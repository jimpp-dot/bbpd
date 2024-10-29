import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/model/oss_upload_data.dart';
import 'package:chat/k.dart' as ChatK;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/api/api.dart';
import 'package:personaldata/src/model/voiceTextModel.dart';
import 'package:personaldata/src/page/reception_rules_screen.dart';
import 'package:personaldata/src/widget/audioRecorderWidget.dart';
import 'package:personaldata/src/widget/voiceCardWidget.dart';

/// 声音录制
class AudioRecordScreen extends StatefulWidget {
  final String? audioRemoteUrl;
  final String? bgAsset;
  final int duration;
  final int minDuration;
  final AudioRecordType type;
  final int verifyId;
  final Function(String)? uploadedFunc;
  final Iterable<Future Function()>? afterUploaded;

  const AudioRecordScreen(
      {Key? key,
      this.audioRemoteUrl,
      this.bgAsset,
      this.duration = 0,
      this.minDuration = 0,
      this.type = AudioRecordType.editAudio,
      this.verifyId = 0,
      this.uploadedFunc,
      this.afterUploaded})
      : super(key: key);

  @override
  _AudioRecordScreenState createState() => _AudioRecordScreenState();

  static show(BuildContext context,
      {String? url,
      String? bgAsset,
      int duration = 0,
      int minDuration = 0,
      AudioRecordType type = AudioRecordType.editAudio,
      int verifyId = 0,
      Function(String)? uploadedFunc,
      Iterable<Future Function()>? afterUploaded}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AudioRecordScreen(
          audioRemoteUrl: url,
          bgAsset: bgAsset,
          duration: duration,
          minDuration: minDuration,
          type: type,
          verifyId: verifyId,
          uploadedFunc: uploadedFunc,
          afterUploaded: afterUploaded),
      settings: const RouteSettings(name: '/audioRecordScreen'),
    ));
  }
}

class _AudioRecordScreenState extends State<AudioRecordScreen> {
  // 本地录音文件路径
  String _audioLocalFile = '';
  int _duration = 0;

  bool _hasDelAudio = false;
  bool _changed = false;
  bool _isRecording = false;
  GlobalKey _tinderCardKey = GlobalKey();

  VoiceTextModelRsp? _voiceTextModelRsp;
  bool _loading = true;
  String? _errorMsg;
  int _page = 1;
  final List<VoiceTextModel> _dialogs = [];
  CardController? _controller;
  DialogLoadingController? _loadingController;
  DataRsp<AudioWordsInfoModel>? _dataRsp;

  @override
  void initState() {
    super.initState();
    _controller = CardController();
    _load();
  }

  Widget _buildAppBar() {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          InkWell(
            onTap: _popBack,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 20, top: 10, bottom: 10, end: 20),
              child: R.img("btn_back_white.png",
                  width: 16.0,
                  height: 16.0,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              (widget.type == AudioRecordType.editAudio)
                  ? K.personal_record_voice
                  : K.personal_voice_check,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (widget.type == AudioRecordType.receptionShow)
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: InkWell(
                onTap: () {
                  ReceptionRulesScreen.show(context, 1, widget.verifyId);
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 20, top: 10, bottom: 10, end: 20),
                  child: Text(
                    K.personal_skip,
                    style: R.textStyle.regular16.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _buildAppBar(),
            Expanded(
              child: _buildContent(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_loading) {
      return const Center(
        child: Loading(),
      );
    } else if (_errorMsg != null) {
      return ErrorData(
        onTap: () {
          _load();
        },
        error: _errorMsg,
      );
    }
    int minSec = 0;
    int maxSec = 60;
    if (widget.type == AudioRecordType.receptionAuth && _dataRsp != null) {
      minSec = _dataRsp!.data!.firstMin!;
      maxSec = 30;
    } else if (widget.type == AudioRecordType.receptionShow &&
        _dataRsp != null) {
      minSec = _dataRsp!.data!.secondMin!;
    } else
      minSec = widget.minDuration;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: _buildLines(),
          ),
        ),
        AudioRecorderWidget(
          maxBottomMargin: 12,
          audioUrl: widget.audioRemoteUrl ?? '',
          duration: widget.duration ?? 0,
          onFinish: _onFinish,
          onCompleted: _submit,
          onDelete: _onDelete,
          maximumDuration: maxSec,
          onStartRecord: _onStartRecord,
          minDuration: minSec,
          type: widget.type,
          supportDark: true,
        )
      ],
    );
  }

  VoiceTextModel? _getDialogItem(int index) {
    if (index > _dialogs.length - 1) {
      return null;
    }
    return _dialogs[index];
  }

