import 'dart:async';

import 'package:shared/shared.dart' hide DownloadState;
import 'package:chat_room/k.dart';
import 'package:chat_room/src/ktv/utils/ktv_theme.dart';
import 'package:chat_room/src/ktv/model/song_sheet_beans.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/song_download_util.dart';

class SongDownloadDialog extends StatefulWidget {
  final Song song;

  /// 酷狗音速达的歌词
  final String? krc;

  static Set<int> existSongs = {};

  const SongDownloadDialog({Key? key, required this.song, this.krc})
      : super(key: key);

  static Future<bool?> show(BuildContext context, Song song,
      {String? krc}) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SongDownloadDialog(song: song, krc: krc);
      },
    );
  }

  @override
  State<SongDownloadDialog> createState() => _SongDownloadDialogState();
}

class _SongDownloadDialogState extends State<SongDownloadDialog> {
  double _progress = 0.0;

  static const String LOG_TAG = "SongDownloadDialog";

  CancelToken cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    _initDownload();
  }

  void _initDownload() async {
    DownloadState downloadState = await SongDownloadUtil.downloadSongs(
      widget.song,
      cancelToken,
      (double progress) {
        if (!mounted) return;
        _progress = progress;
        setState(() {});
      },
      krc: widget.krc,
    );
    Log.d(
        'DownloadResult $downloadState and id = ${widget.song.pid} and brc = ${widget.song.brcUrl}',
        tag: LOG_TAG);

    if (!mounted) return;

    if (downloadState == DownloadState.Success) {
      Toast.showCenter(context, K.ktv_download_success);
    } else if (downloadState == DownloadState.Failure) {
      Toast.showCenter(context, K.ktv_download_failure);
    } else if (downloadState == DownloadState.AlreadyExists) {
      Toast.showCenter(context, K.ktv_already_download);
    }

    Navigator.of(context).pop(downloadState == DownloadState.Success ||
        downloadState == DownloadState.AlreadyExists);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: _buildContent(context, widget.song.icon));
  }

  Future<void> _cancelDownload() async {
    try {
      cancelToken.cancel("User want cancel........!");
    } catch (e) {
      Log.d(e);
    }
    await SongDownloadUtil.deleteSong(widget.song);
  }

  Widget _buildContent(BuildContext context, String icon) {
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
                child: CommonAvatar(
                  path: icon,
                  shape: BoxShape.circle,
                  size: 96,
                  suffix: null,
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
                onTap: () {
                  _cancelDownload();
                },
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
}
