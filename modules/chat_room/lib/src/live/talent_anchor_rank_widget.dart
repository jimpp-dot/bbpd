import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/live/model/live_repository.dart';
import 'package:chat_room/src/live/talent_anchor_rank_sub_widget.dart';
import 'package:flutter/material.dart';

import '../protobuf/generated/live.pb.dart';

/// 优质才艺主播展示
class TalentAnchorRankWidget extends StatefulWidget {
  final int type;

  const TalentAnchorRankWidget(this.type, {super.key});

  @override
  State<StatefulWidget> createState() => _TalentAnchorRankState();

  static void show(BuildContext context, int type) async {
    await displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      defineBarrierColor: Colors.black.withOpacity(0.2),
      maxHeightRatio: 1,
      builder: (context) {
        return TalentAnchorRankWidget(type);
      },
    );
  }
}

class _TalentAnchorRankState extends State<TalentAnchorRankWidget>
    with BaseScreenStateMixin {
  final List<Widget> _pagesWidget = [];
  final List<LiveTagItem> _tabs = [];

  PageController? _pageController;
  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadTabList();
  }

  void _loadTabList() async {
    ResLiveTagTab res = await LiveRepository.getTalentAnchorRankTabList();
    if (res.success && res.data.isNotEmpty == true) {
      _tabs.clear();
      _pagesWidget.clear();

      _tabs.addAll(res.data);
      _tabs.forEachIndexed((index, element) {
        if (element.id == widget.type) {
          _curIndex = index;
        }
        _pagesWidget.add(TalentAnchorRankSubWidget(element.id));
      });
      _pageController = PageController(initialPage: _curIndex, keepPage: true);
      setScreenReady();
    } else {
      setScreenError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(16), topEnd: Radius.circular(16))
          .resolve(TextDirection.ltr),
      child: Container(
        width: Util.width,
        height: Util.height * 0.75,
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [Color(0xFFCB61FF), Color(0xFF5AC8FC)],
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(
                  'static/room/ic_talent_anchor_rank_bg.webp'),
              width: Util.width,
              fit: BoxFit.fitWidth,
            ),
            R.img(
              RoomAssets.chat_room$live_ic_talent_anchor_rank_top_webp,
              height: 68,
              fit: BoxFit.fitHeight,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
            PositionedDirectional(
              end: 16,
              top: 28,
              child: InkWell(
                onTap: () {
                  BaseWebviewScreen.show(context,
                      url: Util.getHelpUrlWithQStr('k96'));
                },
                child: R.img(
                  RoomAssets.chat_room$ic_help_svg,
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                  color: Colors.white.withOpacity(0.6),
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
            buildStatusContent(),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 52),
          Text(
            K.room_talent_anchor_rank_title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 20),
          _buildTabBar(),
          const SizedBox(height: 14),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _pagesWidget,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 32,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white.withOpacity(0.4), width: 1),
        ),
      ),
      padding: const EdgeInsets.all(2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: _tabs.mapIndexed((i, e) => _buildTabItem(e.name, i)).toList(),
      ),
    );
  }

  Widget _buildTabItem(String tabLabel, int index) {
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Container(
        height: 28,
        decoration: ShapeDecoration(
          color: _curIndex == index ? Colors.white : Colors.transparent,
          shape: const StadiumBorder(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Text(
          tabLabel,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: _curIndex == index
                ? const Color(0xFF8383FF)
                : Colors.white.withOpacity(0.4),
          ),
        ),
      ),
    );
  }

  void _onTabSelected(int index) async {
    _curIndex = index;
    _pageController?.jumpToPage(index);
    refresh();
  }
}
