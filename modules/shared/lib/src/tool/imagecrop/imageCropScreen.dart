import 'dart:io';

import 'package:shared/k.dart';
import 'package:shared/src/tool/imagecrop/image_crop_preview_screen.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/image_editor.dart';

import '../../../shared.dart';

/// 图片裁剪
class ImageCropScreen extends StatefulWidget {
  final File imgFile;
  final Size? minSize;
  final double cropAspectRatio;

  const ImageCropScreen(
      {Key? key,
      required this.imgFile,
      this.minSize,
      this.cropAspectRatio = 1.0})
      : super(key: key);

  @override
  _ImageCropScreenState createState() => _ImageCropScreenState();

  static Future<Map?> cropImage(
      BuildContext context, File file, Size? minSize, double cropAspectRatio) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImageCropScreen(
          imgFile: file,
          minSize: minSize,
          cropAspectRatio: cropAspectRatio,
        ),
        settings: const RouteSettings(name: '/imagecrop'),
      ),
    );
  }
}

class _ImageCropScreenState extends State<ImageCropScreen> {
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();

  void _save() async {
    try {
      Rect? cropRect = editorKey.currentState?.getCropRect();
      Uint8List? data = editorKey.currentState?.rawImageData;
      if (cropRect == null || data == null) return;

      double minWidth = widget.minSize?.width ?? 200;
      double minHeight = widget.minSize?.height ?? 200;
      Log.d(
          "cropRect width:${cropRect.width.toString()}, cropRectHeight:${cropRect.height.toString()}, minWidth:$minWidth  minHeight:$minHeight");
      if (cropRect.width.toInt() < minWidth ||
          cropRect.height.toInt() < minHeight) {
        Fluttertoast.showToast(msg: K.base_image_pixel_low);
      } else {
        ImageEditorOption option = ImageEditorOption();
        option.addOption(ClipOption.fromRect(cropRect));
        Uint8List? result =
            await ImageEditor.editImage(image: data, imageEditorOption: option);

        Map croppedData = {
          'rect': cropRect,
          'image': result,
        };
        Map? previewResult =
            await ImageCropPreviewScreen.startCropPreview(context, croppedData);
        if (previewResult != null) {
          Navigator.of(context).pop(previewResult);
        }
      }
    } catch (e) {
      Log.d('Error: $e');
      Fluttertoast.showToast(msg: K.base_image_save_failed);
    }
  }

  @override
  Widget build(BuildContext context) {
    double ratio = Util.height / 812;
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.only(top: 80 * ratio, bottom: 80 * ratio),
                child: ExtendedImage.file(
                  widget.imgFile,
                  fit: BoxFit.contain,
                  mode: ExtendedImageMode.editor,
                  enableLoadState: true,
                  extendedImageEditorKey: editorKey,
                  cacheRawData: true,
                  initEditorConfigHandler: (state) {
                    return EditorConfig(
                      maxScale: 4.0,
                      cropRectPadding: const EdgeInsets.all(8.0),
                      hitTestSize: 0.0,
                      editorMaskColorHandler:
                          (BuildContext context, bool pointerDown) =>
                              Colors.transparent,
                      lineColor: Colors.white,
                      cornerSize: const Size(26, 2),
                      cornerColor: Colors.white,
                      cropAspectRatio: widget.cropAspectRatio,
                    );
                  },
                ),
              ),
              PositionedDirectional(
                bottom: 0,
                start: 0,
                end: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 20 * ratio, bottom: 20 * ratio),
                  child: SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(null);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(20 * ratio),
                            child: Text(
                              K.cancel,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: _save,
                          child: Padding(
                            padding: EdgeInsets.all(20 * ratio),
                            child: Text(
                              K.confirm,
                              style: TextStyle(
                                  color: R.color.secondaryBrandColor,
                                  fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
