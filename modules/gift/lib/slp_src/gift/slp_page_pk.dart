import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:date_format/date_format.dart';

import '../../assets.dart';

/// PK道具
class SlpPagePK extends StatefulWidget {
  final GiftScene giftScene;
  final int id;
  final ChatRoomData? room; // room data
  final int defaultId; // 初次展示默认选中礼物ID，不设置默认不用传参
  final BbGiftPanelData? data;
  final VoidCallback? refreshCallback;

  const SlpPagePK({
    Key? key,
    required this.giftScene,
    required this.id,
    this.data,
    this.room,
    this.defaultId = -1,
    this.refreshCallback,
  }) : super(key: key);

  @override
  SlpPagePKState createState() {
    return SlpPagePKState();
  }
}

class SlpPagePKState extends State<SlpPagePK>
    with AutomaticKeepAliveClientMixin {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  int _pkId = 0;
  BbGiftPanelLiveProps? _selectPk;

  bool _isFriend = true; // 亲密度是否大于5000
  bool _isRisk = false; // 要打赏的用户是否存在风险

  ScrollController? controller;
  int crossAxisCount = 4;
  double childAspectRatio = 0.9;
  double horizontalPadding = 5.0;

  bool get _isInRoom {
    return isGiftSceneInRoom(widget.giftScene);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _queryRisk();
  }

  @override
  void dispose() {
    _payManager.dispose('gift');
    super.dispose();
  }

  /// 查询用户风险信息
  _queryRisk() async {
    XhrResponse response = await Xhr.postJson(
        "${System.domain}friend/risk", {'uids': widget.id.toString()},
        throwOnError: false);
    if (response.error == null) {
      Map res = response.response as Map;
      if (res['success'] == true) {
        List<Map> results = List<Map>.from(res['data']);
        if (results.isNotEmpty) {
          _isFriend = Util.parseInt(results[0]['friend']) > 0;
          _isRisk = Util.parseInt(results[0]['modify']) > 0;
          if (!mounted) {
            return;
          }
          setState(() {});
        }
      } else {
        Log.d(res['msg']);
      }
    } else {
      Log.d(response.error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.data?.liveProps == null ||
        widget.data?.liveProps.isEmpty == true) {
      return Center(
        child: Text(K.empty_bag, style: const TextStyle(color: Colors.grey)),
      );
    }
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            childAspectRatio: childAspectRatio,
            controller: controller,
            padding: EdgeInsetsDirectional.only(
              start: horizontalPadding,
              end: horizontalPadding,
              bottom: 0,
            ),
            children: widget.data?.liveProps != null
                ? widget.data!.liveProps.map((pk) {
                    return _buildItem(pk);
                  }).toList()
                : [],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
          // decoration: BoxDecoration(
          //   border: _isInRoom ? null : Border(top: BorderSide(color: R.color.dividerColor, width: 0.5)),
          // ),
          child: _buildHandleBar(),
        ),
      ],
    );
  }

  Widget _buildItem(BbGiftPanelLiveProps pk) {
    int pid = pk.pid;
    bool selected = _pkId == pid;

    return InkWell(
      key: ValueKey('$pid'),
      onTap: () {
        setState(() {
          _pkId = pid;
          _selectPk = pk;
        });
      },
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RepaintBoundary(
                    child: CachedNetworkImage(
                      placeholder: const CupertinoActivityIndicator(),
                      imageUrl: Util.getRemoteImgUrl(pk.url),
                      height: 55,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    pk.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _isInRoom || darkMode
                          ? Colors.white
                          : R.color.mainTextColor,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            _renderNumBadge(pk),
            if (selected)
              R.img(
                Assets.ic_gift_select_svg,
                package: ComponentManager.MANAGER_GIFT,
                fit: BoxFit.fill,
              ),
          ],
        ),
      ),
    );
  }

  /// 右上角数量角标
  Widget _renderNumBadge(BbGiftPanelLiveProps pk) {
    int num = pk.pnum;
    String numStr = num > 999 ? '999+' : num.toString();
    if (num <= 1) {
      return Container();
    }

    TextStyle textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 11,
      fontWeight: FontWeight.w600,
    );
    return PositionedDirectional(
      end: 7,
      top: 4,
      child: Container(
        height: 16,
        width: 26,
        decoration: BoxDecoration(
          color: R.color.thirdBrightColor,
          borderRadius: BorderRadius.circular(8.5),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          numStr,
          style: textStyle,
        ),
      ),
    );
  }

  /// 操作条
  Widget _buildHandleBar() {
    if (_pkId <= 0 || _selectPk == null) return const SizedBox.shrink();
    BbGiftPanelLiveProps pk = _selectPk!;

    String end = formatDate(
        DateTime.fromMillisecondsSinceEpoch(pk.expired * 1000),
        [mm, '-', dd, ' ', HH, ':', nn]);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      height: 52,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pk.desc,
                style: TextStyle(
                  color: _isInRoom || darkMode
                      ? Colors.white.withOpacity(0.4)
                      : R.color.mainTextColor,
                  fontSize: 12.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '${K.gift_validity} $end ${K.gift_invalid}',
                  style: TextStyle(
                    color: _isInRoom || darkMode
                        ? Colors.white.withOpacity(0.4)
                        : R.color.secondTextColor,
                    fontSize: 9.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 10),
            height: 32,
            width: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: R.color.mainBrandGradientColors,
              ),
              borderRadius: BorderRadius.circular(23),
            ),
            child: InkWell(
              onTap: () {
                _sendPkProp(_selectPk!);
              },
              borderRadius: BorderRadius.circular(23),
              child: Center(
                child: Text(
                  K.give_something,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _checkCheat() async {
    if (_isRisk != true) return true;

    bool result = await showDialog(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            title: BaseK.K.base_warm_prompt,
            content: BaseK.K.gift_risk_dialog_content,
            positiveButton: PositiveButton(
              text: BaseK.K.gift_risk_dialog_button_sure,
            ),
            negativeButton: NegativeButton(
              text: BaseK.K.base_go_back,
            ),
          );
        });
    return result;
  }

  void _sendPkProp(BbGiftPanelLiveProps pk) async {
    bool checked = await _checkCheat();
    if (checked != true) {
      return;
    }
    try {
      String url = "${System.domain}live/useprop";
      final Map<String, String> params = {
        "rid": (widget.room?.rid ?? 0).toString(),
        "pid": pk.pid.toString(),
        'num': '1',
      };

      XhrResponse response = await Xhr.postJson(url, params);
      BaseResponse baseResponse = BaseResponse.parse(response);
      if (baseResponse.success == true) {
        Navigator.of(context).pop();
        if (widget.refreshCallback != null) {
          widget.refreshCallback!();
        }
      } else {
        Toast.show(context, baseResponse.msg);
      }
    } catch (e) {
      Log.d('getPKConfig exception: $e');
    }
  }
}
