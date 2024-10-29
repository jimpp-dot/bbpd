import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../k.dart';

class WelcomeHiEditPage extends StatefulWidget {
  final String? text;

  const WelcomeHiEditPage(this.text, {super.key});

  static Future<bool?> show(BuildContext context, String? text) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => WelcomeHiEditPage(text),
      settings: const RouteSettings(name: '/WelcomeHiEdit'),
    ));
  }

  @override
  WelcomeHiEditState createState() {
    return WelcomeHiEditState();
  }
}

class WelcomeHiEditState extends State<WelcomeHiEditPage> {
  late FocusNode _focusNode;
  late TextEditingController _textController;
  String? _request;

  @override
  void initState() {
    super.initState();
    _request = widget.text;
    _focusNode = FocusNode();
    _textController = TextEditingController();
    if (widget.text != null && widget.text!.isNotEmpty) {
      _textController.text = widget.text!;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.profile_welcome_hi_title,
          style: R.textStyle.title,
        ),
        actions: _buildTextAction(),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 20, start: 20, end: 20),
          padding:
              const EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 12),
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
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.start,
            focusNode: _focusNode,
            controller: _textController,
            autocorrect: true,
            autofocus: true,
            onChanged: (value) {
              if (!mounted) return;
              setState(() {
                _request = value;
              });
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            maxLines: 5,
            maxLength: 300,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextAction() {
    return <Widget>[
      ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(0.0)),
          child: ButtonTheme(
            minWidth: 36,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            buttonColor: R.color.mainBrandColor,
            disabledColor: R.color.thirdBgColor,
            child: TextButton(
              onPressed: _onCommit,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 4),
                child: Text(
                  K.profile_submmit,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 14,
                    color: canCommit()
                        ? R.color.mainTextColor
                        : R.color.mainTextColor.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          )),
    ];
  }

  bool canCommit() {
    return _request != null && _request!.isNotEmpty && _request != widget.text;
  }

  void _onCommit() async {
    if (!canCommit()) {
      return;
    }
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}welcome/submit",
          {
            'uid': '${Session.uid}',
            'wel_text': _request!,
          },
          throwOnError: false);

      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(
            msg: K.profile_welcome_text_has_submmit,
            gravity: ToastGravity.CENTER);
        Navigator.of(context).pop(true);
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: K.profile_submmit_fail, gravity: ToastGravity.CENTER);
    }
  }
}
