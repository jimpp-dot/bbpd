import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared/shared.dart' hide Icon;

class UiView {
  static OverlayEntry? _overlayEntry;

  static init() {
    bool dev = false;
    assert(() {
      dev = true;
      return true;
    }());
    if (dev == false) return;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      dispose();
      var overlayState = Overlay.of(System.context);
      OverlayEntry overlayEntry;
      overlayEntry = OverlayEntry(builder: (context) {
        return const DevView();
      });
      _overlayEntry = overlayEntry;
      overlayState.insert(overlayEntry);
    });
  }

  static dispose() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}

class DevView extends StatefulWidget {
  const DevView({Key? key}) : super(key: key);

  @override
  State createState() => _State();
}

class _State extends State<DevView> {
  bool _lock = false;
  File? _image;
  final double _opacity = 0.5;

  _openImage() async {
    if (_lock) return;
    File? image;
    try {
      _lock = true;
      image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      _lock = false;
    } catch (e) {
      Log.d(e);
      _lock = false;
      Fluttertoast.showToast(
          msg: R.string('select_photo_error_retry'),
          gravity: ToastGravity.CENTER);
      return;
    }
    Log.d("_openImage $image");
    if (image == null || !mounted) return;
    setState(() {
      _image = image;
    });
  }

  _reset() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];
    if (_image != null) {
      res.add(PositionedDirectional(
        start: 0.0,
        top: 0.0,
        end: 0.0,
        bottom: 0.0,
        child: IgnorePointer(
          child: Opacity(
            opacity: _opacity,
            child: Image.file(_image!),
          ),
        ),
      ));
    }
    res.add(PositionedDirectional(
      end: 5.0,
      top: 100.0,
      width: 50.0,
      height: 50.0,
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            onTap: _image == null ? _openImage : _reset,
            child: Icon(
              _image == null ? Icons.add_circle : Icons.remove_circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ));
    return Stack(
      clipBehavior: Clip.none,
      children: res,
    );
  }
}