  void _load() async {
    if (_voiceTextModelRsp != null && !(_voiceTextModelRsp?.more == true)) {
      return;
    }

    if (_dialogs.isEmpty) {
      _loading = true;
    }
    _errorMsg = null;
    _voiceTextModelRsp = await Api.getVoiceTextModels(_page);
    _loading = false;
    if (_voiceTextModelRsp != null) {
      _dialogs.insertAll(0, _voiceTextModelRsp?.dialogs ?? []);
      if (_voiceTextModelRsp?.more == true) {
        _page++;
      }
    } else {
      _errorMsg = R.string('server_return_error_retry');
    }

    if (widget.type != AudioRecordType.editAudio) {
      if (_dataRsp == null || _dataRsp?.success == false) {
        await _loadAudioInfo();
        if (_dataRsp != null && Util.validStr(_dataRsp?.msg)) {
          _errorMsg = _dataRsp!.msg;
        }
      }
    }
    _refresh();
  }

  _loadAudioInfo() async {
    _dataRsp = await Api.getAudioWords();
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildLines() {
    double maxWidth = MediaQuery.of(context).size.width * (335.0 / 375.0);
    double maxHeight = maxWidth / 335.0 * 440.0;
    if (widget.type == AudioRecordType.receptionShow) {
      VoiceTextModel item = VoiceTextModel.fromJson(
          {'content': _dataRsp?.data?.words ?? '', 'id': -1});
      return Column(
        children: [
          Container(
              height: maxHeight,
              margin: const EdgeInsetsDirectional.only(top: 12, end: 20),
              child: VoiceCardWidget(item, false, null)),
          Expanded(child: Container())
        ],
      );
    }

    return Container(
      height: maxHeight + 8.0,
      margin: const EdgeInsetsDirectional.only(top: 12),
      child: CustomFlipCards(
        key: _tinderCardKey,
        orientation: AmassOrientation.BOTTOM,
        totalNum: _dialogs.length,
        stackNum: 2,
        swipeEdge: 80.0,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        minWidth: maxWidth * 0.95,
        minHeight: maxHeight * 0.84,
        bottomStackOffsetDx: 8.0,
        bottomStackOffsetDy: 8.0,
        cardBuilder: (context, index, isTop, onNext) {
          VoiceTextModel? item = _getDialogItem(index);
          return VoiceCardWidget(item, isTop, onNext,
              key: ValueKey(item?.id ?? 0));
        },
        cardController: _controller,
        swipeUpdateCallback:
            (DragUpdateDetails details, Alignment align, int index) {
          /// Get swiping card's alignment
          if (align.x < 0) {
            //Card is LEFT swiping
          } else if (align.x > 0) {
            //Card is RIGHT swiping
          }
        },
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          /// Get orientation & index of swiped card!
          if (orientation == CardSwipeOrientation.RECOVER) {
            return;
          }
          if (index >= _dialogs.length - 1) {
            _load();
            _tinderCardKey = GlobalKey();
            _refresh();
          }
        },
      ),
    );
  }

  Future<bool> _checkDispose() async {
    if (_isRecording) {
      Fluttertoast.showToast(msg: K.personaldata_stop_recording_first);
      return false;
    }
    if (_changed) {
      bool result = await showDialog(
        context: context,
        builder: (context) => ConfirmDialog(
          content: K.personaldata_save_alert,
          negativeButton: NegativeButton(
            text: K.personaldata_give_up,
          ),
          positiveButton: PositiveButton(text: K.personaldata_save),
        ),
      );
      if (result ?? false) {
        _submit(_audioLocalFile, _duration);
        return false;
      }
    }
    return true;
  }

  void _popBack() async {
    bool result = await _checkDispose();
    if (result) {
      Navigator.of(context).pop(true);
    }
  }

