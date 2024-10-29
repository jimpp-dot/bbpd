import 'dart:io';

import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/rpc_anti_auction.pb.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:path_provider/path_provider.dart';

/// 防沉迷弹窗
///
class AntiAddictionDialog extends StatefulWidget {
  const AntiAddictionDialog({Key? key}) : super(key: key);

  @override
  State createState() => AntiAddictionState();
}

class AntiAddictionState extends State<AntiAddictionDialog> {
  bool isVerify = false;
  late TextEditingController _nameController;
  late TextEditingController _numController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (isVerify) {
      return _buildVerify();
    } else {
      return _buildInput();
    }
  }

  Widget _buildVerify() {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 265,
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsetsDirectional.only(
              start: 20, end: 20, top: 24, bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                K.room_anti_addiction_dialog_title,
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 39),
              SizedBox(
                width: 68,
                height: 68,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(R.color.mainBrandColor),
                ),
              ),
              const SizedBox(height: 45),
              Text(
                K.room_anti_addiction_verify_content,
                style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 265,
            decoration: BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                _buildTitle(),
                _buildDialogContent(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NegativeButton(onPressed: cancel),
                    PositiveButton(
                        text: K.room_auth_at_once, onPressed: goVerify),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  K.room_anti_addiction_dialog_tips,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: showUserLicense,
                      child: Text(
                        K.room_anti_addiction_dialog_button1,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15.0,
                            color: R.color.mainBrandColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        /// 国家防沉迷要求链接
                        String url = Util.getHelpUrlWithQStr('k101');
                        BaseWebviewScreen.show(context, url: url);
                      },
                      child: Text(
                        K.room_anti_addiction_dialog_button2,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15.0,
                            color: R.color.mainBrandColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: buildClose(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      K.room_anti_addiction_dialog_title,
      style: TextStyle(
        color: R.color.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDialogContent() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          K.room_anti_addiction_dialog_content,
          style: TextStyle(
            fontSize: 16,
            color: R.color.mainTextColor,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            SizedBox(
              width: 58,
              child: Text(
                K.room_anti_addiction_name,
                style: TextStyle(
                  fontSize: 13,
                  color: R.color.secondTextColor,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsetsDirectional.only(start: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: R.color.secondBgColor,
                ),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: K.room_please_input,
                    counterText: '',
                  ),
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: 13, color: R.color.mainTextColor),
                  // textAlign: TextAlign.end,
                  autofocus: false,
                  autocorrect: false,
                  maxLines: 1,
                  maxLength: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SizedBox(
              width: 58,
              child: Text(
                K.room_anti_addiction_id,
                style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
              ),
            ),
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsetsDirectional.only(start: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: R.color.secondBgColor,
                ),
                child: TextField(
                  controller: _numController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: K.room_please_input,
                    counterText: '',
                  ),
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: 13, color: R.color.mainTextColor),
                  // textAlign: TextAlign.end,
                  autofocus: false,
                  autocorrect: false,
                  maxLines: 1,
                  maxLength: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildClose() {
    return GestureDetector(
      onTap: cancel,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: R.img(
          'ic_close.svg',
          package: ComponentManager.MANAGER_BASE_CORE,
          width: 16,
          height: 16,
          color: R.color.mainTextColor,
        ),
      ),
    );
  }

  void cancel() {
    Fluttertoast.showToast(msg: K.room_cancel_anti_addiction_toast);
    Navigator.of(context).pop(false);
  }

  void goVerify() async {
    String name = _nameController.value.text;
    String num = _numController.value.text;
    if (name.length < 2 || name.length > 20) {
      Fluttertoast.showToast(msg: K.room_name_error_toast);
      return;
    } else if (num.length != 18) {
      Fluttertoast.showToast(msg: K.room_id_error_toast);
      return;
    }
    setState(() {
      isVerify = true;
    });

    /// 调认证接口
    bool verifySuc = false;
    try {
      String url = '${System.domain}go/yy/account/antiAuction';
      Map<String, String> params = {
        'name': name,
        'num': num,
      };
      XhrResponse response =
          await Xhr.post(url, params, throwOnError: true, pb: true);
      ResCheckIdCard res = ResCheckIdCard.fromBuffer(response.bodyBytes);
      if (res.success == true) {
        verifySuc = true;
        eventCenter.emit('antiAuction.verify.success');
      } else if (Util.validStr(res.message)) {
        Fluttertoast.showToast(msg: res.message, gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }

    if (mounted) {
      if (verifySuc == true) {
        Navigator.of(context).pop(true);
      } else {
        setState(() {
          isVerify = false;
        });
      }
    }
  }

  void showUserLicense() async {
    String fileName = 'agreement3.html';
    String title = BaseK.K.setting_user_protcol_agreement3;
    String url = Util.licenseUrl(LicenseType.USER_AGREEMENT3);
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName');
    bool fileExist = false;
    try {
      fileExist = await file.exists();
    } catch (e) {
      Log.d('showUserLicense file not exist $e');
    }
    if (fileExist) {
      BaseWebviewScreen.show(context,
          url: Uri.file(file.path).toString(), title: title);
    } else {
      BaseWebviewScreen.show(context, url: url, title: title);
    }
  }
}
