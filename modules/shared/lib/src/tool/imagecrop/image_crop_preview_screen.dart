import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../shared.dart';
import '../../../k.dart';

class ImageCropPreviewScreen extends StatelessWidget {
  final Map map;

  const ImageCropPreviewScreen(this.map, {super.key});

  static Future<Map?> startCropPreview(BuildContext context, Map map) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ImageCropPreviewScreen(map),
      settings: const RouteSettings(name: '/imagecrop_preview'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (map['image'] == null) {
      return Container();
    }
    double ratio = Util.height / 812;
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.only(
                  top: 80 * ratio, bottom: 80 * ratio, left: 8, right: 8),
              child: _buildImage(),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top,
              child: SizedBox(
                width: size.width,
                height: kToolbarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(null);
                      },
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 20),
                        child: R.img(
                          'ic_titlebar_back.svg',
                          package: ComponentManager.MANAGER_BASE_CORE,
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(map);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                        child: Text(
                          K.finish,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    var imageFile = map['image'];
    if (imageFile is File) {
      return Image.file(
        imageFile,
        fit: BoxFit.contain,
      );
    } else {
      return Image.memory(
        imageFile,
        fit: BoxFit.contain,
      );
    }
  }
}
