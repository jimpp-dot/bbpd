import 'package:settings/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pulse_log/pulse_log.dart';

/// @Author bobzhou
/// @Description
/// @Date 2022-09-15 15:20

class BBLogUploadDialog extends StatefulWidget {
  const BBLogUploadDialog({super.key});

  static Future<bool?> show(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const BBLogUploadDialog(),
    );
  }

  @override
  State<StatefulWidget> createState() => _BBLogUploadDialogState();
}

class _BBLogUploadDialogState extends State<BBLogUploadDialog> {
  double _progress = 0.0;

  static const String _logTag = "BBLogUploadDialog";

  final CancelToken cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    _initUpload();
  }

  @override
  void dispose() {
    _cancelUpload();
    super.dispose();
  }

  void _initUpload() async {
    bool result = await PulseLog.instance.uploadLogByDefault(
      onSendProgress: _onProgressUpdate,
      cancelToken: cancelToken,
    );
    if (result == true) {
      Fluttertoast.showCenter(msg: K.upload_log_success);
    }
    Navigator.of(context).pop(result);
  }

  void _onProgressUpdate(int count, int total) {
    _progress = count / total;
    refresh();
  }

  void _cancelUpload() {
    try {
      cancelToken.cancel("User want cancel........!");
    } catch (e) {
      Log.d(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
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
                    path: Session.icon,
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
                    backgroundColor: R.color.secondBgColor,
                    valueColor: AlwaysStoppedAnimation(R.color.mainBrandColor),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 20),
              child: Text(
                K.upload_progress([(_progress * 100).round().toString()]),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Container(
              height: 48,
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Material(
                child: InkWell(
                  onTap: _cancelUpload,
                  borderRadius: BorderRadius.circular(24),
                  child: Ink(
                    height: 48,
                    decoration: BoxDecoration(
                      color: R.color.mainBgColor,
                      border:
                          Border.all(color: const Color(0x1F313131), width: 1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        K.cancel_upload,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
