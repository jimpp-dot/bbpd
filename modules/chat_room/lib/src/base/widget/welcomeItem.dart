import 'dart:io';
import 'dart:math';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/welcome_offer_price_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'welcome_item_info.dart';

/// 公屏入场横幅 动效
///
class WelcomeItem extends StatefulWidget {
  final Welcome data;
  final ValueChanged<Welcome>? onComplete;

  const WelcomeItem({super.key, required this.data, this.onComplete});

  @override
  _State createState() => _State();
}

class _State extends State<WelcomeItem> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin<WelcomeItem> {
  int _duration = 0;
  bool _toLeft = false;
  final GlobalKey _key = GlobalKey();
  int _hitNum = 0;

  ValueAnimation? _translateX;
  ValueAnimation _opacity = Animated.value(1.0);
  Sequence? _sequence;
  bool _translateXEnd = false;
  bool _imageLoading = false;
  String? _effectLocalPath; // 入场动效本地路径

  Widget? _body;
  String? _hitNumIcon;
  AnimationController? _iconController;
  Animation<double>? _iconAnimation;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    if (widget.data.hitNum == null || widget.data.hitNum == 0) {
      widget.data.hitNum = 1;
    }

    if (widget.data.type == WelcomeType.ComboGift) {
      _hitNum = widget.data.hitNum ?? 0;
    }
    _init();
    _initIconAnimation();

