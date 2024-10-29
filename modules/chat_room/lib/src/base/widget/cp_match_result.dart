import 'package:chat_room/k.dart';
import 'package:chat_room/src/cplove/heart/cp_heart_hat_avatar.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CpMatchResultPage extends StatefulWidget {
  final VoidCallback? onComplete;
  final Map data;

  const CpMatchResultPage({super.key, required this.data, this.onComplete});

  @override
  _CpMatchResultPageState createState() => _CpMatchResultPageState();
}

class _CpMatchResultPageState extends State<CpMatchResultPage>
    with TickerProviderStateMixin {
  final double _giftRatio = 1624.0 / 750.0;

  double get giftRatio => _giftRatio;
  late double giftWidth, giftHeight, offsetHorizontal, offsetVertical;
  File? _bgFile;
  final GlobalKey _cpMatchKey = GlobalKey();

  late AnimationController _inAnimationController;
  bool _inAnimating = false;
  bool _avatarShowing = false;
  bool _outAnimating = false;
  late AnimationController _outAnimationController;
  double avatarStart = 170 / 2.0;
  double avatarTop = (508 + 76 + 72) / 2.0;
  double avatarFinalTop = (570 + 76 + 72) / 2.0;
  late Animation _userTranslationYAnim;
  late Animation _userOpacityAnim;
  late Animation _userDisappearOpacityAnim;

  @override
  void initState() {
    super.initState();
    _initSizes();
    _initAnimation();
    _loadFile();
  }

  @override
  void dispose() {
    _release();
    super.dispose();
  }

  void _release() {
    _inAnimationController.dispose();
    _outAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_bgFile == null) return Container();
    return Container(
//      color: Colors.yellow.withOpacity(0.4),
      child: Stack(
        children: [
          RepaintBoundary(
            key: _cpMatchKey,
            child: _buildCpMatch(),
          ),
          _buildClose(),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 20),
              child: Opacity(
                  opacity: _getUserOpacity(),
                  child: CpCaptureButton(
                    captureKey: _cpMatchKey,
                  )),
            ),
          ),
        ],
      ),
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

  Stack _buildCpMatch() {
    String dateline = Utility.formatDateToDayAndChinese(
        DateTime.fromMicrosecondsSinceEpoch(
            Util.parseInt(widget.data['dateline']) * 1000000));
    return Stack(
      children: <Widget>[
        _buildBackground(),
        PositionedDirectional(
          start: Util.width / 2 - 80,
          top: _getVirtualY(_userTranslationYAnim.value),
          child: _buildUserLayout(widget.data['user_a'], true),
        ),
        PositionedDirectional(
          end: Util.width / 2 - 80,
          top: _getVirtualY(_userTranslationYAnim.value),
          child: _buildUserLayout(widget.data['user_b'], false),
        ),
        _buildInfo(dateline),
      ],
    );
  }

  PositionedDirectional _buildBackground() {
    int avatarStartFrame = Util.parseInt(widget.data['webp_start']);
    int avatarEndFrame = Util.parseInt(widget.data['webp_end']);
    return PositionedDirectional(
      start: offsetHorizontal,
      end: offsetHorizontal,
      top: offsetVertical,
      bottom: offsetVertical,
      child: MultiframeImage.file(
        _bgFile,
        onFrameEmitted: (int count, int totalCount) async {
//              Log.d('_CpMatchResultPageState.onFrameEmitted count = $count, totalCount = $totalCount');
          //大于指定的某一帧时，把头像显示出来
          if (count == avatarStartFrame) {
            _inAnimationController.forward();
            _inAnimating = true;
            _avatarShowing = true;
          }
          if (count == avatarEndFrame) {
            _outAnimationController.forward();
            _outAnimating = true;
          }
//              if (count == 30) {
//                //截图保存
//                Uint8List imageBytes = await _capturePng();
//                Directory tempDir = Constant.temporaryDirectory;
//                String imageFileName = 'cpmatch_' + DateFormat('yyyy_MM_dd_HH_mm_ss').format(DateTime.now()) + '.png';
//                File file = File(join(tempDir.path, imageFileName));
//                if (!file.existsSync()) {
//                  file.createSync(recursive: true);
//                }
//                file.writeAsBytesSync(imageBytes, flush: true);
//                String result = await ImagePicker.saveToCameraRoll(file.absolute.path);
//                if (result == null) {
//                  Fluttertoast.showToast(msg: '图片已保存到系统相册');
//                }
//              }
        },
        onComplete: () {
          Log.d('_CpMatchResultPageState.onComplete');
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
      child: Opacity(
        opacity: _getUserOpacity(),
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
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                K.room_cp_match_desc_tips,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(R.imagePath('cp_intimacy_bg.webp',
                              package: ComponentManager.MANAGER_BASE_ROOM)),
                          fit: BoxFit.fill),
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

  Widget _buildUserLayout(Map data, bool man) {
    String iconPath = Util.notNullStr(data['icon']);
    String name = Util.notNullStr(data['name']);
    int hatLevel = Util.parseInt(data['hat_level']);
    String hatUrl = Util.notNullStr(data['hat_url']);
    double opacity = _getUserOpacity();
    return Opacity(
      opacity: opacity,
      child: Column(
        children: <Widget>[
          _buildUserIcon(iconPath, hatLevel, man, hatUrl),
          const SizedBox(
            height: 2,
          ),
          Container(
            width: 95,
            alignment: AlignmentDirectional.topCenter,
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                shadows: [
                  Shadow(
                    offset: Offset(0, 2),
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserIcon(
      String iconPath, int hatLevel, bool man, String hatUrl) {
    double size = 60.0;
    if (hatLevel == 1 || hatLevel == 2 || hatLevel == 3) {
      return CpHeartHatAvatar(
        icon: iconPath,
        level: hatLevel,
        man: man,
        size: size,
        headUrl: hatUrl,
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0x80aaa7a4),
        ),
        width: size + 5.0,
        height: size + 5.0,
        alignment: AlignmentDirectional.center,
        child: CommonAvatar(
          path: iconPath,
          shape: BoxShape.circle,
          size: size,
        ),
      );
    }
  }

  Widget _cpHatAvatar(String icon, int level, bool man, double size) {
    String head = R.imagePath(
        man
            ? 'cplove/cp_heart_hat_b$level.webp'
            : 'cplove/cp_heart_hat_g$level.webp',
        package: ComponentManager.MANAGER_BASE_ROOM);
    double overflow = 5.0;

    Widget hatWidget = PositionedDirectional(
      top: -overflow,
      start: -overflow,
      child: SizedBox(
        width: size + overflow * 2,
        height: size + overflow * 2,
        child: IgnorePointer(
          child: Image.asset(head),
        ),
      ),
    );
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CommonAvatar(
          path: icon,
          shape: BoxShape.circle,
          size: size,
        ),
        hatWidget
      ],
    );
  }

  double _getUserOpacity() {
    double opacity;
    if (_avatarShowing) {
      if (_inAnimating) {
        opacity = _userOpacityAnim.value;
      } else if (_outAnimating) {
        opacity = _userDisappearOpacityAnim.value;
      } else {
        opacity = 1.0;
      }
    } else {
      opacity = 0.0;
    }
    return opacity;
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

  double _getVirtualX(double dx) {
    return dx + offsetHorizontal;
  }

  double _getVirtualY(double dy) {
    return dy + offsetVertical;
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void _loadFile() async {
    String url = widget.data['webp_url'];
    _bgFile = await getCpMatchFile(url);
    if (_bgFile != null && await _bgFile!.exists()) {
      _refresh();
    }
  }

  Future<Uint8List?> _capturePng() async {
    try {
      RenderRepaintBoundary boundary = _cpMatchKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      return pngBytes; //这个对象就是图片数据
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  void _onClose() {
    if (widget.onComplete != null) {
      widget.onComplete!();
    }
  }

  void _initAnimation() {
    _inAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    CurvedAnimation curve = CurvedAnimation(
        parent: _inAnimationController, curve: Curves.easeInOut);
    _userTranslationYAnim =
        Tween<double>(begin: avatarTop, end: avatarFinalTop).animate(curve);
    _userOpacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
    _inAnimationController.addListener(() {
      _refresh();
    });
    _inAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _inAnimating = false;
      }
    });

    _outAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    CurvedAnimation outCurve =
        CurvedAnimation(parent: _outAnimationController, curve: Curves.easeOut);
    _userDisappearOpacityAnim =
        Tween<double>(begin: 1.0, end: 0.0).animate(outCurve);
    _outAnimationController.addListener(() {
      _refresh();
    });
  }
}

class CpCaptureButton extends StatelessWidget {
  final GlobalKey captureKey;

  const CpCaptureButton({super.key, required this.captureKey});

  @override
  Widget build(BuildContext context) {
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
    Uint8List? imageBytes = await _capturePng();
    Directory tempDir = Constant.temporaryDirectory;
    String imageFileName =
        'cpmatch_${DateFormat('yyyy_MM_dd_HH_mm_ss').format(DateTime.now())}.png';
    File file = File(join(tempDir.path, imageFileName));
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    file.writeAsBytesSync(imageBytes!, flush: true);
    String? result = await ImagePicker.saveToCameraRoll(file.absolute.path);
    if (result == null) {
      Fluttertoast.showToast(msg: K.room_pic_has_save_album);
    }

    //IMomentManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    //await manager.openMomentPublishScreen(this.context, initImages: file != null ? [file] : []);
  }

  Future<Uint8List?> _capturePng() async {
    try {
      RenderRepaintBoundary boundary = captureKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      return pngBytes; //这个对象就是图片数据
    } catch (e) {
      Log.d(e);
    }
    return null;
  }
}
