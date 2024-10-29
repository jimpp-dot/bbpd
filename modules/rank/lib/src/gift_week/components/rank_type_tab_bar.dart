import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/gift_week/model/gift_week_rank_view_model.dart';
import 'package:rank/src/model/pb/generated/gift_week.pb.dart';
import 'package:provider/provider.dart' hide Selector;

/// 排行榜tabbar. 主播榜/平台周星/房间大人物
class RankTypeTabBar extends StatefulWidget {
  /// tab列表数据
  final List<RankTab> tabDataList;

  const RankTypeTabBar({super.key, required this.tabDataList});

  @override
  State<RankTypeTabBar> createState() => _RankTypeTabBarState();
}

class _RankTypeTabBarState extends State<RankTypeTabBar>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final GlobalKey _sliderBarKey = GlobalKey();

  double? _currSliderBarX;

  double _destSliderBarX = 0;

  final List<GlobalKey> _tabBarItemKeys = [];

  late AnimationController _animationController;

  late Animation<double> _animation;

  late double _tabBarItemWidth;

  bool _animated = true;

  @override
  void dispose() {
    _animationController.removeListener(_animationListener);
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    /// 36 = [RankTypeTabBar]的两侧外边距32 + 两侧内边距4
    _tabBarItemWidth = (Util.width - 36) / widget.tabDataList.length;
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController.addListener(_animationListener);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        Future.delayed(const Duration(milliseconds: 300)).then((value) =>
            sliderBarGoToDest(_tabBarItemKeys.first, animated: false));
      }
    });
  }

  _animationListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF830000),
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(4)),
              border: Border.all(color: const Color(0xFFCC3F06)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(1),
              child: Stack(
                children: [
                  IgnorePointer(
                    child: GradientBorderBox(
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                      borderWidth: 1,
                      borderRadius: 3,
                      gradientColors: [
                        Color(0xFF520007),
                        Color(0xFF8C0023),
                        Color(0xFF660A47),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            start: (_currSliderBarX ?? 0) +
                (_destSliderBarX - (_currSliderBarX ?? 0)) *
                    (_animated ? _animation.value : 1),
            child: R.img(
              Assets.gift_week_rank_type_tab_item_bg_webp,
              width: 144 * (Util.width / 375),
              height: 48,
              key: _sliderBarKey,
              fit: BoxFit.fitWidth,
              package: ComponentManager.MANAGER_RANK,
            ),
          ),
          PositionedDirectional(
            start: 16,
            end: 16,
            child: _buildBody(context),
          ),
        ],
      ),
    );
  }

  /// 滑块滑动到指定位置
  sliderBarGoToDest(GlobalKey? destKey, {bool animated = true}) {
    if (destKey == null) return;

    if (mounted) {
      _animated = animated;

      RenderBox? sliderBox;
      RenderBox? destBox;

      final sliderObj = _sliderBarKey.currentContext?.findRenderObject();
      if (sliderObj != null && sliderObj is RenderBox) {
        sliderBox = sliderObj;
      }

      final destObj = destKey.currentContext?.findRenderObject();
      if (destObj != null && destObj is RenderBox) {
        destBox = destObj;
      }

      if (sliderBox != null && destBox != null) {
        _currSliderBarX = sliderBox.localToGlobal(Offset.zero).dx;
        _destSliderBarX = destBox.localToGlobal(Offset.zero).dx;

        /// 计算中心位置
        _destSliderBarX = _destSliderBarX -
            (sliderBox.size.width / 2 - destBox.size.width / 2);

        if (_tabBarItemKeys.last == destKey) {
          _destSliderBarX += 4;
        }

        if (animated) {
          _animationController.reset();
          _animationController.forward();
        } else {
          setState(() {});
        }
      }
    }
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> buildTabItems() {
      List<Widget> list = [];

      _tabBarItemKeys.clear();

      for (var element in widget.tabDataList) {
        list.add(Builder(
          builder: (context) {
            final currRankType = context.select<GiftWeekRankViewModel, int>(
                (value) => value.state.currRankType);
            final tabBarKey = GlobalKey();
            _tabBarItemKeys.add(tabBarKey);
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                context
                    .read<GiftWeekRankViewModel>()
                    .actionForChangeRankType(newType: element.rankType);
                sliderBarGoToDest(tabBarKey);
              },
              child: Container(
                width: _tabBarItemWidth,
                alignment: AlignmentDirectional.center,
                child: _RankTabBarItem(
                  key: tabBarKey,
                  data: element,
                  isSelected: currRankType == element.rankType,
                ),
              ),
            );
          },
        ));
      }

      return list;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...buildTabItems(),
      ],
    );
  }
}

class _RankTabBarItem extends StatelessWidget {
  final RankTab data;

  final bool isSelected;

  const _RankTabBarItem(
      {super.key, required this.data, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Text(
          data.tabName,
          style: R.textStyle.medium16.copyWith(
              color: isSelected
                  ? const Color(0xFFFDF3A1)
                  : const Color(0xFFFFCAA9).withOpacity(0.4)),
        ),
      ),
    );
  }
}
