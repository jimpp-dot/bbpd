import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/model/public_screen_enhancement_model.dart';

/// 赠送礼物引导
///
class GiftingGuide extends StatefulWidget {
  final ChatRoomData room;

  const GiftingGuide({super.key, required this.room});

  @override
  _GiftingGuideState createState() => _GiftingGuideState();
}

class _GiftingGuideState extends State<GiftingGuide>
    with TickerProviderStateMixin {
  bool _displayGiftingGuide = false; //显示赠送小心心
  bool _isHeart = true; //默认提示赠送小心心，false的时候是棒棒糖
  Offset? _offSize; //偏移位置 Offset offSize;//偏移位置

  late AnimationController animationController; //文本出来的动画
  late Animation<double> animationAnimation;

  late Animation<EdgeInsetsDirectional> _paddingAnimation;
  late AnimationController _paddingAniController;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('gift.show.guide', _showGuide);
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animationAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animationAnimation.addStatusListener(_onAnimationStatus);

    _paddingAniController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    _paddingAnimation = Tween<EdgeInsetsDirectional>(
      //EdgeInsetsTween  EdgeInsetsGeometryTween
      begin: const EdgeInsetsDirectional.only(
        bottom: 0.0,
      ),
      end: const EdgeInsetsDirectional.only(
        bottom: 15.0,
      ),
    ).animate(
      CurvedAnimation(
        parent: _paddingAniController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _paddingAniController.addStatusListener(_onPaddingAnimationStatus);
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_displayGiftingGuide) {
        _paddingAniController.forward();
      }
    } else if (status == AnimationStatus.dismissed) {
      _displayGiftingGuide = false;
    }
  }

  void _onPaddingAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_displayGiftingGuide) {
        _paddingAniController.reverse().orCancel;
      }
    } else if (status == AnimationStatus.dismissed) {
      if (_displayGiftingGuide) {
        _paddingAniController.forward().orCancel;
      }
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    _paddingAniController.dispose();
    eventCenter.removeListener('gift.show.guide', _showGuide);
    super.dispose();
  }

  _showGuide(String type, Object? data) {
    Map res = data as Map;
    _isHeart = Util.parseBool(res['isHeart']);
    _offSize = res['offSize'] ?? _offSize;
    bool isShow = res['isShow'];

    if (isShow) {
      _displayGiftingGuide = isShow;
      animationController.forward();
    } else {
      _paddingAniController.stop();
      animationController.reverse();
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_displayGiftingGuide == false) return Container(); //|| _offSize == null

    return Container(
      padding: EdgeInsetsDirectional.only(
          end: MediaQuery.of(context).size.width - (_offSize?.dx ?? 0) - 42),
      child: ScaleTransition(
        alignment: const Alignment(0.6, 1.0),
        scale: animationAnimation,
        child: SizedBox(
          height: 300,
          child: AnimatedBuilder(
            builder: _buildAnimation,
            animation: _paddingAniController,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      alignment: AlignmentDirectional.bottomEnd,
      padding: _paddingAnimation.value,
      child: getSendHeartOrLollipop(_isHeart),
    );
  }

  /// 提示赠送小心心
  Widget getSendHeartOrLollipop(bool isHeart) {
    return GestureDetector(
      onTap: () {
        _sendHeartOrLollipop(isHeart ? 'heart' : 'lollipop');
      },
      child: SizedBox(
        width: 129,
        height: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 129,
              height: 58,
              alignment: Alignment.center,
              padding: const EdgeInsetsDirectional.only(
                start: 15.0,
                end: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  //渐变色
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: [Color(0xFFFF67A8), Color(0xFFFFAB8F)],
                ),
              ),
              child: Text(
                isHeart
                    ? K.send_a_small_heart
                    : K.send_lollipops_will_make_you_more_popular,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.only(end: 17),
              transform: Matrix4.translationValues(0, -1, 0.0),
              child: R.img(
                'room_tip_sharp.webp',
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: 18,
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 点击赠送小心心礼物或者棒棒糖
  void _sendHeartOrLollipop(String giftStr) async {
    Tracker.instance.track(TrackEvent.room_public_guide_click, properties: {
      'type': giftStr == 'heart' ? 'send_coin_gift' : 'send_normal_gift',
    });

    String url =
        '${System.domain}room/rcmdContent?rid=${widget.room.rid}&type=$giftStr&package=${Constant.packageName}'; //lollipop//heart
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.response as Map;
      if (res['success'] == true) {
        PublicScreenEnhancementModel model =
            PublicScreenEnhancementModel.fromJson(res as Map<String, dynamic>);
        _sendGift(model.data?.cid ?? -1);
      }
    } catch (e) {
      _sendGift(-1);
    }
  }

  /// 弹出礼物面板
  _sendGift(int cid) async {
    // 房间礼物面板
    IGiftManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    await manager.showRoomGiftPanel(context, room: widget.room, defaultId: cid);
    eventCenter.emit('Gift.click.close');
  }
}
