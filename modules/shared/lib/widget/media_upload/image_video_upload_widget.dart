import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/component/progress_image.dart';
import 'package:shared/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

typedef UploadCompleteCallback = bool Function(
    String name, String type, String cover);

class ImageVideoUpload extends StatefulWidget {
  final ImageSource source;
  final Widget child;
  final String imageUplaodUrl;
  final ValueChanged<String>? onError;
  final UploadCompleteCallback? onComplete;
  final VoidCallback? onFilePicked;
  final bool enableVideo;

  const ImageVideoUpload({
    super.key,
    required this.child,
    required this.imageUplaodUrl,
    this.onComplete,
    this.onError,
    required this.source,
    this.enableVideo = true,
    this.onFilePicked,
  });

  @override
  State createState() {
    return UploadState();
  }
}

class UploadState extends State<ImageVideoUpload>
    with AutomaticKeepAliveClientMixin<ImageVideoUpload> {
  bool _lock = false;

  @override
  bool get wantKeepAlive => true;

  final GlobalKey<ProgressImageState> _progressImageKey =
      GlobalKey<ProgressImageState>();
  dynamic uploadingFile;
  final DialogLoadingController _controller = DialogLoadingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _onSelectIconTaped(),
      child: FittedBox(
        alignment: Alignment.center,
        child: _rendImage(context),
      ),
    );
  }

  Widget _rendImage(BuildContext context) {
    if (uploadingFile != null) {
      return ProgressImage(
          width: 100.0,
          height: 100.0,
          key: _progressImageKey,
          builder: (BuildContext context, Size size) {
            if (uploadingFile is File) {
              return Image.file(
                uploadingFile as File,
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              );
            } else {
              return Image.memory(
                uploadingFile,
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              );
            }
          });
    } else {
      return widget.child;
    }
  }

  _onSelectIconTaped() async {
    if (_lock) {
      return;
    }

    if (!widget.enableVideo) {
      _onSelectImageTaped();
    } else {
      List<SheetItem> res = [];
      res.add(SheetItem(K.base_image, "image"));
      res.add(SheetItem(K.base_video, "video"));
      SheetCallback? result = await displayModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return RadioBottomSheet(data: res);
          });
      if (result == null || result.reason == SheetCloseReason.Active) {
        return;
      }

      if (result.value?.key == "image") {
        _onSelectImageTaped();
      } else {
        File? video = await ImagePicker.pickVideo(
          source: ImageSource.gallery,
        );
        _onVideoSelected(video);
      }
    }
  }

  _onSelectImageTaped() async {
    dynamic pickFile;
    try {
      pickFile = await ImagePicker.pickImage(
        source: widget.source,
        maxWidth: 1080.0,
        maxHeight: 1080.0,
      );
    } catch (e) {
      Log.d(e);
      Fluttertoast.showToast(
          msg: K.select_photo_error_retry, gravity: ToastGravity.CENTER);
    }

    if (pickFile == null) {
      return;
    }
    if (widget.onFilePicked != null) widget.onFilePicked!();
    _lock = true;
    setState(() {
      uploadingFile = pickFile;
    });

    await ImageUploadState.uploadImage(
        imageFile: pickFile,
        uploadUrl: widget.imageUplaodUrl,
        onProgress: (value) {
          if (_progressImageKey.currentState != null) {
            _progressImageKey.currentState!.setProgress(value);
          }
        },
        onComplete: (Map data) {
          setState(() {
            uploadingFile = null;
          });
          String url = Util.notNullStr(data['name']);
          if (widget.onComplete != null) {
            widget.onComplete!(url, 'image', '');
          }
          _lock = false;
        },
        onError: (String error) {
          setState(() {
            uploadingFile = null;
          });
          Fluttertoast.showToast(msg: error, gravity: ToastGravity.CENTER);
          _lock = false;
        });
  }

  _onVideoSelected(File? videoFile) async {
    if (videoFile == null) {
      return;
    }

    if (await videoFile.length() > 100 * 1024 * 1024) {
      Fluttertoast.showToast(msg: K.upload_error_size_too_big);
      return;
    }
    if (widget.onFilePicked != null) widget.onFilePicked!();
    _lock = true;
    String filePath = videoFile.absolute.path;
    final thumb = await VideoCompress.getFileThumbnail(filePath,
        quality: 80, position: -1);

    setState(() {
      uploadingFile = thumb;
    });

    _controller.show(context: context);

    // 视频压缩
    final MediaInfo? info = await VideoCompress.compressVideo(
      videoFile.path,
      quality: VideoQuality.MediumQuality,
      deleteOrigin: false,
      includeAudio: true,
    );

    if (info != null) {
      await VideoUpload.upload(
          file: info.file,
          onUploading: (value) {
            if (_progressImageKey.currentState != null) {
              _progressImageKey.currentState!
                  .setProgress((value * 100).toInt());
            }
          },
          onComplete: (Map data) {
            String video = Util.notNullStr(data['video']); //视频上传地址
            String cover = Util.notNullStr(data['cover']); //视频封面上传地址
            if (uploadingFile is File) {
              (uploadingFile as File).delete();
            }
            setState(() {
              uploadingFile = null;
            });
            if (widget.onComplete != null) {
              widget.onComplete!(video, 'video', cover);
            }
            _lock = false;
          },
          onError: (String tips) {
            Fluttertoast.showToast(
              msg: tips,
              gravity: ToastGravity.CENTER,
            );
            _lock = false;
            if (uploadingFile is File) {
              (uploadingFile as File).delete();
            }
            setState(() {
              uploadingFile = null;
            });
          });
    }

    _controller.close();
  }
}

class ImageVideoItem {
  String url; //如果为图片则url为图片上传的地址，如果为视频则url为视频上传的地址
  String type; //'image'为图片,'video'为视频
  String cover; //如果为视频，则为视频封面url

  ImageVideoItem(this.url, this.type, this.cover);
}
