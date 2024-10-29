import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/model/mounts_list_view_model.dart';
import 'package:personaldata/src/collection_room/widgets/collection_get_dialog.dart';
import 'package:personaldata/src/collection_room/widgets/collection_mounts_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:personaldata/src/collection_room/widgets/show_out_button.dart';
import '../../../widgets/collection_list_box.dart';
import 'package:provider/provider.dart' hide Selector;

/// 单个等级下的座驾列表
class MountsGridWidget extends StatefulWidget {
  final ExhibitIndexData data;

  const MountsGridWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<MountsGridWidget> createState() => _MountsGridWidgetState();
}

class _MountsGridWidgetState extends State<MountsGridWidget> {
  late MountsListViewModel _viewModel;

  late SwiperController _swiperController;

  @override
  void dispose() {
    _viewModel.dispose();
    _swiperController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
    _viewModel = MountsListViewModel(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    if (_viewModel.allItems.isEmpty) return const SizedBox.shrink();

    return ChangeNotifierProvider.value(
      value: _viewModel,
      builder: (context, child) {
        return CollectionListBox(
          levelIcon: widget.data.gradeIcon,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 422,
            ),
            alignment: AlignmentDirectional.topCenter,
            child: Stack(
              alignment: AlignmentDirectional.center,
              clipBehavior: Clip.none,
              children: [
                _buildBottomCenterWidget(),
                _buildDeskWidget(),
                PositionedDirectional(
                  top: 52,
                  child: _TopSwiperPagination(
                    length: _viewModel.allItems.length,
                  ),
                ),

                /// 名称
                const PositionedDirectional(
                  bottom: 134,
                  child: _MountsNameWidget(),
                ),

                /// 座驾组件
                Column(
                  children: [
                    _buildMountsSwiper(context),
                    const SizedBox(
                      height: 72,
                    ),
                  ],
                ),

                /// 对外展示按钮
                const PositionedDirectional(
                  bottom: 74,
                  child: _ShowOutWidget(),
                ),

                /// 左右滑动指示器
                PositionedDirectional(
                  top: 195,
                  start: 20,
                  end: 20,
                  child: _SwiperIndicator(
                    length: _viewModel.allItems.length,
                    controller: _swiperController,
                  ),
                ),

                /// 锁
                const PositionedDirectional(
                  top: 185,
                  child: IgnorePointer(
                    child: _LockWidget(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMountsSwiper(BuildContext context) {
    final itemWidth = Util.width - 40 - 68;
    final itemHeight = itemWidth / 0.71;

    /// 0.71 是Vap视频的宽高比 1072 : 1504

    final itemList =
        context.select<MountsListViewModel, List<ExhibitCommodityItem>>(
            (value) => value.allItems);

    return Container(
      height: 422,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.only(top: 76),
      child: Swiper(
        loop: itemList.length > 1 ? true : false,
        controller: _swiperController,
        itemBuilder: (context, index) {
          final data = itemList[index];
          return GestureDetector(
            onTap: () {
              CollectionGetDialog.show(System.context, data: data);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 84),
              child: CollectionMountsWidget(
                data: data,
                showLock: false,
                // size: 300,
                showPlay: false,
              ),
            ),
          );
        },
        itemHeight: itemHeight,
        itemWidth: itemWidth,
        itemCount: itemList.length,
        onIndexChanged: (index) {
          _viewModel.actionForChangeCurrentShowMounts(index);
        },
      ),
    );
  }

  Widget _buildDeskWidget() {
    return PositionedDirectional(
      bottom: 54,
      child: RepaintBoundary(
        child: R.img(
          'collection_room/car_bottom_desk.webp',
          package: ComponentManager.MANAGER_PERSONALDATA,
          width: 288,
          height: 110,
          cachedWidth: 288.px,
          cachedHeight: 110.px,
        ),
      ),
    );
  }

  Widget _buildBottomCenterWidget() {
    return PositionedDirectional(
      bottom: 0,
      child: RepaintBoundary(
        child: R.img(
          'collection_room/box_bottom_btn_bg1.webp',
          package: ComponentManager.MANAGER_PERSONALDATA,
          width: 96,
          height: 30,
        ),
      ),
    );
  }
}

/// 锁
class _LockWidget extends StatelessWidget {
  const _LockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.select<MountsListViewModel, ExhibitCommodityItem?>(
        (value) => value.currentShowMounts);
    if (data == null || (data.lock.toPbBool() == false))
      return const SizedBox.shrink();

    return Container(
      width: 48,
      height: 48,
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(12)),
        color: Color(0x80000000),
      ),
      child: R.img('collection_room/ic_lock.webp',
          package: ComponentManager.MANAGER_PERSONALDATA,
          width: 24,
          height: 24),
    );
  }
}

/// 座驾名称
class _MountsNameWidget extends StatelessWidget {
  const _MountsNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.select<MountsListViewModel, ExhibitCommodityItem?>(
        (value) => value.currentShowMounts);
    if (data == null) return const SizedBox.shrink();

    return Text(
      data.name,
      style: R.textStyle.medium16.copyWith(color: Colors.white),
    );
  }
}

/// 对外展示按钮
class _ShowOutWidget extends StatelessWidget {
  const _ShowOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.select<MountsListViewModel, ExhibitCommodityItem?>(
        (value) => value.currentShowMounts);
    if (data == null) return const SizedBox.shrink();

    return ShowOutButton(
      width: 120,
      height: 48,
      fontSize: 16,
      isEnable: !data.lock.toPbBool(),
      hasShowed: data.pinned.toPbBool(),
      onTap: () {
        context
            .read<MountsListViewModel>()
            .actionForCurrentMountsShowOutOrNot();
      },
    );
  }
}

/// 左右滑动指示器
class _SwiperIndicator extends StatelessWidget {
  final int length;

  final SwiperController controller;

  const _SwiperIndicator(
      {Key? key, required this.length, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemList =
        context.select<MountsListViewModel, List<ExhibitCommodityItem>>(
            (value) => value.allItems);

    if (itemList.length <= 1) return const SizedBox.shrink();

    return SizedBox(
      height: 30,
      child: Row(
        children: [
          _indicatorBtn(true),
          const Spacer(),
          _indicatorBtn(false),
        ],
      ),
    );
  }

  Widget _indicatorBtn(bool isLeft) {
    return GestureDetector(
      onTap: () {
        if (isLeft) {
          controller.previous(animation: true);
        } else {
          controller.next(animation: true);
        }
      },
      child: SizedBox(
        width: 23,
        height: 30,
        child: RotatedBox(
          quarterTurns: isLeft ? 0 : 2,
          child: R.img(
            'collection_room/indicator_left.webp',
            package: ComponentManager.MANAGER_PERSONALDATA,
          ),
        ),
      ),
    );
  }
}

/// 顶部分页显示器
class _TopSwiperPagination extends StatelessWidget {
  final int length;

  const _TopSwiperPagination({Key? key, required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currIndex = context
        .select<MountsListViewModel, int>((value) => value.currentShowIndex);
    final pageIndex = currIndex + 1;

    final TextStyle textStyle =
        R.textStyle.regular12.copyWith(fontSize: 11, color: Colors.white);

    return Container(
      width: 40,
      height: 20,
      decoration: const BoxDecoration(
        color: Color(0x80000000),
        borderRadius: BorderRadiusDirectional.all(Radius.circular(6)),
      ),
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$pageIndex',
            style: textStyle,
          ),
          Text(
            '/$length',
            style: textStyle.copyWith(color: Colors.white.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}
