import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:profile/assets.dart';
import 'package:profile/k.dart';
import 'package:profile/src/api/api.dart';
import 'package:profile/src/model/pb/generated/act.pb.dart';

/// 恋爱测试答题页
class LoveTestAnswerPage extends StatefulWidget {
  const LoveTestAnswerPage({super.key});

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoveTestAnswerPage(),
      settings: const RouteSettings(name: '/LoveTestAnswerPage'),
    ));
  }

  @override
  _LoveTestAnswerPageState createState() => _LoveTestAnswerPageState();
}

class _LoveTestAnswerPageState extends State<LoveTestAnswerPage> {
  List<LoveExamQuestion> _questions = [];
  int _index = 0;
  bool _isLoading = false;
  GetLoveExamRes? _res;
  int _answerId = -1;
  final Map<String, int> _answerMap = {};

  @override
  void initState() {
    super.initState();

    _loadQuestions();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadQuestions() async {
    _isLoading = true;
    _res = await Api.getLoveTestQuestion();

    if (_res!.success && _res!.hasData()) {
      _questions = _res!.data.loveExamQuestions;
    }

    _isLoading = false;

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.profile_love_test,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.profile$lovetest_love_test_bg_webp),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              top: -31.dp,
              end: 0,
              child: R.img(Assets.profile$lovetest_love_test_answer_face_webp,
                  width: 105.dp, height: 131.dp),
            ),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    if (Util.isCollectionEmpty(_questions)) {
      return ErrorData(
        error: _res!.msg,
        onTap: _loadQuestions,
      );
    }

    LoveExamQuestion ques = _questions[_index];

    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 24.dp,
          top: 32.dp,
          end: 9.dp,
          bottom: 10.dp + Util.iphoneXBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ques.questionDesc,
            maxLines: 10,
            style: TextStyle(fontSize: 28.dp, color: const Color(0xFF000000)),
          ),
          ..._buildAnswer(ques),
          SizedBox(
            height: 24.dp,
          ),
          _buildNextBtn(ques),
          const Spacer(),
          Row(
            children: [
              Container(
                width: 46.dp,
                height: 24.dp,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        Assets.profile$lovetest_love_test_answer_index_bg_webp),
                  ),
                ),
                child: Text(
                  '${_index + 1}/${_questions.length}',
                  style: TextStyle(
                      fontSize: 14.dp,
                      color: const Color(0xFF050000),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const Spacer(),
              R.img(Assets.profile$lovetest_love_test_answer_365_webp,
                  width: 20.dp, height: 56.dp),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAnswer(LoveExamQuestion ques) {
    return ques.answer.map((e) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 14.dp,
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (_answerId == e.id) {
                _answerId = -1;
              } else {
                _answerId = e.id;

                Tracker.instance
                    .track(TrackEvent.love_personality_click, properties: {
                  'type': 'option',
                  'num': e.id,
                });
              }

              if (mounted) {
                setState(() {});
              }
            },
            child: Container(
              padding: EdgeInsetsDirectional.only(
                  start: 20.dp, top: 15.dp, end: 20.dp, bottom: 15.dp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.dp),
                border: Border.all(width: 1, color: const Color(0xFF000000)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: _answerId == e.id
                      ? [const Color(0xFFFFF7F7), const Color(0xFFFF9BD4)]
                      : [Colors.white, Colors.white],
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 8,
                    spreadRadius: 0,
                    color: Color(0x14000000),
                  ),
                ],
              ),
              child: Text(
                e.answerDesc,
                style: TextStyle(
                    fontSize: 16.dp,
                    color: R.color.mainTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildNextBtn(LoveExamQuestion ques) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (_answerId == -1) return;

        _answerMap['${ques.id}'] = _answerId;
        if (_index == _questions.length - 1) {
          /// 提交

          Tracker.instance
              .track(TrackEvent.love_personality_click, properties: {
            'type': 'submit',
          });

          GetLoveExamResultRes res = await Api.submitLoveTestAnswer(_answerMap);
          if (res.success) {
            Tracker.instance
                .track(TrackEvent.love_personality_get_result, properties: {
              'type': res.data.desc,
            });

            Navigator.of(context).popUntil((route) =>
                (route.settings.name != '/loveTestIndex' &&
                    route.settings.name != '/LoveTestAnswerPage'));
            IProfileManager profileManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PROFILE);
            profileManager.openLoveTestIndexPage(context);
          } else {
            Fluttertoast.showCenter(msg: res.msg);
          }
        } else {
          /// 下一题

          Tracker.instance
              .track(TrackEvent.love_personality_click, properties: {
            'type': 'next',
            'num': ques.id,
          });

          _index++;
          _answerId = -1;

          if (mounted) {
            setState(() {});
          }
        }
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(
            start: 24.dp, top: 17.dp, end: 24.dp, bottom: 17.dp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.dp),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF484848), Color(0xFF000000)],
          ),
        ),
        child: Text(
          _index == _questions.length - 1
              ? K.profile_love_test_submit_answer
              : K.profile_love_test_next_question,
          style: TextStyle(
              fontSize: 16.dp,
              color: _answerId == -1
                  ? Colors.white.withOpacity(0.4)
                  : Colors.white,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
