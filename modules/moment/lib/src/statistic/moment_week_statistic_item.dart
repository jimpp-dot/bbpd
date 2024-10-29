import 'dart:math' as math;
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/assets.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/assets.dart' as MomentAssets;

import 'package:moment/src/model/moment_notice_people.dart';
import 'package:moment/src/statistic/moment_week_statistic_item_content.dart';
import 'package:moment/src/statistic/moment_week_statistic_media_widget.dart';

class MomentWeekStatisticItem extends StatelessWidget {
  final int index;
  final GetWeekInfoData_CircleWeekItem data;

  const MomentWeekStatisticItem(this.index, this.data, {super.key});

  CircleItem get moment => data.item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        PositionedDirectional(
          top: 1.dp,
          bottom: 1.dp,
          start: 0,
          end: 0,
          child: Transform.rotate(
            angle: math.pi / 84,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFF006FFF),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0x36000000),
                  offset: Offset(0, 2.dp),
                  blurRadius: 4.dp,
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          start: 0,
          bottom: 0,
          child: R.img(
            Util.getRemoteImgUrl('static/circle/circle_week_backend.webp'),
            width: 153.dp,
            height: 162.dp,
          ),
        ),
        PositionedDirectional(
          end: 0,
          top: 0,
          child: R.img(
            Util.getRemoteImgUrl('static/circle/circle_week_backend_line.webp'),
            width: 156.dp,
            height: 296.dp,
          ),
        ),
        _renderMoment(context),
        _renderRank(),
        PositionedDirectional(
          end: -12.dp,
          bottom: 6.dp,
          child: R.img(
            Assets.moment$statistic_img_paper_webp,
            width: 69.dp,
            height: 37.dp,
          ),
        ),
      ],
    );
  }

  Widget _renderMoment(BuildContext context) {
    return Container(
      width: 344.dp,
      padding: EdgeInsetsDirectional.only(top: 20.dp, bottom: 22.dp),
      constraints: BoxConstraints(minHeight: 100.dp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 277.dp,
            constraints: BoxConstraints(minHeight: 40.dp),
            padding: EdgeInsetsDirectional.only(
                top: 10.dp, start: 10.dp, end: 10.dp, bottom: 10.dp),
            margin: EdgeInsetsDirectional.only(end: 17.dp),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFF1F1F1),
                width: 1.dp,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderHeader(context),
                SizedBox(height: 6.dp),
                _renderText(),
                WeekStatisticMomentMediaWidget(moment: moment),
                // 点赞评论数量
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 6.dp),
                  child: _renderLikeAndComment(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.dp),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 25.dp, end: 25.dp),
            child: _renderBottom(),
          ),
        ],
      ),
    );
  }

  Widget _renderHeader(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            IPersonalDataManager personalDataManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.openImageScreen(context, moment.user.uid);
          },
          child: _renderIcon(),
        ),
        SizedBox(width: 6.dp),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 4.dp),
                      child: Text(
                        moment.user.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: const Color(0xFF222222),
                            fontSize: 13.dp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              if (moment.user.age > 0)
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 4.dp, top: 2.dp),
                  child: UserSexAndAgeWidget(
                    sex: moment.user.sex,
                    age: moment.user.age,
                    width: 22.dp,
                    height: 10.dp,
                    textSize: 6.dp,
                    sexIconSize: 7.dp,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(width: 16.dp),
        R.img(
          BaseAssets.shared$ic_more_svg,
          width: 16.dp,
          height: 16.dp,
        ),
      ],
    );
  }

  Widget _renderIcon() {
    if (moment.user.frame.isNotEmpty) {
      return Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            width: 35.dp,
            height: 35.dp,
            alignment: AlignmentDirectional.center,
            child: RoundNetIcon(
              url: moment.user.icon,
              size: 32.dp,
              showBorder: false,
            ),
          ),
          UserIconFrame(size: 35.dp, frameUrl: moment.user.frame),
        ],
      );
    } else {
      return RoundNetIcon(
        url: moment.user.icon,
        size: 32.dp,
        showBorder: false,
      );
    }
  }

  /// 文字内容
  Widget _renderText() {
    if (moment.content.isEmpty && moment.atUids.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 8.dp),
      child: MomentWeekStatisticItemContent(
        showTag: false,
        onTagTap: null,
        onUserTaped: null,
        tags: moment.tagstp.map((e) => NormalTag(e.id, e.tag)).toList(),
        text: moment.content,
        style: TextStyle(
            color: const Color(0xFF262626),
            fontSize: 11.dp,
            height: 1.4,
            fontWeight: FontWeight.w500),
        maxLines: 2,
        atUsers: moment.atUids
            .map((e) => MomentNoticePeople(e.uid, e.name, e.pos))
            .toList(),
      ),
    );
  }

  Widget _renderLikeAndComment() {
    return Row(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            R.img(
              Assets.moment$ic_comment_svg,
              width: 20.dp,
              height: 20.dp,
              package: ComponentManager.MANAGER_MOMENT,
            ),
            SizedBox(width: 2.dp),
            NumText(
              '${moment.cmtNum}',
              style: TextStyle(
                color: const Color(0xFF262626),
                fontSize: 11.dp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(width: 10.dp),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            R.img(
              MomentAssets.Assets.moment_ic_rush_unlike_svg,
              width: 20.dp,
              height: 20.dp,
              package: MomentAssets.Assets.package,
            ),
            SizedBox(width: 2.dp),
            NumText(
              '${moment.likeNum}',
              style: TextStyle(
                color: const Color(0xFF262626),
                fontSize: 11.dp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Spacer(),
        if (Session.uid != moment.user.uid)
          Row(
            children: <Widget>[
              R.img(
                'moment/ic_say_hi.webp',
                width: 20.dp,
                height: 20.dp,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
              SizedBox(width: 2.dp),
              Text(
                K.moment_say_hi_v2,
                style: TextStyle(
                  color: const Color(0xFF262626),
                  fontSize: 11.dp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _renderBottom() {
    TextSpan parseSpan(ContentZone item) {
      TextStyle style = TextStyle(
          color: Util.parseColor(item.color, Colors.black),
          fontSize: 12.dp,
          fontWeight: item.isBold ? FontWeight.w500 : null);
      String text = item.content;
      if (item.wordsLimit > 0 && item.content.length > item.wordsLimit) {
        text = '${text.safeSubstring(0, item.wordsLimit)}... ';
      }
      return TextSpan(text: text.toCharacterBreakStr(), style: style);
    }

    List<InlineSpan> spans = data.msg.map((e) => parseSpan(e)).toList();
    return Text.rich(TextSpan(children: spans));
  }

  Widget _renderRank() {
    String? rankIcon;
    if (moment.rank == 1) {
      rankIcon = Assets.moment$statistic_ic_top_one_webp;
    } else if (moment.rank == 2) {
      rankIcon = Assets.moment$statistic_ic_top_two_webp;
    } else if (moment.rank == 3) {
      rankIcon = Assets.moment$statistic_ic_top_three_webp;
    }
    if (rankIcon == null) return const SizedBox.shrink();
    return PositionedDirectional(
      end: 26.dp,
      top: 80.dp,
      child: R.img(
        rankIcon,
        width: 83.dp,
        height: 67.dp,
      ),
    );
  }
}
