import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_request.dart';
import 'package:chat_room/src/protobuf/generated/grab_hat.pb.dart';
import 'package:chat_room/src/protobuf/generated/grab_hat_rank.pb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 房间内vap Overlay动效
class HatMergeVapOverlay extends StatefulWidget {
  final String category;
  final String vapUrl;
  final int vapSize;
  final VoidCallback? onStartPlay;
  final Function(bool success, {HatActivityRewardCommodity? rewardItem})?
      onComplete;
  final VoidCallback? onError;
  const HatMergeVapOverlay(
      {Key? key,
      required this.vapUrl,
      required this.vapSize,
      required this.category,
      this.onStartPlay,
      this.onComplete,
      this.onError})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HatMergeVapOverlayState();
  }

  static OverlayEntry? _overlayEntry;

  /// vapUrl: vap链接
  /// vapSize: vap文件大小
  /// textList: 文字tags
  /// imageList: 图片tags
  static show({
    BuildContext? context,
    required String vapUrl,
    required int vapSize,
    required String category,
    VoidCallback? onStartPlay,
    Function(bool success, {HatActivityRewardCommodity? rewardItem})?
        onComplete,
  }) async {
    if (!Util.isAppActive) {
      Log.d('app is not Active, ignore');
      return;
    }

    var overlayState = Overlay.of(System.context);

    if (_overlayEntry != null) {
      return;
    }

    vapUrl = Util.getRemoteImgUrl(vapUrl);
    if (Util.validStr(vapUrl)) {
      _overlayEntry = OverlayEntry(builder: (context) {
        return HatMergeVapOverlay(
          vapUrl: vapUrl,
          vapSize: vapSize,
          category: category,
          onStartPlay: () {
            if (onStartPlay != null) {
              onStartPlay();
            }
          },
          onComplete: (bool success, {HatActivityRewardCommodity? rewardItem}) {
            if (onComplete != null) {
              onComplete(success, rewardItem: rewardItem);
            }
            _onComplete();
          },
          onError: () {
            if (onComplete != null) {
              onComplete(false, rewardItem: null);
            }
            _onComplete();
          },
        );
      });
      overlayState.insert(_overlayEntry!);
    }
  }

  static _onComplete() {
    Log.d('_onComplete-----------------------');
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static dismiss() {
    _onComplete();
  }
}

class HatMergeVapOverlayState extends State<HatMergeVapOverlay> {
  ResHatMerge? hatMerge;
  final _giftOpacity = 0.0.obs;

  @override
  void initState() {
    super.initState();
    getMergeInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (Constant.isDevMode && Util.isIOSSimulator) {
      return VapSimulatorWidget(onComplete: () {
        if (widget.onComplete != null) {
          widget.onComplete!(hatMerge?.success ?? false,
              rewardItem: hatMerge?.data);
        }
      }); // 拦截iOS模拟器播放VAP动画
    }
    return Obx(() {
      return Stack(
        children: [
          Container(
            height: Util.height,
            width: Util.width,
            color: Colors.black.withOpacity(0.7),
          ),
          PositionedDirectional(
              child: VapDisplayWidget(
            vap: Vap(url: widget.vapUrl, size: widget.vapSize),
            onComplete: () {
              _giftOpacity.value = 1;
              Future.delayed(const Duration(seconds: 3), () {
                if (widget.onComplete != null) {
                  widget.onComplete!(hatMerge?.success ?? false,
                      rewardItem: hatMerge?.data);
                }
              });
            },
            onError: () {
              if (widget.onError != null) {
                widget.onError!();
              }
            },
          )),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: _giftOpacity.value,
              child: (hatMerge != null && hatMerge!.success)
                  ? Column(mainAxisSize: MainAxisSize.min, children: [
                      Stack(alignment: AlignmentDirectional.center, children: [
                        CachedNetworkImage(
                          imageUrl:
                              Util.getRemoteImgUrl(hatMerge?.data.url ?? ''),
                          width: 120,
                          height: 120,
                        ),
                        R.img(RoomAssets.chat_room$grab_hat_hat_icon_mask_webp,
                            width: 208, height: 208)
                      ]),
                      SizedBox(
                        height: 9.dp,
                      ),
                      Text(hatMerge?.data.name ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                    ])
                  : Text(
                      hatMerge == null ? '请求中' : hatMerge!.message,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
            ),
          ),
        ],
      );
    });
  }

  Future<void> getMergeInfo() async {
    ResHatMerge response = await HatRequest.mergeHatPicture(widget.category);
    hatMerge = response;

    if (mounted) {
      setState(() {});
    }
  }
}
