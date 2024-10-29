import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';
import '../widget/slp_gift_num_select_widget.dart';
import '../widget/slp_page_gift_item.dart';

class SlpPrivateRoomGiftSelectPanel extends StatefulWidget {
  final int giftId;
  final int giftNum;
  final int uid;
  final int rid;
  const SlpPrivateRoomGiftSelectPanel(
      {super.key,
      this.giftId = 0,
      this.giftNum = 0,
      this.uid = 0,
      this.rid = 0});

  @override
  PrivateRoomGiftSelectState createState() {
    return PrivateRoomGiftSelectState();
  }

  static Future<bool?> show(
      {BuildContext? context,
      int giftId = 0,
      int giftNum = 0,
      int uid = 0,
      int rid = 0}) {
    return displayModalBottomSheet(
      context: context ?? System.context,
      maxHeightRatio: 0.5,
      defineBarrierColor: Colors.transparent,
      builder: (context) {
        return SlpPrivateRoomGiftSelectPanel(
          giftId: giftId,
          giftNum: giftNum,
          uid: uid,
          rid: rid,
        );
      },
    );
  }
}

class PrivateRoomGiftSelectState extends State<SlpPrivateRoomGiftSelectPanel> {
  List<BbGiftPanelGift>? gifts;
  int _giftId = 0;
  BbGiftPanelGift? _selectGift;
  int _selectGiftNum = 1;

  final GlobalKey _selectNumKey = GlobalKey();

  ScrollController? controller;
  int crossAxisCount = 4;
  double childAspectRatio = 0.9;
  double horizontalPadding = 5.0;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    gifts = [];

    String url = '${System.domain}go/yy/gift/nest?rid=${widget.rid}';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      ResNestGiftList res = ResNestGiftList.fromBuffer(response.bodyBytes);
      if (res.success == true) {
        gifts = res.list;
      } else if (Util.validStr(res.msg)) {
        Fluttertoast.showCenter(msg: res.msg);
        return;
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      return;
    }

