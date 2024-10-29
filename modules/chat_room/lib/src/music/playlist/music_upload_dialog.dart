import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

const int OPTION_LOCAL_UPLOAD = 1;
const int OPTION_WIFI_UPLOAD = 2;

/// 显示上传音乐对话框
/// 返回值：
/// 1.[OPTION_LOCAL_UPLOAD] 本地上传
/// 2.[OPTION_WIFI_UPLOAD] WIFI上传
Future<int?> showMusicUploadDialog(BuildContext context) async {
  int? index = await showDialog<int>(
    context: context,
    builder: (ctx) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        child: MusicUploadDialog(),
      );
    },
  );
  return index;
}

/// 上传音乐
class MusicUploadDialog extends StatelessWidget {
  const MusicUploadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.dp),
        color: R.color.mainBgColor,
      ),
      width: 312.dp,
      height: 209.dp,
      child: Column(
        children: [
          SizedBox(height: 20.dp),
          _buildTitle(),
          SizedBox(height: 24.dp),
          _buildLocalUpload(context),
          SizedBox(height: 20.dp),
          _buildWifiUpload(context),
        ],
      ),
    );
  }

  /// WIFI上传
  Widget _buildWifiUpload(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(OPTION_WIFI_UPLOAD);
      },
      child: _buildOptionItem(K.room_music_wifi_upload),
    );
  }

  /// 本地上传
  Widget _buildLocalUpload(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(OPTION_LOCAL_UPLOAD);
      },
      child: _buildOptionItem(K.room_music_local_upload),
    );
  }

  /// 上传音乐
  Widget _buildTitle() {
    return Text(
      K.room_music_upload,
      style: TextStyle(color: R.color.mainTextColor, fontSize: 18.dp),
    );
  }

  Widget _buildOptionItem(String text) {
    return Container(
      width: 272.dp,
      height: 48.dp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24.0.dp)),
        border: Border.all(width: 1.dp, color: _textOptColor),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: _textOptColor, fontSize: 15.dp),
        ),
      ),
    );
  }

  Color get _textOptColor => const Color(0xFF61C8FF);
}
