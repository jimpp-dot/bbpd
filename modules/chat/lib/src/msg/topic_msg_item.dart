// import 'package:fluwx/fluwx.dart' as FlutterWx;
import 'package:shared/shared.dart';
import 'package:chat/src/model/chat_topic_model.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../k.dart';

/// 话题通知消息
class TopicMsgItem extends StatelessWidget {
  final ChatTopicModel topic;
  final double width;

  const TopicMsgItem({super.key, required this.topic, required this.width});

  @override
  Widget build(BuildContext context) {
    double wHRatio = 335 / 150;
    return VisibilityDetector(
      key: ValueKey('follow_${topic.tagId}_${topic.title}'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 0.0) {
          _onWidgetVisible(false);
        } else if (visibilityInfo.visibleFraction == 1.0) {
          _onWidgetVisible(true);
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: R.colors.secondBgColor,
          ),
          child: Column(
            children: [
              if (topic.image != null && topic.image!.isNotEmpty)
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: CachedNetworkImage(
                      imageUrl: topic.image,
                      width: width,
                      height: width / wHRatio,
                      fit: BoxFit.cover),
                ),
              Container(
                width: width,
                padding: const EdgeInsetsDirectional.only(
                    top: 12, bottom: 12, start: 12, end: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (topic.title != null && topic.title!.isNotEmpty)
                      Row(
                        children: [
                          if (topic.tag != null && topic.tag!.isNotEmpty)
                            Container(
                              margin: const EdgeInsetsDirectional.only(end: 4),
                              padding: const EdgeInsetsDirectional.only(
                                  top: 2, bottom: 2, start: 8, end: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: R.colors.mainTextColor,
                              ),
                              child: Text(
                                topic.tag!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                            ),
                          Flexible(
                            child: Text(
                              topic.title ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: R.textStyle.subtitle
                                  .copyWith(color: R.colors.mainTextColor),
                            ),
                          )
                        ],
                      ),
                    if (topic.desc != null && topic.desc!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 5),
                        child: Text(
                          topic.desc ?? "",
                          style: R.textStyle.subCaption
                              .copyWith(color: R.colors.thirdTextColor),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10),
                      child: Divider(
                        height: 1 / Util.devicePixelRatio,
                        color: const Color(0x1A202020),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                      child: Row(
                        children: [
                          Text(
                            K.chat_check_detail,
                            style: TextStyle(
                                color: R.colors.highlightColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: R.colors.highlightColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onTap(BuildContext context) {
    Tracker.instance.track(TrackEvent.topic_click, properties: {
      'topic_id': topic.tagId,
      'page': 'message_list',
    });

    // 有小程序跳转链接，优先跳转小程序
    // if (!Util.isNullOrEmpty(topic.appletName) && !Util.isNullOrEmpty(topic.appletUrl)) {
    //   FlutterWx.launchWeChatMiniProgram(username: topic.appletName ?? '', path: topic.appletUrl);
    //   return;
    // }

    if (topic.navUrl != null && topic.navUrl!.isNotEmpty) {
      BaseWebviewScreen.show(context, url: topic.navUrl!);
    } else if (topic.tagId > 0) {
      IMomentManager? momentManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
      momentManager?.openTopicDetailScreen(context,
          tagId: topic.tagId, tagName: topic.title ?? "");
    }
  }

  /// 曝光统计
  void _onWidgetVisible(bool visible) {
    if (visible && topic.tagId > 0) {
      Log.d('follow topic :$visible: ${topic.title}');
      Tracker.instance.track(TrackEvent.topic_expo, properties: {
        'topic_id': topic.tagId,
        'page': 'message_list',
      });
    }
  }
}
