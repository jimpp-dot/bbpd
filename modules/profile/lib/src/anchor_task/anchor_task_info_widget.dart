import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';
import '../model/pb/generated/slp_anchor.pb.dart';
import 'anchor_task_detail_tab_page.dart';

class AnchorTaskInfoWidget extends StatelessWidget {
  final AnchorInfo info;

  const AnchorTaskInfoWidget({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return buildInfoWithPct(context);
  }

  /// 新样式：带奖励比例
  Widget buildInfoWithPct(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [Color(0xFF8EF5B2), Color(0xFF26C4FF), Color(0xFF926AFF)],
        ),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            start: 0,
            child: CachedNetworkImage(
              width: 92,
              height: 110,
              imageUrl: 'static/profile/anchor_task_info_bg_1.png',
            ),
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: CachedNetworkImage(
              width: 162,
              height: 104,
              imageUrl: 'static/profile/anchor_task_info_bg_2.webp',
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.only(
                start: 16, top: 16, end: 16, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0x1A313131), width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: CommonAvatar(
                        path: Session.icon,
                        size: 58,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${K.profile_award_date}${info.awardDesc}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${K.profile_award_high_rate}${info.awardPct}%',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        /// 奖励说明
                        BaseWebviewScreen.show(context,
                            url: Util.parseHelpUrl(141));
                        Tracker.instance.track(TrackEvent.click, properties: {
                          'click_page': 'gsPlatformAwardInfo',
                        });
                      },
                      child: Container(
                        margin: const EdgeInsetsDirectional.only(
                            top: 16, bottom: 10),
                        width: 70,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(16),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          K.profile_reward_desc,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2ECEFE),
                            height: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(top: 16, bottom: 16),
                  width: double.infinity,
                  height: 0.5,
                  color: Colors.white.withOpacity(0.16),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          buildAward(
                              K.profile_anchor_task_score_live_duration,
                              '${info.liveDurationCredit}',
                              '${info.awardLdPct}%'),
                          const SizedBox(height: 8),
                          buildAward(K.profile_anchor_task_score_behavior,
                              '${info.behaviorCredit}', '${info.awardBPct}%'),
                          const SizedBox(height: 8),
                          buildAward(K.profile_anchor_task_score_week_flow,
                              '${info.weekFlowCredit}', '${info.awardWfPct}%'),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        /// 任务页
                        AnchorTaskDetailTabPage.show(context);
                        Tracker.instance.track(TrackEvent.click, properties: {
                          'click_page': 'gsPlatformMissionInfo',
                        });
                      },
                      child: Container(
                        width: 52,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0x3DFFFFFF),
                          borderRadius: BorderRadiusDirectional.circular(14),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              K.profile_anchor_task_detail_button,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            R.img(
                              'ic_next_small.png',
                              color: Colors.white,
                              width: 8,
                              height: 16,
                              package: ComponentManager.MANAGER_PROFILE,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  info.text,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAward(String title, String credit, String pct) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: NumText(
                  credit,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                K.profile_award_rate,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: NumText(
                  pct,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
