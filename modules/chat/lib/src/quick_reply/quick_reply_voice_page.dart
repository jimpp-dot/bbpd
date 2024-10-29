import 'dart:io';

import 'package:chat/src/quick_reply/model/quick_reply_edit_model.dart';
import 'package:chat/src/quick_reply/widget/quick_reply_voice_widget.dart';
import 'package:shared/model/oss_upload_data.dart';
import 'package:chat/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 快捷回复 新增录音/修改录音
class QuickReplyVoicePage extends StatefulWidget {
  final String? audioDes;
  final String? audioUrl;
  final int? audioDuration;
  final String? contentId;

  const QuickReplyVoicePage(
      {Key? key,
      this.audioDes,
      this.audioUrl,
      this.audioDuration,
      this.contentId})
      : super(key: key);

  @override
  _QuickReplyVoicePageState createState() => _QuickReplyVoicePageState();

  static Future<dynamic> open(BuildContext context,
      {String? audioDes,
      String? audioUrl,
      int? audioDuration,
      String? contentId}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuickReplyVoicePage(
            audioDes: audioDes,
            audioUrl: audioUrl,
            audioDuration: audioDuration,
            contentId: contentId),
        settings: const RouteSettings(name: '/QuickReplyVoicePage'),
      ),
    );
  }
}

class _QuickReplyVoicePageState extends State<QuickReplyVoicePage> {
  late FocusNode _focusNode;
  late TextEditingController _textController;

  String? _audioDes;
  String? _audioUrl;
  int? _audioDuration;

  DialogLoadingController? _loadingController;
  bool _changed = false;
  bool _isRecording = false;
  String? _audioLocalFile;

  @override
  void initState() {
    super.initState();

    _audioDes = widget.audioDes;
    _audioUrl = widget.audioUrl;
    _audioDuration = widget.audioDuration;

    _textController = TextEditingController(text: _audioDes ?? '');
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _checkDispose,
      child: Scaffold(
        backgroundColor: R.colors.homeSecondModuleBgColor,
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar(
          backgroundColor: R.colors.homeSecondModuleBgColor,
          statusBrightness: R.colors.statusBarTheme,
          backColor: R.colors.mainTextColor,
          titleColor: R.colors.mainTextColor,
          Util.isStringEmpty(widget.audioDes)
              ? K.chat_quick_reply_add_voice
              : K.chat_quick_reply_edit_voice,
          onBackPressedCallback: () async {
            await Navigator.maybePop(context);
          },
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _focusNode.unfocus(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildInput(),
                if (!Util.isStringEmpty(_audioUrl) &&
                    Util.parseInt(_audioDuration) > 0)
                  ..._buildRecordAgain()
                else
                  ..._buildStartRecord(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _checkDispose() async {
    if (_isRecording) {
      Fluttertoast.showToast(msg: K.keychat_quick_reply_stop_first);
      return false;
    }

    if (!Util.isStringEmpty(widget.audioDes) &&
        !Util.isStringEmpty(_textController.text.trim()) &&
        _textController.text.trim() != widget.audioDes) {
      _changed = true;
    }

    if (_changed) {
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
        _submit(_audioLocalFile, _audioDuration);
        return false;
      }
    }
    return true;
  }

  Widget _buildInput() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: R.colors.tagBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsetsDirectional.only(start: 20, top: 16.0, end: 20),
      padding: const EdgeInsetsDirectional.only(
        top: 0.0,
        start: 12.0,
        end: 12.0,
        bottom: 12.0,
      ),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: TextField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.start,
          style: R.textStyle.regular14.copyWith(color: R.colors.mainTextColor),
          focusNode: _focusNode,
          controller: _textController,
          autocorrect: true,
          autofocus: false,
          maxLength: 6,
          maxLines: 11,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '',
              counterStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: R.colors.secondTextColor)),
        ),
      ),
    );
  }

  List<Widget> _buildRecordAgain() {
    return [
      Container(
        padding:
            const EdgeInsetsDirectional.only(start: 20, top: 12, bottom: 12),
        child: Row(
          children: [
            Text(
              K.chat_quick_reply_record,
              style: TextStyle(
                  fontSize: 14,
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w500),
            ),
            QuickReplyVoiceWidget(
                audioPlay: AudioPlay.instance(),
                audioUrl: _audioUrl!,
                audioLen: _audioDuration!),
          ],
        ),
      ),
      const Spacer(),
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (mounted) {
            setState(() {
              _audioLocalFile = null;
              _audioUrl = null;
              _audioDuration = 0;
            });
          }
        },
        child: Container(
          height: 52,
          alignment: AlignmentDirectional.center,
          margin:
              const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: LinearGradient(
              colors: R.colors.mainBrandGradientColors,
            ),
          ),
          child: Text(
            K.chat_quick_reply_record_again,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildStartRecord() {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);

    return [
      const Spacer(),
      manager.getAudioRecorderWidget(
          maxBottomMargin: 12,
          audioUrl: _audioUrl ?? '',
          duration: _audioDuration ?? 0,
          onFinish: _onFinish,
          onCompleted: _submit,
          onDelete: _onDelete,
          maximumDuration: 60,
          onStartRecord: _onStartRecord,
          minDuration: 1,
          type: AudioRecordType.quickReply,
          supportDark: true),
    ];
  }

  Future<void> _submit(String? localFile, int? duration) async {
    if (Util.isStringEmpty(_textController.text.trim())) {
      Fluttertoast.showCenter(msg: K.chat_quick_reply_des_first);
      return;
    }

    _audioDes = _textController.text.trim();

    if (localFile != null && localFile.isNotEmpty) {
      try {
        OssUploadDataResp resp =
            await BaseRequestManager.getFileUploadUrl('audio');
        showLoading(K.chat_quick_reply_uploading);
        if (resp.success == true && resp.data != null) {
          bool result =
              await BaseRequestManager.uploadFile(resp.data!, File(localFile));
          if (result) {
            String filePath = BaseRequestManager.getOssFilePath(
                resp.data?.dir ?? '', File(localFile));
            hideLoading();

            final QuickReplyEditResult result = QuickReplyEditResult(
                _audioDes ?? '',
                audio: filePath,
                duration: _audioDuration);
            Navigator.of(context).pop(result);
          } else {
            hideLoading();
            Fluttertoast.showToast(
                msg: R.array('xhr_error_type_array')[6],
                gravity: ToastGravity.CENTER);
          }
        }
      } catch (e) {
        hideLoading();
        Log.d(e.toString());
      }
    } else if (!Util.isStringEmpty(_audioDes)) {
      Map<String, dynamic> map = {
        'content': _audioDes,
      };
      Navigator.of(context).pop(map);
    } else {
      Navigator.of(context).pop();
    }
  }

  void _onStartRecord() {
    _isRecording = true;
    _changed = true;
    setState(() {});
  }

  void _onFinish(String? localFile, int? duration) {
    _isRecording = false;
    _audioLocalFile = localFile;
    _audioDuration = duration;
    _changed = true;
    setState(() {});
  }

  void _onDelete() {
    _isRecording = false;
    _audioLocalFile = null;
    _changed = false; // 删除了语音不处理了

    setState(() {});
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