  Future<void> _submit(String? localFile, int? duration) async {
    Map<String, String> postData = <String, String>{};
    String audioBase64 = '';
    String audioSuffix = '';
    if (localFile != null && localFile.isNotEmpty) {
      try {
        File imageFile = File(localFile);
        List<int> imageBytes = imageFile.readAsBytesSync();
        audioBase64 = base64.encode(imageBytes);
        audioSuffix = localFile.split('.').last;
        Log.d(localFile);
      } catch (e) {
        Log.d(e.toString());
      }
    }

    if (audioBase64.isNotEmpty) {
      postData['audioBase64'] = audioBase64;
    }

    if (Util.validStr(audioSuffix)) {
      postData['audioSuffix'] = audioSuffix;
    }

    String url = '${System.domain}rush/account/editFriendCard';
    if (widget.type == AudioRecordType.editAudio) {
      postData['duration'] = duration.toString();
      if (_hasDelAudio && (audioBase64.isEmpty)) {
        postData['clearAudio'] = '1';
      } else {
        postData['clearAudio'] = '0';
      }
    } else {
      if (audioBase64.isNotEmpty) {
        _uploadFile(localFile);
        return;
      } else {
        Fluttertoast.showToast(
            msg: R.array('xhr_error_type_array')[6],
            gravity: ToastGravity.CENTER);
        return;
      }
    }

    showLoading(ChatK.K.chat_add_card_loading);
    try {
      XhrResponse response =
          await Xhr.postJson(url, postData, throwOnError: false);

      Map<String, dynamic> res = response.response as Map<String, dynamic>;

      if (res['success'] == true) {
        hideLoading();
        Fluttertoast.showToast(msg: K.save_success);
        _changed = false;
        _uploadSuccess();
      } else {
        hideLoading();
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Log.d(e.toString());
    }
    hideLoading();
  }

  _uploadFile(String? path) async {
    OssUploadDataResp resp = await BaseRequestManager.getFileUploadUrl('audio');
    showLoading(ChatK.K.chat_add_card_loading);
    if (resp.success == true && resp.data != null) {
      bool result =
          await BaseRequestManager.uploadFile(resp.data!, File(path ?? ''));
      if (result) {
        String filePath = BaseRequestManager.getOssFilePath(
            resp.data?.dir ?? '', File(path ?? ''));
        bool success = true;
        String errorMsg = K.personal_impress_dialog_submit_failed;

        if (widget.type == AudioRecordType.common) {
          if (widget.uploadedFunc != null) {
            widget.uploadedFunc!('${resp.data?.host ?? ''}/$filePath');
          }

          if (widget.afterUploaded != null) {
            List<String> results = await Future.wait([
              for (var func in widget.afterUploaded!)
                func().then((value) => value ?? ''),
            ]);
            for (String r in results) {
              success = false;
              errorMsg = r;
              break;
            }
          }
        } else {
          int order = (widget.type == AudioRecordType.receptionAuth) ? 1 : 2;
          BaseResponse baseResponse = await Api.receptionSaveAudio(
              widget.verifyId, order, '${resp.data?.host ?? ''}/$filePath');
          success = baseResponse.success == true;
          if (!Util.isNullOrEmpty(baseResponse.msg)) {
            errorMsg = baseResponse.msg!;
          }
        }

        hideLoading();
        if (success) {
          Fluttertoast.showToast(msg: K.save_success);
          _changed = false;
          _uploadSuccess();
        } else {
          Fluttertoast.showToast(msg: errorMsg, gravity: ToastGravity.CENTER);
        }
      } else {
        hideLoading();
        Fluttertoast.showToast(
            msg: R.array('xhr_error_type_array')[6],
            gravity: ToastGravity.CENTER);
      }
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
    }
  }

  _uploadSuccess() {
    if (widget.type == AudioRecordType.editAudio) {
      Navigator.of(context).pop(true);
      Tracker.instance.track(TrackEvent.write_dating_card, properties: {
        'is_voice': true,
      });
      Tracker.instance.user_set({
        'has_friendcard': true,
      });
    } else if (widget.type == AudioRecordType.common) {
      Navigator.of(context).pop(true);
    } else {
      if (widget.type == AudioRecordType.receptionAuth) {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openAudioRecord(context,
            type: AudioRecordType.receptionShow, verifyId: widget.verifyId);
      } else {
        ReceptionRulesScreen.show(context, 1, widget.verifyId);
      }
    }
  }

  void _onStartRecord() {
    Log.d('audio:_onStartRecord');
    _isRecording = true;
    _changed = true;
    setState(() {});
  }

  void _onFinish(String? localFile, int? duration) {
    Log.d('audio:_onFinish$localFile$duration');
    _isRecording = false;
    _audioLocalFile = localFile ?? '';
    _duration = duration ?? 0;
    _changed = true;
    setState(() {});
  }

  void _onDelete() {
    Log.d('audio:_onDelete');
    _hasDelAudio = true;
    _isRecording = false;
    _changed = true;

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

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      const Color(0xFF2DF9F8),
      const Color(0xFF26A6FF)
    ];
    bool hasBg = Util.validStr(widget.bgAsset);
    return WillPopScope(
      onWillPop: _checkDispose,
      child: Scaffold(
        body: Stack(
          children: [
            if (!hasBg)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                  ),
                ),
              ),
            if (!hasBg)
              PositionedDirectional(
                end: -150,
                top: 100,
                child: ClipOval(
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradientColors,
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
            if (!hasBg)
              PositionedDirectional(
                start: -180,
                top: 200,
                child: ClipOval(
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradientColors,
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
            if (hasBg)
              R.img(widget.bgAsset,
                  width: Util.width, height: Util.height, fit: BoxFit.cover),
            _buildBody(),
          ],
        ),
      ),
    );
  }
}
