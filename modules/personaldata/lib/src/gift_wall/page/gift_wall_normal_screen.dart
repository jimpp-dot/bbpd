import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/gift_wall/model/gift_wall_api.dart';
import 'package:personaldata/src/gift_wall/page/gift_wall_list_screen.dart';

import '../widget/gift_wall_item_widget.dart';

class GiftWallNormalScreen extends StatefulWidget {
  final int targetUid;
  final ChatRoomData? room;
  final VoidCallback? giftCountChange;
  final ScrollController? scrollController;
  final int tabId;

  const GiftWallNormalScreen(
      {Key? key,
      required this.targetUid,
      this.room,
      this.giftCountChange,
      this.scrollController,
      this.tabId = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => GiftWallNormalState();
}

class GiftWallNormalState extends State<GiftWallNormalScreen>
    with AutomaticKeepAliveClientMixin, BaseScreenStateMixin {
  PageController? _pageController;
  ScrollController? _tabController;

  final List<GiftWallTabItem> _tabs = [];
  final List<Widget> _pagesWidget = [];

  int _curIndex = 0;

  int get curIndex => _curIndex;

  List<GiftWallItem>? _data;

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.click,
        properties: {'click_page': 'click_forever_collect'});
    _load();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    GiftWallListRes rsp =
        await GiftWallApi.getBBGiftWallListResp(widget.targetUid);
    if (rsp.success) {
      _data = rsp.data;
      _tabs.clear();
      _tabs.addAll(rsp.tabs);
      if (_tabs.length > 1) {
        _pagesWidget.clear();
        _tabs.forEachIndexed((i, e) {
          if (e.tabId == widget.tabId) {
            _curIndex = i;
          }
          _pagesWidget.add(NestedScrollViewInnerScrollPositionKeyWidget(
              Key('GiftWallTab_1$i'),
              GiftWallListScreen(
                widget.targetUid,
                widget.room,
                giftCountChange: widget.giftCountChange,
                scrollController: widget.scrollController,
                tabId: e.tabId,
                data: (i == 0) ? _data : null,
              )));
        });
        _tabController = ScrollController();
        _pageController = PageController(initialPage: curIndex, keepPage: true);
      }
      setScreenReady();
      Future.delayed(const Duration(milliseconds: 300), () => _tabAutoScroll());
    } else {
      setScreenError();
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return buildStatusContent();
  }

  @override
  Widget buildContent() {
    if (_tabs.length > 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTabBar(),
          const SizedBox(height: 8),
          Expanded(child: _buildPage()),
        ],
      );
    }
    return NestedScrollViewInnerScrollPositionKeyWidget(
      const Key('GiftWallTab_10'),
      GiftWallListScreen(
        widget.targetUid,
        widget.room,
        giftCountChange: widget.giftCountChange,
        scrollController: widget.scrollController,
        data: _data,
      ),
    );
  }

  Widget _buildPage() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: _pagesWidget,
    );
  }

  Widget _buildTabBar() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ListView.separated(
        controller: _tabController,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _tabs.length,
        itemBuilder: (context, index) {
          return _buildTabItem(_tabs[index], index);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 4);
        },
      ),
    );
  }

  final double _itemWidth = 107;

  Widget _buildTabItem(GiftWallTabItem item, int index) {
    bool start = index == 0;
    bool end = index == _tabs.length - 1;

    bool selected = _curIndex == index;
    return GestureDetector(
      onTap: () {
        if (_curIndex != index) {
          if (item.event.isNotEmpty) {
            Tracker.instance.track(TrackEvent.click,
                properties: {'click_page': item.event});
          }
          _onTabSelected(index);
          _tabAutoScroll();
        }
      },
      child: Container(
        width: _itemWidth,
        height: 48,
        margin: EdgeInsetsDirectional.only(
            start: start ? 20 : 0, end: end ? 20 : 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.imagePath(
                selected
                    ? 'mate/gift_wall/ic_gift_wall_tab_bg_l.webp'
                    : 'mate/gift_wall/ic_gift_wall_tab_bg.webp',
                package: ComponentManager.MANAGER_PERSONALDATA)),
            fit: BoxFit.cover,
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorFiltered(
              colorFilter: selected
                  ? const ColorFilter.mode(Colors.transparent, BlendMode.color)
                  : greyscale,
              child: CachedNetworkImage(
                  imageUrl: item.icon, width: 30, height: 30),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item.title,
                    style: TextStyle(
                        color: selected
                            ? Colors.white
                            : Colors.white.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text('${item.cur}/${item.total}',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 9)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _tabAutoScroll() async {
    _tabController?.animateTo(_itemWidth * (curIndex - 1),
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  void _onTabSelected(int index) async {
    _curIndex = index;
    _pageController?.jumpToPage(index);
    refresh();
  }

  @override
  bool get wantKeepAlive => true;
}
