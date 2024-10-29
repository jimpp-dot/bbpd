import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/gift_week/model/gift_week_rank_view_model.dart';
import 'package:rank/src/model/pb/generated/gift_week.pb.dart';

import 'gift_user_rank_list_item.dart';
import 'gift_week_empty_widget.dart';
import 'package:provider/provider.dart' hide Selector;

double _giftRankListItemHeight = 72;

/// 礼物用户排行
/// 礼物列表 + 单个礼物下排行列表
class GiftUserRankListView extends StatefulWidget {
  /// 上周礼物列表
  final List<GiftObj>? lastWeekGiftList;

  /// 本周礼物列表
  final List<GiftObj>? thisWeekGiftList;

  final int? currRankType;

  const GiftUserRankListView(
      {super.key,
      this.thisWeekGiftList,
      this.lastWeekGiftList,
      this.currRankType});

  @override
  State<GiftUserRankListView> createState() => _GiftUserRankListViewState();
}

class _GiftUserRankListViewState extends State<GiftUserRankListView>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void dispose() {
    _tabController?.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 548),
      decoration: const BoxDecoration(
        color: Color(0xFF520007),
        borderRadius: BorderRadiusDirectional.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.all(1),
      clipBehavior: Clip.hardEdge,
      child: GradientBorderBox(
        gradientColors: const [
          Color(0xFFCC3F06),
          Color(0xFFCC3F06),
        ],
        borderRadius: 4,
        borderWidth: 1,
        child: Column(
          children: [
            _buildWeekTabBar(), // 44px
            _buildGiftList(context), // 144px
            _buildUserRankList(context),
          ],
        ),
      ),
    );
  }

  /// 本周/上周TabBar
  Widget _buildWeekTabBar() {
    if (Util.isCollectionEmpty(widget.lastWeekGiftList))
      return const SizedBox.shrink();

    int week = context
        .select<GiftWeekRankViewModel, int>((value) => value.state.currWeek);

    if (_tabController != null) {
      _tabController?.dispose();
    }
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: week == 1 ? 0 : 1);

    return Container(
      height: 44,
      color: const Color(0xFF830000),
      alignment: AlignmentDirectional.center,
      child: CommonTabBar(
        controller: _tabController,
        tabs: [
          Container(
            height: 36,
            color: const Color(0xFF830000),
            alignment: AlignmentDirectional.center,
            child: Tab(
              text: K.this_week,
            ),
          ),
          Container(
            height: 36,
            color: const Color(0xFF830000),
            alignment: AlignmentDirectional.center,
            child: Tab(
              text: K.last_week,
            ),
          ),
        ],
        labelColor: const Color(0xFFFFCAA9),
        labelStyle: R.textStyle.medium16,
        unselectedLabelColor: const Color(0xFFFFCAA9).withOpacity(0.4),
        unselectedLabelStyle: R.textStyle.medium16,
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: false,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 4, color: Color(0xFFFFCAA9)),
        ),
        onTap: (index) {
          context
              .read<GiftWeekRankViewModel>()
              .actionForChangeWeek(index == 0 ? 1 : 2);
        },
      ),
    );
  }

  /// 礼物列表
  Widget _buildGiftList(BuildContext context) {
    List<GiftObj>? giftObjs = [];

    int week = context
        .select<GiftWeekRankViewModel, int>((value) => value.state.currWeek);
    if (week == 1) {
      giftObjs = widget.thisWeekGiftList;
    } else {
      giftObjs = widget.lastWeekGiftList;
    }
    // if (giftObjs!.length <= 4) {
    //   giftObjs.add(giftObjs.last);
    // }

    if (Util.isCollectionEmpty(giftObjs)) return const GiftWeekEmptyWidget();

    int selectedGiftId = context.select<GiftWeekRankViewModel, int>(
        (value) => value.state.selectedGiftId);
    if (selectedGiftId <= 0) return const GiftWeekEmptyWidget();

    return Container(
      height: 144,
      alignment: AlignmentDirectional.topCenter,
      decoration: BoxDecoration(
        color: const Color(0xFF520007),
        borderRadius: BorderRadiusDirectional.circular(3),
      ),
      padding: const EdgeInsetsDirectional.only(top: 23, bottom: 12),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final giftObj = giftObjs![index];

          return _GiftListItem(
            data: giftObj,
            isSelected: giftObj.giftId == selectedGiftId,
            onTap: () {
              if (selectedGiftId != giftObj.giftId) {
                setState(() {
                  context
                      .read<GiftWeekRankViewModel>()
                      .actionForChangeSelectedGiftId(giftId: giftObj.giftId);
                });
              }
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 7,
          );
        },
        itemCount: giftObjs?.length ?? 0,
        padding: const EdgeInsetsDirectional.only(start: 15, end: 15),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  /// 当前礼物下的用户排行
  Widget _buildUserRankList(BuildContext context) {
    final isLoading = context.select<GiftWeekRankViewModel, bool>(
        (value) => value.isGiftRankListLoading);
    if (isLoading) {
      return const Center(
        child: Loading(
          label: '',
        ),
      );
    }

    final requestListRes =
        context.select<GiftWeekRankViewModel, GiftRankListRes?>(
            (value) => value.state.requestGiftRankListRes);
    if (requestListRes == null) {
      return const Padding(
        padding: EdgeInsets.only(top: 53),
        child: GiftWeekEmptyWidget(),
      );
    }

    if (!requestListRes.success) {
      return ErrorData(
        error: requestListRes.msg,
        onTap: () => context
            .read<GiftWeekRankViewModel>()
            .actionForChangeSelectedGiftId(),
      );
    }

    final giftRankList = requestListRes.data.rankList;

    if (Util.isCollectionEmpty(giftRankList)) {
      return const Padding(
        padding: EdgeInsets.only(top: 53),
        child: GiftWeekEmptyWidget(),
      );
    }

    return SizedBox(
      height: giftRankList.length * _giftRankListItemHeight,

      /// 计算具体高度
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: giftRankList.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          final data = giftRankList[index];
          return UserRankItem(
            data: data,
            index: index,
            height: _giftRankListItemHeight,
            bgColor: index % 2 == 0 ? const Color(0x14FFFFFF) : null,
            currRankType: widget.currRankType,
          );
        },
      ),
    );
  }
}

