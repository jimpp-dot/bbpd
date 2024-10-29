import 'package:chat/k.dart';
import 'package:shared/assets.dart';
import 'dart:convert';
import 'package:shared/shared.dart';
import 'package:chat/src/model/intimate_msg_open.dart';
import 'package:flutter/material.dart';
import 'config.dart';
import 'intimate_intro_pop.dart';

/// 亲密度触发gs送礼
class DisplayIntimateGift extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;

  const DisplayIntimateGift(
      {Key? key,
      required this.message,
      required this.extra,
      required this.direction})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DisplayIntimateGiftState();
  }
}

class DisplayIntimateGiftState extends State<DisplayIntimateGift> {
  final GlobalKey _btnKey = GlobalKey();
  late int _taskId;
  late bool _hasOpen;
  String? _senderContent;

  @override
  void initState() {
    super.initState();
    _taskId = Util.parseInt(widget.extra['task_id']);
    _hasOpen = Util.parseBool(widget.extra['has_open']);
    _senderContent = Util.parseStr(widget.extra['content_for_sender']);
  }

  @override
  Widget build(BuildContext context) {
    String content;
    if (MessageDisplayDirection.Right == widget.direction) {
      content = _senderContent ?? '';
    } else {
      content = widget.message.content;
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 236,
          height: 128,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFF5F7D),
                Color(0xFFFF5FBE),
              ],
            ),
          ),
        ),
        Container(
          width: 236,
          height: 128,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFFF9ABC),
            ),
          ),
        ),
        PositionedDirectional(
          top: 0,
          end: 0,
          child: R.img(
            'intimate_interact/msg_gift_wave.png',
            width: 188,
            height: 128,
            package: ComponentManager.MANAGER_GIFT,
          ),
        ),
        PositionedDirectional(
          top: -16,
          end: 0,
          child: R.img(
            'intimate_interact/msg_gift_bag.png',
            width: 88,
            height: 89,
            package: ComponentManager.MANAGER_GIFT,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              width: 142,
              margin: const EdgeInsetsDirectional.only(start: 12),
              child: Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _buildBtn(),
          ],
        ),
      ],
    );
  }

  Widget _buildBtn() {
    bool disable =
        _hasOpen || MessageDisplayDirection.Right == widget.direction;
    String btnText;
    if (disable) {
      btnText = MessageDisplayDirection.Right == widget.direction
          ? K.chat_has_sent
          : K.chat_has_open;
    } else {
      btnText = K.chat_open_now;
    }
    return GestureDetector(
      onTap: disable ? null : _tapOpen,
      child: Container(
        key: _btnKey,
        width: 212,
        height: 40,
        alignment: AlignmentDirectional.center,
        margin: const EdgeInsetsDirectional.only(start: 12, end: 12),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: Colors.white,
        ),
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 13,
              color: const Color(0xFFFF5F7D).withOpacity(disable ? 0.7 : 1),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Future<void> _tapOpen() async {
    if (MessageDisplayDirection.Left == widget.direction) {
      DataRsp<IntimateMsgOpen> rsp = await _openGift(_taskId);
      if (rsp.success == true && rsp.data != null) {
        if (rsp.data!.isCommoditySent) {
          Fluttertoast.showToast(msg: '已领取');
          _setHasOpen();
        } else {
          if (!Util.isCollectionEmpty(rsp.data!.commodityList)) {
            Tracker.instance.track(TrackEvent.get_gift_success, properties: {
              'chat_gift_id':
                  rsp.data!.commodityList.map((e) => e.cid).toList(),
            });
            _ReceiveGiftDialog.show(context, rsp.data!.commodityList);
            _setHasOpen();
          } else if (!Util.isCollectionEmpty(rsp.data!.prompt)) {
            _showTip(rsp.data!.prompt);
          }
        }
      } else {
        Fluttertoast.showToast(msg: rsp.msg ?? '');
      }
    }
  }

  Future<void> _setHasOpen() async {
    widget.extra['has_open'] = true;
    String extra = json.encode(widget.extra);
    Im.setMessageExtraNew(widget.message.messageId, extra);
    setState(() {
      _hasOpen = true;
    });
  }

  void _showTip(List<IntimateColorText> tipList) {
    RenderBox renderBox =
        _btnKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    IntimateIntroPop.show(context, offset, renderBox.size.width, tipList);
  }

  static Future<DataRsp<IntimateMsgOpen>> _openGift(int taskId) async {
    String url = '${System.domain}go/mate/gs/benefitReceived';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'task_id': '$taskId',
          },
          formatJson: true);
      return DataRsp<IntimateMsgOpen>.fromXhrResponse(response,
          (object) => IntimateMsgOpen.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<IntimateMsgOpen>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}

class _ReceiveGiftDialog extends StatefulWidget {
  final List<ShopMailCommodity> list;

  const _ReceiveGiftDialog({Key? key, required this.list}) : super(key: key);

  @override
  _ReceiveGiftDialogState createState() => _ReceiveGiftDialogState();

  static Future show(
      BuildContext context, List<ShopMailCommodity>? list) async {
    if (list == null || list.isEmpty) {
      return false;
    }
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: _buildMaterialDialogTransitions,
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Material(
          color: Colors.transparent,
          child: _ReceiveGiftDialog(
            list: list,
          ),
        );
      },
    );
  }

  static Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOutCubic,
      ),
      child: SlideTransition(
        position: animation
            .drive(Tween(begin: const Offset(0, 0.05), end: Offset.zero)),
        child: ScaleTransition(
          scale: animation.drive(Tween(begin: 0.9, end: 1.0)),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

class _ReceiveGiftDialogState extends State<_ReceiveGiftDialog> {
  double height = 0;
  double giftSize = 80;
  int style = 1;

  @override
  void initState() {
    super.initState();
    int len = widget.list.length;
    if (len == 1) {
      style = 1;
      height = 325;
      giftSize = 120;
    } else if (len == 2) {
      style = 2;
      height = 285;
    } else {
      style = 3;
      if (len == 3) {
        height = 285;
      } else if (len <= 6) {
        height = 401;
      } else {
        height = 433;
      }
    }
  }

  Widget _buildGiftItem(ShopMailCommodity commodity) {
    IVipManager vipManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    double ratio = giftSize / 104;
    return Column(
      children: [
        Container(
          width: giftSize,
          height: giftSize,
          decoration: BoxDecoration(
            color: R.colors.secondBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: vipManager.getCommodityListItemTop(
              ratio: ratio, commodity: commodity),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          commodity.name ?? '',
          style: TextStyle(fontSize: 13, color: R.colors.secondTextColor),
        ),
      ],
    );
  }

  Widget _buildOne() {
    return _buildGiftItem(widget.list[0]);
  }

  Widget _buildTwo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildGiftItem(widget.list[0]),
        const SizedBox(
          width: 12,
        ),
        _buildGiftItem(widget.list[0]),
      ],
    );
  }

  Widget _buildMulti() {
    return SizedBox(
      width: 264,
      height: height - 181,
      child: GridView.count(
        padding: const EdgeInsetsDirectional.only(),
        primary: true,
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 80 / 104,
        children: widget.list.map((e) => _buildGiftItem(e)).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (style == 1) {
      content = _buildOne();
    } else if (style == 2) {
      content = _buildTwo();
    } else {
      content = _buildMulti();
    }
    return Center(
      child: Container(
        width: 312,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: R.colors.mainBgColor,
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              end: 0,
              top: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: R.img(
                    BaseAssets.shared$ic_close_svg,
                    package: ComponentManager.MANAGER_BASE_CORE,
                    width: 16,
                    height: 16,
                    color: R.colors.mainTextColor,
                  ),
                ),
              ),
            ),
            Container(
              width: 312,
              padding: const EdgeInsetsDirectional.only(top: 32),
              child: Column(
                children: [
                  Text(
                    K.chat_wish_you_get_gifts,
                    style: TextStyle(
                        color: R.colors.mainTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  content,
                  const SizedBox(
                    height: 28,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: GradientButton(
                      K.chat_got_it,
                      width: 216,
                      height: 48,
                      colors: const [Color(0xFFFF5F7D), Color(0xFFFF5FBE)],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
