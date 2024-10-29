import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import '../../../assets.dart';
import 'achievement_rank_sub_page.dart';

/// 成就墙榜单
class AchievementWallRankScreen extends StatefulWidget {
  final PageRefer refer = const PageRefer('AchievementWallRank');

  const AchievementWallRankScreen({Key? key}) : super(key: key);

  @override
  State<AchievementWallRankScreen> createState() =>
      _AchievementWallRankScreenState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AchievementWallRankScreen(),
        settings: const RouteSettings(name: '/AchievementWallRankScreen'),
      ),
    );
  }
}

class _AchievementWallRankScreenState extends State<AchievementWallRankScreen> {
  int _segmentSelectedIndex = 0;
  final List<Widget> _pages = [];
  final List<String> _tabs = [
    K.personaldata_achievement_wall_rank_tab_friend,
    K.personaldata_achievement_wall_rank_tab_all
  ];
  late PageController _pageController;
  final ValueNotifier<double> _headerOpacity = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    _loadData();
    _pageController =
        PageController(initialPage: _segmentSelectedIndex, keepPage: true);
  }

  void _loadData() {
    _pages.add(
      KeepAliveWrapper(
        child: AchievementRankSubPage(
          tab: 1,
          refer: widget.refer,
          scrolled: _onChildScrolled,
        ),
      ),
    );
    _pages.add(
      KeepAliveWrapper(
        child: AchievementRankSubPage(
          tab: 2,
          refer: widget.refer,
          scrolled: _onChildScrolled,
        ),
      ),
    );
  }

  _onChildScrolled(double progress) {
    _headerOpacity.value = 1 - progress;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      color: const Color(0xFF1D1D2B),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
              top: 0,
              child: ValueListenableBuilder<double>(
                  valueListenable: _headerOpacity,
                  builder: (context, value, child) {
                    return Opacity(
                        opacity: value,
                        child: R.img(
                            Assets
                                .personaldata$achievement_wall_achieve_rank_header_webp,
                            width: Util.width,
                            height: 160.dp,
                            fit: BoxFit.fitHeight));
                  })),
          Positioned(
            child: Column(
              children: [
                BaseAppBar.custom(
                  backgroundColor: Colors.transparent,
                  backColor: Colors.white,
                  statusBrightness: Brightness.dark,
                  title: Text(
                    K.personaldata_achievement_wall_medal_rank,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 48,
                  child: Center(
                    child: Container(
                      width: 102.0 * _pages.length,
                      height: 32,
                      padding: const EdgeInsetsDirectional.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < _pages.length; i++)
                            _buildTabItem(i)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _pages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _pages[index];
                    },
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: MediaQuery.of(context).padding.top + 12,
            end: 16,
            child: GestureDetector(
              onTap: () {
                BaseWebviewScreen.show(context,
                    url: Util.parseActHelpUrl("achievementwall"));
              },
              child: R.img(
                'ic_accost_rank_help.svg',
                package: ComponentManager.MANAGER_MESSAGE,
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index) {
    String name = _tabs[index];
    return GestureDetector(
      onTap: () {
        _switchPage(index);
      },
      child: Container(
        width: 96,
        height: 28,
        decoration: BoxDecoration(
          color: _segmentSelectedIndex == index
              ? Colors.white
              : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                color: _segmentSelectedIndex == index
                    ? Colors.black
                    : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  void _switchPage(int index) {
    setState(() {
      _segmentSelectedIndex = index;
      _pageController.animateToPage(
        _segmentSelectedIndex,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 200),
      );
    });
  }
}
