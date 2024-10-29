import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:personaldata/src/api/api.dart';
import 'package:personaldata/src/model/exam_model.dart';
import 'package:personaldata/src/page/exam_result_screen.dart';

import '../../k.dart';

class ReceptionExamScreen extends StatefulWidget {
  final int verifyId;
  const ReceptionExamScreen(this.verifyId, {super.key});
  @override
  _ReceptionExamScreenState createState() => _ReceptionExamScreenState();
  static Future show(BuildContext context, int verifyId) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ReceptionExamScreen(verifyId),
      settings: const RouteSettings(name: '/receptionExamScreen'),
    ));
  }
}

class _ReceptionExamScreenState extends State<ReceptionExamScreen> {
  bool _loading = true;
  DataRsp<QuestionListInfo>? _dataRsp;
  int _remainTime = 0;
  Timer? _timer;
  int _currentIndex = 0;
  bool _hasFinish = false;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
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
      appBar: BaseAppBar.custom(
        title: Text(K.personal_reception_test),
        actions: _buildActions(),
      ),
      backgroundColor: R.color.mainBgColor,
      body: _buildBody(),
      bottomNavigationBar: _buildFooter(),
    );
  }

  List<Widget> _buildActions() {
    if (_dataRsp == null || !(_dataRsp?.success == true)) {
      return [];
    }
    return [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Utility.formatTimeClock(_remainTime),
            style:
                R.textStyle.medium16.copyWith(color: R.color.secondTextColor),
          ),
          const SizedBox(
            width: 2,
          ),
          R.img('ic_clock.webp',
              width: 24,
              height: 24,
              package: ComponentManager.MANAGER_PERSONALDATA),
          const SizedBox(
            width: 20,
          )
        ],
      )
    ];
  }

  _loadData() async {
    _dataRsp = await Api.getExamQuestions();
    _loading = false;
    if (_dataRsp?.success == true) {
      _remainTime = _dataRsp?.data?.duration ?? 0;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _remainTime--;
        if (_remainTime <= 0) {
          _timer?.cancel();
          _submitExam();
        }
        if (mounted) {
          setState(() {});
        }
      });
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildBody() {
    if (_loading && _dataRsp == null) {
      return const Loading();
    }
    if (Util.validStr(_dataRsp?.msg)) {
      return ErrorData(
        onTap: _loadData,
        error: _dataRsp!.msg,
      );
    }

    return Container(
        padding: const EdgeInsetsDirectional.only(top: 20),
        child: Column(
          children: [
            _buildProgress(),
            const SizedBox(
              height: 20,
            ),
            _buildIndex(),
            _buildContent()
          ],
        ));
  }

  Widget _buildProgress() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: BorderRadius.circular(3),
            ),
            alignment: AlignmentDirectional.centerStart,
            child: FractionallySizedBox(
              widthFactor: (_dataRsp?.data?.total ?? 0) > 0
                  ? (_currentIndex / _dataRsp!.data!.total!)
                  : 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
          PositionedDirectional(
              end: 0,
              width: 16,
              height: 16,
              child: Container(
                alignment: AlignmentDirectional.center,
                decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    gradient: LinearGradient(
                        colors: R.color.mainBrandGradientColors)),
                child: R.img('ic_star.webp',
                    width: 8,
                    height: 8,
                    package: ComponentManager.MANAGER_PERSONALDATA),
              ))
        ],
      ),
    );
  }

  Widget _buildIndex() {
    if (Util.isCollectionEmpty(_dataRsp?.data?.list))
      return const SizedBox.shrink();
    QuestionInfo questionInfo = _dataRsp!.data!.list[_currentIndex];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              '${_currentIndex + 1}',
              style: R.textStyle.medium16
                  .copyWith(color: R.color.mainBrandColor, fontSize: 48),
            ),
            Text(
              '/${_dataRsp?.data?.total}',
              style: R.textStyle.medium16
                  .copyWith(color: R.color.secondTextColor, fontSize: 24),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(start: 8, bottom: 14),
          padding: const EdgeInsetsDirectional.fromSTEB(6, 3, 6, 3),
          decoration: BoxDecoration(
            color: R.color.mainBrandColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            (questionInfo.type == 1)
                ? K.personal_select_only
                : K.personal_select_much,
            style: R.textStyle.medium14.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Expanded(
        child: ListView.builder(
      itemBuilder: _buildItem,
      scrollDirection: Axis.horizontal,
      itemCount: _dataRsp?.data?.total ?? 0,
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
    ));
  }

  Widget _buildItem(BuildContext context, int index) {
    QuestionInfo? questionInfo = _dataRsp?.data?.list[_currentIndex];
    int answerCount = 0;
    String type = '';
    if (questionInfo?.options?.a != null) {
      answerCount++;
      type = questionInfo!.options!.a!.type;
    }
    if (questionInfo?.options?.b != null) {
      answerCount++;
    }
    if (questionInfo?.options?.c != null) {
      answerCount++;
    }
    if (questionInfo?.options?.d != null) {
      answerCount++;
    }

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      width: Util.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          Text(
            questionInfo?.question ?? '',
            style: R.textStyle.medium18.copyWith(fontSize: 24),
          ),
          const SizedBox(
            height: 22,
          ),
          Expanded(
            child: (type == 'picture')
                ? _buildImgWidget(answerCount)
                : _buildTextWidget(answerCount),
          )
        ],
      ),
    );
  }

  Widget _buildTextWidget(int optionCount) {
    return ListView.builder(
      itemBuilder: _buildTextItem,
      itemCount: optionCount,
      physics: const BouncingScrollPhysics(),
    );
  }

  Widget _buildTextItem(BuildContext context, int index) {
    QuestionInfo? questionInfo = _dataRsp?.data?.list[_currentIndex];
    QuestionOptionInfo? optionInfo =
        questionInfo?.options?.getOptionInfoWithIndex(index);
    String str = questionInfo?.options?.getStringWithIndex(index) ?? '';
    Color color = optionInfo?.selected == true
        ? R.color.mainBrandColor
        : R.color.mainTextColor;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (questionInfo?.type == 1) {
          if (questionInfo?.options?.a != null) {
            questionInfo!.options!.a!.selected = false;
          }
          if (questionInfo?.options?.b != null) {
            questionInfo!.options!.b!.selected = false;
          }
          if (questionInfo?.options?.c != null) {
            questionInfo!.options!.c!.selected = false;
          }
          if (questionInfo?.options?.d != null) {
            questionInfo!.options!.d!.selected = false;
          }
          optionInfo?.selected = true;
        } else {
          optionInfo?.selected = !(optionInfo.selected ?? false);
        }
        if (mounted) {
          setState(() {});
        }
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
        margin: const EdgeInsetsDirectional.only(bottom: 12),
        constraints: const BoxConstraints(minHeight: 64),
        decoration: BoxDecoration(
            boxShadow: [getCardBoxShadow()],
            borderRadius: BorderRadius.circular(8),
            border: optionInfo?.selected == true
                ? Border.all(width: 2, color: color)
                : null,
            color: R.color.mainBgColor),
        child: Row(
          children: [
            Text(
              str,
              style: R.textStyle.medium16.copyWith(color: color),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Text(
              optionInfo?.content ?? '',
              style: R.textStyle.medium16.copyWith(color: color),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildImgWidget(int optionCount) {
    return GridView.builder(
        padding: const EdgeInsets.only(top: 0),
        itemCount: optionCount,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 162 / 104,
        ),
        itemBuilder: _buildImgItem);
  }

  Widget _buildImgItem(BuildContext context, int index) {
    QuestionInfo? questionInfo = _dataRsp?.data?.list[_currentIndex];
    QuestionOptionInfo? optionInfo =
        questionInfo?.options?.getOptionInfoWithIndex(index);
    String str = questionInfo?.options?.getStringWithIndex(index) ?? '';
    Color color = optionInfo?.selected == true
        ? R.color.mainBrandColor
        : R.color.mainTextColor;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (questionInfo?.type == 1) {
          if (questionInfo?.options?.a != null) {
            questionInfo!.options!.a!.selected = false;
          }
          if (questionInfo?.options?.b != null) {
            questionInfo!.options!.b!.selected = false;
          }
          if (questionInfo?.options?.c != null) {
            questionInfo!.options!.c!.selected = false;
          }
          if (questionInfo?.options?.d != null) {
            questionInfo!.options!.d!.selected = false;
          }
          optionInfo?.selected = true;
        } else {
          optionInfo?.selected = !(optionInfo.selected ?? false);
        }
        if (mounted) {
          setState(() {});
        }
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
        decoration: BoxDecoration(
            boxShadow: [getCardBoxShadow()],
            borderRadius: BorderRadius.circular(8),
            border: optionInfo?.selected == true
                ? Border.all(width: 2, color: color)
                : null,
            color: R.color.mainBgColor),
        child: Row(
          children: [
            Text(
              str,
              style: R.textStyle.medium16.copyWith(color: color),
            ),
            const SizedBox(
              width: 16,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(optionInfo?.content ?? ''),
                width: 80 * Util.ratio,
                height: 80 * Util.ratio,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            if (optionInfo?.selected == true)
              Container(
                alignment: AlignmentDirectional.center,
                width: 24,
                height: 24,
                decoration: const ShapeDecoration(
                    shape: StadiumBorder(), color: Color(0xFF3DF0C6)),
                child: R.img('ic_checkbox_selected.webp',
                    width: 24,
                    height: 24,
                    package: ComponentManager.MANAGER_PERSONALDATA),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    if (_dataRsp == null || !(_dataRsp?.success == true)) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WidgetUtils.buildDivider(
            margin: EdgeInsetsDirectional.zero, height: 0.5),
        BottomButton.of(
            title: (_currentIndex ==
                    ((_dataRsp?.data?.total ?? 0) > 1
                        ? (_dataRsp!.data!.total! - 1)
                        : 0))
                ? K.personal_check_result
                : K.personal_next_question,
            onTap: _nextAction),
      ],
    );
  }

  _nextAction() async {
    if (_dataRsp == null) return;
    if (_hasFinish) {
      _submitExam();
      return;
    }
    if (_loading) return;
    _loading = true;
    QuestionInfo? questionInfo = _dataRsp?.data?.list[_currentIndex];
    BaseResponse response = await Api.chooseAnswer(_dataRsp?.data?.examId ?? 0,
        questionInfo?.index ?? 0, questionInfo?.options?.getAnswerStr() ?? '');
    if (response.success == true) {
      if ((_dataRsp?.data?.total ?? 0) >= 1) {
        if (_currentIndex < _dataRsp!.data!.total! - 1) {
          _currentIndex++;
          _scrollController
              .animateTo(_currentIndex * Util.width,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut)
              .then((value) {
            if (mounted) {
              setState(() {
                _loading = false;
              });
            }
          });
        } else if (_currentIndex == _dataRsp!.data!.total! - 1) {
          _loading = false;
          _hasFinish = true;
          _submitExam();
        }
      }
    } else {
      _loading = false;
      Fluttertoast.showCenter(msg: response.msg);
    }
  }

  _submitExam() async {
    if (_dataRsp == null) return;
    DataRsp<ExamResultInfo> rsp = await Api.submitExam(
        _dataRsp?.data?.examId ?? 0,
        ((_dataRsp?.data?.duration ?? 0) >= _remainTime)
            ? (_dataRsp!.data!.duration! - _remainTime)
            : 0,
        widget.verifyId);
    if (rsp.success == true) {
      ExamResultScreen.show(context, _dataRsp?.data?.examId ?? 0,
          rsp.data?.totalScore ?? 0, rsp.data?.pass ?? 0);
    } else {
      Fluttertoast.showCenter(msg: rsp.msg);
    }
  }
}
