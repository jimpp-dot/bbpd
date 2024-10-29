import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/src/model/wolf_test.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolfBgWidget.dart';
import 'package:chat_room/k.dart';

/// 答题
class WolfTestScreen extends StatefulWidget {
  final int mode;

  const WolfTestScreen({super.key, this.mode = 1});

  @override
  _WolfTestScreenState createState() => _WolfTestScreenState();

  static Future show(BuildContext context, {int mode = 1}) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return WolfTestScreen(mode: mode);
      }),
    );
  }
}

double heightRatio = Util.height / 667;

class _WolfTestScreenState extends State<WolfTestScreen> {
  int curQuestionIndex = 0;
  int totalQuestionCount = 10;
  int curQuestionMode = Question.MODE_EASY;
  List<Question>? questions;

  @override
  void initState() {
    super.initState();
    _loadQuestions(widget.mode);
  }

  //mode：1:9人场，3:12人局
  _loadQuestions(int mode) async {
    questions = await WolfTestRepository.getQuestions(mode);
    curQuestionIndex = 0;
    totalQuestionCount = questions!.length;
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Widget _buildQuestionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 43 * heightRatio, bottom: 31 * heightRatio),
      child: Text(
        title,
        style: R.textStyle.title
            .copyWith(fontSize: 20, color: const Color(0xFFA54E35)),
      ),
    );
  }

  Widget _buildQuestion(Question question) {
    List<Widget> widgets = [];

    widgets.add(_buildQuestionTitle(question.title));

    for (var element in question.options) {
      widgets.add(const SizedBox(height: 16));
      widgets.add(QuestionOptionItemWidget(
        optionKey: element.key,
        optionValue: element.value,
        onTap: () async {
          if (curQuestionIndex >= totalQuestionCount - 1) {
            Map result = await WolfTestRepository.postAnswer(
                question.qid, element.oid,
                isEnd: true, mode: widget.mode);
            await _showFinishDialog(result);
            Navigator.pop(context);
          } else {
            WolfTestRepository.postAnswer(question.qid, element.oid,
                mode: widget.mode);
            curQuestionIndex++;
            setState(() {});
          }
        },
      ));
    }

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        const Positioned.fill(
          child: WolfBgWidget(),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20 * heightRatio,
            left: R.dimen.defaultScreenMarginLeft,
            right: R.dimen.defaultScreenMarginRight,
            bottom: 68 * heightRatio,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            alignment: Alignment.center,
            height: 68 * heightRatio,
            padding: EdgeInsets.only(
              left: R.dimen.defaultScreenMarginLeft,
              right: R.dimen.defaultScreenMarginRight,
              bottom: 4 * heightRatio,
            ),
            child: Text(
              K.wolf_test_question_desc,
              style:
                  R.textStyle.caption.copyWith(color: const Color(0xFF7F5E37)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgress() {
    if (questions == null || questions!.isEmpty) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath('bg_wolf_test_bottom.png',
                package: ComponentManager.MANAGER_WERE_WOLF),
          ),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(height: 24),
          Padding(
            padding: EdgeInsets.only(
                left: R.dimen.defaultScreenMarginLeft,
                right: R.dimen.defaultScreenMarginRight),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    K.wolf_test_progress,
                    style: R.textStyle.caption.copyWith(color: Colors.white),
                  ),
                ),
                Text(
                  '${curQuestionIndex + 1}/$totalQuestionCount',
                  style: R.textStyle.caption
                      .copyWith(color: const Color(0xFFFFCC00)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: R.dimen.defaultScreenMarginLeft,
                right: R.dimen.defaultScreenMarginRight,
                top: 8,
                bottom: 22),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: ((curQuestionIndex + 1) / totalQuestionCount),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: const Color(0xFF645EB6),
              ),
            ),
          ),
          Container(
            height: 32,
            color: Colors.white.withOpacity(0.05),
            alignment: Alignment.center,
            child: Text(
              curQuestionMode == Question.MODE_EASY
                  ? K.wolf_test_bottom_desc_easy
                  : K.wolf_test_bottom_desc_advance,
              style: R.textStyle.caption.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (questions == null || questions!.isEmpty) {
      return const Loading();
    } else {
      return _buildQuestion(questions!.elementAt(curQuestionIndex));
    }
  }

  _showFinishDialog(Map result) async {
    bool passed = result['answer_result'];
    String content = result['end_message'];
    int score = Util.parseInt(result['score']);
    content = passed
        ? widget.mode == 3
            ? K.wolf_test_result_dialog_content_passed_12
            : K.wolf_test_result_dialog_content_passed
        : K.wolf_test_result_dialog_content_fail(['$score']);

    await showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            content: content,
            positiveButton: PositiveButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                if (passed) {
                  //通过
                  eventCenter.emit(EventConstant.EventRoomWolfTestPass);
                }
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF655DC4),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            BaseAppBar.custom(
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  width: 36.0,
                  height: kToolbarHeight,
                  child: Center(
                    child: R.img("back.svg",
                        width: 24.0,
                        height: 24.0,
                        package: ComponentManager.MANAGER_BASE_ROOM),
                  ),
                ),
              ),
              title: Text(
                K.wolf_test_title,
                style: R.textStyle.title.copyWith(color: Colors.white),
              ),
              backgroundColor: const Color(0xFF655DC4),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: R.dimen.defaultScreenMarginLeft,
                  right: R.dimen.defaultScreenMarginRight,
                ),
                child: Center(
                  child: _buildBody(),
                ),
              ),
            ),
            _buildProgress(),
          ],
        ),
      ),
    );
  }
}

class QuestionOptionItemWidget extends StatefulWidget {
  final String optionKey;
  final String optionValue;
  final GestureTapCallback? onTap;

  const QuestionOptionItemWidget(
      {super.key,
      required this.optionKey,
      required this.optionValue,
      this.onTap});

  @override
  _QuestionOptionItemWidgetState createState() =>
      _QuestionOptionItemWidgetState();
}

class _QuestionOptionItemWidgetState extends State<QuestionOptionItemWidget> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    String bgImg =
        pressed ? 'bg_wolf_test_item_selected.svg' : 'bg_wolf_test_item.svg';
    Color textColor =
        pressed ? const Color(0xFFFCD3A0) : const Color(0xFF7F5E37);

    double textMaxWidth = Util.width -
        2 * R.dimen.defaultScreenMarginLeft -
        2 * R.dimen.defaultScreenMarginRight -
        2 * 34;

    return GestureDetector(
      onTapDown: (tapDetail) {
        pressed = true;
        setState(() {});
      },
      onTapUp: (tapDetail) {
        pressed = false;
        setState(() {});
      },
      onTapCancel: () {
        pressed = false;
        setState(() {});
      },
      onTap: widget.onTap,
      child: SizedBox(
        height: 51 * heightRatio,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child:
                    R.img(bgImg, package: ComponentManager.MANAGER_WERE_WOLF)),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  widget.optionKey,
                  style: R.textStyle.subhead.copyWith(color: textColor),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: textMaxWidth,
                alignment: Alignment.center,
                padding: const EdgeInsetsDirectional.only(bottom: 2),
                child: Text(
                  widget.optionValue,
                  style: R.textStyle.subhead.copyWith(color: textColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