    if (gifts != null && gifts?.isNotEmpty == true) {
      _selectGift = gifts![0];
      _giftId = _selectGift!.id;

      if (widget.giftId > 0) {
        int index = gifts!.indexWhere((element) => element.id == widget.giftId);
        // 有初始选中的礼物，需要自适应默认GridView滑动距离
        if (index != -1) {
          int scrollIndex = 0;
          if (gifts!.length <= 2 * crossAxisCount ||
              index < 2 * crossAxisCount) {
            // 所有礼物不超过一页不用滚动，（部分手机显示不到3行）
            // 选中礼物在第一屏内不用滚动
            scrollIndex = 0;
          } else {
            scrollIndex = (index - 2 * crossAxisCount) ~/ crossAxisCount + 1;
          }
          double initialScrollOffset = scrollIndex *
              ((Util.width - 2 * horizontalPadding) /
                  crossAxisCount /
                  childAspectRatio);
          controller =
              ScrollController(initialScrollOffset: initialScrollOffset);

          _selectGift = gifts![index];
          _giftId = _selectGift!.id;
          _selectGiftNum = widget.giftNum ?? 1;
        }
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// do nothing
      },
      child: Container(
        width: Util.width,
        height: 398,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
          color: Color(0xFF171621),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              K.gift_change_gift,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
              height: 1,
              color: Colors.white10,
            ),
            Expanded(
              child: Util.validList(gifts)
                  ? GridView.count(
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      childAspectRatio: childAspectRatio,
                      controller: controller,
                      padding: EdgeInsetsDirectional.only(
                        start: horizontalPadding,
                        end: horizontalPadding,
                        top: 10,
                        bottom: 10,
                      ),
                      children: gifts != null
                          ? gifts!.map((gift) {
                              return _buildGiftItem(gift);
                            }).toList()
                          : [],
                    )
                  : const SizedBox.shrink(),
            ),
            _buildHandleBar(),
            SizedBox(
              height: Util.iphoneXBottom,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGiftItem(BbGiftPanelGift gift) {
    int giftId = gift.id;
    if (gift.id == _selectGift?.id) {
      _selectGift = gift;
      _giftId = giftId;
    }
    bool selected = _giftId == giftId;

    return SlpPageGiftItem(
        key: ValueKey('$giftId'),
        gift: gift,
        isInRoom: true,
        selected: selected,
        onGiftTaped: (BbGiftPanelGift gift) async {
          _changeSelectGift(gift);
        });
  }

  _changeSelectGift(BbGiftPanelGift gift) {
    _selectGift = gift;
    _giftId = gift.id;
    if (mounted) {
      setState(() {});
    }
  }

  /// 操作条
  Widget _buildHandleBar() {
    if (_giftId <= 0) return Container();

    if (_selectGift == null) return Container();

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      height: 52,
      alignment: Alignment.center,
      child: Row(
        children: [
          Text(
            _selectGift?.name ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          NumText(
            'x$_selectGiftNum',
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: _switchNum,
            child: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: R.color.mainBrandColor, width: 1),
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(16),
                  bottomStart: Radius.circular(16),
                ),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: NumText(
                      "x$_selectGiftNum",
                      style: TextStyle(
                        color: R.color.mainBrandColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  R.img(Assets.ic_up_arrow_svg,
                      width: 16,
                      height: 16,
                      color: R.color.mainBrandColor,
                      package: ComponentManager.MANAGER_GIFT,
                      key: _selectNumKey),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _submit();
            },
            child: Container(
              width: 60,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
                borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(16),
                  bottomEnd: Radius.circular(16),
                ),
              ),
              child: Text(
                K.gift_sure,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _switchNum() {
    RenderBox rowRenderBox =
        _selectNumKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset =
        rowRenderBox.localToGlobal(Offset(rowRenderBox.size.width / 2.0, -20));

    List<BbGiftPanelChooseNumConfig> chooseNumConfig = [
      BbGiftPanelChooseNumConfig(num: 1, desc: K.gift_private_room_1_num_desc),
      BbGiftPanelChooseNumConfig(num: 2, desc: K.gift_private_room_2_num_desc),
      BbGiftPanelChooseNumConfig(num: 3, desc: K.gift_private_room_3_num_desc),
      BbGiftPanelChooseNumConfig(num: 5, desc: K.gift_private_room_5_num_desc),
      BbGiftPanelChooseNumConfig(num: 8, desc: K.gift_private_room_8_num_desc),
      BbGiftPanelChooseNumConfig(
          num: 10, desc: K.gift_private_room_10_num_desc),
      BbGiftPanelChooseNumConfig(
          num: 13, desc: K.gift_private_room_13_num_desc),
      BbGiftPanelChooseNumConfig(
          num: 66, desc: K.gift_private_room_66_num_desc),
      BbGiftPanelChooseNumConfig(
          num: 99, desc: K.gift_private_room_99_num_desc),
    ];

    SlpGiftNumSelectWidget.show(
            context, chooseNumConfig, _selectGiftNum, offset)
        .then((value) {
      if (Util.parseInt(value?[0]) > 0) {
        if (mounted) {
          setState(() {
            _selectGiftNum = value![0];
          });
        }
      }
    });
  }

  bool submit = false;
  _submit() async {
    if (_giftId <= 0) return;
    if (!(ModalRoute.of(context)?.isCurrent ?? false)) return;
    if (_selectGift == null) return;
    if (submit) {
      return;
    }
    submit = true;

    try {
      String url = '${System.domain}go/room/nest/saveCondition';
      Map<String, String> body = {
        'gs_uid': '${widget.uid}',
        'gift_id': '$_giftId',
        'num': '$_selectGiftNum',
        'rid': '${widget.rid}',
      };
      XhrResponse response =
          await Xhr.post(url, body, pb: true, throwOnError: true);

      NormalNull res = NormalNull.fromBuffer(response.bodyBytes);
      if (res.success == true) {
        if (ModalRoute.of(context)?.isCurrent ?? false) {
          Navigator.of(context).pop(true);
        }
      } else if (Util.validStr(res.msg)) {
        Fluttertoast.showCenter(msg: res.msg);
      }
    } catch (e) {
      Log.d(e.toString());
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }

    submit = false;
  }
}
