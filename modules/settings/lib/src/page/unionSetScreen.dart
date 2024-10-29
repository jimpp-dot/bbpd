import 'package:shared/shared.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings/k.dart';
import 'package:settings/src/model/setting_repository.dart';
import 'package:settings/src/page/brokeListScreen.dart';

/// 设置公会ID
class UnionSetScreen extends StatefulWidget {
  final bool needRecommendBroker;

  const UnionSetScreen({Key? key, this.needRecommendBroker = false})
      : super(key: key);

  @override
  _UnionSetScreenState createState() => _UnionSetScreenState();

  static void show(BuildContext context, {bool needRecommendBroker = false}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => UnionSetScreen(
        needRecommendBroker: needRecommendBroker,
      ),
      settings: const RouteSettings(name: '/unionSet'),
    ));
  }
}

class _UnionSetScreenState extends State<UnionSetScreen> {
  int _inputID = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: BaseAppBar.(K.setting_setup_game_family_id, actionTitle: K.setting_submit, onPressed: _onCommit,),
      appBar: BaseAppBar.custom(
        title: Text(
          K.setting_setup_game_family_id,
          style: R.textStyle.title,
        ),
        actions: _buildTextAction(),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              color: R.color.secondBgColor,
            ),
            margin:
                const EdgeInsetsDirectional.only(start: 20, end: 20, top: 16),
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            child: TextField(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: Util.numFontFamily,
              ),
              autofocus: false,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 20,
              decoration: InputDecoration(
                hintText: K.setting_input_game_family_id,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: Util.fontFamily,
                    fontSize: 14),
                counterText: '',
                isDense: false,
                filled: false,
                errorMaxLines: 1,
                border: InputBorder.none,
              ),
              onChanged: (text) {
                Log.d('Input text changed: $text');
                _inputID = Util.parseInt(text.trim());
                if (!mounted) return;
                setState(() {});
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 16, start: 20, end: 20),
            child: RichText(
              text: TextSpan(
                text: K.setting_game_family_tips,
                style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 13.0,
                  fontFamily: Util.fontFamily,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: K.setting_game_family_rule,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        BaseWebviewScreen.show(
                          context,
                          url: '${System.domain}wechat/ghnotice',
                        );
                      },
                    style: TextStyle(
                      color: R.color.mainBrandColor,
                      fontFamily: Util.fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.needRecommendBroker)
            const Expanded(
              child: BrokeListScreen(),
            ),
        ],
      ),
    );
  }

  Future _onCommit() async {
//     if (_inputID == 0) {
//       return;
//     }
//
//     try {
//       XhrResponse response =
//           await Xhr.postJson(System.domain + "broker/join?version=1", {'bid': _inputID.toString()}, throwOnError: false);
//       Map res = response.value();
//       if (res['success'] == true) {
//         Log.d('join union succeeded.');
//         Fluttertoast.showToast(msg: res['data'], gravity: ToastGravity.CENTER);
//       } else {
//         Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
//       }
//     } catch (e) {
//       Log.d(e);
//     }
    await SettingRepository.brokerJoin(_inputID);
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
                    K.setting_submit,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 14,
                      color: _inputID > 0
                          ? R.color.mainTextColor
                          : R.color.mainTextColor.withOpacity(0.2),
                    ),
                  ),
                )),
          )),
    ];
  }
}
