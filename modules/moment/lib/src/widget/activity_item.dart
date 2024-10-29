import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/src/model/activity_bean.dart';
import 'package:moment/src/page/topic_detail_screen.dart';

/// 首页活动推荐
class ActivityItem extends StatefulWidget {
  final ActivityBean? activityBean;
  final MomentFlowPage page; // 信息流数据上报，页面来源

  const ActivityItem(
      {super.key, required this.activityBean, required this.page});

  @override
  _ActivityItemState createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  /// 首页推荐话题活动点击
  _onActivityItemClick() {
    TopicDetailScreen.openTopicDetailScreen(context,
        tagId: widget.activityBean!.id,
        tagName: widget.activityBean!.tag ?? '');
    Tracker.instance.track(TrackEvent.click_flow, properties: {
      'page': getFlowPage(widget.page),
      'flow_type': 'topic',
      'topic_id': widget.activityBean!.id,
      'click_type': 'detail',
      'tag': widget.activityBean!.tag
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.activityBean == null) {
      Log.d('ActivityBean is null');
      return Container();
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onActivityItemClick,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            bottom: 20, top: 16, start: 20, end: 20),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          border: Border(
            bottom: BorderSide(width: 8, color: R.color.secondBgColor),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            const SizedBox(height: 18),
            Text(
              '${widget.activityBean!.content}',
              style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                colors: R.color.mainBrandGradientColors,
                begin: AlignmentDirectional.centerEnd,
                end: AlignmentDirectional.centerStart,
              ),
            ),
            padding: const EdgeInsetsDirectional.only(
                top: 2, bottom: 2, start: 8, end: 8),
            child: Text(
              K.moment_activity,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: R.img('circle/ic_rush_circle_tag.svg',
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_MOMENT),
          ),
          Expanded(
            child: Text(
              widget.activityBean!.tag ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          if (widget.activityBean!.userNum != 0)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: Text(
                '${widget.activityBean!.userNum}${K.moment_topic_user_num}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: R.color.thirdTextColor, fontSize: 13),
              ),
            )
        ],
      );

  Widget _buildImage() => GridView.count(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: widget.activityBean!.images
            .map((item) => _buildImageItem(item))
            .toList(growable: false),
      );

  Widget _buildImageItem(String url) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
        ),
      );
}
