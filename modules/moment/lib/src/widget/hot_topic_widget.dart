import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moment/assets.dart';
import 'package:moment/k.dart';
import 'package:moment/src/page/topic_detail_screen.dart';
import 'package:moment/src/page/topic_square_page.dart';

/// 动态广场列表-热搜话题
class HotTopicWidget extends StatefulWidget {
  final List<RecTag> data;

  const HotTopicWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HotTopicState();
}

class _HotTopicState extends State<HotTopicWidget> {
  List<RecTag> get _data => widget.data;

  @override
  Widget build(BuildContext context) {
    return Rext.themeCardContainer(
      cornerRadius: 16,
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 0),
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 12, bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            K.moment_top_search_tag,
            style: TextStyle(
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w900,
                fontSize: 16),
          ),
          const SizedBox(height: 14),
          _renderTopicList(),
        ],
      ),
    );
  }

  Widget _renderTopicList() {
    List<RecTag> left = [];
    List<RecTag> right = [];
    int i = 0;
    for (RecTag item in _data) {
      if (i % 2 == 0) {
        left.add(item);
      } else {
        right.add(item);
      }
      i++;
    }
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: left.map((e) => _renderTopicItem(e)).toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...right.map((e) => _renderTopicItem(e)).toList(),
                    _renderMore(),
                  ],
                ),
              ),
            )
          ],
        ),
        PositionedDirectional(
          top: 0,
          bottom: 10,
          width: 1,
          child: Container(
            width: 1,
            height: double.infinity,
            color: R.colors.dividerColor,
          ),
        ),
      ],
    );
  }

  Widget _renderTopicItem(RecTag item) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          TopicDetailScreen.openTopicDetailScreen(context,
              tagId: item.tagId, tagName: item.name);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            R.img(
              darkMode
                  ? Assets.moment$ic_topic_tag_2_dark_webp
                  : Assets.moment$ic_topic_tag_2_webp,
              width: 18,
              height: 18,
            ),
            const SizedBox(width: 4),
            Flexible(
                child: Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            )),
            SizedBox(width: 10.dp),
          ],
        ),
      ),
    );
  }

  Widget _renderMore() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          TopicSquarePage.openTopicSquareScreen(context,
              tab: TopicSquareTab.Recommend);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              K.moment_tag_more,
              style: TextStyle(
                  color: R.colors.tagTextV2Color,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            R.img(
              Assets.moment$ic_next_svg,
              color: R.colors.tagTextV2Color,
              width: 16,
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
