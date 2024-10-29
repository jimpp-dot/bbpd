import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/k.dart';
import 'package:login/src/api/api.dart';

import '../../assets.dart';

class InvitationCodeDialog extends StatefulWidget {
  final String? code;

  const InvitationCodeDialog({Key? key, this.code}) : super(key: key);

  static Future<String?> show(BuildContext context, {String? code}) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return InvitationCodeDialog(code: code);
      },
    );
  }

  @override
  State createState() => _InvitationCodeDialogState();
}

class _InvitationCodeDialogState extends State<InvitationCodeDialog> {
  late TextEditingController _codeController;

  FocusNode blankNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (!Util.isStringEmpty(widget.code)) {
      _codeController = TextEditingController(text: widget.code.toString());
    } else {
      _codeController = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = Util.width - 32 * 2;
    double headerHeight = width * 134 / 312;
    double top = Util.height * 0.25;

    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          blankNode.unfocus();
        },
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            PositionedDirectional(
                top: top,
                // child: R.img(Assets.login$login_invite_code_header_webp,
                //     package: ComponentManager.MANAGER_LOGIN, width: width, fit: BoxFit.fitWidth),
                child: Container(
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                    color: R.colors.mainBgColor,
                    borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(16),
                        topEnd: Radius.circular(16)),
                  ),
                )),
            PositionedDirectional(
              top: top + headerHeight - 5,
              child: Container(
                width: width,
                padding: const EdgeInsetsDirectional.only(
                    start: 20, end: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: R.colors.mainBgColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(16),
                      bottomEnd: Radius.circular(16)),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      K.login_invitation_code_input,
                      style: TextStyle(
                          color: R.color.mainTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    _buildInput(),
                    const SizedBox(height: 40),
                    Row(
                      children: <Widget>[
                        _getNegativeButton(),
                        const SizedBox(width: 8),
                        _getPositiveButton()
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _requestingBinding = false;

  Future<void> _getBindingUser(String code) async {
    if (_requestingBinding) {
      return;
    }
    _requestingBinding = true;
    CommonLoading.show();
    var res = await Api.getBindingUser(code);
    CommonLoading.dismiss();
    _requestingBinding = false;
    if (res.success == true) {
      _showConfirmDialog(code, res.data!);
    } else {
      Toast.show(context, res.msg);
    }
  }

  void _showConfirmDialog(String code, String user) async {
    bool result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmDialog(
          content: K.login_bind_invite_code_confirm([user]),
          negativeButton: const NegativeButton(),
          positiveButton: const PositiveButton(),
        );
      },
    );
    if (result == true) {
      Navigator.of(context).pop(Util.isStringEmpty(code) ? "" : code);
      Toast.show(context, K.login_bind_invite_code_ok([user]));
    } else {
      Navigator.of(context).pop('');
      Toast.show(context, K.commom_bind_failed);
    }
  }

  Widget _getPositiveButton() {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            String code = _codeController.text.trim();
            Log.d("invite_code = $code");
            if (Util.validStr(code)) {
              if (code == widget.code) {
                Navigator.pop(context, code);
              } else {
                _getBindingUser(code);
              }
            } else {
              Toast.show(context, K.login_input_invitation_code);
            }
          },
          borderRadius: BorderRadius.circular(24),
          child: Ink(
            height: 48,
            decoration: BoxDecoration(
              color: R.color.mainBrandColor,
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: R.color.mainBrandGradientColors,
              ),
            ),
            child: Center(
              child: Text(
                K.login_ensure,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getNegativeButton() {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop('');
            if (Util.validStr(widget.code)) {
              Toast.show(context, K.commom_bind_failed);
            }
          },
          borderRadius: BorderRadius.circular(24),
          child: Ink(
            height: 48,
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                K.login_cancel,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
                textScaleFactor: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildInput() {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 24, right: 24),
      decoration: BoxDecoration(
        color: R.color.secondBgColor,
        borderRadius: BorderRadius.circular(27),
      ),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _codeController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: K.login_input_invitation_code,
                counterText: '',
                hintStyle:
                    TextStyle(fontSize: 16, color: R.color.thirdTextColor),
              ),
              textInputAction: TextInputAction.done,
              style: TextStyle(fontSize: 16, color: R.color.secondTextColor),
              autofocus: false,
              autocorrect: false,
              maxLines: 1,
              maxLength: 20,
              focusNode: blankNode,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]+'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
