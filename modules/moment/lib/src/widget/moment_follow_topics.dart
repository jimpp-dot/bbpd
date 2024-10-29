import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/src/api/api.dart';
import 'package:moment/src/model/topic_bean.dart';
import 'package:moment/src/page/topic_detail_screen.dart';
import 'package:moment/src/page/topic_square_page.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../k.dart';

/// 关注流顶部关注话题列表
class MomentFollowTopics extends StatefulWidget {
  final List<Topic>? topics;

  const MomentFollowTopics({super.key, this.topics});

  @override
  MomentFollowTopicsState createState() => MomentFollowTopicsState();
}

class MomentFollowTopicsState extends State<MomentFollowTopics> {
  late List<Topic> _followTopics;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventRefreshFollowTopics, _onRefreshFollowTopics);
    _followTopics = widget.topics ?? [];
    _load();
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventRefreshFollowTopics, _onRefreshFollowTopics);
    super.dispose();
  }

  _onRefreshFollowTopics(String type, dynamic data) {
    _load();
  }

  reload() {
    _load();
  }

  _load() async {
    DataRsp<List<Topic>> response = await Api.getFollowTopics();
    if (response.success == true) {
      _followTopics = response.data ?? [];
    }
    if (mounted) setState(() {});
  }

  void _onAllTaped(BuildContext context) {
    TopicSquarePage.openTopicSquareScreen(context, tab: TopicSquareTab.Follow);
  }

  @override
  Widget build(BuildContext context) {
    if (_followTopics.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 32,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _followTopics.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) => FollowTopicWidget(
                    topic: _followTopics[index], index: index),
              ),
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () => _onAllTaped(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.moment_all_topic,
                  style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                R.img(
                  'ic_all.svg',
                  package: ComponentManager.MANAGER_MOMENT,
                  width: 16,
                  height: 16,
                  color: R.colors.thirdTextColor,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

/// 关注话题
class FollowTopicWidget extends StatelessWidget {
  static Set<int> topicIds = HashSet();

  final Topic topic;
  final int index;

  const FollowTopicWidget({super.key, required this.topic, this.index = 0});

  void _onTopicTaped(BuildContext context) {
    Tracker.instance.track(TrackEvent.topic_click, properties: {
      'topic_id': topic.id,
      'page': 'follow',
    });
    TopicDetailScreen.openTopicDetailScreen(context,
        tagId: topic.id, tagName: topic.name ?? '');
  }

  _onWidgetVisible(bool visible) {
    if (visible && !topicIds.contains(topic.id)) {
      Log.d('follow topic :$visible: ${topic.name}');
      topicIds.add(topic.id);
      Tracker.instance.track(TrackEvent.topic_expo, properties: {
        'topic_id': topic.id,
        'page': 'follow',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('follow_${topic.id}_${topic.name}'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 0.0) {
          _onWidgetVisible(false);
        } else if (visibilityInfo.visibleFraction == 1.0) {
          _onWidgetVisible(true);
        }
      },
      child: GestureDetector(
        onTap: () => _onTopicTaped(context),
        child: Container(
          height: 32,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
          margin: EdgeInsetsDirectional.only(start: index == 0 ? 16 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: R.colors.mainBrandColor.withOpacity(0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(
                'ic_tag.svg',
                package: ComponentManager.MANAGER_MOMENT,
                width: 16,
                height: 16,
                color: R.colors.secondTextColor,
              ),
              Text(
                '${topic.name}',
                style: TextStyle(
                  color: R.colors.secondTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
