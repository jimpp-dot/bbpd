import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/entity/pk_rank_beans.dart';

import 'pk_win_streak_widget.dart';

class BottomAnchorPkInfo extends StatelessWidget {
  final PkAnchorInfoItem? item;
  final int? maxRank;
  final PageRefer? refer;

  const BottomAnchorPkInfo({super.key, this.item, this.maxRank, this.refer});

  @override
  Widget build(BuildContext context) {
    if (item == null || maxRank == null) return Container();
    return Container(
        width: Util.width,
        height: 76 + Util.iphoneXBottom,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(12), topEnd: Radius.circular(12)),
          border: Border.all(color: R.color.dividerColor, width: 1),

          // boxShadow: const [
          //   BoxShadow(s
          //     color: Color(0x21000000),
          //     offset: Offset(0, 2),
          //     blurRadius: 16,
          //   )
          // ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  const SizedBox(
                    width: 14,
                  ),
                  _buildIndex(),
                  const SizedBox(
                    width: 4,
                  ),
                  _buildHeaderInfo(context),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUserInfo(),
                      const SizedBox(
                        height: 4,
                      ),
                      _buildPkInfo(),
                    ],
                  ),
                  const Spacer(),
                  _buildIntegralInfo(),
                ],
              ),
            ),
            SizedBox(
              height: Util.iphoneXBottom,
            )
          ],
        ));
  }

  _buildIndex() {
    String index =
        (item?.order == 0 || item?.order == null || item!.order > maxRank!)
            ? '$maxRank+'
            : '${item?.order ?? ''}';
    return Container(
      height: 23,
      constraints: const BoxConstraints(minWidth: 28),
      alignment: Alignment.center,
      child: Text(index,
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          )),
    );
  }

  _buildHeaderInfo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, item!.uid, refer: refer);
      },
      child: CommonAvatar(
        path: item!.icon,
        size: 52,
        shape: BoxShape.circle,
      ),
    );
  }

  _buildUserInfo() {
    return Row(
      children: [
        Text(
          item?.name ?? '',
          maxLines: 1,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(
          width: 4,
        ),
        PkWinStreakWidget(number: item!.winStreak),
      ],
    );
  }

  _buildPkInfo() {
    return Row(
      children: [
        Text(
          '${K.pk_number}：',
          style: TextStyle(fontSize: 13, color: Colors.black),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          '${item!.total}',
          style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: Util.numFontFamily,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          '${K.pk_win_rate}：',
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          _getWinRateString(),
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontFamily: Util.numFontFamily,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  _buildIntegralInfo() {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 16),
      child: Text(
        '${item!.score}',
        style: const TextStyle(fontSize: 14, color: Color(0xFFFF0065)),
      ),
    );
  }

  _getWinRateString() {
    int winNumber = item?.winNumber ?? 0;
    int totalNumber = item?.total ?? 0;
    if (totalNumber == 0) {
      return "0%";
    } else {
      return '${(100 * winNumber / totalNumber).toStringAsFixed(0)}%';
    }
  }
}
