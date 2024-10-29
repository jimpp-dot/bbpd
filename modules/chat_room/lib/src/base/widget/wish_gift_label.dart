import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/gift_wish_bean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 心愿礼物标签
class WishGiftLabel extends StatefulWidget {
  final ChatRoomData room;

  const WishGiftLabel({super.key, required this.room});

  @override
  _WishGiftLabelState createState() => _WishGiftLabelState();

  static bool notRealShow(ChatRoomData room) {
    RoomWishGiftsData? data = room.roomWishGiftsData;

    if (data == null) {
      return false;
    }

    if (data.show == false) {
      return true;
    }
    if (!(room.isCreator || room.isReception) &&
        Util.isCollectionEmpty(data.gifts)) {
      return true;
    }

    return false;
  }
}

class _WishGiftLabelState extends State<WishGiftLabel> {
  final GlobalKey _textKey = GlobalKey();

  double _progressWidth = 40.0;

  final SwiperController _controller = SwiperController();

  int? _timerKey;

  int _index = 0;

  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _disposed = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      RenderBox? textBox =
          _textKey.currentContext?.findRenderObject() as RenderBox?;
      double width = 0.0;
      if (textBox != null) {
        width = textBox.size.width;
      }
      if (width > 0 && mounted) {
        _progressWidth = width;
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      _startAnimate();
    });

    widget.room.addListener(RoomConstant.Event_Refresh_Gift_Wish, _onRefresh);
  }

  void _onRefresh(String type, dynamic data) {
    if (mounted) {
      if (_timerKey != null) {
        JsTimer.clearTimeout(_timerKey!);
      }
      _index = 0;
      _startAnimate();
      setState(() {});
    }
  }

  RoomWishGiftsData? get _data => widget.room.roomWishGiftsData;

  bool get _canAdmin => widget.room.isCreator || widget.room.isReception;

  bool get _isComplete =>
      _data != null &&
      _data?.champion != null &&
      !Util.isStringEmpty(_data?.champion?.icon);

  @override
  Widget build(BuildContext context) {
    RoomWishGiftsData? data = _data;
    if (data == null || data.show == false) {
      return const SizedBox.shrink();
    }
    if (!_canAdmin && Util.isCollectionEmpty(_data?.gifts)) {
      return const SizedBox.shrink();
    }

    double percent = (data.percent) / 100.0;
    return GestureDetector(
      onTap: () {
        IGiftManager giftManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        if (_canAdmin) {
          giftManager.showWishGiftEditPanel(context, room: widget.room);
        } else {
          giftManager.showWishGiftSendPanel(context, room: widget.room);
        }
      },
      child: Container(
        height: 22,
        padding: const EdgeInsetsDirectional.only(end: 8),
        decoration: const ShapeDecoration(
            color: Color(0x1FFFFFFF), shape: StadiumBorder()),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_isComplete)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 4, end: 2),
                child: Text(
                  K.room_thanks_word,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ),
            if (_isComplete)
              CommonAvatar(
                path: data.champion?.icon ?? '',
                size: 16,
                shape: BoxShape.circle,
              )
            else
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1)),
                child: _getGiftIconWidget(data),
              ),
            const SizedBox(
              width: 4,
            ),
            if (_isComplete)
              Text(
                K.room_wish_complete,
                key: _textKey,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              )
            else
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    K.room_gift_wish,
                    key: _textKey,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                    child: Stack(
                      children: [
                        Container(
                          width: _progressWidth,
                          decoration: const ShapeDecoration(
                              shape: StadiumBorder(), color: Color(0x33000000)),
                        ),
                        Container(
                          width: _progressWidth * (min(1, percent)),
                          decoration: const ShapeDecoration(
                            shape: StadiumBorder(),
                            gradient: LinearGradient(
                                colors: [Color(0xFF9E6AFF), Color(0xFFFF6AF7)]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget _getGiftIconWidget(RoomWishGiftsData data) {
    if (Util.isCollectionEmpty(data.gifts)) {
      return ClipOval(
        child: R.img('ic_gift_question.png',
            width: 22, height: 22, package: ComponentManager.MANAGER_BASE_ROOM),
      );
    }

    if (data.gifts.length > 1) {
      return Swiper(
        itemCount: data.gifts.length,
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return _buildGiftItem(data.gifts[index]);
        },
      );
    }

    return _buildGiftItem(data.gifts[0]);
  }

  Widget _buildGiftItem(RoomWishGift gift) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: Util.squareResize(Util.giftImgUrl(gift.giftId), 75),
        width: 22,
        height: 22,
        cachedWidth: 22.px,
        cachedHeight: 22.px,
      ),
    );
  }

  _startAnimate() {
    if (_data != null && _data!.gifts.length > 1) {
      int length = _data!.gifts.length;
      const Duration duration = Duration(seconds: 3);
      _timerKey = JsTimer.setTimeout(() {
        if (!mounted) return;
        if (_disposed) return;

        _index += 1;
        if (_index >= length) {
          _index = _index % length;
        }
        _controller.next(animation: true);
        _startAnimate();
      }, duration.inMilliseconds);
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _controller.dispose();

    if (_timerKey != null) {
      JsTimer.clearTimeout(_timerKey!);
    }

    widget.room
        .removeListener(RoomConstant.Event_Refresh_Gift_Wish, _onRefresh);
    super.dispose();
  }
}
