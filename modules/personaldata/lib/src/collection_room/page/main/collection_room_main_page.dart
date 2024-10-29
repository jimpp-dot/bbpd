import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/collection_room_util.dart';
import 'package:personaldata/src/collection_room/model/collection_room_main_view_model.dart';
import 'package:personaldata/src/collection_room/page/main/avatar_frame_tab_bar_view.dart';
import 'package:personaldata/src/collection_room/page/main/mounts_tab_bar_view.dart';
import 'package:provider/provider.dart' hide Selector;

/// 收藏室主页
class CollectionRoomMainPage extends StatefulWidget {
  final int targetUid;

  const CollectionRoomMainPage({Key? key, required this.targetUid})
      : super(key: key);

  @override
  State<CollectionRoomMainPage> createState() => _CollectionRoomMainPageState();
}

class _CollectionRoomMainPageState extends State<CollectionRoomMainPage>
    with TickerProviderStateMixin {
  late CollectionRoomMainViewModel _viewModel;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _viewModel = CollectionRoomMainViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _tabController?.removeListener(_onTabControllerListener);
    _tabController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CollectionRoomMainViewModel>.value(
            value: _viewModel),
      ],
      builder: (context, child) {
        return Stack(
          children: [
            const _BackgroundWidget(),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: BaseAppBar.custom(
                statusBrightness: Brightness.dark,
                backgroundColor: Colors.transparent,
                leading: const BaseAppBarBackButton(
                  color: Colors.white,
                ),
                title: Text(
                  '收藏室',
                  style: R.textStyle.medium18.copyWith(color: Colors.white),
                ),
              ),
              body: Builder(
                builder: (context) {
                  final isRequesting =
                      context.select<CollectionRoomMainViewModel, bool>(
                          (value) => value.isRequesting);

                  final tabRes = context.select<CollectionRoomMainViewModel,
                      ResExhibitTab?>((value) => value.tabRes);
                  if (tabRes == null && !isRequesting) {
                    return Center(
                      child: ErrorData(
                        onTap: () => _viewModel.actionForRefresh(),
                      ),
                    );
                  }

                  return CollectionRoomRequestingWidget(
                    isRequesting: isRequesting,
                    child: tabRes == null
                        ? const SizedBox.expand()
                        : _buildBody(context, tabRes),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, ResExhibitTab tabRes) {
    if (!tabRes.success) {
      return const Center(
        child: EmptyWidget(textColor: Colors.white),
      );
    }
    var tabList = tabRes.data
        .map((e) => Tab(
              text: e.name,
            ))
        .toList();

    if (_tabController != null) {
      _tabController?.removeListener(_onTabControllerListener);
    }

    // int curIndex = context.select<CollectionRoomMainViewModel,int>((value) => value.curTabIndex);

    int curIndex = _viewModel.curTabIndex;

    safeRun(
      () => _tabController = ExtendedTabController(
          length: tabList.length, vsync: this, initialIndex: curIndex)
        ..addListener(_onTabControllerListener),
    );

    List<Widget> tabPages = tabRes.data.map((e) {
      if (e.type.isMountsType) {
        return const MountsTabBarView();
      } else {
        return AvatarFrameTabBarView(type: e.type);
      }
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTabBar(
          tabs: tabList,
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const CommonUnderlineTabIndicator(
            insets: EdgeInsetsDirectional.only(bottom: 4),
            wantWidth: 16,
            draggingWidth: 12.0,
          ),
          marginStart: 10,
          labelColor: Colors.white,
          labelStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          unselectedLabelColor: const Color(0x99FFFFFF),
          unselectedLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0x99FFFFFF)),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: tabPages,
          ),
        ),
      ],
    );
  }

  _onTabControllerListener() {
    if (_tabController == null) return;

    if (!(_tabController!.indexIsChanging)) {
      _viewModel.actionForChangeTabIndex(_tabController!.index);
    }
  }
}

class _BackgroundWidget extends StatelessWidget {
  const _BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1D0B6F),
                Color(0xFF51179F),
              ],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x0051179F),
                  Color(0xFF2C2499),
                ],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
          ),
        ),
        PositionedDirectional(
          top: 0,
          start: 0,
          end: 0,
          child: R.img('collection_room/room_bg_top.png',
              package: ComponentManager.MANAGER_PERSONALDATA, fit: BoxFit.fill),
        ),
      ],
    );
  }
}

class CollectionRoomRequestingWidget extends StatelessWidget {
  final Widget child;

  final bool isRequesting;

  const CollectionRoomRequestingWidget({
    Key? key,
    required this.child,
    this.isRequesting = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isRequesting)
          Positioned.fill(
            child: SizedBox.expand(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: const Loading(
                    label: '',
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
