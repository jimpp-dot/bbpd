import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/gift_week/components/gift_user_rank_list_view.dart';
import 'package:rank/src/gift_week/components/last_week_champion_title_bar.dart';
import 'package:rank/src/gift_week/components/last_week_star_user_list_view.dart';
import 'package:rank/src/model/pb/generated/gift_week.pb.dart';
import 'package:provider/provider.dart' hide Selector;

import '../model/gift_week_rank_view_model.dart';

/// 礼物周星榜排行榜类型Tab页
/// 包含[LastWeekChampionTitleBar] 上周冠军Bar 、 上榜用户、和礼物排行榜列表
class RankTypeTabPage extends StatefulWidget {
  const RankTypeTabPage({super.key});

  @override
  State<RankTypeTabPage> createState() => _RankTypeTabPageState();
}

class _RankTypeTabPageState extends State<RankTypeTabPage> {
  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<GiftWeekRankViewModel, bool>(
        (value) => value.isRankConfigLoading);
    if (isLoading) {
      return const Center(
        child: Loading(
          label: '',
        ),
      );
    }

    final configRes = context.select<GiftWeekRankViewModel, GiftRankConfigRes?>(
        (value) => value.state.requestRankConfigRes);
    final currRankType = context.select<GiftWeekRankViewModel, int>(
        (value) => value.state.currRankType);
    if (configRes == null || !configRes.success) {
      return ErrorData(
        onTap: () =>
            context.read<GiftWeekRankViewModel>().actionForChangeRankType(),
      );
    }

    return Column(
      children: [
        if (!Util.isCollectionEmpty(configRes.data.weekStar))
          Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Builder(
              builder: (context) {
                return LastWeekChampionTitleBar(
                  rankType: currRankType,
                );
              },
            ),
          ),
        if (!Util.isCollectionEmpty(configRes.data.weekStar))
          Padding(
            padding: const EdgeInsets.only(bottom: 19),
            child: SizedBox(
              width: Util.width,
              child: LastWeekStarUserListView(
                weekStarList: configRes.data.weekStar,
                currRankType: currRankType,
              ),
            ),
          ),
        Container(
          width: Util.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GiftUserRankListView(
            thisWeekGiftList: configRes.data.thisWeekGifts,
            lastWeekGiftList: configRes.data.lastWeekGifts,
            currRankType: currRankType,
          ),
        ),
      ],
    );
  }
}
