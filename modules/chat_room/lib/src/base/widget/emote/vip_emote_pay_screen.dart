import 'package:shared/assets.dart';
import 'package:chat_room/k.dart';
import 'dart:ui';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/assets.dart' as Room;
import 'package:flutter/material.dart';
import 'dart:math';
import '../../model/pb/generated/emotion.pb.dart';

class VipEmotePayScreen extends StatefulWidget {
  final ChatRoomData room;
  final List<EmojiPrice>? priceList;
  final String? emojiDesc;
  final VoidCallback? onSuccess;
  final int pubMsgInterval;
  final int emojiGroupId; // 表情包系列id
  final String? title;
  final String? defaultIcon;
  final String? background;
  const VipEmotePayScreen(
      {Key? key,
      required this.room,
      this.background,
      this.title,
      this.defaultIcon,
      this.priceList,
      this.emojiDesc,
      this.onSuccess,
      this.emojiGroupId = 0,
      this.pubMsgInterval = 0})
      : super(key: key);

  @override
  State<VipEmotePayScreen> createState() => _VipEmotePayScreenState();

  static Future show(
    BuildContext context,
    ChatRoomData room, {
    String? title,
    String? defaultIcon,
    List<EmojiPrice>? priceList,
    String? emojiDesc,
    String? background,
    Color? defineBarrierColor,
    VoidCallback? onSendSuccess,
    int pubMsgInterval = 0,
    int emojiGroupId = 0,
  }) async {
    return displayModalBottomSheet(
      context: context,
      defineBarrierColor: defineBarrierColor ?? Colors.black54,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return VipEmotePayScreen(
            room: room,
            priceList: priceList,
            emojiDesc: emojiDesc,
            onSuccess: onSendSuccess,
            pubMsgInterval: pubMsgInterval,
            emojiGroupId: emojiGroupId,
            title: title,
            defaultIcon: defaultIcon,
            background: background);
      },
    );
  }
}

