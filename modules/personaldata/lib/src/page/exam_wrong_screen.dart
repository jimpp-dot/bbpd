import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/api/api.dart';
import 'package:personaldata/src/model/exam_model.dart';

class ExamWrongScreen extends StatefulWidget {
  final int examId;
  const ExamWrongScreen(this.examId, {super.key});
  @override
  _ExamWrongScreenState createState() => _ExamWrongScreenState();
  static Future show(BuildContext context, int examId) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ExamWrongScreen(examId),
      settings: const RouteSettings(name: '/examWrongScreen'),
    ));
  }
}

class _ExamWrongScreenState extends State<ExamWrongScreen> {
  DataRsp<QuestionListInfo>? _dataRsp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.personal_wrong_question,
        onBackPressedCallback: () {
          Navigator.of(context)
              .popUntil((route) => route.settings.name == '/receptionAuth');
        },
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildFooter(),
    );
  }

  _loadData() async {
    _dataRsp = await Api.getWrongQuestions(widget.examId);
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildBody() {
    if (_dataRsp == null) {
      return const Loading();
    }
    if (Util.validStr(_dataRsp?.msg)) {
      return ErrorData(
        onTap: _loadData,
        error: _dataRsp?.msg,
      );
    }
    if (!Util.validList(_dataRsp?.data?.list)) {
      return const EmptyWidget();
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 20),
      alignment: AlignmentDirectional.topStart,
      child: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: _dataRsp!.data!.list.length,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    QuestionInfo questionInfo = _dataRsp!.data!.list[index];
    int answerCount = 0;
    String type = '';
    if (questionInfo.options!.a != null) {
      type = questionInfo.options!.a!.type;
    }
    if (questionInfo.options!.a != null) {
      answerCount++;
      type = questionInfo.options!.a!.type;
    }
    if (questionInfo.options!.b != null) {
      answerCount++;
    }
    if (questionInfo.options!.c != null) {
      answerCount++;
    }
    if (questionInfo.options!.d != null) {
      answerCount++;
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 12),
      width: Util.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${questionInfo.index}. ${questionInfo.question}',
              style: R.textStyle.medium16),
          const SizedBox(
            height: 12,
          ),
          (type == 'picture')
              ? _buildImgWidget(answerCount, questionInfo)
              : _buildTextWidget(answerCount, questionInfo),
        ],
      ),
    );
  }

  Widget _buildTextWidget(int optionCount, QuestionInfo questionInfo) {
    if (optionCount == 0) {
      return _buildEmptyAnswer();
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _buildTextItem(context, index, questionInfo);
      },
      itemCount: optionCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildTextItem(
      BuildContext context, int index, QuestionInfo questionInfo) {
    // String str = '${questionInfo.myAnswer[index]}';
    // QuestionOptionInfo optionInfo = questionInfo.options.getOptionInfoWithStr(str);
    QuestionOptionInfo optionInfo =
        questionInfo.options!.getOptionInfoWithIndex(index)!;
    String str = questionInfo.options!.getStringWithIndex(index);
    // Color color = R.color.mainTextColor;
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
      margin: const EdgeInsetsDirectional.only(bottom: 12),
      constraints: const BoxConstraints(minHeight: 64),
      decoration: BoxDecoration(
          boxShadow: [getCardBoxShadow()],
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(width: 2,color: R.color.thirdBrightColor),
          color: R.color.mainBgColor),
      child: Row(
        children: [
          Text(
            str,
            style: R.textStyle.medium16.copyWith(color: R.color.mainTextColor),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              optionInfo.content,
              style:
                  R.textStyle.medium16.copyWith(color: R.color.mainTextColor),
            ),
          ),
          // Container(
          //   alignment: AlignmentDirectional.center,
          //     width: 24,
          //     height: 24,
          //   decoration: ShapeDecoration(
          //     shape: StadiumBorder(),
          //     color: R.color.thirdBrightColor
          //   ),
          //   child: R.img('ic_checkbox_close.webp',width: 24,height: 24,package: ComponentManager.MANAGER_PERSONALDATA),
          // )
        ],
      ),
    );
  }

  Widget _buildImgWidget(int optionCount, QuestionInfo questionInfo) {
    if (optionCount == 0) {
      return _buildEmptyAnswer();
    }
    return Container(
      child: GridView.builder(
          padding: const EdgeInsets.only(top: 0, bottom: 12),
          itemCount: optionCount,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 162 / 104,
          ),
          itemBuilder: (BuildContext context, int index) {
            return _buildImgItem(context, index, questionInfo);
          }),
    );
  }

  Widget _buildImgItem(
      BuildContext context, int index, QuestionInfo questionInfo) {
    // String str = '${questionInfo.myAnswer[index]}';
    // QuestionOptionInfo optionInfo = questionInfo.options.getOptionInfoWithStr(str);
    // Color color = R.color.thirdBrightColor;
    QuestionOptionInfo optionInfo =
        questionInfo.options!.getOptionInfoWithIndex(index)!;
    String str = questionInfo.options!.getStringWithIndex(index);

    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
      decoration: BoxDecoration(
          boxShadow: [getCardBoxShadow()],
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(width: 2,color: color),
          color: R.color.mainBgColor),
      child: Row(
        children: [
          Text(
            str,
            style: R.textStyle.medium16.copyWith(color: R.color.mainTextColor),
          ),
          const SizedBox(
            width: 16,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(optionInfo.content),
              width: 80 * Util.ratio,
              height: 80 * Util.ratio,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          // Container(
          //   alignment: AlignmentDirectional.center,
          //   width: 24,
          //   height: 24,
          //   decoration: ShapeDecoration(
          //       shape: StadiumBorder(),
          //       color: color
          //   ),
          //   child: R.img('ic_checkbox_close.webp',width: 24,height: 24,package: ComponentManager.MANAGER_PERSONALDATA),
          // )
        ],
      ),
    );
  }

  Widget _buildEmptyAnswer() {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
      margin: const EdgeInsetsDirectional.only(bottom: 12),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        boxShadow: [getCardBoxShadow()],
        borderRadius: BorderRadius.circular(8),
        color: R.color.mainBgColor,
        border: Border.all(width: 2, color: R.color.thirdBrightColor),
      ),
      child: Text(K.personal_no_answer, style: R.textStyle.medium16),
    );
  }

  Widget _buildFooter() {
    if (_dataRsp == null) return const SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WidgetUtils.buildDivider(
            margin: EdgeInsetsDirectional.zero, height: 0.5),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'X${_dataRsp?.data?.rightNum}',
              style: R.textStyle.regular16,
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: R.color.thirdBrightColor),
              child: R.img('ic_checkbox_close.webp',
                  width: 24,
                  height: 24,
                  package: ComponentManager.MANAGER_PERSONALDATA),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'X${_dataRsp?.data?.wrongNum}',
              style: R.textStyle.regular16,
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
