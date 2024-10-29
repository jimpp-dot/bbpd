import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_room/k.dart';

/// 密码输入框
class RoomPwdDialog extends StatefulWidget {
  final String? title;
  final String? subTitle;

  const RoomPwdDialog({super.key, this.title, this.subTitle});

  static Future<String?> show(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return RoomPwdDialog(
            title: K.room_set_pwd,
            subTitle: K.room_input_pwd,
          );
        });
  }

  @override
  _RoomPwdDialogState createState() {
    return _RoomPwdDialogState();
  }
}

class _RoomPwdDialogState extends State<RoomPwdDialog> {
  late FocusNode _focusNode;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  _onChanged(String value) {
    Log.d('_PwdDialogState._onChanged: $value');
    setState(() {});
  }

  String get pwd {
    return _textEditingController.value.text;
  }

  Widget _buildItem(int index) {
    return Container(
      width: 56,
      height: 43,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: R.color.thirdTextColor,
          ),
        ),
      ),
      child: Text(
        pwd.length > index ? '*' : '',
        style: TextStyle(
          color: R.color.mainTextColor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ConfirmDialog(
        title: Util.isStringEmpty(widget.title)
            ? K.room_require_password
            : widget.title,
        width: 312,
        contentBuilder: (context) {
          return Util.isStringEmpty(widget.subTitle)
              ? _buildInput()
              : _buildSubTitleBody();
        },
        positiveButton: PositiveButton(
          onPressed: () {
            if (pwd.length != 4) {
              Fluttertoast.showToast(
                  msg: K.room_please_input_password,
                  gravity: ToastGravity.CENTER);
            } else {
              Navigator.of(context).pop(pwd);
            }
          },
          useGradientBg: true,
        ),
        negativeButton: NegativeButton(
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
    );
  }

  Widget _buildSubTitleBody() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 6,
        ),
        Text(
          widget.subTitle ?? '',
          style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
        ),
        _buildInput()
      ],
    );
  }

  Container _buildInput() {
    return Container(
      width: 312,
      padding: const EdgeInsetsDirectional.only(top: 41, bottom: 11),
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 43,
            child: TextField(
              controller: _textEditingController,
              autofocus: true,
              autocorrect: false,
              maxLines: 1,
              maxLength: 4,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: null,
              obscureText: true,
              cursorWidth: 0,
              keyboardType: TextInputType.number,
              enableInteractiveSelection: false,
              focusNode: _focusNode,
              onChanged: _onChanged,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4)
              ],
            ),
          ),
          IgnorePointer(
            child: Container(
              color: R.color.mainBgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildItem(0),
                  _buildItem(1),
                  _buildItem(2),
                  _buildItem(3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
