import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import '../../k.dart';
import 'exam_wrong_screen.dart';

class ExamResultScreen extends StatefulWidget {
  final int examId;
  final int score;
  final int pass;
  const ExamResultScreen(this.examId, this.score, this.pass, {super.key});
  @override
  _ExamResultScreenState createState() => _ExamResultScreenState();

  static Future show(BuildContext context, int examId, int score, int pass) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ExamResultScreen(examId, score, pass),
      settings: const RouteSettings(name: '/examResultScreen'),
    ));
  }
}

class _ExamResultScreenState extends State<ExamResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.personal_test_result,
        onBackPressedCallback: () {
          Navigator.of(context)
              .popUntil((route) => route.settings.name == '/receptionAuth');
        },
      ),
      body: _buildContent(),
      bottomNavigationBar: _buildFooter(),
    );
  }

  Widget _buildContent() {
    bool pass = (widget.pass == 1);
    String imgPath =
        pass ? 'ic_answer_done_success.webp' : 'ic_answer_done_fail.webp';
    String title = pass ? K.personal_apply_success : K.personal_apply_fail;
    String tips =
        pass ? K.personal_apply_success_tips : K.personal_apply_fail_tips;
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            margin: const EdgeInsetsDirectional.fromSTEB(0, 140, 0, 0),
            height: 263,
            decoration: BoxDecoration(
                boxShadow: [getCardBoxShadow()], color: R.color.mainBgColor),
          ),
          PositionedDirectional(
              bottom: 0,
              end: 0,
              child: R.img('ic_answer_base.webp',
                  width: 120,
                  height: 96,
                  package: ComponentManager.MANAGER_PERSONALDATA)),
          PositionedDirectional(
            top: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img(imgPath,
                    width: 200,
                    height: 169,
                    package: ComponentManager.MANAGER_PERSONALDATA),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  tips,
                  style: R.textStyle.medium16,
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 1,
                      width: 48,
                      color: R.color.dividerColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      K.personal_exam_score,
                      style: R.textStyle.regular14
                          .copyWith(color: R.color.secondTextColor),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 1,
                      width: 48,
                      color: R.color.dividerColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '${widget.score}',
                  style: R.textStyle.medium16
                      .copyWith(color: R.color.mainBrandColor, fontSize: 48),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: 158,
            child: Text(
              title,
              style: R.textStyle.medium16.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WidgetUtils.buildDivider(
            margin: EdgeInsetsDirectional.zero, height: 0.5),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    ExamWrongScreen.show(context, widget.examId);
                  },
                  child: Container(
                    height: 52,
                    alignment: AlignmentDirectional.center,
                    decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: R.color.secondBgColor),
                    child: Text(
                      K.personal_check_question,
                      style: R.textStyle.medium16,
                    ),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil(
                        (route) => route.settings.name == '/receptionAuth');
                  },
                  child: Container(
                    height: 52,
                    alignment: AlignmentDirectional.center,
                    decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors)),
                    child: Text(
                      K.personal_confirm,
                      style: R.textStyle.medium16.copyWith(color: Colors.white),
                    ),
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        SizedBox(
          height: 14 + Util.iphoneXBottom,
        )
      ],
    );
  }
}
