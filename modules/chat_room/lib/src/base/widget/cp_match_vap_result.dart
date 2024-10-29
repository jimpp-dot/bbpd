import 'dart:io';
import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vap_texture/flutter_vap_texture.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../k.dart';

/// 心动速配牵手动效：VAP播放
///
class CpMatchVapResult extends StatefulWidget {
  final VoidCallback? onComplete;
  final Map data;

  const CpMatchVapResult({super.key, this.onComplete, required this.data});

  @override
  CpMatchVapState createState() => CpMatchVapState();
}

class CpMatchVapState extends State<CpMatchVapResult>
    with TickerProviderStateMixin {
  final double _giftRatio = 1624.0 / 750.0;

  double get giftRatio => _giftRatio;
  late double giftWidth, giftHeight, offsetHorizontal, offsetVertical;
  File? _bgFile;
  bool hideButton = false;
  late AnimationController _inAnimationController;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _initSizes();
    _initAnimation();
    _loadFile();
  }

  @override
  void dispose() {
    _inAnimationController.dispose();
    super.dispose();
  }

  void _initAnimation() {
    _inAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    CurvedAnimation curve = CurvedAnimation(
        parent: _inAnimationController, curve: Curves.easeInOut);
    _opacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
  }

  void _initSizes() {
    final width = Util.width;
    final height = Util.height;
    if (height / width >= giftRatio) {
      giftHeight = height;
      giftWidth = giftHeight / giftRatio;
      offsetHorizontal = -(giftWidth - width) / 2;
      offsetVertical = 0;
    } else {
      giftWidth = width;
      giftHeight = giftWidth * giftRatio;
      offsetHorizontal = 0;
      offsetVertical = -(giftHeight - height) / 2;
    }
  }

  void _loadFile() async {
    String url = widget.data['vap_url'];

    if (widget.data['user_a'] is Map &&
        Util.validStr(widget.data['user_a']['icon']) &&
        widget.data['user_b'] is Map &&
        Util.validStr(widget.data['user_b']['icon'])) {
      /// 预加载头像
      CachedImageManager.preCache(
          this.context, Util.getUserIconUrl(widget.data['user_a']['icon']));
      CachedImageManager.preCache(
          this.context, Util.getUserIconUrl(widget.data['user_b']['icon']));

      /// 预加载帽子
      if (Util.validStr(widget.data['user_a']['hat_url'])) {
        /// 优先使用服务端下发的帽子资源
        CachedImageManager.preCache(this.context,
            Util.getCpHatImgUrl(widget.data['user_a']['hat_url']));
      } else {
        String manHat =
            getHatPath(true, Util.parseInt(widget.data['user_a']['hat_level']));
        if (Util.validStr(manHat) && !(await File(manHat).exists())) {
          await preloadHat(
              true, Util.parseInt(widget.data['user_a']['hat_level']));
        }
      }

      if (Util.validStr(widget.data['user_b']['hat_url'])) {
        /// 优先使用服务端下发的帽子资源
        CachedImageManager.preCache(this.context,
            Util.getCpHatImgUrl(widget.data['user_b']['hat_url']));
      } else {
        String femaleHat = getHatPath(
            false, Util.parseInt(widget.data['user_b']['hat_level']));
        if (Util.validStr(femaleHat) && !(await File(femaleHat).exists())) {
          await preloadHat(
              false, Util.parseInt(widget.data['user_b']['hat_level']));
        }
      }
    }
    _bgFile = await getCpMatchFile(url);
    if (_bgFile != null && await _bgFile!.exists()) {
      _refresh();
    }
  }

  String getHatPath(bool man, int hatLevel) {
    if (hatLevel == 1 || hatLevel == 2 || hatLevel == 3) {
      return join(
          Constant.documentsDirectory.path,
          man
              ? 'cp_heart_hat_b$hatLevel.webp'
              : 'cp_heart_hat_g$hatLevel.webp');
    }

    return '';
  }

  Future<void> preloadHat(bool man, int hatLevel) async {
    String toPath = getHatPath(man, hatLevel);
    String assetPath =
        'packages/${ComponentManager.MANAGER_BASE_ROOM}/assets/images/cplove/${man ? 'cp_heart_hat_b$hatLevel.webp' : 'cp_heart_hat_g$hatLevel.webp'}';
    if (Util.validStr(toPath)) {
      var bytes = await otaResourceBundle.load(assetPath);
      ByteBuffer buffer = bytes.buffer;
      await File(toPath).writeAsBytes(
          buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    }
  }

  double _getVirtualY(double dy) {
    return dy + offsetVertical;
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_bgFile == null) return const SizedBox.shrink();

    return Stack(
      children: [
        _buildCpMatch(),
        if (!hideButton) ...[
          _buildClose(),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 20),
              child: AnimatedBuilder(
                animation: _inAnimationController,
                builder: (BuildContext context, child) {
                  return FadeTransition(
                    opacity: _opacityAnim,
                    child: child,
                  );
                },
                child: buildCpCaptureButton(),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Align _buildClose() {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onClose,
        child: Container(
          width: 31,
          height: 31,
          margin: const EdgeInsetsDirectional.only(top: 52, end: 16),
          alignment: AlignmentDirectional.center,
          child: R.img('cp_close.svg',
              package: ComponentManager.MANAGER_BASE_ROOM),
        ),
      ),
    );
  }

  void _onClose() {
    if (widget.onComplete != null) {
      widget.onComplete!();
    }
  }

  Widget _buildCpMatch() {
    if (Constant.isDevMode && Util.isIOSSimulator) {
      return VapSimulatorWidget(
          onComplete: widget.onComplete); // 拦截iOS模拟器播放VAP动画
    }
    String dateline = Utility.formatDateToDayAndChinese(
      DateTime.fromMicrosecondsSinceEpoch(
          Util.parseInt(widget.data['dateline']) * 1000000),
    );
    return Stack(
      children: <Widget>[
        _buildBackground(),
        _buildInfo(dateline),
      ],
    );
  }

  PositionedDirectional _buildBackground() {
    return PositionedDirectional(
      start: offsetHorizontal,
      end: offsetHorizontal,
      top: offsetVertical,
      bottom: offsetVertical,
      child: VapWidget(
        hybridComposition: false,
        onPlatformViewCreated: (FlutterVapController controller) async {
          String filePath = _bgFile!.path;
          List<String>? imgList;
          List<String>? textList;
          if (widget.data['user_a'] is Map &&
              Util.validStr(widget.data['user_a']['icon']) &&
              widget.data['user_b'] is Map &&
              Util.validStr(widget.data['user_b']['icon'])) {
            // vap融合图片预下载好在本地
            String hatPathA = getHatPath(
                true, Util.parseInt(widget.data['user_a']['hat_level']));
            if (Util.validStr(widget.data['user_a']['hat_url'])) {
              /// 优先使用服务端下发的帽子资源
              hatPathA = CachedImageManager.instance()
                  .getFileByUrl(
                      Util.getCpHatImgUrl(widget.data['user_a']['hat_url']))
                  .path;
            }
            String hatPathB = getHatPath(
                false, Util.parseInt(widget.data['user_b']['hat_level']));
            if (Util.validStr(widget.data['user_b']['hat_url'])) {
              /// 优先使用服务端下发的帽子资源
              hatPathB = CachedImageManager.instance()
                  .getFileByUrl(
                      Util.getCpHatImgUrl(widget.data['user_b']['hat_url']))
                  .path;
            }
            imgList = [
              CachedImageManager.instance()
                  .getFileByUrl(
                      Util.getUserIconUrl(widget.data['user_a']['icon'])!)
                  .path,
              CachedImageManager.instance()
                  .getFileByUrl(
                      Util.getUserIconUrl(widget.data['user_b']['icon'])!)
                  .path,
              hatPathA,
              hatPathB,
            ];

            textList = [
              Util.notNullStr(widget.data['user_a']['name'])
                  .safeSubstring(0, 4),
              Util.notNullStr(widget.data['user_b']['name']).safeSubstring(0, 4)
            ];
          }
          controller.startPlay(filePath, textList: textList, imgList: imgList);
        },
        onRenderFrame: (int frameIndex, int frameTotal) {
          if (frameIndex == 0) {
            /// VAP目前都是50ms每帧，最后4s开始渐出动画，动画持续1s，后面3s一直展示
            int delay = 2000;

            /// 如果没有frameTotal，默认视频是6s的
            if (frameTotal > 0) {
              int duration = 50 * frameTotal;
              delay = 0;
              if (duration > 4000) {
                delay = duration - 4000;
              }
            }
            Future.delayed(Duration(milliseconds: delay), () {
              if (mounted) {
                _inAnimationController.forward();
              }
            });
          }
        },
        onComplete: () {
          if (!mounted) {
            return;
          }
          if (widget.onComplete != null) {
            widget.onComplete!();
          }
        },
      ),
    );
  }

  Align _buildInfo(String dateline) {
    String numWord = Util.notNullStr(widget.data['num_word']);
    if (numWord.isEmpty) {
      numWord = K.cp_match_intimacy;
    }
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: AnimatedBuilder(
        animation: _inAnimationController,
        builder: (BuildContext context, child) {
          return FadeTransition(
            opacity: _opacityAnim,
            child: child,
          );
        },
        child: Container(
          margin: EdgeInsetsDirectional.only(bottom: _getVirtualY(115)),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                dateline,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                K.room_cp_match_desc_tips,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(R.imagePath('cp_intimacy_bg.webp',
                            package: ComponentManager.MANAGER_BASE_ROOM)),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: 32,
                    alignment: AlignmentDirectional.center,
                    padding:
                        const EdgeInsetsDirectional.only(start: 20, end: 20),
                    child: Text(
                      '$numWord ${widget.data['package']}',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 2),
                            blurRadius: 3.0,
                            color: Color(0xFF333333),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCpCaptureButton() {
    return GestureDetector(
      onTap: _savePic,
      child: Container(
        width: 175,
        height: 36,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFF718FFF), Color(0xFF69D1FF)]),
        ),
        child: Center(
          child: Text(
            K.room_save_picture,
            style: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  void _savePic() async {
    PermissionStatus? permissionStatus;
    if (Platform.isAndroid) {
      permissionStatus = await PermissionUtil.checkAndRequestPermissions(
          Constant.context, Permission.storage);
    } else if (Platform.isIOS) {
      permissionStatus = await PermissionUtil.checkAndRequestPermissions(
          Constant.context, Permission.photos);
    }

    if (permissionStatus != PermissionStatus.granted) {
      return null;
    }

    if (mounted) {
      setState(() {
        hideButton = true;
      });
    }

    await Future.delayed(const Duration(milliseconds: 200));

    String? path = await NativeScreenshot.takeScreenshot();
    if (Util.validStr(path)) {
      Fluttertoast.showToast(msg: K.room_pic_has_save_album);
    }

    if (mounted) {
      setState(() {
        hideButton = false;
      });
    }
  }
}
