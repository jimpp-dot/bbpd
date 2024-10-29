import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:chat/assets.dart';
import 'package:chat/src/quick_reply/model/quick_reply_edit_model.dart';
import 'package:shared/model/oss_upload_data.dart';
import 'package:chat/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared/k.dart' as BaseK;

/// 快捷回复 新增/修改图文
class QuickReplyTextPage extends StatefulWidget {
  final String? title;
  final String? content;
  final String? image;
  final int? imgWidth;
  final int? imgHeight;

  const QuickReplyTextPage(
      {Key? key,
      this.title,
      this.content,
      this.image,
      this.imgWidth,
      this.imgHeight})
      : super(key: key);

  @override
  _QuickReplyTextPageState createState() => _QuickReplyTextPageState();

  static Future<dynamic> open(BuildContext context,
      {String? title, String? content, String? image}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            QuickReplyTextPage(title: title, content: content, image: image),
        settings: const RouteSettings(name: '/QuickReplyVoicePage'),
      ),
    );
  }
}

class _QuickReplyTextPageState extends State<QuickReplyTextPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  late String _title;
  late String _content;
  String? _image;
  int? _imgWidth;
  int? _imgHeight;
  bool _isLocalImage = true;

  DialogLoadingController? _loadingController;
  bool _changed = false;

  final ValueNotifier<String> _titleNotify = ValueNotifier('');

  @override
  void initState() {
    super.initState();

    _title = widget.title ?? '';
    _content = widget.content ?? '';
    _image = widget.image;
    _imgWidth = widget.imgWidth;
    _imgHeight = widget.imgHeight;
    if (_image != null && _image!.isNotEmpty) {
      _isLocalImage = false;
    }
    _titleNotify.value = _title;
    _titleController = TextEditingController(text: _title);
    _contentController = TextEditingController(text: _content);
    _titleController.addListener(() {
      _title = _titleController.text.trim();
      _titleNotify.value = _title;
    });
    _contentController.addListener(() {
      _content = _contentController.text.trim();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _titleNotify.dispose();
    super.dispose();
  }

  bool _isChange() {
    if ((_title.isNotEmpty && _title != widget.title) ||
        (_content.isNotEmpty && _content != widget.content) ||
        _image != widget.image) {
      _changed = true;
    } else {}
    return _changed;
  }

  Future _onImageSelected() async {
    try {
      File? file = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080.0,
        maxHeight: 1080.0,
      );
      if (mounted) {
        setState(() {
          _isLocalImage = true;
          _image = file?.path;
        });
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: BaseK.K.select_photo_error_retry, gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _checkDispose,
      child: Scaffold(
        backgroundColor: R.colors.homeSecondModuleBgColor,
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar.custom(
          backgroundColor: R.colors.homeSecondModuleBgColor,
          statusBrightness: R.colors.statusBarTheme,
          backColor: R.colors.mainTextColor,
          title: Text(
            !Util.isStringEmpty(widget.title)
                ? K.chat_quick_reply_edit
                : K.chat_quick_reply_text_image_add,
            style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          onBackPressedCallback: () async {
            await Navigator.maybePop(context);
          },
          actions: _renderAction(),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SafeArea(
            child: _renderBody(),
          ),
        ),
      ),
    );
  }

  List<Widget> _renderAction() {
    return <Widget>[
      TextButton(
          onPressed: _submit,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 4),
            child: Text(
              BaseK.K.base_submmit,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 14,
                color: R.colors.mainTextColor,
              ),
            ),
          )),
    ];
  }

  Widget _renderBody() {
    return Column(
      children: [
        const SizedBox(height: 16),
        _renderItem(K.chat_quick_reply_title, _renderTitleInput()),
        const SizedBox(height: 16),
        _renderItem(K.chat_quick_reply_content, _renderContentInput()),
        const SizedBox(height: 16),
        _renderItem(K.chat_image, _renderImage()),
        const Spacer(),
      ],
    );
  }

  Widget _renderItem(String title, Widget child) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 14, end: 12),
            child: Text(
              title,
              style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _renderImage() {
    List<Widget> childList = [];
    if (_image != null && _image!.isNotEmpty) {
      if (_isLocalImage) {
        childList.add(Image.file(File(_image!),
            width: 80, height: 80, fit: BoxFit.cover));
      } else {
        childList.add(CachedNetworkImage(
            imageUrl: Util.getUserIconUrl(_image!),
            width: 80,
            height: 80,
            fit: BoxFit.cover));
      }
      childList.add(GestureDetector(
        onTap: () {
          setState(() {
            _image = null;
          });
        },
        child: Container(
          width: 32,
          height: 32,
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(
            color: Color(0x80000000),
            shape: BoxShape.circle,
          ),
          child: R.img(Assets.chat$ic_delete_webp, width: 14, height: 15),
        ),
      ));
    } else {
      childList.add(GestureDetector(
        onTap: _onImageSelected,
        child: Container(
          width: 80,
          height: 80,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: R.colors.tagBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child:
              Icon(Icons.add_rounded, size: 28, color: R.colors.thirdTextColor),
        ),
      ));
    }

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: childList,
        ),
      ),
    );
  }

  Future<bool> _checkDispose() async {
    _title = _titleController.text.trim();
    _content = _contentController.text.trim();

    if (_isChange()) {
      bool? result = await showDialog(
        context: context,
        builder: (context) => ConfirmDialog(
          content: K.keychat_quick_reply_save_or_not,
          negativeButton: NegativeButton(
            text: K.keychat_quick_reply_not_save,
          ),
          positiveButton: PositiveButton(text: K.keychat_quick_reply_save),
        ),
      );
      if (result ?? false) {
        _submit();
        return false;
      }
    }
    return true;
  }

  Widget _renderTitleInput() {
    return Container(
      height: 48,
      width: double.infinity,
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: R.colors.tagBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.start,
              style:
                  R.textStyle.regular14.copyWith(color: R.colors.mainTextColor),
              // focusNode: _focusNode,
              controller: _titleController,
              autocorrect: true,
              autofocus: false,
              maxLength: 6,
              maxLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
                counter: const SizedBox(),
                counterStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: R.colors.thirdTextColor,
                ),
              ),
            ),
          ),
          ValueListenableBuilder<String>(
            valueListenable: _titleNotify,
            builder: (BuildContext context, value, Widget? child) {
              return Text('${_titleController.text.trim().length}/6',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: R.colors.thirdTextColor));
            },
          ),
        ],
      ),
    );
  }

  Widget _renderContentInput() {
    return Container(
      height: 168,
      width: double.infinity,
      alignment: AlignmentDirectional.topStart,
      decoration: BoxDecoration(
        color: R.colors.tagBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsetsDirectional.only(
        top: 0.0,
        start: 12.0,
        end: 12.0,
        bottom: 12.0,
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.start,
        style: R.textStyle.regular14.copyWith(color: R.colors.mainTextColor),
        // focusNode: _focusNode,
        controller: _contentController,
        autocorrect: true,
        autofocus: false,
        maxLength: 50,
        maxLines: 11,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            counterStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: R.colors.thirdTextColor)),
      ),
    );
  }

  Future<void> _submit() async {
    _title = _titleController.text.trim();
    _content = _contentController.text.trim();

    if (Util.isStringEmpty(_title)) {
      Fluttertoast.showCenter(msg: K.chat_quick_reply_des_first);
      return;
    }

    if (Util.isStringEmpty(_content) && Util.isStringEmpty(_image)) {
      Fluttertoast.showCenter(msg: '内容和图片必须填一个');
      return;
    }
    if (_image != null && !_image!.startsWith('http') && _image!.isNotEmpty) {
      try {
        OssUploadDataResp resp =
            await BaseRequestManager.getFileUploadUrl('quick_reply_img');
        showLoading(K.chat_quick_reply_uploading);
        if (resp.success == true && resp.data != null) {
          File file = File(_image!);
          var image = Image.file(file);
          Completer<ui.Image> completer = Completer<ui.Image>();
          image.image
              .resolve(const ImageConfiguration())
              .addListener(ImageStreamListener((ImageInfo info, bool _) {
            completer.complete(info.image);
          }));

          ui.Image info = await completer.future;
          _imgWidth = info.width;
          _imgHeight = info.height;
          bool result = await BaseRequestManager.uploadFile(resp.data!, file);
          if (result) {
            String filePath =
                BaseRequestManager.getOssFilePath(resp.data?.dir ?? '', file);
            _image = filePath;
            hideLoading();
          } else {
            hideLoading();
            Fluttertoast.showToast(
                msg: R.array('xhr_error_type_array')[6],
                gravity: ToastGravity.CENTER);
            return;
          }
        }
      } catch (e) {
        hideLoading();
        Fluttertoast.showToast(
            msg: R.array('xhr_error_type_array')[6],
            gravity: ToastGravity.CENTER);
        Log.d(e.toString());
        return;
      }
    }
    final QuickReplyEditResult result = QuickReplyEditResult(_title,
        content: _content,
        image: _image,
        imgWidth: _imgWidth,
        imgHeight: _imgHeight);
    Navigator.of(context).pop(result);
  }

  void showLoading(String message) {
    if (_loadingController != null) {
      _loadingController!.setLabel(message);
      return;
    }

    _loadingController = DialogLoadingController();
    _loadingController!.show(context: context, message: message);
  }

  void hideLoading() {
    if (_loadingController != null) {
      _loadingController!.close();
      _loadingController = null;
    }
  }
}
