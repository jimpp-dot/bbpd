import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:profile/assets.dart';
import 'package:profile/k.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:profile/src/model/pb/generated/act.pb.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' hide context;
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'views/love_test_info_view.dart';

/// 恋爱人格测试分享页
class LoveTestSharePage extends StatefulWidget {
  final LoveMatchData info;

  const LoveTestSharePage({super.key, required this.info});

  static Future<void> show(BuildContext context,
      {required LoveMatchData info}) {
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1.0,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {},
            child: LoveTestSharePage(
              info: info,
            ),
          );
        });
  }

  @override
  _LoveTestSharePageState createState() => _LoveTestSharePageState();
}

class _LoveTestSharePageState extends State<LoveTestSharePage> {
  static const String IOS_SHARE_URL =
      'https://apps.apple.com/cn/app/id1546973783';
  static const String ANDROID_SHARE_URL =
      'https://a.app.qq.com/o/simple.jsp?pkgname=com.havefun.android';

  final double _shareImageFactor = 610 / 375;

  final ScreenshotController _screenShotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF000000).withOpacity(0.75),
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SizedBox(
          height: 72.dp,
        ),
        ScreenShot(
          controller: _screenShotController,
          child: _buildShareContent(Util.width),
        ),
        SizedBox(
          height: 16.dp,
        ),
        _buildSaveAndShare(),
      ],
    );
  }

  Widget _buildShareContent(double width) {
    String url = '';
    if (Platform.isIOS) {
      url = IOS_SHARE_URL;
    } else if (Platform.isAndroid) {
      url = ANDROID_SHARE_URL;
    }

    if (url.isEmpty) return const SizedBox.shrink();
    double widthFactor = width / Util.width;

    return Container(
      width: Util.width * widthFactor,
      height: Util.width * 602 / 375 * widthFactor,
      padding: EdgeInsetsDirectional.only(start: 12.dp, end: 12.dp),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(Assets.profile$lovetest_love_test_share_bg_webp),
      )),
      child: Column(
        children: [
          SizedBox(
            height: 44.dp * widthFactor,
          ),
          LoveTestInfoView(
            info: widget.info,
            fontSizeScale: widthFactor,
          ),
          const Spacer(),
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    K.profile_love_test_scan,
                    style: TextStyle(
                        fontSize: 21.dp * widthFactor,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.dp * widthFactor,
                  ),
                  Text(
                    K.profile_love_test_scan_text,
                    style: TextStyle(
                        fontSize: 13.dp * widthFactor,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.dp * widthFactor),
                  border: Border.all(
                      width: 1.dp * widthFactor,
                      color: const Color(0xFF000000)),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: QrImage(
                  data: url,
                  size: 68.dp * widthFactor,
                  padding: EdgeInsets.all(6.dp * widthFactor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.dp * widthFactor,
          ),
        ],
      ),
    );
  }

  Widget _buildSaveAndShare() {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              alignment: AlignmentDirectional.center,
              width: 94.dp,
              height: 52.dp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.dp),
                color: const Color(0x33FFFFFF),
              ),
              child: Text(
                BaseK.K.cancel,
                style: TextStyle(
                    fontSize: 17.dp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _onShareTaped(),
            child: Container(
              width: 225.dp,
              height: 52.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.dp),
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF6DA4), Color(0xFFFF8585)],
                ),
              ),
              child: Text(
                K.profile_love_test_share_save,
                style: TextStyle(
                    fontSize: 17.dp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onShareTaped() async {
    String? dir;
    if (Platform.isIOS) {
      dir = Constant.temporaryDirectory.path;
    } else if (Platform.isAndroid) {
      PermissionStatus storagePermission =
          await PermissionUtil.checkAndRequestPermissions(
              context, Permission.storage);
      if (storagePermission != PermissionStatus.granted ||
          Constant.externalStorageDirectory == null) return;
      dir = join(Constant.externalStorageDirectory!.path, 'external_files');
    }

    if (Util.isStringEmpty(dir)) return;

    String path = '$dir/loveTest_${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File(path);

    double scaleWidth = 215;

    await _screenShotController.captureAndSave(filePath: path, pixelRatio: 3.0);
    if (await file.exists()) {
      dynamic result = await ImageGallerySaver.saveImage(file.readAsBytesSync(),
          quality: 100,
          name:
              "loveTest_${DateTime.now().millisecondsSinceEpoch}_${Session.uid}");
      if (result['isSuccess']) {
        Fluttertoast.showCenter(msg: K.profile_love_test_share_save_success);
      }

      ISettingManager settingManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_SETTINGS);
      settingManager.share(context, Session.uid,
          shareInfo: ShareInfo(type: 3, localImgPath: file.path),
          extra: {
            'width': scaleWidth,
            'height': scaleWidth * _shareImageFactor,
            'widget': _buildShareContent(scaleWidth),
          });
    }
  }
}
