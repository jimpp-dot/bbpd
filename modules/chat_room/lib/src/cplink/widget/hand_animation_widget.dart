import 'dart:async';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';
import 'package:chat_room/src/cplink/util/cplink_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vap_texture/flutter_vap_texture.dart';

import '../../../k.dart';

/// 牵手成功或者失败后的动画界面
class HandAnimationWidget extends StatefulWidget {
  final ChatRoomData room;

  const HandAnimationWidget({Key? key, required this.room}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HandAnimationState();
  }
}

class _HandAnimationState extends State<HandAnimationWidget> {
  CpLinkResult? _cpLinkResult;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(RoomConstant.EVENT_CPLINK_HAND_RESULT, _onHandResultEvent);
  }

  void _onHandResultEvent(String type, dynamic data) async {
    CpLinkResult cpLinkResult = CpLinkResult.fromJson(data);
    _cpLinkResult = cpLinkResult;
    setState(() {});
  }

  @override
  void dispose() {
    eventCenter.removeListener(RoomConstant.EVENT_CPLINK_HAND_RESULT, _onHandResultEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cpLinkResult == null) {
      return const SizedBox.shrink();
    }
    return HandVapAniWidget(
      onAnimationComplete: () {
        if (_cpLinkResult!.isSuccess()) {
          int newRid = _cpLinkResult!.rid;
          List<String> uids = _cpLinkResult!.uids;
          if (newRid > 0 && !Util.isCollectionEmpty(uids) && uids.contains(Session.uid.toString())) {
            eventCenter.emit(EventConstant.roomChangeRid, newRid);
          }
        }

        _cpLinkResult = null;
        if (mounted) setState(() {});
      },
      cpLinkResult: _cpLinkResult!,
      isTheOne: widget.room.config?.types == RoomTypes.TheOne,
    );
  }
}

class HandVapAniWidget extends StatefulWidget {
  final OnAnimationComplete onAnimationComplete;
  final CpLinkResult cpLinkResult;
  final bool isTheOne;

  const HandVapAniWidget({Key? key, required this.onAnimationComplete, required this.cpLinkResult, this.isTheOne = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HandSuccessAniState();
  }
}

typedef OnAnimationComplete = Function();

class _HandSuccessAniState extends State<HandVapAniWidget> with TickerProviderStateMixin {
  static const String LOG_TAG = "_HandSuccessAniState";

  bool downloadVapSuccess = false;

  late AnimationController _opacityController;
  late Animation<double> _opacity;
  Timer? _cancelTimer;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    loadVap();
  }

