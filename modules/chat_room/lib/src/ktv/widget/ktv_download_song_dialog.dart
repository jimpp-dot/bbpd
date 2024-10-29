import 'package:flutter/material.dart';
import 'package:chat_room/src/ktv/utils/progress_provider.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/ktv/utils/ktv_theme.dart';
import '../../../k.dart';

typedef ProviderBuilder = ProgressInterface Function(
    ProgressCallBack onProgressChanged, CompleteCallBack onCompleted);

/// ktv 歌曲下载进度dialog
///
class KtvDownloadSongDialog extends StatefulWidget {
  final ProviderBuilder providerBuilder;

  const KtvDownloadSongDialog({Key? key, required this.providerBuilder})
      : super(key: key);

  Future<bool?> show(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => this,
    );
  }

  @override
  State<KtvDownloadSongDialog> createState() => _KtvDownloadSongDialogState();
}

class _KtvDownloadSongDialogState extends State<KtvDownloadSongDialog> {
  double _progress = 0.0;
  late ProgressInterface provider;

  @override
  void initState() {
    super.initState();

    provider = widget.providerBuilder(_onProgressChanged, _onCompleted);
    provider.startDownload();
  }

  @override
  void dispose() {
    provider.cancelDownload();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent, child: buildContent(context));
  }

  Widget buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
      width: 254,
      height: 254,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                child: R.img(
                  'ktv/ic_default_song_photo.webp',
                  width: 96,
                  height: 96,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: _progress,
                  strokeWidth: 3.0,
                  backgroundColor: KtvTheme.secondBgColor,
                  valueColor: AlwaysStoppedAnimation(KtvTheme.mainBrandColor),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 20),
            child: Text(
              K.ktv_down_in_progress_percent(
                  [(_progress * 100).round().toString()]),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Container(
            height: 48,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Material(
              child: InkWell(
                onTap: _cancelDownload,
                borderRadius: BorderRadius.circular(24),
                child: Ink(
                  height: 48,
                  decoration: BoxDecoration(
                    color: KtvTheme.mainBgColor,
                    border:
                        Border.all(color: const Color(0x1F313131), width: 1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Text(
                      K.ktv_cancel_download,
                      style: TextStyle(
                        color: KtvTheme.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onProgressChanged(double progress) {
    if (mounted && _progress != progress) {
      setState(() {
        _progress = progress;
      });
    }
  }

  void _onCompleted(bool success, String? errorMsg) {
    _dismiss(success);
  }

  void _cancelDownload() {
    provider.cancelDownload();
    _dismiss(false);
  }

  void _dismiss(bool success) {
    if (mounted) {
      Navigator.of(context).pop(success);
    }
  }
}
