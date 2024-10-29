import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// app层的banner动画播放
/// webp格式，播完需要回调通知
class GlobalAppBannerAnimWidget extends StatefulWidget {
  final Map data;
  final VoidCallback? onComplete;

  const GlobalAppBannerAnimWidget(
      {Key? key, required this.data, this.onComplete})
      : super(key: key);

  @override
  _GlobalAppBannerAnimWidgetState createState() =>
      _GlobalAppBannerAnimWidgetState();
}

class _GlobalAppBannerAnimWidgetState extends State<GlobalAppBannerAnimWidget> {
  late Map _currentItem;
  final ValueAnimation _trx = Animated.value(Util.width);
  Sequence? _sequence;

  @override
  void initState() {
    super.initState();
    _sequence = Animated.sequence([
      Animated.spring(
        _trx,
        toValue: 0.0,
        speed: 1.0,
        bounciness: 3.0,
      ),
      Animated.delay(const Duration(milliseconds: 2000)),
      Animated.spring(_trx,
          toValue: 0 - Util.width,
          speed: 3.0,
          bounciness: 3.0,
          overshootClamping: true),
    ], _onAniUpdate);

    _currentItem = widget.data;
    _sequence?.start();
  }

  @override
  void dispose() {
    if (_sequence != null) {
      _sequence!.stop();
      _sequence = null;
    }
    super.dispose();
  }

  _onAniUpdate(bool complete) {
    if (complete) {
      if (widget.onComplete != null) {
        widget.onComplete!();
      }
    } else {
      setState(() {});
    }
  }

  Transform _buildBannerBody(BuildContext context, Map data) {
    String? bgImg = Util.parseStr(data['bgImg']);
    String? leftIcon = Util.parseStr(data['leftIcon']);
    String? content = Util.parseStr(data['content']);
    String? rightIcon = Util.parseStr(data['rightIcon']);
    String? schemaUrl = Util.parseStr(data['schemaUrl']);
    return Transform.scale(
      scale: Util.ratio,
      child: Container(
        height: 80,
        width: 375,
        alignment: AlignmentDirectional.center,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            RepaintBoundary(
              child: CachedNetworkImage(
                height: 80,
                fit: BoxFit.fitHeight,
                imageUrl: '$bgImg',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (schemaUrl != null && schemaUrl.isNotEmpty) {
                  SchemeUrlHelper.instance().checkSchemeUrlAndGo(
                    context,
                    schemaUrl,
                  );
                }
              },
              child: Container(
                width: 310,
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 2),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          // border: Border.all(color: _isActivity() ? Colors.white : Color(0xFFFFDE01), width: 2),
                          borderRadius: BorderRadius.circular((44.0 + 4) / 2),
                          gradient: const LinearGradient(
                            begin: AlignmentDirectional.topCenter,
                            end: AlignmentDirectional.bottomCenter,
                            colors: [Color(0xFFA08AFF), Color(0xFF3EFFE2)],
                          )),
                      child: CommonAvatar(
                        path: '$leftIcon',
                        size: 44.0,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        '$content',
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (rightIcon != null && rightIcon.isNotEmpty)
                      SizedBox(
                        width: 74,
                        height: 70,
                        child: Stack(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          children: [
                            Container(
                              width: 74,
                              height: 70,
                              alignment: AlignmentDirectional.center,
                              child: CachedNetworkImage(
                                imageUrl: rightIcon,
                                width: 60.0,
                                height: 60.0,
                              ),
                            ),
                            R.img('ic_gift_mask.png',
                                width: 74,
                                height: 70,
                                package: ComponentManager.MANAGER_BASE_ROOM),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (schemaUrl != null && schemaUrl.isNotEmpty)
              PositionedDirectional(
                end: 0,
                child: RepaintBoundary(
                    child: R.img('ic_room_arrow.webp',
                        width: 40,
                        height: 30,
                        package: ComponentManager.MANAGER_BASE_ROOM)),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsetsDirectional.only(
            top: MediaQuery.of(context).padding.top + 34.0,
          ),
          transform: Matrix4.identity()..translate(_trx.value),
          child: _buildBannerBody(context, _currentItem),
        ),
      ),
    );
  }
}
