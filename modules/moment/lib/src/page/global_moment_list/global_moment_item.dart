import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:fmodifier/fmodifier.dart';
import 'package:moment/src/model/moment_notice_people.dart';
import 'package:moment/src/page/global_moment_list/view.dart';
import 'package:moment/src/widget/moment_item_header.dart';

class GlobalMomentItem extends StatelessWidget {
  final Moment moment;
  final bool showInNormalMoment;
  final OnMomentDelete? onMomentDelete;
  final MomentFlowPage page;

  const GlobalMomentItem(
      {required this.moment,
      this.showInNormalMoment = false,
      this.onMomentDelete,
      required this.page,
      super.key});

  @override
  Widget build(BuildContext context) {
    final numLines = '\n'.allMatches(moment.content ?? '').length + 1;
    final bgUrl = moment.getMomentImages().isNotEmpty
        ? moment.getMomentImages().first.url
        : moment.userIcon;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: NetworkImage(bgUrl ?? ""),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              MomentItemHeader(
                moment: moment,
                canHeadTaped: true,
                showFollow: false,
                showDelete: true,
                showMore: !showInNormalMoment,
                page: page,
                onMomentDelete: () {
                  if (onMomentDelete != null) {
                    onMomentDelete!(moment.topicId);
                  }
                },
              ).paddingExt(
                  const EdgeInsetsDirectional.only(start: 16, top: 10)),
              _wholeText().paddingExt(EdgeInsetsDirectional.only(
                  top: 10, bottom: numLines > 1 ? 30 : 54, start: 16, end: 16)),
            ],
          )
              .overlayExt(
                  Image.asset(
                    R.imagePath(
                      "ic_horn.webp",
                      package: ComponentManager.MANAGER_MOMENT,
                    ),
                    width: 30,
                  ).visibleExt(showInNormalMoment),
                  alignment: AlignmentDirectional.topStart)
              .overlayExt(
                  Text(
                    K.moment_global_moment_all,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                            .withOpacity(showInNormalMoment ? 0.6 : 0)),
                  )
                      .paddingExt(const EdgeInsetsDirectional.only(
                          top: 28, start: 20, end: 20))
                      .onTapExt(showInNormalMoment
                          ? () {
                              _onAllGlobalMoment(context);
                            }
                          : null),
                  alignment: AlignmentDirectional.topEnd),
        ),
        _buildBottom(),
      ],
    )
        .backgroundColorExt(const Color(0xff2E2E30))
        .cornerRadiusExt(radius: 12)
        .onTapExt(() {
          showInNormalMoment
              ? _onAllGlobalMoment(context)
              : _onItemTaped(context);
        })
        .paddingExt(const EdgeInsetsDirectional.only(
            start: 20, end: 20, top: 0, bottom: 8))
        .backgroundColorExt(
            showInNormalMoment ? R.color.secondBgColor : Colors.transparent);
  }

  /// 文字内容
  String get wholeWord {
    String wholeText = '';

    String tag = "";
    if (moment.tagsTp != null && moment.tagsTp!.isNotEmpty) {
      NormalTag normalTag = moment.tagsTp![0];
      if (normalTag.tag != null && normalTag.tag!.isNotEmpty) {
        tag = '#${normalTag.tag}#';
      }
    }

    wholeText += tag;

    // 文字内容
    wholeText += moment.content ?? '';

    if (moment.atUsers != null && moment.atUsers!.isNotEmpty) {
      for (MomentNoticePeople item in moment.atUsers!) {
        wholeText += '@${item.name}';
      }
    }

    return wholeText;
  }

  Widget _wholeText() {
    List<InlineSpan> spanItems = [];

    // 标签
    String tag = "";
    if (moment.tagsTp != null && moment.tagsTp!.isNotEmpty) {
      NormalTag normalTag = moment.tagsTp![0];
      if (normalTag.tag != null && normalTag.tag!.isNotEmpty) {
        tag = '#${normalTag.tag}#';
      }
    }

    if (moment.tagsBroadcast != null &&
        moment.tagsBroadcast!.tag != null &&
        moment.tagsBroadcast!.tag!.isNotEmpty) {
      tag = '#${moment.tagsBroadcast!.tag}#';
    }

    if (tag.isNotEmpty) {
      spanItems.add(TextSpan(
        text: tag,
      ));
    }

    List<int> chars = [];
    if (moment.content != null && moment.content!.isNotEmpty) {
      chars = moment.content!.runes.toList();
    }

    if (moment.atUsers != null && moment.atUsers!.isNotEmpty) {
      bool hasSelf = false;
      int startPos = 0;
      for (MomentNoticePeople item in moment.atUsers!) {
        if (item.uid == Session.uid) {
          hasSelf = true;
        }

        int endPost = min(item.pos, chars.length);
        if (endPost > startPos) {
          List<int> subTextRunes = chars.sublist(startPos, endPost);
          String subString = String.fromCharCodes(subTextRunes);
          spanItems.add(TextSpan(text: subString));
        }

        spanItems.add(TextSpan(
          text: '@${item.name}',
        ));

        startPos = min(item.pos, chars.length);
      }

      if (chars.length > startPos) {
        List<int> subTextRunes = chars.sublist(startPos, chars.length);
        String subString = String.fromCharCodes(subTextRunes);
        spanItems.add(TextSpan(text: subString));
      }

      if (hasSelf) {
        spanItems.add(TextSpan(
          text: K.moment_notice_you,
        ));
      }
    } else {
      spanItems.add(TextSpan(text: moment.content ?? ''));
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16),
        children: spanItems,
      ),
      textAlign: TextAlign.center,
      maxLines: 4,
    );
  }

  _buildBottom() {
    if (showInNormalMoment) {
      return const SizedBox.shrink();
    } else {
      return SayHiWidget(
        moment: moment,
        isGlobalMoment: true,
        mainTextColor: R.color.mainTextColor,
        secondTextColor: R.color.secondTextColor,
      )
          .paddingExt(const EdgeInsetsDirectional.only(start: 20))
          .sizeFixedExt(height: 42, width: double.infinity);
    }
  }

  /// 动态点击
  void _onItemTaped(BuildContext context) {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentDetailScreen(context,
        topicId: moment.topicId, topicUid: moment.uid, parentPage: page);
  }

  void _onAllGlobalMoment(BuildContext context) {
    GlobalMomentListScreen.openGlobalMomentScreen(context);
  }
}
