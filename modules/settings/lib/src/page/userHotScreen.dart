import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';
import '../page/api/settings_repo.dart';
import '../model/pb/generated/account_hot.pb.dart';
import '../../assets.dart';

/// 红人认证
class UserHotScreen extends StatefulWidget {
  const UserHotScreen({Key? key}) : super(key: key);

  @override
  State createState() => _State();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UserHotScreen(),
      settings: const RouteSettings(name: '/userhot'),
    ));
  }
}

class _State extends State<UserHotScreen> {
  FocusNode? _focusNode;
  TextEditingController? _textController;
  String _request = '';
  bool _disabled = true;
  String _reason = '';
  String _status = '';
  int _wearStatus = 0; //0 不是红人，1已佩戴，2没有佩戴

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textController = TextEditingController();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode?.dispose();
  }

  void _load() async {
    ResAccountHotStatus rsp = await SettingRepo.getHotStatus();
    if (rsp.success) {
      _disabled = (rsp.data.status == 'wait') ? true : false;
      _status = rsp.data.status;
      _request = rsp.data.request;
      _reason = rsp.data.reason;
      _wearStatus = rsp.data.wearStatus;
      _textController?.text = _request;
    }
    refresh();
  }

  void _onSubmit() async {
    if (_disabled) return;
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}go/yy/account/hotRequest",
        {
          'request': _request,
        },
        throwOnError: false,
        formatJson: true,
      );

      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(
            msg: K.setting_hot_auth_submit_notice,
            gravity: ToastGravity.CENTER);
        Navigator.of(context).pop();
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: K.setting_submit_failed, gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
          title: Text(K.hot_user_auth,
              style: TextStyle(
                  fontSize: 17,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.bold)),
          actions: [_buildAction()]),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 26, bottom: 15),
              child: Text(
                K.setting_accept_hot_auth_useful,
                style: TextStyle(color: R.color.secondTextColor, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  child: Column(
                    children: <Widget>[
                      R.img(Assets.settings$hot_request_1_webp,
                          package: ComponentManager.MANAGER_SETTINGS,
                          width: 48,
                          height: 48),
                      Text(
                        K.setting_auth_flag,
                        style: TextStyle(
                            color: R.color.mainTextColor, fontSize: 13),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Column(
                    children: <Widget>[
                      R.img(Assets.settings$hot_request_2_webp,
                          package: ComponentManager.MANAGER_SETTINGS,
                          width: 48,
                          height: 48),
                      Text(
                        K.setting_office_recommend,
                        style: TextStyle(
                            color: R.color.mainTextColor, fontSize: 13),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Column(
                    children: <Widget>[
                      R.img(Assets.settings$hot_request_3_webp,
                          package: ComponentManager.MANAGER_SETTINGS,
                          width: 48,
                          height: 48),
                      Text(
                        K.setting_spec_page,
                        style: TextStyle(
                            color: R.color.mainTextColor, fontSize: 13),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_reason.isNotEmpty && _status == 'reject')
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
                child: Text(
                  _reason,
                  style: R.textStyle.body1,
                ),
              ),
            Container(
              margin: const EdgeInsets.only(
                  top: 20, bottom: 26, left: 20, right: 20),
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              decoration: ShapeDecoration(
                color: R.color.secondBgColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.send,
                textAlign: TextAlign.start,
                focusNode: _focusNode,
                controller: _textController,
                autocorrect: true,
                autofocus: false,
                onChanged: (value) {
                  if (!mounted) return;
                  setState(() {
                    _request = value;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: K.setting_input_hot_auth_desc,
                ),
                maxLines: 4,
                maxLength: 250,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 26, bottom: 2),
              child: Text(
                K.setting_hot_auth_condition,
                style: R.textStyle.subtitle,
              ),
            ),
            _buildDesc(
                K.setting_pop_god, K.setting_pop_god_desc([Util.appName])),
            _buildDesc(K.setting_pop_anchor, K.setting_pop_anchor_desc),
            _buildDesc(K.setting_pop_human, K.setting_pop_human_desc),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton.of(
        title: _getSubmit(),
        onTap: _onSubmit,
      ),
    );
  }

  Widget _buildAction() {
    if (_wearStatus == 0) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
        onTap: () {
          showWearDialog(context);
        },
        child: Container(
            padding: const EdgeInsetsDirectional.only(end: 16),
            alignment: AlignmentDirectional.center,
            child: Text(
                _wearStatus == 1
                    ? K.setting_hot_user_cancel
                    : K.setting_hot_user_confirm,
                style: TextStyle(fontSize: 14, color: R.color.mainTextColor))));
  }

  /// 佩戴or取消佩戴
  Future<bool?> showWearDialog(BuildContext context) {
    return showDialog<bool>(
        barrierDismissible: true,
        barrierColor: Colors.black45,
        context: context,
        builder: (context) {
          return ConfirmDialog(
            title: _wearStatus == 1
                ? K.setting_hot_user_cancel
                : K.setting_hot_user_confirm,
            content: _wearStatus == 1
                ? K.setting_hot_user_content_cancel
                : K.setting_hot_user_content_confirm,
            contentTextColor: R.color.mainTextColor,
            positiveButton: PositiveButton(
              text: K.sure,
              useGradientBg: true,
              gradientBg: R.color.mainBrandGradientColors,
              onPressed: () async {
                NormalNull rsp = await SettingRepo.wearHot();
                if (rsp.success) {
                  Fluttertoast.showToast(
                      msg: _wearStatus == 1
                          ? K.setting_already_cancel
                          : K.setting_hot_user_wear_succeed);
                  Navigator.pop(context);
                  _load();
                } else {
                  Fluttertoast.showToast(
                      msg: rsp.msg.isNotEmpty ? rsp.msg : "error");
                }
              },
            ),
            negativeButton: NegativeButton(
              text: K.cancel,
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          );
        });
  }

  Widget _buildDesc(String title, String desc) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Flexible(
            child: Text(
              desc,
              style: R.textStyle.body2,
            ),
          )
        ],
      ),
    );
  }

  String _getSubmit() {
    var map = {
      'none': K.setting_send_apply,
      'wait': K.setting_waiting_check,
      'reject': K.setting_send_apply,
      'agree': K.setting_check_success,
    };

    return map[_status] ?? (map['none'] ?? '');
  }
}
