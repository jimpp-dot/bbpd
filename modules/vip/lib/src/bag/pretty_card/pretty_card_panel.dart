import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:vip/k.dart';
import 'package:vip/src/bag/bag_api.dart';
import 'package:vip/src/bag/model/bag_bean.dart';
import 'package:vip/src/vip_mall/widget/commodity_preview_widget.dart';

/// 靓号卡使用or赠送面板
///
class PrettyCardPanel extends StatefulWidget {
  final int id;
  final int cid;
  final String? goodsType;

  const PrettyCardPanel(this.id, this.cid, {super.key, this.goodsType});

  @override
  _PrettyCardPanelState createState() => _PrettyCardPanelState();

  static Future<bool?> show(BuildContext context, int id, int cid, {String? type}) async {
    return displayModalBottomSheet<bool?>(
      context: context,
      maxHeightRatio: 1,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return PrettyCardPanel(id, cid, goodsType: type);
      },
    );
  }
}

class _PrettyCardPanelState extends State<PrettyCardPanel> {
  bool _loading = true;
  String? _error;
  BagGoods? _bagGoods;

  int _selectIndex = -1;

  bool _canUse = true;

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  _loadData() async {
    setState(() {
      _loading = true;
      _error = null;
      _bagGoods = null;
    });
    DataRsp<BagGoods> response = await BagApi.getPrettyCardInfo(widget.id, widget.cid, type: widget.goodsType);
    if (response.success == true) {
      _bagGoods = response.data;
      if (_bagGoods != null && !Util.isCollectionEmpty(_bagGoods!.prettyIds)) {
        int index = _bagGoods!.prettyIds.indexWhere((element) => element.status == 1);
        if (index >= 0) {
          _canUse = false;
        }
        _selectIndex = _bagGoods!.prettyIds.indexWhere((element) => element.canUse);
      }
    } else {
      _error = response.msg;
    }
    _loading = false;
    if (mounted) setState(() {});
  }

  _onItemSelect(int index) {
    if (index < 0 || index >= _bagGoods!.prettyIds.length) return;

    PrettyCard card = _bagGoods!.prettyIds[index];
    if (card.canUse == false) {
      Fluttertoast.showToast(msg: '该靓号已被使用');
      return;
    }

    _selectIndex = index;
    setState(() {});
  }

  _onUseTaped() async {
    if (_selectIndex < 0 || _selectIndex >= _bagGoods!.prettyIds.length) return;

    PrettyCard card = _bagGoods!.prettyIds[_selectIndex];
    if (card.canUse == false) {
      Fluttertoast.showToast(msg: '该靓号已被使用');
      return;
    }

    bool result = await TipsDialog.show(context, tips: '点击确认后，之前使用中的靓号会自动失效，确认使用');

    if (result == true) {
      DataRsp rsp = await BagApi.usePrettyCard(_bagGoods!.id, card.prettyId);
      if (rsp.success == true) {
        Navigator.of(context).pop(true);
      } else {
        Fluttertoast.showToast(msg: rsp.msg);
      }
    }
  }

  _onGiveTaped() async {
    if (_selectIndex < 0 || _selectIndex >= _bagGoods!.prettyIds.length) return;

    PrettyCard card = _bagGoods!.prettyIds[_selectIndex];
    if (card.canUse == false) {
      Fluttertoast.showToast(msg: '该靓号已被使用');
      return;
    }
    bool result = await TipsDialog.show(
      context,
      tips: 'CP靓号赠送成功后，接受者会自动使用此靓号，本人则自动使用另外一个，确认赠送？',
      positiveBtnText: '选择接收者',
    );

    if (result == true) {
      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.showContactSelectScreen(context, (BuildContext context, List<int>? uidList, List<bool> isGroupList, Map room) async {
        if (uidList == null || uidList.isEmpty) {
          return;
        }
        Navigator.of(context).pop();
        DataRsp rsp = await BagApi.sendPrettyCard(_bagGoods!.id, card.prettyId, uidList[0]);
        if (rsp.success == true) {
          Navigator.of(System.context).pop(true);
        } else {
          Fluttertoast.showToast(msg: rsp.msg);
        }
      }, hideGroupTab: true, title: '选择赠送对象', onlySelectOne: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (_loading || _error != null || _bagGoods == null) ? R.color.mainBgColor : Colors.transparent,
        borderRadius: const BorderRadiusDirectional.only(topStart: Radius.circular(20), topEnd: Radius.circular(20)),
      ),
      child: _renderBody(),
    );
  }

