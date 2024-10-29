import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/model/oss_upload_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/ktv/utils/ktv_theme.dart';

//随意指定大小，可以点击外围消失，这个坑有点深， 这种方法还行。
class KtvUploadDialog extends StatefulWidget {
  final String? orgFilePath;

  final String? accFilePath;

  final OssUploadData ossUploadData;

  const KtvUploadDialog(
      {super.key,
      required this.ossUploadData,
      this.orgFilePath,
      this.accFilePath});

  @override
  State<StatefulWidget> createState() {
    return _KtvUploadDialogState();
  }

  static Future<bool?> show(BuildContext context, OssUploadData ossUploadData,
      String? orgFilePath, String? accFilePath) async {
    return showDialog(
      context: context,
      builder: (context) {
        return KtvUploadDialog(
            ossUploadData: ossUploadData,
            orgFilePath: orgFilePath,
            accFilePath: accFilePath);
      },
    );
  }
}

class _KtvUploadDialogState extends State<KtvUploadDialog> {
  double _progress = 0.0;

  int _orgSize = 0;

  int _accSize = 0;

  final CancelToken _orGCancelToken = CancelToken();
  final CancelToken _accCancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    _realUpload(widget.ossUploadData);
  }

  Future _realUpload(OssUploadData ossData) async {
    Log.d("resp = ${ossData.host}");

    _orgSize = await getFileSize(widget.orgFilePath);
    _accSize = await getFileSize(widget.accFilePath);

    int oriCurrent = 0;
    int hqCurrent = 0;

    int totalSize = _orgSize + _accSize;

    bool orgRe = true;
    if (!Util.isStringEmpty(widget.orgFilePath)) {
      orgRe = await BaseRequestManager.uploadFile(
          ossData, File(widget.orgFilePath!),
          onSendProgress: (int progress, int total) {
        Log.d("org current $progress total= $total and _orgSize = $_orgSize");
        oriCurrent = progress;
        _progress = (oriCurrent + hqCurrent) / totalSize;
        setState(() {});
      }, cancelToken: _orGCancelToken);
      Log.d("upload orgRe = $orgRe");
    }

    bool accRe = true;
    if (!Util.isStringEmpty(widget.accFilePath)) {
      accRe = await BaseRequestManager.uploadFile(
          ossData, File(widget.accFilePath!),
          onSendProgress: (int progress, int total) {
        Log.d("acc current $progress total $total and _accSize = $_accSize");
        hqCurrent = progress;
        _progress = (oriCurrent + hqCurrent) / totalSize;
        setState(() {});
      }, cancelToken: _accCancelToken);
      Log.d("upload accRe = $accRe");
    }

    if (orgRe == true && accRe == true) {
      Navigator.of(context).pop(true);
    } else {
      Navigator.of(context).pop(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: Center(
          child: SizedBox(
            width: 250,
            height: 250,
            child: GestureDetector(
              onTap: () {
                /// do noting
              },
              child: Container(
                decoration: ShapeDecoration(
                  color: KtvTheme.mainBgColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Text(
                          '${(_progress * 100).round().toString()}%',
                          style: TextStyle(
                              color: KtvTheme.mainTextColor, fontSize: 14),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            value: _progress,
                            strokeWidth: 3.0,
                            backgroundColor: KtvTheme.secondBgColor,
                            valueColor:
                                AlwaysStoppedAnimation(KtvTheme.mainBrandColor),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 20),
                      child: Text(K.ktv_file_uploading,
                          style: TextStyle(
                              color: KtvTheme.mainTextColor, fontSize: 14)),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _accCancelToken.cancel();
                        _orGCancelToken.cancel();
                        Navigator.of(context).pop(false);
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: KtvTheme.gradientColors,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: Text(
                            K.ktv_cancel_upload,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<int> getFileSize(String? filePath) async {
    if (Util.isStringEmpty(filePath)) {
      return 0;
    }
    File file = File(filePath!);
    bool s = await file.exists();
    if (s == true) {
      FileStat stat = await file.stat();
      return stat.size;
    }
    return 0;
  }
}