    // 如果有入场横幅动效，先下载动效图片再显示
    if ((widget.data.type == WelcomeType.Welcome ||
            widget.data.type == WelcomeType.DefendJoinMic ||
            widget.data.type == WelcomeType.DefendEnterRoom) &&
        widget.data.effect != null) {
      _imageLoading = true;

      DownloadManager.downloadImage(Util.getRemoteImgUrl(widget.data.effect?.image ?? '')).then((value) {
        _effectLocalPath = value;
      }).whenComplete(() {
        if (!mounted) return;
        setState(() {
          _imageLoading = false;
        });
        WidgetsBinding.instance.addPostFrameCallback(_onLayout);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback(_onLayout);
    }
  }

  @override
  void dispose() {
    if (_sequence != null) {
      _sequence!.stop();
      _sequence = null;
    }
    _iconController?.dispose();
    _iconController = null;
    super.dispose();
  }

  _onLayout(Duration timeStamp) {
    if (_key.currentContext == null || !mounted) {
      return;
    }
    RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
    double end = 0.0;
    if (_toLeft) {
      end = -(Util.width - box.size.width) + 18.0;
    }
    if (!mounted) return;
    setState(() {
      _translateX = Animated.value(box.size.width);
    });

    startAni(end, true);
  }

  void startAni(double end, bool needTranslateX) {
    _opacity = Animated.value(1.0);
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      if (!mounted || _translateX == null) return;
      String? tempIcon = ChatRoomData.getInstance()?.hitIconWithCount(_hitNum);
      if (Util.validStr(tempIcon)) {
        //特殊数字左边需要加扫光 右边数字出现后需要换成图片
        Future.delayed(const Duration(milliseconds: 1000)).then((value) {
          if (!mounted) return;
          _changeRightWidgetIfNeed();
        });
      }
      _sequence = Animated.sequence([
        if (needTranslateX)
          Animated.spring(_translateX!, toValue: end, speed: 1.0, bounciness: 3.0, onUpdate: (bool end) {
            if (end == true) {
              _translateXEnd = true;
            }
          }),
        Animated.delay(Duration(milliseconds: _duration)),
        Animated.spring(_opacity, toValue: 0.0, speed: 1.0, bounciness: 1.0, overshootClamping: true),
      ], (bool complete) {
        if (!mounted) return;
        if (complete) {
          _onComplete();
        } else {
          setState(() {});
        }
      }).start();
    });
  }

  _init() {
    _toLeft = false;
    _duration = 1000;
    if (widget.data.type == WelcomeType.ComboGift ||
        widget.data.type == WelcomeType.OfferPrice ||
        widget.data.type == WelcomeType.DefendJoinMic ||
        widget.data.type == WelcomeType.DefendEnterRoom) {
      _duration = 2000;
      _toLeft = true;
    } else if (widget.data.type == WelcomeType.PrivateRoom || widget.data.type == WelcomeType.HeartRaceTopChange) {
      _duration = 3000;
      _toLeft = true;
    } else if (widget.data.type == WelcomeType.AuctionBlessAward) {
      _duration = 5000;
      _toLeft = true;
    } else if (widget.data.type == WelcomeType.HeartRaceChooseRelation) {
      _duration = 8000;
      _toLeft = true;
    } else {
      int vip = widget.data.vip;
      if (vip <= 5) {
        _duration = 1000;
      } else if (vip <= 10) {
        _duration = 1500;
      } else if (vip <= 15) {
        _duration = 2000;
      } else if (vip <= 20) {
        _duration = 2500;
      } else if (vip <= 30) {
        _duration = 3000;
      } else {
        _duration = 3500;
      }

      // 有入场动效最少显示2秒
      if (widget.data.effect != null) {
        _duration = max(_duration, 2000);
      }

      if ((widget.data.top > 0 && widget.data.top <= 3) ||
          (widget.data.topWeek > 0 && widget.data.topWeek <= 3) ||
          (widget.data.topMonth > 0 && widget.data.topMonth <= 3) ||
          widget.data.titleNew > 0) {
        _toLeft = true;
      }
    }
  }

  _initIconAnimation() {
    _iconController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _iconAnimation = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: const ElasticOutCurve(0.8))).animate(_iconController!);
    // _iconAnimation.addStatusListener((status) {
    //   Log.d('_iconAnimation:$status');
    //   if (status == AnimationStatus.completed) {
    //   } else if (status == AnimationStatus.dismissed) {}
    // });
    _iconController?.forward();
  }

  _onComplete() {
    // Log.d("DebugWelcome ${widget.data.name} toClose");
    _sequence = null;
    widget.onComplete?.call(widget.data);
  }

  Widget _renderItem() {
    if (_body == null) {
      if (widget.data.type == WelcomeType.ComboGift) {
        _body = _renderComboGiftWidget();
      } else if (widget.data.type == WelcomeType.Welcome) {
        _body = WelcomeItemInfo(key: _key, welcome: widget.data, effectLocalPath: _effectLocalPath);
      } else if (widget.data.type == WelcomeType.OfferPrice) {
        _body = WelcomeOfferPriceItem(widget.data, key: _key);
      } else if (widget.data.type == WelcomeType.DefendJoinMic) {
        _body = buildDefendJoinMic();
      } else if (widget.data.type == WelcomeType.DefendEnterRoom) {
        _body = buildDefendEnterRoom();
      } else if (widget.data.type == WelcomeType.PrivateRoom) {
        _body = buildPrivateRoom();
      } else if (widget.data.type == WelcomeType.AuctionBlessAward) {
        _body = buildAuctionBlessAward();
      } else if (widget.data.type == WelcomeType.HeartRaceChooseRelation) {
        _body = buildHeartRaceChooseRelation();
      } else if (widget.data.type == WelcomeType.HeartRaceTopChange) {
        _body = buildHeartRaceTopChange();
      }
    }

    return Opacity(
      opacity: _opacity.value,
      child: Container(
        transform: Matrix4.translationValues(_translateX == null ? Util.width : _translateX!.value, 0.0, 0.0),
        alignment: AlignmentDirectional.centerEnd,
        margin: const EdgeInsetsDirectional.only(bottom: 6.0, end: 0.0),
        child: _body,
      ),
    );
  }

  Widget _renderComboGiftWidget() {
    String giftIcon = Util.giftImgUrl(widget.data.giftId ?? 0) + Util.getGiftUrlSuffix();
    String? lightPath;
    String bgPath = 'bg_combo_Level_';
    int price = (Util.parseDouble(widget.data.giftPrice) * 100).ceil();
    int? level = ChatRoomData.getInstance()?.hitLevelWithPrice(price);
    String? hitIcon = ChatRoomData.getInstance()?.hitIconWithCount(_hitNum);
    if (Util.validStr(hitIcon)) {
      lightPath = 'bg_combo_light.webp';
    }
    bgPath = '$bgPath$level.webp';
    return Row(
      key: _key,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
              width: 246,
              height: 56,
              child: RepaintBoundary(
                child: CachedNetworkImage(imageUrl: Util.getImgUrl(bgPath, package: ComponentManager.MANAGER_BASE_ROOM)),
              ),
            ),
            Positioned.fill(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0x99FFFFFF), width: 2),
                    ),
                    child: CommonAvatar(
                      path: widget.data.icon,
                      size: 36,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            if (widget.data.vip > 0)
                              UserVipWidget(
                                vip: widget.data.vip,
                                height: kNameplateHeight,
                                padding: const EdgeInsetsDirectional.only(end: 2),
                              ),
                            if (widget.data.popularityLevel > 0)
                              UserPopularity(popularityLevel: widget.data.popularityLevel, height: kNameplateHeight),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                widget.data.name ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        _sendUserInfoWidget()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8),
                    child: CachedNetworkImage(
                      placeholder: const CupertinoActivityIndicator(),
                      imageUrl: giftIcon,
                      width: 56,
                      height: 56,
                      cachedWidth: 56.px,
                      cachedHeight: 56.px,
                      fit: BoxFit.contain,
                      fadeInDuration: const Duration(microseconds: 0),
                      fadeOutDuration: const Duration(microseconds: 0),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.data.isVoiceGift)
              PositionedDirectional(
                top: 4,
                start: 0,
                child: R.img('ic_voice.webp', width: 16, height: 16, package: ComponentManager.MANAGER_BASE_ROOM),
              ),
            if (Util.validStr(lightPath))
              Positioned.fill(
                child: MultiframeImage.asset(
                  R.imagePath(lightPath!, package: ComponentManager.MANAGER_BASE_ROOM),
                ),
                // child: R.img(lightPath,package: ComponentManager.MANAGER_ROOM),
              )
          ],
        ),
        if (_iconAnimation != null)
          ScaleTransition(
            scale: _iconAnimation!,
            child: FadeTransition(
              opacity: _iconAnimation!,
              child: _comboRightWidget(),
            ),
          )
      ],
    );
  }

  /// 守护双方上麦横幅
  Widget buildDefendJoinMic() {
    /// 判null操作
    if (Util.isStringEmpty(_effectLocalPath)) {
      return const SizedBox();
    }

    String name1 = getMaxText(widget.data.name);
    String name2 = getMaxText(widget.data.toName);
    return RepaintBoundary(
      key: _key,
      child: Container(
        width: 293,
        height: 44,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(_effectLocalPath ?? '')),
            fit: BoxFit.fill,
          ),
        ),
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(start: 43),
        child: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: name1,
            style: TextStyle(
              fontFamily: Util.fontFamily,
              fontSize: 12,
              color: widget.data.effect?.fontColor,
            ),
            children: [
              TextSpan(
                text: K.room_with,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: name2,
                style: TextStyle(
                  fontSize: 12,
                  color: widget.data.effect?.fontColor,
                ),
              ),
              TextSpan(
                text: widget.data.micSuffix ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 守护双方进房横幅
  Widget buildDefendEnterRoom() {
    String name1 = getMaxText(widget.data.name);
    String name2 = getMaxText(widget.data.toName);
    return RepaintBoundary(
      key: _key,
      child: Container(
        width: 287,
        height: 56,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(_effectLocalPath ?? '')),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 60,
              child: Stack(
                children: [
                  buildDefendIcon(Util.getRemoteImgUrl(widget.data.icon ?? '')),
                  PositionedDirectional(
                    start: 26,
                    child: buildDefendIcon(Util.getRemoteImgUrl(widget.data.toIcon ?? '')),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: name1,
                    style: TextStyle(
                      fontFamily: Util.fontFamily,
                      fontSize: 12,
                      color: widget.data.effect?.fontColor,
                    ),
                    children: [
                      TextSpan(
                        text: K.room_with,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: name2,
                        style: TextStyle(
                          fontSize: 12,
                          color: widget.data.effect?.fontColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.data.enterSuffix ?? '',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDefendIcon(String icon) {
    return Container(
      width: 34,
      height: 34,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      alignment: AlignmentDirectional.center,
      child: CommonAvatar(
        path: icon,
        size: 32,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildAuctionBlessAward() {
    return Row(
      key: _key,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 44,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            gradient: LinearGradient(
              colors: [Color(0xFFFF6CE1), Color(0xFF9068FE)],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: CommonAvatar(
                  path: widget.data.icon,
                  size: 32,
                  shape: BoxShape.circle,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                K.room_congratulations,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 70,
                ),
                child: Text(
                  widget.data.name ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                K.room_auction_bless_award,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        buildIconCountWidget(),
      ],
    );
  }

  /// 心跳竞速：第一名变动
  Widget buildHeartRaceTopChange() {
    return SizedBox(
      key: _key,
      width: 120,
      height: 57,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 13,
            child: Container(
              width: 120,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(24),
                gradient: LinearGradient(
                  colors: widget.data.isMale == true
                      ? [const Color(0xFF6CA6FF), const Color(0xFF9068FE)]
                      : [const Color(0xFFFF6CE1), const Color(0xFF9068FE)],
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: 13,
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl('static/room/heart_race/ic_heart_race_star_bg.webp'),
              width: 120,
              height: 44,
            ),
          ),
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(
              widget.data.isMale == true
                  ? 'static/room/heart_race/ic_heart_race_top_change_male.webp'
                  : 'static/room/heart_race/ic_heart_race_top_change_female.webp',
            ),
            width: 120,
            height: 22,
          ),
          PositionedDirectional(
            top: 19,
            start: 8,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildHeartRaceIcon(widget.data.icon ?? ''),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.isMale == true ? K.room_heart_race_top_change_male : K.room_heart_race_top_change_female,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 70),
                      child: Text(
                        widget.data.name ?? '',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withOpacity(0.8),
                          height: 1.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 心跳竞速：选择关系
  Widget buildHeartRaceChooseRelation() {
    return Container(
      key: _key,
      width: 145,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(24),
        gradient: const LinearGradient(colors: [Color(0xFFFF6CE1), Color(0xFF9068FE)]),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl('static/room/heart_race/ic_heart_race_star_bg.webp'),
            width: 120,
            height: 44,
          ),
          PositionedDirectional(
            top: 6,
            start: 6,
            child: buildHeartRaceIcon(widget.data.icon ?? ''),
          ),
          PositionedDirectional(
            top: 6,
            start: 34,
            child: buildHeartRaceIcon(widget.data.toIcon ?? ''),
          ),
          PositionedDirectional(
            top: 6,
            start: 70,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.micSuffix ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.data.enterSuffix ?? '',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withOpacity(0.8),
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeartRaceIcon(String icon) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
      ),
      alignment: AlignmentDirectional.center,
      child: CommonAvatar(
        path: icon,
        size: 30,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildIconCountWidget() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: <Color>[Color(0xFFFFF3AA), Color(0xFFF2A04D)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: SizedBox(
        width: 88,
        child: RichText(
          maxLines: 1,
          text: TextSpan(
            text: 'x',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontFamily: Util.fontFamily,
              shadows: const <Shadow>[Shadow(offset: Offset(0.0, 0.0), blurRadius: 1.0, color: Color(0xFF974200))],
            ),
            children: <TextSpan>[
              const TextSpan(
                text: ' ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: (widget.data.hitNum ?? 0) < 9999 ? '${widget.data.hitNum}' : Util.numberToKString(widget.data.hitNum!, fix: 0),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  shadows: <Shadow>[Shadow(offset: Offset(0.0, 0.0), blurRadius: 1.0, color: Color(0xFF974200))],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPrivateRoom() {
    return Container(
      key: _key,
      width: 162,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6CE1), Color(0xFF9068FE)],
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 6,
          ),
          buildPrivateRoomIcons(),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  K.room_cplink_state_hand,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  K.room_go_private_room,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 6,
          ),
        ],
      ),
    );
  }

  Widget buildPrivateRoomIcons() {
    return SizedBox(
      width: 30.0 + 36,
      child: Stack(
        children: [
          PositionedDirectional(
            start: 30,
            child: buildPrivateRoomIcon(widget.data.icon ?? ''),
          ),
          buildPrivateRoomIcon(widget.data.toIcon ?? ''),
        ],
      ),
    );
  }

  Widget buildPrivateRoomIcon(String url) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: CommonAvatar(
        path: url,
        size: 34,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _sendUserInfoWidget() {
    if (Util.validList(widget.data.icons) && widget.data.icons!.length > 1) {
      return Row(
        children: [
          Text(
            K.room_send,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white60,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          _iconListWidget(),
          Text(
            '｜${widget.data.allMic ? K.room_all_mic : '${widget.data.icons!.length}${K.room_person}'}',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white60,
            ),
          ),
        ],
      );
    }
    return Flexible(
        child: Text(
      K.room_send + (widget.data.allMic ? K.room_all_mic : ' ${widget.data.toName}'),
      style: const TextStyle(
        fontSize: 11,
        color: Colors.white60,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ));
  }

  Widget _iconListWidget() {
    List<String> list = widget.data.icons!.sublist(0, min(widget.data.icons!.length, 4));
    Widget iconWidget = IconOverlayWidget(list);
    if (widget.data.icons!.length <= 3) {
      return iconWidget;
    }
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: <Color>[
            Colors.transparent,
            Colors.transparent,
            Colors.black,
            Colors.black,
          ],
          stops: [0.0, 0.6, 0.9, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: iconWidget,
    );
  }

  Widget _comboRightWidget() {
    if (Util.validStr(_hitNumIcon)) {
      return SizedBox(
        width: 88,
        height: 56,
        child: MultiframeImage.network(
          Util.getRemoteImgUrl(_hitNumIcon!),
          'combo_icon_effect',
          onComplete: () {},
        ),
      );
    }
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: <Color>[Color(0xFFFFF3AA), Color(0xFFF2A04D)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: SizedBox(
        width: 88,
        child: RichText(
          maxLines: 1,
          text: TextSpan(
            text: 'x',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontFamily: Util.fontFamily,
              shadows: const <Shadow>[Shadow(offset: Offset(0.0, 0.0), blurRadius: 1.0, color: Color(0xFF974200))],
            ),
            children: <TextSpan>[
              const TextSpan(
                text: ' ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: (widget.data.hitNum ?? 0) < 9999 ? '${widget.data.hitNum}' : Util.numberToKString(widget.data.hitNum!, fix: 0),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  shadows: <Shadow>[Shadow(offset: Offset(0.0, 0.0), blurRadius: 1.0, color: Color(0xFF974200))],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeRightWidgetIfNeed() {
    _hitNumIcon = ChatRoomData.getInstance()?.hitIconWithCount(_hitNum);
    if (Util.validStr(_hitNumIcon)) {
      setState(() {
        _body = null;
        _iconController?.reset();
        _iconController?.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.data.type == WelcomeType.Welcome ||
        widget.data.type == WelcomeType.DefendJoinMic ||
        widget.data.type == WelcomeType.DefendEnterRoom ||
        widget.data.type == WelcomeType.PrivateRoom ||
        widget.data.type == WelcomeType.AuctionBlessAward ||
        widget.data.type == WelcomeType.HeartRaceChooseRelation ||
        widget.data.type == WelcomeType.HeartRaceTopChange) {
      if (_imageLoading) {
        return const SizedBox.shrink();
      }
      return _renderItem();
    } else {
      if (_hitNum != widget.data.hitNum) {
        // 礼物发生连击
        _hitNum = widget.data.hitNum ?? 0;
        _body = null;
        _hitNumIcon = null;
        _iconController?.reset();
        _iconController?.forward();
        if (_sequence != null && _translateXEnd == true) {
          // 当前还在做动画，切水平移动动画已完成，重新倒计时3s
          _sequence!.stop();
          _sequence = null;
          startAni(0, false);
        }
      }
      return _renderItem();
    }
  }

  /// 最多6个中文字符
  String getMaxText(String? text) {
    if (text == null) return '';
    if (text.length <= 6) {
      return text;
    }
    return text.safeSubstring(0, 6);
  }
}