  Widget _renderBody() {
    if (_loading) {
      return Container(
        height: 300,
        alignment: AlignmentDirectional.center,
        child: const Loading(),
      );
    }

    if (_error != null || _bagGoods == null) {
      return Container(
        height: 300,
        alignment: AlignmentDirectional.center,
        child: ErrorData(
          error: _error,
          onTap: _loadData,
          top: 0,
          bottom: 0,
        ),
      );
    }
    return _renderContent();
  }

  Widget _renderContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommodityPreviewWidget(
          commodity: _bagGoods!,
          extra: _bagGoods!.extra,
          expireDate: _bagGoods!.expires,
          using: _bagGoods!.using == 1 && _bagGoods!.expired != 1,
          expireJumpPage: _bagGoods!.expireDatePage,
        ),
        Container(
          alignment: AlignmentDirectional.topStart,
          padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 8, bottom: 10 + Util.iphoneXBottom),
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      _bagGoods!.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: R.color.mainTextColor, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(width: 10),
                  _renderNameRightWidget(),
                ],
              ),
              Visibility(
                visible: _bagGoods!.desc != null && _bagGoods!.desc!.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8),
                  child: Text(
                    _bagGoods!.desc ?? '',
                    style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSelector(_bagGoods!.prettyIds),
              const SizedBox(height: 24),
              _renderBtn(),
            ],
          ),
        ),
      ],
    );
  }

  // 商品名称右边文案
  _renderNameRightWidget() {
    String text;
    Color bgColor = R.color.mainBrandColor.withOpacity(0.1);
    Color textColor = R.color.mainBrandColor;
    text = _bagGoods!.leftTime;
    if (_bagGoods!.expired == 1 || _bagGoods!.useUp == 1) {
      bgColor = Colors.black.withOpacity(0.1);
      textColor = R.color.secondTextColor;
    }
    return text.isNotEmpty
        ? Container(
            padding: const EdgeInsetsDirectional.only(start: 5, end: 4, top: 3, bottom: 3),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(11), color: bgColor),
            child: Text(
              text,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textColor),
            ),
          )
        : Container();
  }

  Widget _buildSelector(List<PrettyCard> prettyIds) {
    if (Util.isCollectionEmpty(prettyIds)) return const SizedBox.shrink();

    return Row(
      children: [
        _buildItem(0, prettyIds[0]),
        if (prettyIds.length >= 2) ...[
          const SizedBox(width: 12),
          _buildItem(1, prettyIds[1]),
        ]
      ],
    );
  }

  Widget _buildItem(int index, PrettyCard prettyCard) {
    bool select = index == _selectIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemSelect(index),
        child: Container(
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: select ? R.color.mainBrandColor : R.color.dividerColor),
            color: select ? R.color.mainBrandColor.withOpacity(0.08) : null,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '靓号1:',
                  style: TextStyle(
                    color: select ? R.color.mainTextColor : R.color.thirdTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '${prettyCard.prettyId}',
                style: TextStyle(
                  color: select ? R.color.mainTextColor : R.color.thirdTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderBtn() {
    return Row(
      children: [
        if (_canUse) ...[
          Expanded(
            child: GestureDetector(
              onTap: _onUseTaped,
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 52,
                decoration:
                    ShapeDecoration(shape: const StadiumBorder(), gradient: LinearGradient(colors: R.color.mainBrandGradientColors)),
                child: const Text(
                  '使用',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: GestureDetector(
            onTap: _onGiveTaped,
            child: Container(
              alignment: AlignmentDirectional.center,
              height: 52,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                gradient: LinearGradient(colors: [Color(0xffFD8849), Color(0xffFFC45E)]),
              ),
              child: const Text(
                '赠送',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TipsDialog extends StatelessWidget {
  final String? tips;
  final String? positiveBtnText;

  static Future show(BuildContext context, {String? tips, String? positiveBtnText}) {
    return Navigator.of(System.context).push(DialogRoute(
      context: context,
      builder: (BuildContext context) {
        return TipsDialog(tips: tips, positiveBtnText: positiveBtnText);
      },
      barrierColor: Colors.black54,
      barrierDismissible: true,
      useSafeArea: true,
    ));
  }

  const TipsDialog({Key? key, this.tips, this.positiveBtnText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 312,
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsetsDirectional.only(start: 24, end: 24, top: 32, bottom: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tips ?? '',
              style: TextStyle(color: R.color.mainTextColor, fontSize: 18, height: 1.4),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                NegativeButton(
                  width: 124,
                  height: 48,
                  text: K.cancel,
                  fontSize: 16,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                const Spacer(),
                PositiveButton(
                  width: 124,
                  height: 48,
                  textSize: 16,
                  text: positiveBtnText ?? '确认',
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
