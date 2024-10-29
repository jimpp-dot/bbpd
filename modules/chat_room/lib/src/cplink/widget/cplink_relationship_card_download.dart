import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chat_room/assets.dart';

class CpLinkRelationShipCardDownload extends StatefulWidget {
  final MessageContent message;
  const CpLinkRelationShipCardDownload({Key? key, required this.message})
      : super(key: key);

  @override
  State<CpLinkRelationShipCardDownload> createState() =>
      _CpLinkRelationShipCardDownloadState();

  static Future show(BuildContext context, MessageContent message) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CpLinkRelationShipCardDownload(message: message),
    );
  }
}

class _CpLinkRelationShipCardDownloadState
    extends State<CpLinkRelationShipCardDownload> {
  late ScreenshotController screenshotController;
  ValueNotifier<double>? downloadValueNotifier = ValueNotifier<double>(0);

  @override
  void initState() {
    screenshotController = ScreenshotController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    Map? extra = widget.message.extra;
    //卡片url
    String cardUrl = extra?['card_url_l'] ?? '';
    return SizedBox(
      width: 360.dp,
      height: 675.dp,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ScreenShot(
            controller: screenshotController,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.maybePop(context);
                    },
                    child: CachedNetworkImage(
                        imageUrl: Util.getRemoteImgUrl(cardUrl),
                        width: 360.dp,
                        fit: BoxFit.fitWidth)),
                _buildMiddleWidget(),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 18,
            child: GestureDetector(
              onTap: () {
                _saveImage();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SimpleCircularProgressBar(
                    size: 40,
                    progressColors: const [
                      Colors.white,
                    ],
                    backStrokeWidth: 4,
                    progressStrokeWidth: 4,
                    animationDuration: const Duration(seconds: 2),
                    backColor: Colors.white.withOpacity(0.3),
                    valueNotifier: downloadValueNotifier,
                  ),
                  R.img(RoomAssets.chat_room$cplink_cplink_download_icon_png,
                      width: 15, height: 17),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMiddleWidget() {
    Map? extra = widget.message.extra;
    //卡片url
    String leftUserIcon = extra?['user_icon1'] ?? '';
    String leftUserName = extra?['user_name1'] ?? '';
    String rightUserIcon = extra?['user_icon2'] ?? '';
    String rightUserName = extra?['user_name2'] ?? '';

    String time = extra?['time'] ?? '';
    String auctionName = extra?['auction_name'] ?? '';
    int rid = Util.parseInt(extra?['room_id']);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildUserWidget(leftUserIcon, leftUserName),
            _buildUserWidget(rightUserIcon, rightUserName),
          ],
        ),
        const SizedBox(
          height: 28,
        ),
        SizedBox(
          width: 170,
          child: NumText(
            '$time我们在房间ID:$rid拍的$auctionName关系',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFAEA),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserWidget(String url, String name) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(url), width: 60, height: 60)),
        SizedBox(
          width: 60,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 9,
              color: Color(0xffFFFAEA),
            ),
          ),
        )
      ],
    );
  }

  bool _isDownloading = false;
  void _saveImage() async {
    if (Platform.isAndroid) {
      PermissionStatus storagePermission =
          await PermissionUtil.checkAndRequestPermissions(
              context, Permission.storage);
      if (storagePermission != PermissionStatus.granted) {
        return;
      }
    } else if (Platform.isIOS) {
      PermissionStatus storagePermission =
          await PermissionUtil.checkAndRequestPermissions(
              context, Permission.photos);
      if (storagePermission != PermissionStatus.granted) {
        return;
      }
    }

    if (_isDownloading == true) return;
    downloadValueNotifier?.value = 100;
    _isDownloading = true;
    Uint8List? pngBytes = await screenshotController.capture(pixelRatio: 2);
    String? result = pngBytes != null
        ? await ImagePicker.saveByteDataImageToGallery(pngBytes)
        : null;
    if (result != null) {
      _isDownloading = false;
      Navigator.maybePop(context);
      Fluttertoast.showToast(msg: '保存成功');
    } else {
      _isDownloading = false;
      downloadValueNotifier?.value = 0;
      Fluttertoast.showToast(msg: '保存失败');
    }
  }
}
