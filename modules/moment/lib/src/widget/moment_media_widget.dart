import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/src/model/moment_bean.dart';
import 'package:moment/src/model/tag_bean.dart';
import 'package:moment/src/moment_utils.dart';
import 'package:moment/src/widget/moment_case_tags_widget.dart';

import '../video_player/mate_moment_video_widget.dart';
import 'image_moment_widget.dart';

/// 动态媒体内容 图片、音频、视频预览
class MomentMediaWidget extends StatelessWidget {
  final Moment moment;
  final bool canTap;
  final int? parentTagId;
  final bool showPublishTime;
  final MomentFlowPage? page; // 页面来源
  final String? topicName; // 页面标签
  final bool isInView;
  final bool autoPlayVideo;
  final Color? textColor;
  final bool supportDark;
  const MomentMediaWidget({
    super.key,
    required this.moment,
    this.canTap = true,
    this.parentTagId,
    this.showPublishTime = true,
    this.page,
    this.topicName,
    this.isInView = false,
    this.autoPlayVideo = false,
    this.textColor,
    this.supportDark = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    switch (moment.type) {
      case MomentType.picture:
        widgets.add(MomentImageWidget(
          images: moment.getMomentImages(),
          moment: moment,
          page: page,
          topicName: topicName,
        ));
        break;

      case MomentType.video:
        widgets.add(MateMomentVideoWidget(
          key: ValueKey('video_${moment.topicId}'),
          url: moment.videoCover?.cover375,
          width: moment.videoCover?.width,
          height: moment.videoCover?.height,
          moment: moment,
          autoPlay: autoPlayVideo,
          videoUrl: moment.videoUrl ?? '',
          pageKey: page,
          isInView: isInView,
          topicName: topicName,
        ));

        break;

      case MomentType.audio:
        widgets.add(AudioButton(
          audioUrl: moment.audioUrl ?? '',
          duration: moment.duration,
          onTap: () => _onAudioTaped(),
          onAudioStop: _onAudionStop,
        ));
        break;
      default:
        break;
    }

    double paddingTop = widgets.isEmpty ? 0 : 12;

    // case tag
    if (moment.tagsCase != null) {
      widgets.add(
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: paddingTop,
          ),
          child: MomentCaseTagsWidget(
            tags: [
              CaseTag(
                moment.tagsCase!.id,
                moment.tagsCase!.tag,
                moment.tagsCase!.icon,
              ),
            ],
            canTap: canTap,
            parentTagId: parentTagId ?? 0,
            paddingBottom: 0,
            type: PageType.Case,
          ),
        ),
      );
    }

    paddingTop = widgets.isEmpty ? 0 : 11;
    // 地理位置/时间

    if (showPublishTime &&
        ((moment.location != null && moment.location!.isNotEmpty))) {
      widgets.add(Padding(
        padding: EdgeInsets.only(top: widgets.isEmpty ? 0 : 8),
        child: _buildLocationAndTime(moment.location!, moment.rushPublishTime!),
      ));
    }

    if (widgets.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 2, end: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  _onAudionStop(int playtime) {
    Tracker.instance.track(TrackEvent.flow_media_time, properties: {
      'moment_id': moment.topicId,
      'owner_uid': moment.uid,
      'flow_type': moment.flowType,
      'tag': moment.reportTag,
      'subject_id': moment.reportTagIds,
      'page': getFlowPage(page),
      if (page == MomentFlowPage.NetDetail) 'net_page': '$topicName',
      if (page == MomentFlowPage.TopicDetail) 'topic_page': '$topicName',
      'total_time': moment.duration * 1000,
      'play_time': playtime,
      'media_type': 'audio',
    });
  }

  /// 音频点击上报
  _onAudioTaped() {
    trackerReport(
        moment: moment,
        page: page,
        clickType: 'dating_audio',
        topicName: topicName);
  }

  Widget _buildLocationAndTime(String location, String? time) {
    String timeText =
        '${(moment.location != null && moment.location!.isNotEmpty) ? '' : ''}$time';

    return Container(
      decoration: BoxDecoration(
        // color: const Color(0xFFF3F5F6),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 3, horizontal: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (moment.location != null && moment.location!.isNotEmpty) ...[
            R.img('ic_location.svg',
                width: 18,
                height: 18,
                color: R.colors.locationColor,
                package: ComponentManager.MANAGER_MOMENT),
            Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Text(
                moment.location!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: R.colors.locationColor,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