  void _initAnimation() {
    _opacityController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    final CurvedAnimation scaleCurve = CurvedAnimation(parent: _opacityController, curve: const Interval(0, 1, curve: Curves.decelerate));
    _opacity = Tween<double>(begin: .0, end: 1.0).animate(scaleCurve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          widget.onAnimationComplete();
        }
      });
  }

  void _tryClose() {
    int time = widget.cpLinkResult.isSuccess() ? 13 : 9;
    _cancelTimer?.cancel();
    _cancelTimer = Timer(Duration(seconds: time), () {
      if (!mounted) {
        return;
      }
      if (widget.cpLinkResult.isSuccess()) {
        _opacityController.reverse();
      } else {
        widget.onAnimationComplete();
      }
    });
  }

  void loadVap() async {
    String url = System.imageDomain + (widget.cpLinkResult.url ?? '');
    bool success = await CpLinkUtil.cacheGiftWithTry(url, widget.cpLinkResult.size);
    if (!mounted) return;
    if (success) {
      File vapFile = File(CpLinkUtil.getVapFilePathByUrl(url));

      FileStat stat = await vapFile.stat();
      Log.d(tag: LOG_TAG, "Down success url = $url ex = ${vapFile.exists()} and path = ${vapFile.path} and size = ${stat.size}");

      downloadVapSuccess = true;
      if (mounted) setState(() {});

      if (widget.cpLinkResult.isSuccess()) {
        _opacityController.forward();
      }

      _tryClose();
    } else {
      Log.w(tag: LOG_TAG, "down cplink vap fail url = $url && size = ${widget.cpLinkResult.size}");
      widget.onAnimationComplete();
    }
  }

  @override
  void dispose() {
    _opacityController.dispose();
    _cancelTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (downloadVapSuccess) {
      return IgnorePointer(
        child: Container(
          color: Colors.black38,
          child: Stack(
            children: getWidgets(),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  List<Widget> getWidgets() {
    List<Widget> list = [_renderVapGift(context)];
    if (widget.cpLinkResult.isSuccess()) {
      list.add(_getUserIcon());
    } else if (widget.cpLinkResult.isFail()) {
      list.add(_getHandFail());
    }
    return list;
  }

  Widget _getHandFail() {
    return PositionedDirectional(
      top: 170 / 812 * Util.height,
      child: Container(
        width: Util.width,
        alignment: Alignment.center,
        child: GradientText(
          widget.isTheOne ? K.room_theone_fail_hand : K.room_cplink_fail_hand,
          textAlign: TextAlign.start,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFFFACF0)],
          ),
          style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  final double _iconSize = 70;

  Widget _getUserIcon() {
    return PositionedDirectional(
      top: 140 / 812 * Util.height,
      child: AnimatedBuilder(
        animation: _opacityController,
        builder: (context, child) {
          return FadeTransition(opacity: _opacity, child: child);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              K.room_cplink_cong,
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            GradientText(
              widget.isTheOne ? K.room_theone_success_hand : K.room_cplink_success_hand,
              textAlign: TextAlign.start,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFFFACF0)],
              ),
              style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            SizedBox(height: 48 / 812 * Util.height),
            SizedBox(
              width: (2 * _iconSize - 16) / 375 * Util.width,
              height: (_iconSize + 1) / 812 * Util.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PositionedDirectional(start: 0, child: _buildUserIcon(widget.cpLinkResult.users[0].icon ?? '')),
                  PositionedDirectional(end: 0, child: _buildUserIcon(widget.cpLinkResult.users[1].icon ?? '')),
                  PositionedDirectional(
                    child:
                        R.img("cplink/cplink_success_inner_heart.png", package: ComponentManager.MANAGER_BASE_ROOM, width: 40, height: 40),
                  )
                ],
              ),
            ),
            SizedBox(
              width: Util.width,
              height: 125 / 812 * Util.height,
            ),
            if (!Util.isStringEmpty(widget.cpLinkResult.relationName))
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    WidgetSpan(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 76),
                        child: Text(
                          widget.cpLinkResult.users[0].name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Color(0xFFFF8FAB), fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 4)),
                    TextSpan(
                      text: K.room_cplink_and_word,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const WidgetSpan(child: SizedBox(width: 4)),
                    WidgetSpan(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 76),
                        child: Text(
                          widget.cpLinkResult.users[1].name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Color(0xFFFF8FAB), fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 4)),
                    TextSpan(
                      text: K.room_cplink_reach,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const WidgetSpan(child: SizedBox(width: 4)),
                    WidgetSpan(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.white.withOpacity(0.1), width: 0.5),
                          color: const Color(0xFFFF5F7D),
                        ),
                        padding: const EdgeInsetsDirectional.only(top: 3, bottom: 3, start: 7, end: 7),
                        child: Text(
                          widget.cpLinkResult.relationName ?? '',
                          style: const TextStyle(color: Colors.white, fontSize: 9),
                        ),
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 4)),
                    TextSpan(
                      text: widget.cpLinkResult.relationDuration,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
          ],
        ),
      ),
    );
  }

  Widget _buildUserIcon(String icon) {
    String image = _getUrl(icon, '!head150');
    return Container(
      height: _iconSize / 812 * Util.height,
      width: _iconSize / 812 * Util.height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: HeadIcon(
        icon: image,
        width: _iconSize / 812 * Util.height,
        height: _iconSize / 812 * Util.height,
      ),
    );
  }

  Widget _renderVapGift(BuildContext context) {
    if (Constant.isDevMode && Util.isIOSSimulator) {
      return VapSimulatorWidget(onComplete: widget.onAnimationComplete); // 拦截iOS模拟器播放VAP动画
    }
    File vapFile = File(CpLinkUtil.getVapFilePathByUrl(System.imageDomain + (widget.cpLinkResult.url ?? '')));
    return PositionedDirectional(
      start: 0.0,
      end: 0.0,
      top: 0.0,
      height: MediaQuery.of(context).size.height,
      child: VapWidget(
        hybridComposition: !Util.cantHybridComposition(),
        onPlatformViewCreated: (FlutterVapController controller) async {
          String filePath = vapFile.path;
          Log.d(tag: LOG_TAG, "onPlatformViewCreated and filePath = $filePath");
          controller.startPlay(filePath);
        },
        onComplete: () {
          Log.d(tag: LOG_TAG, "Vap onComplete");
          if (!mounted) {
            return;
          }
          _cancelTimer?.cancel();

          if (widget.cpLinkResult.isSuccess()) {
            _opacityController.reverse();
          } else {
            widget.onAnimationComplete();
          }
        },
      ),
    );
  }

  String _getUrl(String? path, String? suffix) {
    String? url;
    if (path != null && path.trim().isNotEmpty) {
      url = Util.imageFullUrl(path);
      if (suffix != null && !url.contains(RegExp(r'!head(\d+)')) && !url.contains('x-oss-process=image/resize')) {
        url = url + suffix;
      }
      url = Util.recombineUrl(url);
    }
    return url ?? '';
  }
}
