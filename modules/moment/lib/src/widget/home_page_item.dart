import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/widget/activity_item.dart';
import 'package:moment/src/widget/hot_topic_widget.dart';
import 'package:moment/src/widget/room_item_widget.dart';
import 'package:provider/provider.dart' hide Selector;

/// 首页推荐item
class HomePageItemWidget extends StatelessWidget {
  final HomePageItemData data;
  final bool isTest;
  final PageRefer? refer;
  final bool isInView;
  final bool autoPlayVideo;
  final bool supportDark;

  const HomePageItemWidget({
    super.key,
    required this.data,
    this.isTest = false,
    this.refer,
    this.isInView = false,
    this.autoPlayVideo = false,
    this.supportDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return _buildItemByType(context);
  }

  Widget _buildItemByType(BuildContext context) {
    if (data.type == HomePageItemType.Circle) {
      return Consumer<MomentModel>(builder: (context, model, child) {
        MomentModel model = context.watch<MomentModel>();
        Moment? moment =
            model.getCachedMoment(data.circleItemData?.topicId ?? 0);
        if (moment != null) {
          data.circleItemData = moment;
        }
        return MomentItem(
          moment: data.circleItemData!,
          key: ValueKey(data.circleItemData!.topicId),
          showFollow: true,
          showDelete: false,
          showTestData: isTest,
          page: MomentFlowPage.Recommend,
          isInView: isInView,
          autoPlayVideo: autoPlayVideo,
          canCommentTaped: false,
          supportDark: supportDark,
        );
      });
    } else if (data.type == HomePageItemType.Room) {
      return RoomItemWidget(
          data: data.roomItemData!, page: MomentFlowPage.Recommend);
    } else if (data.type == HomePageItemType.Activity) {
      return ActivityItem(
        activityBean: data.activityBean,
        page: MomentFlowPage.Recommend,
      );
    } else if (data.type == HomePageItemType.HotTopic) {
      return HotTopicWidget(data: data.topics!);
    }
    return const SizedBox.shrink();
  }
}
