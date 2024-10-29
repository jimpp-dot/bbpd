import 'package:shared/shared.dart';
import 'package:shared/widget/qualifying_segment_start_widget.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/qualifying/page/qualifying_record_widget.dart';
import 'package:personaldata/k.dart';
import 'package:shared/util/qualifying_util.dart';

// 个人页-PK战绩
class QualifyingWidget extends StatelessWidget {
  final int uid;
  final RoomCrossPkQualifyingSummary? qualifying;

  const QualifyingWidget(
      {Key? key, required this.uid, required this.qualifying})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => QualifyingRecordWidget.show(context, uid),
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    K.personal_cpk_record_title,
                    style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                R.img(
                  'ic_next.svg',
                  width: 16,
                  height: 16,
                  color: R.colors.mainTextColor.withOpacity(0.3),
                  package: ComponentManager.MANAGER_PROFILE,
                ),
              ],
            ),
            const SizedBox(height: 16),
            QualifyingBannerWidget(uid: uid, qualifying: qualifying),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class QualifyingBannerWidget extends StatelessWidget {
  final int uid;
  final RoomCrossPkQualifyingSummary? qualifying;
  final bool arrow;

  const QualifyingBannerWidget(
      {Key? key,
      required this.uid,
      required this.qualifying,
      this.arrow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => QualifyingRecordWidget.show(context, uid),
        child: Rext.themeCardContainer(
          height: 68,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 8),
              CachedNetworkImage(
                  imageUrl: qualifying?.curSegment.segmentUrl,
                  width: 60,
                  height: 60),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            QualifyingUtil.getSegmentTitle(
                                qualifying?.curSegment.segmentName ?? '',
                                qualifying?.curSegment.subSegment ?? 0),
                            style: TextStyle(
                                color: R.colors.mainTextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 6),
                        QualifyingSegmentStarWidget(
                            qualifying?.curSegment.star ?? 0,
                            qualifying?.curSegment.totalStart ?? 0),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            K.personal_cpk_segment_record([
                              '${qualifying?.numWin ?? 0}',
                              '${qualifying?.numDraw ?? 0}',
                              '${qualifying?.numFail ?? 0}'
                            ]),
                            style: TextStyle(
                                color: R.colors.mainTextColor, fontSize: 11),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          K.personal_cpk_segment_rate([
                            QualifyingUtil.getWinRate(
                                qualifying?.numWin ?? 0,
                                qualifying?.numDraw ?? 0,
                                qualifying?.numFail ?? 0)
                          ]),
                          style: TextStyle(
                              color: R.colors.mainTextColor, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (arrow)
                R.img('ic_next.svg',
                    width: 16,
                    height: 16,
                    color: R.colors.mainTextColor,
                    package: ComponentManager.MANAGER_PROFILE),
              const SizedBox(width: 8),
            ],
          ),
          cornerRadius: 16,
        ));
  }
}
