import 'dart:collection';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:moment/src/api/api.dart';
import 'package:moment/src/model/topic_bean.dart';
import 'package:moment/src/page/topic_detail_screen.dart';
import 'package:moment/src/page/topic_square_page.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// 推荐话题
class RecommendTopicSwiper extends StatefulWidget {
  const RecommendTopicSwiper({super.key});

  @override
  RecommendTopicSwiperState createState() => RecommendTopicSwiperState();
}

class RecommendTopicSwiperState extends State<RecommendTopicSwiper> {
  List<Topic>? _recommendTopics;

  final int pageShowNum = 4;

  final double oneRowHeight = 54;

  int _selectIndex = 0;
  int _requestTime = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _load() async {
    DataRsp<List<Topic>> response = await Api.getRecommendTopics();
    _requestTime = DateTime.now().millisecond;
    if (response.success) {
      _recommendTopics = response.data;
      _selectIndex = 0;
    }
    if (mounted) setState(() {});
  }

  reload() {
    _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_recommendTopics == null || _recommendTopics!.isEmpty)
      return const SizedBox.shrink();
    int pages = (_recommendTopics!.length / pageShowNum).ceil();

    double height = 144;

    if (_recommendTopics!.length <= 2) {
      height = oneRowHeight;
    } else if (_recommendTopics!.length <= 4) {
      height = oneRowHeight * 2;
    }
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 4),
      width: Util.width,
      height: height,
      child: Swiper(
        key: ValueKey(_requestTime),
        itemBuilder: (BuildContext context, int index) {
          return _buildPage(_recommendTopics!, index);
        },
        loop: pages > 1 ? true : false,
        itemCount: pages,
        index: _selectIndex,
        onIndexChanged: (index) {
          _selectIndex = index;
        },
        pagination: pages > 1
            ? SwiperPagination(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 20),
                builder: RectSwiperPaginationBuilder(
                  size: const Size(8, 4),
                  activeSize: const Size(12, 4),
                  radius: 2,
                  activeColor: R.color.mainTextColor,
                  color: R.color.mainTextColor.withOpacity(0.4),
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildPage(List<Topic> data, int index) {
    double crossAxisSpacing = 9;
    int crossAxisCount = 2;

    double ratio =
        (Util.width - 40 - crossAxisSpacing) / (crossAxisCount * oneRowHeight);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsetsDirectional.only(),
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: 0,
        childAspectRatio: ratio,
        children: data
            .sublist(index * pageShowNum,
                min((index + 1) * pageShowNum, data.length))
            .map(
              (e) => RecommendTopic(topic: e),
            )
            .toList(),
      ),
    );
  }
}

class RecommendTopic extends StatelessWidget {
  static Set<int> exposureIds = HashSet();

  final Topic topic;

  const RecommendTopic({super.key, required this.topic});

  _onTopicTaped(BuildContext context) {
    if (topic.url != null && topic.url!.isNotEmpty) {
      BaseWebviewScreen.show(context, url: topic.url!);
    } else if (topic.id == 0) {
      TopicSquarePage.openTopicSquareScreen(context,
          tab: TopicSquareTab.Recommend);
    } else {
      Tracker.instance.track(TrackEvent.topic_click, properties: {
        'topic_id': topic.id,
        'page': 'recommend',
      });
      TopicDetailScreen.openTopicDetailScreen(context,
          tagId: topic.id, tagName: topic.name ?? '');
    }
  }

  _onWidgetVisible(bool visible) {
    if (visible && exposureIds.contains(topic.id) == false) {
      Log.d('recommend topic :$visible: ${topic.name}');
      exposureIds.add(topic.id);
      Tracker.instance.track(TrackEvent.topic_expo, properties: {
        'topic_id': topic.id,
        'page': 'recommend',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('recommend_${topic.id}_${topic.name}'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 0.0) {
          _onWidgetVisible(false);
        } else if (visibilityInfo.visibleFraction == 1.0) {
          _onWidgetVisible(true);
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTopicTaped(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonAvatar(
                path: topic.icon,
                size: 32,
                borderRadius: BorderRadius.circular(4)),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    topic.topicName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    topic.content ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(color: R.color.thirdTextColor, fontSize: 11),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