class _VipEmotePayScreenState extends State<VipEmotePayScreen>
    with SingleTickerProviderStateMixin {
  int _selectedId = 0;
  final List<int> _checked = [Session.uid]; // 选中用户
  final List<EmotionUser> _users = []; // 所有的麦上用户
  bool isExpand = true;
  AnimationController? _animationController;
  Animation<Offset>? _offsetAnimation;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: const Interval(
        0.0, // 偏移动画的起始百分比
        1.0, // 偏移动画的结束百分比，这样它将在整个动画时间内播放
        curve: Curves.bounceInOut, // 使用弹性曲线
      ),
    ));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: const Interval(
        0.5, // 透明度动画的起始百分比，这样它将在偏移动画的后半部分开始播放
        1.0, // 透明度动画的结束百分比
        curve: Curves.easeInOut, // 使用平滑进出曲线
      ),
    ));
    _initUsers();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.dp, sigmaY: 16.dp),
        child: Container(
            height: Util.iphoneXBottom + 280.dp,
            padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
            decoration: BoxDecoration(
              color: const Color(0xFF171621).withOpacity(0.7),
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16.dp),
                topEnd: Radius.circular(16.dp),
              ),
            ),
            child: Stack(
              children: [
                PositionedDirectional(
                  end: 0,
                  top: 0,
                  child: CachedNetworkImage(
                      imageUrl: Util.getRemoteImgUrl(widget.background ?? ''),
                      width: 130.dp,
                      height: 130.dp),
                ),
                Column(
                  children: [
                    SizedBox(
                        height: 44.dp,
                        child: Stack(
                          children: [
                            Container(
                              height: 44.dp,
                              alignment: Alignment.center,
                              child: Text(widget.title ?? '',
                                  style: TextStyle(
                                      fontSize: 16.dp,
                                      color: const Color(0xE6FFFFFF),
                                      fontWeight: FontWeight.bold)),
                            ),
                            PositionedDirectional(
                              start: 16.dp,
                              top: 10.dp,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: R.img("back.svg",
                                    width: 24.dp,
                                    height: 24.dp,
                                    package:
                                        ComponentManager.MANAGER_BASE_ROOM),
                              ),
                            )
                          ],
                        )),
                    SizedBox(height: 6.dp),
                    Container(
                      margin:
                          EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
                      child: Text(widget.emojiDesc ?? '',
                          style: TextStyle(
                              fontSize: 11.dp,
                              color: const Color(0x80FFFFFF),
                              fontWeight: FontWeight.w400,
                              height: 1.1)),
                    ),
                    SizedBox(height: 23.dp),
                    Row(
                      children: _buildList(),
                    ),
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child: userWidget(),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    if (widget.priceList?.isNotEmpty == true) {
      for (var element in widget.priceList!) {
        if (widget.priceList!.indexOf(element) == 0) {
          widgets.add(SizedBox(width: 16.dp));
        }
        widgets.add(_buildItem(element, widget.priceList!.indexOf(element)));
        widgets.add(SizedBox(width: 8.dp));
      }
    }
    return widgets;
  }

  Widget _buildItem(EmojiPrice item, int index) {
    double offset = (Util.width - 48.dp) / 3;
    return GestureDetector(
      onTap: () {
        _selectedId = index;
        _animationController?.reset();
        _animationController?.forward();
        refresh();
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          GradientBorder(
            borderGradient: LinearGradient(
                colors: R.dColor.mainBrandGradientColors,
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
            borderWidth: _selectedId == index ? 1.5.dp : 0,
            borderRadius: 16.dp,
            child: Container(
              width: offset,
              height: 115.dp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.dp),
                color: _selectedId == index
                    ? null
                    : const Color(0x0FFFFFFF).withOpacity(0.06),
                gradient: _selectedId == index
                    ? LinearGradient(
                        colors: [
                          const Color(0xFF99FFBC).withOpacity(0.24),
                          const Color(0xFF26C4FF).withOpacity(0.24),
                          const Color(0xFF926AFF).withOpacity(0.24)
                        ],
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                      )
                    : null,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    timeStr(index),
                    style: TextStyle(
                        fontSize: 14.dp,
                        fontWeight: FontWeight.w500,
                        color: _selectedId == index
                            ? const Color(0xE6FFFFFF)
                            : const Color(0x80FFFFFF)),
                  ),
                  SizedBox(height: 4.dp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      R.img(MoneyConfig.moneyIcon,
                          width: 22.dp, height: 22.dp, wholePath: true),
                      SizedBox(width: 2.dp),
                      NumText('${item.price}',
                          style: TextStyle(
                              fontSize: 22.dp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xE6FFFFFF))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_selectedId == index)
            PositionedDirectional(
              top: -22.dp,
              child: FadeTransition(
                opacity: _opacityAnimation!,
                child: SlideTransition(
                    position: _offsetAnimation!,
                    child: CachedNetworkImage(
                        imageUrl:
                            EmoteUtil.emoteImgUrl(widget.defaultIcon ?? ''),
                        width: 22.dp,
                        height: 22.dp)),
              ),
            )
        ],
      ),
    );
  }

  Widget userWidget() {
    double contentWidth = 30.dp;
    bool showExpand = false;
    if (isExpand) {
      for (int i = 0; i <= _users.length; i++) {
        contentWidth += 42.dp;
      }
      showExpand = true;
    }
    return Row(
      crossAxisAlignment:
          showExpand ? CrossAxisAlignment.end : CrossAxisAlignment.end,
      mainAxisAlignment:
          showExpand ? MainAxisAlignment.end : MainAxisAlignment.end,
      children: [
        showExpand ? extendMicUserWidget() : packUpUserWidget(contentWidth),
        Container(
          width: 12.dp,
          height: 34.dp,
          color: const Color(0x0FFFFFFF).withOpacity(0.06),
        ),
        deblockWidget(),
        SizedBox(
          width: 16.dp,
        ),
      ],
    );
  }

  Widget extendMicUserWidget() {
    return Container(
        width: Util.width - 135.dp - 28.dp - 18.dp,
        height: 34.dp,
        margin: EdgeInsetsDirectional.only(top: 19.dp),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(17.dp),
                  bottomStart: Radius.circular(17.dp)),
              color: const Color(0x0FFFFFFF).withOpacity(0.06),
            ),
            child: Row(
              children: [
                expendImgWidget(),
                SizedBox(
                  width: 4.dp,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: Util.width - 38.dp - 165.dp,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding:
                              EdgeInsetsDirectional.only(end: 12.dp, top: 2.dp),
                          child: selectUserWidget(index, _users[index]));
                    },
                    itemCount: _users.length,
                  ),
                ),
              ],
            )));
  }

  Widget packUpUserWidget(double contentWidth) {
    bool selected = _checked.contains(Session.uid);
    return Container(
        width: 54.dp,
        height: 34.dp,
        margin: EdgeInsetsDirectional.only(
          top: 19.dp,
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(17.dp),
                  bottomStart: Radius.circular(17.dp)),
              color: const Color(0x0FFFFFFF).withOpacity(0.06),
            ),
            child: Row(
              children: [
                expendImgWidget(),
                SizedBox(
                  width: 4.dp,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_checked.contains(Session.uid)) {
                          _checked.remove(Session.uid);
                        } else {
                          _checked.add(Session.uid);
                          selected = true;
                        }
                        refresh();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFF7D2EE6), width: 1),
                          borderRadius: BorderRadius.circular(15.dp),
                        ),
                        child: CommonAvatar(
                          path: Session.icon,
                          size: 30.dp,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    if (selected)
                      PositionedDirectional(
                        top: 0,
                        end: 0,
                        child: R.img(
                          BaseAssets.shared$emotion_ic_emotion_select_user_png,
                          width: 12.dp,
                          height: 12.dp,
                        ),
                      ),
                  ],
                ),
              ],
            )));
  }

  int getTotalMoney() {
    int length = _checked.length;
    int checkedPrice = 0;
    if (widget.priceList?.isNotEmpty == true &&
        _selectedId < widget.priceList!.length) {
      checkedPrice = widget.priceList![_selectedId].price;
    }
    return checkedPrice * length;
  }

  Widget deblockWidget() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
            onTap: () async {
              IPayManager payManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PAY);
              //需要计算折扣券之后的金额
              //使用几张折扣券
              int couponCount = min(
                  widget.priceList![_selectedId].couponCount, _checked.length);
              //总的优惠金额
              int couponAllMoney =
                  widget.priceList![_selectedId].ductionMoney * couponCount;

              SheetCallback? result = await payManager.showRechargeSheet(
                  context, getTotalMoney() - couponAllMoney);
              if (result == null ||
                  result.reason == SheetCloseReason.Active ||
                  result.value?.key == IPayManager.pTRecharge) {
                return;
              }
              if (_checked.isEmpty) {
                Fluttertoast.showCenter(msg: K.select_users_tips);
                return;
              }
              payManager.pay(context,
                  key: 'available',
                  type: result.value?.key ?? '',
                  args: {
                    'money': getTotalMoney(),
                    'type': 'slp-consume',
                    'params': {
                      'uids': _checked,
                      'consume_type': 'buy_emoji',
                      "es_id": widget.emojiGroupId,
                      "rid": widget.room.rid,
                      "duration_type": _selectedId == 0
                          ? 1
                          : (_selectedId == 1 ? 2 : 3), // EmojiDurationType
                      "coupon_cid": widget.priceList![_selectedId].couponCid,
                      "coupon_count": min(
                          widget.priceList![_selectedId].couponCount,
                          _checked.length),
                      "duction_money":
                          widget.priceList![_selectedId].ductionMoney,
                    }
                  },
                  showLoading: true,
                  onPayed: _onPayed,
                  onError: _onPayError);
            },
            child: Container(
              width: 135.dp,
              height: 34.dp,
              padding: EdgeInsetsDirectional.only(top: 2.dp, bottom: 2.dp),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(17.dp),
                    bottomEnd: Radius.circular(17.dp)),
                color: const Color(0x0FFFFFFF).withOpacity(0.06),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: R.dColor.mainBrandGradientColors,
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd),
                  borderRadius: BorderRadius.circular(15.dp),
                ),
                child: Text(
                    K.pay_to_unlock(
                        [_checked.length > 1 ? '*${_checked.length}' : '']),
                    style: TextStyle(
                        fontSize: 14.dp,
                        color: const Color(0xFF080A31),
                        fontWeight: FontWeight.w500)),
              ),
            )),
        if (widget.priceList![_selectedId].couponCount > 0)
          PositionedDirectional(
              top: -8.dp,
              end: -12.dp,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  R.img(Room.RoomAssets.chat_room$emote_offer_amount_bg_webp,
                      width: 57.dp, height: 23.dp),
                  Positioned(
                    top: 5.dp,
                    child: Transform.rotate(
                      angle: pi / 25,
                      child: Row(
                        children: [
                          Text(
                            K.immediate_reduction,
                            style: TextStyle(
                                fontSize: 8.dp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffF5F0E3)),
                          ),
                          R.img(MoneyConfig.moneyIcon,
                              width: 10.dp, height: 10.dp, wholePath: true),
                          NumText(
                            (min(widget.priceList![_selectedId].couponCount,
                                        _checked.length) *
                                    widget.priceList![_selectedId].ductionMoney)
                                .toString(),
                            style: TextStyle(
                                fontSize: 9.dp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffF5F0E3)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
      ],
    );
  }

  void _onPayed() {
    Fluttertoast.showToast(msg: K.pay_sucess, gravity: ToastGravity.CENTER);
    eventCenter.emit(EventConstant.EventEmojiPaySucess);
    Navigator.of(context).pop();
  }

  void _onPayError(bool isErrorCatch) {}

  Widget expendImgWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        isExpand = !isExpand;
        refresh();
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(isExpand ? pi : 0),
        child: R.img(BaseAssets.shared$emotion_ic_extend_user_webp,
            width: 18.dp, height: 34.dp, fit: BoxFit.fitHeight),
      ),
    );
  }

  Widget selectUserWidget(int index, EmotionUser user) {
    bool selected = _checked.contains(user.uid);
    return GestureDetector(
      onTap: () {
        if (_checked.contains(user.uid)) {
          _checked.remove(user.uid);
          selected = false;
        } else {
          _checked.add(user.uid);
          selected = true;
        }
        refresh();
      },
      child: Stack(
        children: [
          Container(
            width: 30.dp,
            height: 30.dp,
            decoration: BoxDecoration(
              border: selected
                  ? Border.all(color: const Color(0xFF7D2EE6), width: 1)
                  : null,
              borderRadius: BorderRadius.circular(15.5.dp),
            ),
            child: CommonAvatar(
              path: _users[index].icon,
              size: 30.dp,
              shape: BoxShape.circle,
            ),
          ),
          if (selected)
            PositionedDirectional(
              top: 0,
              end: 0,
              child: R.img(
                BaseAssets.shared$emotion_ic_emotion_select_user_png,
                width: 12.dp,
                height: 12.dp,
              ),
            ),
        ],
      ),
    );
  }

  _initUsers() {
    _users.clear();
    EmotionUser currentUser = EmotionUser(Session.uid, Session.icon);
    _users.add(currentUser);
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    List<RoomPosition> micUser =
        giftManager.getGiftUsers(widget.room) as List<RoomPosition>;
    for (RoomPosition element in micUser) {
      EmotionUser emotionUser = EmotionUser(element.uid, element.icon);
      if (!_users.contains(emotionUser)) {
        _users.add(emotionUser);
      }
    }
  }

  String timeStr(int index) {
    if (index == 0) {
      return K.emtion_pay_a_month;
    } else if (index == 1) {
      return K.emtion_pay_trimester;
    } else {
      return K.emtion_pay_twelvemonth;
    }
  }
}

class EmotionUser {
  final int uid;
  final String icon;
  EmotionUser(this.uid, this.icon);
}