/// 礼物Item
class _GiftListItem extends StatefulWidget {
  final GiftObj data;

  final bool isSelected;

  final VoidCallback? onTap;

  const _GiftListItem(
      {Key? key, required this.data, this.isSelected = false, this.onTap})
      : super(key: key);

  @override
  State<_GiftListItem> createState() => _GiftListItemState();
}

class _GiftListItemState extends State<_GiftListItem>
    with TickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _animationController;

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.removeListener(_animationListener);
    _animationController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _animationController.addListener(_animationListener);
    _animation =
        Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut));

    if (widget.isSelected) {
      _animationController.forward();
    }
  }

  _animationListener() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant _GiftListItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isSelected) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(),
      child: SizedBox(
        width: 74,
        height: 109,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          alignment: AlignmentDirectional.center,
          children: [
            PositionedDirectional(
              top: 0,
              child: Container(
                width: 72,
                height: 96,
                decoration: const BoxDecoration(
                  color: Color(0xFF380005),
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(4)),
                ),
              ),
            ),
            Container(
              width: 74,
              height: 109,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: SlideTransition(
                position: _animation,
                child: R.img(Assets.gift_week_selected_gift_bg_webp,
                    package: ComponentManager.MANAGER_RANK),
              ),
            ),
            PositionedDirectional(
              top: 0,
              child: SizedBox(
                width: 72,
                height: 96,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.all(8),
                      child: CachedNetworkImage(
                        imageUrl: Util.parseIcon(widget.data.giftIcon),
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      widget.data.giftName,
                      style: R.textStyle.medium12.copyWith(
                          color: widget.isSelected
                              ? const Color(0xFFFFAD7A)
                              : const Color(0xFFCC3F06)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
