import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:personaldata/src/page/reception_exam_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../k.dart';

class ReceptionRulesScreen extends StatefulWidget {
  final int type; //1-主播管理规则，2-用户行为规则 3-派对管理规范
  final int verifyId;
  const ReceptionRulesScreen(this.type, this.verifyId, {super.key});
  static show(BuildContext context, int type, int verifyId) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ReceptionRulesScreen(type, verifyId),
        settings: const RouteSettings(name: '/receptionRulesScreen'),
      ),
    );
  }

  @override
  _ReceptionRulesScreenState createState() => _ReceptionRulesScreenState();
}

class _ReceptionRulesScreenState extends State<ReceptionRulesScreen> {
  Timer? _timer;
  int _countDownTime = 10;
  bool _hasSelect = false;
  final List<String> _titles = [
    K.personal_god_rules,
    K.personal_user_rules,
    K.personal_chat_rules
  ];
  final List<String> _urls = ['k3', 'k12', 'k14'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countDownTime--;
      if (_countDownTime <= 0) {
        _countDownTime = 0;
        _timer?.cancel();
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(_titles[widget.type - 1]),
      body: _buildBody(),
      bottomNavigationBar: _buildFooter(),
    );
  }

  _buildBody() {
    Log.d('uri:${Util.getHelpUrlWithQStr(_urls[widget.type - 1])}');
    return Container(
        child: WebView(
      initialUrl: Util.getHelpUrlWithQStr(_urls[widget.type - 1]),
    ));
  }

  _canGoNext() {
    return _hasSelect && (_countDownTime <= 0);
  }

  Widget _buildFooter() {
    String str = K.personal_next_step;
    if (_countDownTime > 0) {
      str = '$str (${_countDownTime}s)';
    }
    Widget btn;
    if (_canGoNext()) {
      btn = BottomButton.of(title: str, onTap: _nextStepAction);
    } else {
      btn = BottomButton.of(
          title: str,
          decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(24.0))),
          textColor: R.color.thirdTextColor.withOpacity(0.2));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _hasSelect = !_hasSelect;
                if (mounted) {
                  setState(() {});
                }
              },
              child: _hasSelect
                  ? Container(
                      decoration: ShapeDecoration(
                          shape: const StadiumBorder(),
                          color: R.color.mainBrandColor),
                      child: R.img('ic_checkbox_selected.webp',
                          width: 16,
                          height: 16,
                          package: ComponentManager.MANAGER_PERSONALDATA),
                    )
                  : Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: R.color.mainBgColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 2, color: const Color(0x33313131)),
                      ),
                    ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              K.personal_rules_tips([_titles[widget.type - 1]]),
              maxLines: 1,
              style: R.textStyle.regular10
                  .copyWith(color: R.color.secondTextColor, fontSize: 11),
            )
          ],
        ),
        btn
      ],
    );
  }

  _nextStepAction() {
    if (widget.type <= 2) {
      ReceptionRulesScreen.show(context, widget.type + 1, widget.verifyId);
    } else {
      ReceptionExamScreen.show(context, widget.verifyId);
    }
  }
}
