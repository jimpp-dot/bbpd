import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/common_room_heartrace.pb.dart';

class HeartRaceAwardDialog extends StatelessWidget {
  final String relationTips;
  final HeartRaceAward award;
  const HeartRaceAwardDialog(
      {required this.relationTips, required this.award, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 312,
          constraints: const BoxConstraints(
            maxHeight: 362,
          ),
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsetsDirectional.only(
              start: 16, end: 16, top: 24, bottom: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                K.room_heart_race_award_title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: R.color.mainTextColor,
                ),
              ),
              Container(
                width: 280,
                height: 61,
                margin: const EdgeInsetsDirectional.only(top: 12, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(12),
                  color: R.color.secondBgColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    buildLevelAwardText(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildLevelAwardProcess(),
                  ],
                ),
              ),
              Text(
                K.room_heart_race_award_subtitle(['${award.awardLevel}']),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainTextColor,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              buildAwardList(),
              const SizedBox(
                height: 24,
              ),
              Text(
                K.room_heart_race_award_relation,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainTextColor,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                K.room_heart_race_award_relation_sub([relationTips]),
                style: TextStyle(
                  fontSize: 13,
                  color: R.color.secondTextColor,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAwardList() {
    int length = award.awardIcons.length;
    if (length > award.awardNames.length) {
      length = award.awardNames.length;
    }
    return SizedBox(
      height: 82,
      child: Center(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: 20),
          itemCount: length,
          itemBuilder: (context, index) {
            return buildAwardItem(index);
          },
        ),
      ),
    );
  }

  Widget buildAwardItem(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: R.color.secondBgColor,
          ),
          alignment: AlignmentDirectional.center,
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(award.awardIcons[index]),
            width: 48,
            height: 48,
            cachedWidth: 48,
            cachedHeight: 48,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 60),
          child: Text(
            award.awardNames[index],
            style: TextStyle(
              fontSize: 11,
              color: R.color.secondTextColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLevelAwardText() {
    String text = award.diffNumTips;
    if (Util.validStr(text)) {
      text =
          '$text${K.room_heart_value}${K.room_upgrade}LV.${award.awardLevel}${K.room_award}';
    } else {
      text = 'LV.${award.awardLevel}${K.room_award}';
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        color: R.color.secondTextColor,
      ),
    );
  }

  Widget buildLevelAwardProcess() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 167,
          height: 8,
          child: Stack(
            children: [
              Container(
                width: 167,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.06),
                  borderRadius: BorderRadiusDirectional.circular(4),
                ),
              ),
              Container(
                width: 167.0 * award.progressStart / award.progressEnd,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(4),
                  gradient: const LinearGradient(
                      colors: [Color(0xFFD960FF), Color(0xFF5BE9FF)]),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          '${award.progressStart}/${award.progressEnd}',
          style: TextStyle(
            fontSize: 9,
            color: R.color.secondTextColor,
          ),
        ),
      ],
    );
  }
}
