import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rank/src/gift_week/components/gift_user_rank_list_item.dart';
import 'package:rank/src/gift_week/components/rank_rule_widget.dart';
import 'package:rank/src/gift_week/components/rank_type_tab_bar.dart';
import 'package:rank/src/gift_week/components/rank_type_tab_page.dart';
import 'package:rank/src/gift_week/model/gift_week_rank_view_model.dart';
import 'package:rank/src/model/pb/generated/gift_week.pb.dart';
import 'package:provider/provider.dart' hide Selector;

/// 礼物周星榜页面
class GiftWeekRankPage extends StatefulWidget {
  final int? rid;

  const GiftWeekRankPage({super.key, this.rid});

  static show(BuildContext context, {int? rid}) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return GiftWeekRankPage(
          rid: rid,
        );
      }),
    );
  }

  @override
  State<GiftWeekRankPage> createState() => _GiftWeekRankPageState();
}

class _GiftWeekRankPageState extends State<GiftWeekRankPage> {
  late GiftWeekRankViewModel _viewModel;

  @override
  void dispose() {
    _viewModel.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _viewModel = GiftWeekRankViewModel(rid: widget.rid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: ChangeNotifierProvider<GiftWeekRankViewModel>.value(
        value: _viewModel,
        builder: (context, child) {
          return Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              /// 背景
              _buildBackground(context),

              /// body
              Scaffold(
                backgroundColor: Colors.transparent,
                body: _buildBody(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    final configRes = context.select<GiftWeekRankViewModel, GiftRankConfigRes?>(
        (value) => value.state.requestRankConfigRes);

    return Container(
      alignment: AlignmentDirectional.center,
      color: const Color(0xFF200000),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          if (configRes != null && configRes.success)
            AspectRatio(
              aspectRatio: 375 / 95,
              child: CachedNetworkImage(
                imageUrl: Util.parseIcon(configRes.data.backgroundBottom),
                fit: BoxFit.fitWidth,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMyRank(BuildContext context) {
    final pbRes = context.select<GiftWeekRankViewModel, GiftRankListRes?>(
        (value) => value.state.requestGiftRankListRes);
    if (pbRes == null || !pbRes.success || !pbRes.data.hasMyRank())
      return const SizedBox.shrink();

    final myRank = pbRes.data.myRank;

    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(8), topEnd: Radius.circular(8)),
          gradient: LinearGradient(
            colors: [
              Color(0xFF820362),
              Color(0xFF490632),
            ],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -1.5),
              blurRadius: 0,
              spreadRadius: 0,
              color: Color(0xFFCC3F06),
            ),
          ]),
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom, left: 18, right: 16),
      child: UserRankItem(
        data: RankList(
          uid: myRank.uid,
          name: myRank.name,
          giftNum: myRank.giftNum,
          icon: myRank.icon,
        ),
        index: (myRank.rank - 1 < 0) ? 0 : myRank.rank - 1,
        height: 72,
        currRankType: _viewModel.currRankType(),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    bool isPageLoading = context
        .select<GiftWeekRankViewModel, bool>((value) => value.isPageLoading);
    if (isPageLoading) {
      return const Center(
        child: Loading(
          label: '',
        ),
      );
    }

    final configRes = context.select<GiftWeekRankViewModel, GiftRankConfigRes?>(
        (value) => value.state.requestRankConfigRes);
    if (configRes == null) {
      return const Center(
        child: Loading(
          label: '',
        ),
      );
    }
    if (!configRes.success) {
      return ErrorData(
        onTap: () {
          _viewModel.actionForChangeRankType();
        },
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 72 + 16),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.topCenter,
                children: [
                  PositionedDirectional(
                    start: 0,
                    end: 0,
                    top: 0,
                    child: AspectRatio(
                      aspectRatio: 375 / 370,
                      child: CachedNetworkImage(
                        imageUrl: Util.parseIcon(configRes.data.background),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 215 + MediaQuery.of(context).padding.top,
                      ),
                      if (!Util.isCollectionEmpty(configRes.data.rankTab))
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: RankTypeTabBar(
                              tabDataList: configRes.data.rankTab),
                        ),
                      const RankTypeTabPage(),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          bottom: 0,
          child: _buildMyRank(context),
        ),
        PositionedDirectional(
          top: MediaQuery.of(context).padding.top + 30,
          end: 0,
          child: RankRuleWidget(
            onTap: () => _viewModel.actionForShowRuleWebPage(),
          ),
        ),
        PositionedDirectional(
          top: MediaQuery.of(context).padding.top,
          start: 0,
          child: const BaseAppBarBackButton(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
