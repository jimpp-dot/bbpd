import 'dart:ui';

import 'package:shared/shared.dart' hide SliverAppBar;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/api/topic_api.dart';
import 'package:moment/src/page/topic_square_page.dart';

/// 话题详情页
class TopicDetailScreen extends StatefulWidget {
  final int tagId; // 话题id
  final String tagName; // 话题名称

  const TopicDetailScreen(
      {super.key, required this.tagId, required this.tagName});

  static Future openTopicDetailScreen(BuildContext context,
      {Key? key, required int tagId, required String tagName}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return TopicDetailScreen(key: key, tagId: tagId, tagName: tagName);
        },
        settings: const RouteSettings(name: '/TopicDetailScreen'),
      ),
    );
  }

  @override
  _TopicDetailScreenState createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen>
    with TickerProviderStateMixin {
  final double cornerHeight = 12;
  final double kTabBarHeight = 44; // tab栏高度
  final double photoHeaderHeight = 220; // 背景图片高度

  bool _loading = true;
  String? _errorMessage;

  late ScrollController _scrollController;

  late List<_TabItem> _tabs;
  late TabController _tabController;
  bool _isExpanded = true;

  TagInfo? _tagInfo;

  String? _tagName;
  bool showTopTag = true;

  @override
  void initState() {
    super.initState();

    int initIndex = 0;
    _tabs = [
      _TabItem(PageType.Recommend, K.moment_recommend, 'recommend'),
      _TabItem(PageType.Tag, K.moment_newest, 'newest'),
    ];

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _tabController = TabController(
        initialIndex: initIndex, length: _tabs.length, vsync: this);
    _tabController.addListener(_onTabChange);
    _loadData();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _tabController.removeListener(_onTabChange);
    _tabController.dispose();
    super.dispose();
  }

  _onTabChange() {
    if (_tabController.indexIsChanging) return;
    Log.d('_onTabChange : ${_tabs[_tabController.index].name}');
    if (_tabs[_tabController.index].name == K.moment_recommend) {
      Tracker.instance.track(TrackEvent.topic_detail_page,
          properties: {'tab': 'recommend', 'topic': _tagName});
    } else {
      Tracker.instance.track(TrackEvent.topic_detail_page,
          properties: {'tab': 'latest', 'topic': _tagName});
    }
  }

  _loadData() async {
    DataRsp<TagInfo> response = await Api.getTagInfo(widget.tagId);
    if (response.success == true) {
      _tagInfo = response.data;
      _tagName = _tagInfo?.name;
      Tracker.instance
          .track(TrackEvent.topic_detail_page, properties: {'show': _tagName});
    } else {
      _errorMessage = response.msg;
    }
    _loading = false;
    if (mounted) setState(() {});
  }

  void _reload() {
    _errorMessage = null;
    _loading = true;
    if (mounted) setState(() {});
    _loadData();
  }

  _onScroll() {
    if (!_scrollController.hasClients) return;
    double max = photoHeaderHeight +
        cornerHeight -
        kTabBarHeight -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    if (_isExpanded == true && _scrollController.offset >= max) {
      setState(() {
        _isExpanded = false;
      });
    } else if (_isExpanded == false && _scrollController.offset < max) {
      setState(() {
        _isExpanded = true;
      });
    }
  }

  _scrollToTop() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  /// 发布动态
  _onPublishTaped() async {
    Tracker.instance
        .track(TrackEvent.topic_detail_page, properties: {'publish': _tagName});
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentPublishScreen(context, tag: _tagName, from: 'topic');
  }

  /// 话题广场
  _onTopicSquareTaped() {
    TopicSquarePage.openTopicSquareScreen(context,
        tab: TopicSquareTab.Recommend);
  }

  _onShareTaped() {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.share(context, Session.uid, tp: 201, tagId: _tagInfo!.id);
  }

  _onFollowTaped() async {
    bool success;
    if (_tagInfo!.isTopicFollow) {
      success = await TopicApi.unFollowTopic(
          _tagInfo!.id, Session.uid, 'topic_detail');
    } else {
      success =
          await TopicApi.followTopic(_tagInfo!.id, Session.uid, 'topic_detail');
    }
    if (success) {
      _tagInfo!.isFollow = _tagInfo!.isTopicFollow ? 0 : 1;
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.homeBgColor,
        resizeToAvoidBottomInset: false,
        body: _buildBody());
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null && _errorMessage!.isNotEmpty) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.colors.secondTextColor,
        onTap: _reload,
      );
    }
    bool isExpanded = _isExpanded;
    return Stack(
      children: <Widget>[
        ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          controller: _scrollController,
          pinnedHeaderSliverHeightBuilder: () {
            return MediaQuery.of(context).padding.top + kToolbarHeight + 44;
          },
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              _buildAppBar(isExpanded),
              SliverPersistentHeader(
                pinned: true,
                delegate: CustomSliverPersistentHeaderDelegate(
                    _buildTabBar(), kTabBarHeight),
              )
            ];
          },
          body: _buildTabPages(),
        ),
        _buildPublishBtn(),
      ],
    );
  }

  Widget _buildPublishBtn() {
    return PositionedDirectional(
      bottom: 32,
      end: 4,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onPublishTaped,
        child: SizedBox(
          width: 123,
          height: 70,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: 91,
                height: 44,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0x2999FFBC),
                          Color(0x2926C4FF),
                          Color(0x29926AFF)
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
              Rext.autoStyleImg('ic_home_send_moment.webp',
                  width: 123,
                  height: 70,
                  package: ComponentManager.MANAGER_MOMENT),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  R.img(
                    'ic_topic_send_moment.webp',
                    width: 21,
                    height: 21,
                    color: Colors.white,
                    package: ComponentManager.MANAGER_MOMENT,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    K.moment_send_moment,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(bool isExpanded) {
    return SliverAppBar(
      backgroundColor: R.colors.homeBgColor,
      pinned: true,
      systemOverlayStyle: isExpanded || darkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      floating: false,
      snap: false,
      elevation: 0,
      title: _buildTitle(isExpanded),
      leading: _buildBackBtn(isExpanded),
      actions: _buildActions(isExpanded),
      expandedHeight: photoHeaderHeight - MediaQuery.of(context).padding.top,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            background: _buildBackground(),
          );
        },
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: SizedBox(
          height: cornerHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              PositionedDirectional(
                start: 0,
                end: 0,
                bottom: -1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: cornerHeight,
                  decoration: BoxDecoration(
                    color: R.colors.homeBgColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackBtn(bool isExpanded) => IconButton(
        padding: const EdgeInsets.all(0.0),
        icon: Container(
          width: 36.0,
          height: 36.0,
          margin: const EdgeInsetsDirectional.only(start: 6.0),
          alignment: Alignment.center,
          child: Center(
            child: R.img(
              "ic_titlebar_back.svg",
              width: 24,
              height: 24,
              color: isExpanded ? Colors.white : R.colors.mainTextColor,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        ),
        onPressed: () => Navigator.pop(context),
      );

  Widget _buildTitle(bool isExpanded) => GestureDetector(
        onDoubleTap: _scrollToTop,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isExpanded
                ? Text(
                    '',
                    style: TextStyle(color: R.colors.mainTextColor),
                  )
                : LimitedBox(
                    maxWidth: 180,
                    child: Text(
                      _tagInfo?.name ?? '',
                      style: TextStyle(
                        color: R.colors.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ],
        ),
      );

  /// 话题广场
  List<Widget> _buildActions(bool isExpand) {
    if (isExpand) {
      return [
        // _buildShareAction(),
        _buildTopicAction(),
      ];
    }
    return [
      _buildFollowButton(),
    ];
  }

  Widget _buildTopicAction() {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
          colors: darkMode
              ? R.colors.mainBrandGradientColors
              : [Colors.white, Colors.white],
        ).createShader(bounds, textDirection: Directionality.of(context));
      },
      child: InkWell(
        onTap: _onTopicSquareTaped,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            R.img(
              'ic_topic_square.svg',
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_MOMENT,
              color: Colors.white,
            ),
            const SizedBox(width: 2),
            Text(
              K.moment_topic_square,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildShareAction() {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: darkMode
                    ? R.colors.mainBrandGradientColors
                    : [Colors.white, Colors.white])
            .createShader(bounds, textDirection: Directionality.of(context));
      },
      child: InkWell(
        onTap: _onShareTaped,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            R.img(
              'ic_share.svg',
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_MOMENT,
              color: Colors.white,
            ),
            const SizedBox(width: 2),
            Text(
              K.moment_share,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowButton() {
    if (!_isExpanded && _tagInfo!.isTopicFollow) return const SizedBox.shrink();

    if (_tagInfo!.isTopicFollow) {
      return GestureDetector(
        onTap: _onFollowTaped,
        child: Container(
          width: 80,
          height: 32,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.4), width: 1),
          ),
          child: Text(
            K.moment_cancel_follow,
            style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _onFollowTaped,
          child: Container(
            width: _isExpanded ? 80 : 52,
            height: 32,
            margin: EdgeInsetsDirectional.only(end: _isExpanded ? 0 : 20),
            alignment: AlignmentDirectional.center,
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient:
                  LinearGradient(colors: R.colors.mainBrandGradientColors),
            ),
            child: Text(
              K.moment_attention,
              style: TextStyle(
                  color: R.colors.brightTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  /// 背景
  Widget _buildBackground() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          _buildImage(),
          Container(
            height: photoHeaderHeight,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF08032B).withOpacity(0.85).withOpacity(0.6),
          ),
          PositionedDirectional(
            start: 20,
            top: 108,
            end: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: R.img('ic_topic_tag.svg',
                      width: 20,
                      height: 20,
                      package: ComponentManager.MANAGER_MOMENT),
                ),
                Expanded(
                  child: Text(
                    _tagInfo?.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 10),
                _buildFollowButton(),
              ],
            ),
          ),
          if (_tagInfo!.isTopicFollow == false)
            PositionedDirectional(
              end: 20,
              top: 144,
              child: Text(
                K.moment_topic_tips,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6), fontSize: 11),
              ),
            ),
          if (_tagInfo!.userNum > 0)
            PositionedDirectional(
              top: 154,
              start: 20,
              child: Row(
                children: <Widget>[
                  UserListWidget(
                    _tagInfo!.avatarUrls,
                    margin: const EdgeInsetsDirectional.only(end: 4.0),
                  ),
                  Text(
                    K.moment_topic_people_title([_tagInfo!.userNum.toString()]),
                    style: const TextStyle(fontSize: 11, color: Colors.white),
                  )
                ],
              ),
            ),
          if (_tagInfo!.desc?.isNotEmpty == true)
            PositionedDirectional(
                top: 174,
                start: 20,
                width: Util.width - 2 * 20,
                child: Text(
                  _tagInfo!.desc ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 11, color: R.colors.secondTextColor),
                )),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (_tagInfo != null &&
        _tagInfo!.bgImg != null &&
        _tagInfo!.bgImg!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: _tagInfo!.bgImg,
        height: photoHeaderHeight,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      );
    } else {
      return R.img(
        'bg_topic_default.webp',
        height: photoHeaderHeight,
        width: MediaQuery.of(context).size.width,
        package: ComponentManager.MANAGER_MOMENT,
        fit: BoxFit.cover,
      );
    }
  }

  Widget _buildTabBar() {
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    MomentThemeConfig? theme = manager.themeConfig;

    List<Widget> tabs = [];
    for (int i = 0; i < _tabs.length; i++) {
      tabs.add(Tab(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(_tabs[i].name,
              style: TextStyle(color: R.colors.mainTextColor)),
        ),
      ));
    }
    return CommonTabBar(
      tabs: tabs,
      controller: _tabController,
      isScrollable: true,
      marginStart: 8,
      labelStyle: theme.labelStyle ??
          TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 26,
              fontWeight: FontWeight.w600),
      unselectedLabelStyle: theme.unselectedLabelStyle ??
          TextStyle(color: R.colors.mainTextColor, fontSize: 14),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: R.colors.mainTextColor,
      unselectedLabelColor:
          theme.unselectedLabelColor ?? R.colors.thirdTextColor,
      indicator: const BoxDecoration(),
      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
      tabItemAlign: const Alignment(0, 0.2),
    );
  }

  Widget _buildTabPages() {
    return TabBarView(
      controller: _tabController,
      children: _tabs.map((tabItem) => _buildTabContent(tabItem)).toList(),
    );
  }

  Widget _buildTabContent(_TabItem tabItem) {
    return TopicListPage(
        tagId: widget.tagId,
        pageType: tabItem.pageType,
        tagName: _tagName ?? '');
  }
}

class _TabItem {
  final PageType pageType;
  final String name;
  final String label;

  _TabItem(this.pageType, this.name, this.label);
}
