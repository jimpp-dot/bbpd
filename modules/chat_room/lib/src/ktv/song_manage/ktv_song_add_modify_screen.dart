import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/oss_upload_data.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/ktv/model/ktv_auto_generate_beans.dart';
import 'package:chat_room/src/ktv/model/ktv_song_manage_beans.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/ktv/song_manage/upload_dialog.dart';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;

import '../../../assets.dart';
import '../utils/ktv_theme.dart';
import 'generate_dialog.dart';

/// ktv歌曲上传或者修改页面(仅支持Android用户)
///
class KtvSongAddModifyScreen extends StatefulWidget {
  final int? songId;

  const KtvSongAddModifyScreen({Key? key, this.songId}) : super(key: key);

  static Future<bool?> show(BuildContext context, {int? songId}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => KtvSongAddModifyScreen(songId: songId),
        settings: const RouteSettings(name: '/KtvSongAddModifyScreen'),
      ),
    );
  }

  @override
  State<KtvSongAddModifyScreen> createState() => _KtvSongAddModifyScreenState();
}

class _FileModel {
  int type;
  String? filePath; // 文件路径
  int? duration;
  int? size;
  String? md5;

  _FileModel(this.type);

  String baseName() {
    return Path.basename(filePath ?? '');
  }

  void resetNull() {
    filePath = null;
    duration = null;
    size = null;
    md5 = null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _FileModel &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          filePath == other.filePath;

  @override
  int get hashCode => type.hashCode ^ filePath.hashCode;

  @override
  String toString() {
    return '_FileModel{type: $type, filePath: $filePath, duration: $duration, size: $size, md5: $md5}';
  }
}

class _KtvSongAddModifyScreenState
    extends BaseScreenState<KtvSongAddModifyScreen> {
  static const int _UPLOAD_MAX_FILE_SIZE = 10 * 1024 * 1024;

  static const _FILE_TYPE_ORG = 1;

  static const _FILE_TYPE_ACCOMPANY = 2;

  static const _FILE_TYPE_LRC = 3;

  static const _SUPPORT_FILE_TYPE = ['.mp3', '.m4a'];
  static const _SUPPORT_FILE_STR = '(.mp3, .m4a)';
  static const _SUPPORT_LRC_STR = '(.lrc)';

  final _FileModel _orgFileModel = _FileModel(_FILE_TYPE_ORG); // 原唱文件

  final _FileModel _accFileModel = _FileModel(_FILE_TYPE_ACCOMPANY); // 伴奏文件

  final _FileModel _lrcFileModel = _FileModel(_FILE_TYPE_LRC); // 歌词文件

  late TextEditingController _songNameEditingController;
  late TextEditingController _singerNameEditingController;

  late AudioPlayer _sound;

  MySongItem? _mySongItem;

  List<_FileModel> get _fileModelList =>
      <_FileModel>[_orgFileModel, _accFileModel, _lrcFileModel];

  /// 是否显示自动生成伴奏入口
  bool _showAutoGenerate = false;
  String? _privacyUrl;

  /// 是否选择了自动生成伴奏模式
  bool _isAutoGenFlag = false;

  final Throttle _uploadThrottle =
      Throttle(duration: const Duration(milliseconds: 1000));

  @override
  void initState() {
    super.initState();
    _songNameEditingController = TextEditingController();
    _singerNameEditingController = TextEditingController();

    _sound = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
    if (isModify) {
      _loadModifyData();
    } else {
      _loadAutoGenerateCfg();
    }
  }

  @override
  void dispose() {
    _sound.dispose();
    super.dispose();
    _uploadThrottle.dispose();
  }

  void _loadModifyData() async {
    MySongDetailResp resp = await KtvRepo.getMySongDetail(widget.songId!);
    if (resp.success == true) {
      _mySongItem = resp.data;
      _songNameEditingController.text = resp.data?.name ?? '';
      _singerNameEditingController.text = resp.data?.singer ?? '';
      _orgFileModel.filePath = resp.data?.orgFileName;
      _accFileModel.filePath = resp.data?.accFileName;
      _lrcFileModel.filePath = resp.data?.lrcFileName;

      await _loadAutoGenerateCfg();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  Future<void> _loadAutoGenerateCfg() async {
    DataRsp<KtvAudioGenerateModel> autoResp = await KtvRepo.generateCfg();
    if (autoResp.success == true && autoResp.data != null) {
      _showAutoGenerate = autoResp.data!.generate;
      _privacyUrl = autoResp.data!.privacyUrl;
    } else {
      Log.d('generateCfg autoResp errMsg=${autoResp.msg}');
    }
    setScreenReady();
  }

  @override
  void onTapErrorWidget() {
    _loadModifyData();
  }

  @override
  Color getBgColor() {
    return KtvTheme.mainBgColor;
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return BaseAppBar.custom(
      title: Text(
        isModify ? K.ktv_modify_song : K.ktv_upload_song,
        style: TextStyle(
          color: KtvTheme.mainTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: InkWell(
        onTap: () {
          Navigator.of(context).maybePop();
        },
        child: Container(
          width: kToolbarHeight,
          height: kToolbarHeight,
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: R.img(
              BaseAssets.shared$titlebar_ic_titlebar_close_svg,
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 18,
              height: 18,
              color: KtvTheme.mainTextColor,
            ),
          ),
        ),
      ),
      backgroundColor: KtvTheme.mainBgColor,
      statusBrightness: KtvTheme.statusBrightness,
    );
  }

  bool get isModify => widget.songId != null && widget.songId! > 0;

  @override
  Widget? buildBottomNavigationBar() {
    if (isModify && !isScreenReady()) {
      return null;
    }

    Widget bottomText;
    if (!Util.isLocale) {
      bottomText = Text(
        K.ktv_upload_legal_tips,
        style: TextStyle(color: R.color.thirdTextColor, fontSize: 11),
      );
    } else {
      bottomText = Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: K.ktv_upload_legal_tips_span_1,
              style: TextStyle(color: KtvTheme.secondTextColor, fontSize: 12),
            ),
            TextSpan(
              text: K.ktv_upload_legal_tips_hyperlink,
              style: TextStyle(
                color: KtvTheme.mainBrandColor,
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => BaseWebviewScreen.show(
                      context,
                      title: K.ktv_upload_legal_tips_hyperlink,
                      url: _privacyUrl ?? '',
                    ),
            ),
            TextSpan(
              text: K.ktv_upload_legal_tips_span_2,
              style: TextStyle(color: KtvTheme.secondTextColor, fontSize: 12),
            ),
          ],
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1, color: Color(0x1A313131)),
        Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: 16 + Util.iphoneXBottom, top: 16, start: 20, end: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientButton(
                isModify ? K.ktv_confirm_modify : K.ktv_confirm_upload,
                width: Util.width - 40,
                height: 48,
                onTap: () => _uploadThrottle.call(_upload),
                colors: KtvTheme.gradientColors,
              ),
              const SizedBox(height: 12),
              bottomText
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        Divider(height: 2, color: KtvTheme.mainTextColor.withOpacity(0.1)),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStepTitle(K.ktv_upload_org, _SUPPORT_FILE_STR),
                  _buildUploadContent(),
                  _buildStepTitle(K.ktv_upload_acc, _SUPPORT_FILE_STR),
                  _buildAccompanimentContent(),
                  _buildStepTitle(K.ktv_upload_lrc, _SUPPORT_LRC_STR),
                  _buildLrcContent(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStepTitle(String title, String attachTitle) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 16, top: 30),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: KtvTheme.mainTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            attachTitle,
            style: TextStyle(
              color: KtvTheme.mainTextColor.withAlpha(66),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  _FileModel? _getFileModel(int type) {
    return _fileModelList.firstWhereOrNull((e) => e.type == type);
  }

  String _getFilePath(int type) {
    return _getFileModel(type)?.filePath ?? '';
  }

  /// 上传控件
  Widget _buildUpload(bool enable, int type) {
    return GestureDetector(
      onTap: () {
        if (!enable) {
          return;
        }
        _handleSelectFile(type);
      },
      child: Opacity(
        opacity: enable ? 1 : 0.3,
        child: Container(
          height: 40,
          padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(55),
            border: Border.all(width: 1, color: const Color(0x1A313131)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(RoomAssets.chat_room$ktv_ic_upload_png,
                  width: 16, height: 16, color: KtvTheme.mainBrandColor),
              const SizedBox(width: 8),
              Text(
                K.upload,
                style: TextStyle(
                  color: KtvTheme.mainTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  /// 上传原唱内容区域
  Widget _buildUploadSoundTrack() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFileItem(_FILE_TYPE_ORG),
        const SizedBox(height: 16),
        _getDesText(K.ktv_song_name),
        const SizedBox(height: 12),
        _buildNameInputText(_songNameEditingController, K.ktv_input_song_name),
        const SizedBox(height: 16),
        _getDesText(K.ktv_songer_name),
        const SizedBox(height: 12),
        _buildNameInputText(
            _singerNameEditingController, K.ktv_input_singer_name),
        const SizedBox(height: 16),
        _buildAutoGenAccompaniment(),
      ],
    );
  }

  // 文件名称，与大小，删除
  Widget _buildFileItem(int type) {
    String filePath;
    String? iconPath;
    String sizeStr;
    if (type == _FILE_TYPE_ACCOMPANY && _isAutoGenFlag) {
      filePath = _getFilePath(_FILE_TYPE_ORG);
      iconPath = _getFileIconAsset(filePath);
      sizeStr = _getHumanReadSize(_FILE_TYPE_ORG);
    } else {
      filePath = _getFilePath(type);
      iconPath = _getFileIconAsset(filePath);
      sizeStr = _getHumanReadSize(type);
    }

    return Row(
      children: [
        if (iconPath != null) R.img(iconPath, width: 40, height: 40),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Path.basename(filePath),
                style: TextStyle(color: KtvTheme.mainTextColor, fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 1),
              Text(
                sizeStr,
                style: TextStyle(color: KtvTheme.secondTextColor, fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => _handleDelete(type),
          child: Container(
            height: 40,
            padding: const EdgeInsetsDirectional.only(start: 15),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text(
                K.room_music_op_rm,
                style: const TextStyle(
                  color: Color(0xFFFF5F7D),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  String? _getFileIconAsset(String filePath) {
    if (Util.isStringEmpty(filePath)) {
      return null;
    }
    if (filePath.endsWith('.mp3')) {
      return RoomAssets.chat_room$ktv_ic_mp3_webp;
    }
    if (filePath.endsWith('.m4a')) {
      return RoomAssets.chat_room$ktv_ic_m4a_webp;
    }
    if (filePath.endsWith('.lrc')) {
      return RoomAssets.chat_room$ktv_ic_lrc_webp;
    }
    return null;
  }

  Widget _getDesText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: KtvTheme.secondTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w600),
    );
  }

  Widget _buildNameInputText(TextEditingController controller, String hint) {
    TextStyle textStyle =
        TextStyle(color: KtvTheme.mainTextColor, fontSize: 14);
    return Container(
      height: 48,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
          color: KtvTheme.formBg,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Center(
        child: TextField(
          cursorColor: KtvTheme.cursorColor,
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          scrollPadding: EdgeInsets.zero,
          enableInteractiveSelection: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            isDense: true,
            hintText: hint,
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: KtvTheme.formHintColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            counterText: '',
          ),
          style: textStyle,
          autofocus: false,
          autocorrect: false,
          onChanged: (String text) {},
          onSubmitted: (text) {
            //_onSubmitted(text);
          },
        ),
      ),
    );
  }

  bool checkFileType(String file, List<String> typeList) {
    if (Util.isStringEmpty(file)) {
      return false;
    }
    return typeList
        .any((element) => file.toLowerCase().endsWith(element.toLowerCase()));
  }

  Future<int> getFileSize(String filePath) async {
    if (Util.isStringEmpty(filePath)) {
      return 0;
    }
    File file = File(filePath);
    bool s = await file.exists();
    if (s == true) {
      FileStat stat = await file.stat();
      return stat.size;
    }
    return 0;
  }

  String _getHumanReadSize(int type) {
    int bytes = _getFileModel(type)?.size ?? 0;
    return Utility.formatBytes(bytes, decimals: 1);
  }

  void _upload() async {
    String songName = _songNameEditingController.text;
    if (Util.isStringEmpty(songName)) {
      Fluttertoast.showToast(msg: K.ktv_input_song_name);
      return;
    }
    String singerName = _singerNameEditingController.text;
    if (Util.isStringEmpty(singerName)) {
      Fluttertoast.showToast(msg: K.ktv_input_singer_name);
      return;
    }

    if (Util.isStringEmpty(_orgFileModel.filePath)) {
      Fluttertoast.showToast(msg: K.ktv_please_choose_org_file);
      return;
    }

    if (Util.isStringEmpty(_accFileModel.filePath) && !_isAutoGenFlag) {
      Fluttertoast.showToast(msg: K.ktv_please_choose_acc_file);
      return;
    }

    // PT 的歌词文件为非必选项
    if (!Util.isLocale && Util.isStringEmpty(_lrcFileModel.filePath)) {
      Fluttertoast.showToast(msg: K.ktv_please_choose_lrc_file);
      return;
    }

    /// 如果是修改歌曲，必须选择过文件
    if (!(isModify && _orgFileModel.filePath == _mySongItem?.orgFileName)) {
      await _sound.setSourceDeviceFile(_orgFileModel.filePath!);
      await Future.delayed(const Duration(milliseconds: 300));
      _orgFileModel.duration =
          (await _sound.getDuration())?.inMilliseconds ?? 0;
      if (_orgFileModel.duration! <= 0) {
        Fluttertoast.showToast(
            msg: K.ktv_audio_file_error([_orgFileModel.baseName()]));
        return;
      }

      _orgFileModel.size = await getFileSize(_orgFileModel.filePath!);
      if (_orgFileModel.size! > _UPLOAD_MAX_FILE_SIZE) {
        Fluttertoast.showToast(
            msg: K.ktv_song_file_too_large([_orgFileModel.baseName()]));
        return;
      }

      _orgFileModel.md5 = _getFileMd5(_orgFileModel.filePath!);
    }

    if (!(isModify && _accFileModel.filePath == _mySongItem?.accFileName ||
        _isAutoGenFlag)) {
      await _sound.setSourceDeviceFile(_accFileModel.filePath ?? '');
      await Future.delayed(const Duration(milliseconds: 300));
      _accFileModel.duration =
          (await _sound.getDuration())?.inMilliseconds ?? 0;
      if (_accFileModel.duration! <= 0) {
        Fluttertoast.showToast(
            msg: K.ktv_audio_file_error(
                [Path.basename(_accFileModel.filePath ?? '')]));
        return;
      }

      _accFileModel.size = await getFileSize(_accFileModel.filePath ?? '');
      if (_accFileModel.size! > _UPLOAD_MAX_FILE_SIZE) {
        Fluttertoast.showToast(
            msg: K.ktv_song_file_too_large(
                [Path.basename(_accFileModel.filePath ?? '')]));
        return;
      }

      _accFileModel.md5 = _getFileMd5(_accFileModel.filePath ?? '');
    }

    if (!(isModify &&
        _lrcFileModel.filePath == (_mySongItem?.lrcFileName ?? ''))) {
      _lrcFileModel.size = await getFileSize(_lrcFileModel.filePath ?? '');
      if (_lrcFileModel.size! > _UPLOAD_MAX_FILE_SIZE) {
        Fluttertoast.showToast(
            msg: K.ktv_song_file_too_large(
                [Path.basename(_lrcFileModel.filePath ?? '')]));
        return;
      }
    }

    String? finalOrgPath = _orgFileModel.filePath;
    String? finalAccPath = _accFileModel.filePath;

    if (isModify) {
      /// 原唱文件没有修改
      if (Util.isStringEmpty(_orgFileModel.md5) ||
          _orgFileModel.md5 == _mySongItem?.orgFileMd5) {
        finalOrgPath = null;
      }

      /// 伴奏文件没有修改
      if (Util.isStringEmpty(_accFileModel.md5) ||
          _accFileModel.md5 == _mySongItem?.accFileMd5) {
        finalAccPath = null;
      }
    }

    bool? uploadSuccess = true;
    OssUploadDataResp? resp;
    if (!Util.isStringEmpty(finalOrgPath) ||
        !Util.isStringEmpty(finalAccPath)) {
      resp = await BaseRequestManager.getFileUploadUrl('ktv');
      if (resp.success == true && resp.data != null) {
        uploadSuccess = await KtvUploadDialog.show(
            context, resp.data!, finalOrgPath, finalAccPath);
      } else {
        uploadSuccess = false;
      }
    }
    if (uploadSuccess == true) {
      Map<String, dynamic> formData = {};
      if (isModify) {
        formData['id'] = _mySongItem?.id ?? 0;
      }
      formData["singer_name"] = _singerNameEditingController.text;
      formData["song_name"] = _songNameEditingController.text;
      if (!Util.isStringEmpty(finalOrgPath)) {
        formData["original_mp3"] =
            _getKey(resp?.data?.dir ?? '', _orgFileModel.filePath ?? '');
        formData["original_size"] = _orgFileModel.size;
        formData["original_play_time"] = _orgFileModel.duration;
      }

      if (_isAutoGenFlag) {
        formData["hq_auto_gen"] = 1;
      } else if (!Util.isStringEmpty(finalAccPath)) {
        formData["hq_music"] =
            _getKey(resp?.data?.dir ?? '', _accFileModel.filePath ?? '');
        formData["hq_size"] = _accFileModel.size;
        formData["hq_playtime"] = _accFileModel.duration;
      }

      if (_lrcFileModel.size != null && (_lrcFileModel.size ?? 0) > 0) {
        formData["lrc"] =
            await MultipartFile.fromFile(_lrcFileModel.filePath ?? '');
      }

      FormData form = FormData.fromMap(formData);
      bool subRe = await KtvRepo.submitFile(form);
      if (subRe == true) {
        Fluttertoast.showToast(
            msg: isModify
                ? K.ktv_song_modify_success
                : K.ktv_song_upload_success,
            gravity: ToastGravity.CENTER);
        Navigator.of(context).pop(true);
      } else {
        Fluttertoast.showToast(
            msg: K.ktv_upload_file_failure, gravity: ToastGravity.CENTER);
      }
    } else {
      Fluttertoast.showToast(
          msg: K.ktv_upload_file_failure, gravity: ToastGravity.CENTER);
    }
  }

  _handleDelete(int type) {
    if (type == _FILE_TYPE_ACCOMPANY && _isAutoGenFlag) {
      _isAutoGenFlag = false;
    }
    _getFileModel(type)?.resetNull();
    _refresh();
  }

  void _handleSelectFile(int type) async {
    final fileType = type == _FILE_TYPE_LRC ? FileType.any : FileType.audio;
    final result = await FilePicker.platform.pickFiles(
      type: fileType,
    );
    String path = result?.files.first.path ?? '';
    if (Util.isStringEmpty(path)) {
      return;
    }
    Log.d('handleSelectFile type=$type,path=$path');
    if (type == _FILE_TYPE_ORG) {
      if (checkFileType(path, _SUPPORT_FILE_TYPE)) {
        int size = await getFileSize(path);
        if (size > _UPLOAD_MAX_FILE_SIZE) {
          Fluttertoast.showToast(
              msg: K.ktv_song_file_too_large([Path.basename(path)]));
          return;
        }
        await _sound.setSourceDeviceFile(path);
        await Future.delayed(const Duration(milliseconds: 300));
        Duration time = await _sound.getDuration() ?? Duration.zero;
        int duration = time.inMilliseconds;
        if (duration <= 0) {
          Fluttertoast.showToast(
              msg: K.ktv_audio_file_error([Path.basename(path)]));
          return;
        }
        _orgFileModel.filePath = path;
        _orgFileModel.size = size;
        _orgFileModel.duration = duration;
      } else {
        Fluttertoast.showToast(msg: K.ktv_choose_file_format_err);
        return;
      }
    } else if (type == _FILE_TYPE_ACCOMPANY) {
      if (checkFileType(path, _SUPPORT_FILE_TYPE)) {
        int size = await getFileSize(path);
        if (size > _UPLOAD_MAX_FILE_SIZE) {
          Fluttertoast.showToast(
              msg: K.ktv_song_file_too_large([Path.basename(path)]));
          return;
        }
        await _sound.setSourceDeviceFile(File(path).path);
        await Future.delayed(const Duration(milliseconds: 300));
        int duration = (await _sound.getDuration())?.inMilliseconds ?? 0;
        if (duration <= 0) {
          Fluttertoast.showToast(
              msg: K.ktv_audio_file_error([Path.basename(path)]));
          return;
        }
        _accFileModel.filePath = path;
        _accFileModel.size = size;
        _accFileModel.duration = duration;
      } else {
        Fluttertoast.showToast(msg: K.ktv_choose_file_format_err);
        return;
      }
    } else if (type == _FILE_TYPE_LRC) {
      if (checkFileType(path, ['.lrc'])) {
        int size = await getFileSize(path);
        if (size > _UPLOAD_MAX_FILE_SIZE) {
          Fluttertoast.showToast(
              msg: K.ktv_song_file_too_large([Path.basename(path)]));
          return;
        }
        _lrcFileModel.filePath = path;
        _lrcFileModel.size = size;
      } else {
        Fluttertoast.showToast(msg: K.ktv_choose_lrc_file);
        return;
      }
    }
    _refresh();
  }

  String _getKey(String dir, String filePath) {
    String fileMd5 = _getFileMd5(filePath);
    String filename = Path.basename(filePath);

    String key = '$dir/$fileMd5.${filename.split(".")[1]}';
    return key;
  }

  String _getFileMd5(String filePath) {
    return md5.convert(File(filePath).readAsBytesSync()).toString();
  }

  /// 自动生成伴奏和歌词控件
  Widget _buildAutoGenAccompaniment() {
    if (_showAutoGenerate != true) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          K.ktv_auto_gen_acc,
          style: TextStyle(
              color: KtvTheme.secondTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () async {
            bool? autoGen = await GenerateDialog.show(context);
            FocusScope.of(context).requestFocus(FocusNode());
            _isAutoGenFlag = autoGen == true;
            if (_isAutoGenFlag) {
              Fluttertoast.showToast(msg: K.ktv_auto_gen_success);
            }
            refresh();
          },
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              gradient: LinearGradient(colors: KtvTheme.gradientColors),
            ),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text(
                K.ktv_auto_gen,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          K.ktv_auto_gen_tip_1,
          style: TextStyle(
            color: KtvTheme.mainTextColor.withAlpha(66),
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildUploadContent() {
    if (Util.isStringEmpty(_orgFileModel.filePath)) {
      return _buildUpload(true, _FILE_TYPE_ORG);
    }
    return _buildUploadSoundTrack();
  }

  Widget _buildAccompanimentContent() {
    bool enable = !Util.isStringEmpty(_orgFileModel.filePath);
    if (Util.isStringEmpty(_accFileModel.filePath) && !_isAutoGenFlag) {
      return _buildUpload(enable, _FILE_TYPE_ACCOMPANY);
    }
    return _buildFileItem(_FILE_TYPE_ACCOMPANY);
  }

  Widget _buildLrcContent() {
    bool enable = !Util.isStringEmpty(_orgFileModel.filePath) &&
        (!Util.isStringEmpty(_accFileModel.filePath) || _isAutoGenFlag);
    if (Util.isStringEmpty(_lrcFileModel.filePath)) {
      return _buildUpload(enable, _FILE_TYPE_LRC);
    }
    return _buildFileItem(_FILE_TYPE_LRC);
  }
}
