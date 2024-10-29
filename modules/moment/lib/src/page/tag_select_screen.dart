import 'dart:async';
import 'dart:convert';

import 'package:shared/shared.dart' hide TagItem;
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/page/moment_publish_screen.dart';
import 'package:moment/src/page/tag_list_page.dart';

/// 选择标签页
class TagSelectScreen extends StatefulWidget {
  final PublishMomentModel model;
  final String? text; // 动态文字内容

  final String? from;
  final String? selectTag;
  final int maxTagNum;
  final bool publish;
  final GetATBeans? getATBeans;
  final int verifyType;

  const TagSelectScreen(
      {super.key,
      required this.model,
      this.text,
      this.from,
      this.selectTag,
      this.maxTagNum = 3,
      this.publish = false,
      required this.getATBeans,
      this.verifyType = 0});

  static Future openTagSelectScreen(BuildContext context,
      {Key? key,
      required String text,
      required PublishMomentModel model,
      String? from,
      String? selectTag,
      int maxTagNum = 3,
      bool publish = false,
      GetATBeans? getATBeans,
      int verifyType = 0}) {
    return Navigator.of(context).push(
      DisappearBottomRoute(
        builder: (context) {
          return TagSelectScreen(
            key: key,
            model: model,
            text: text,
            from: from,
            selectTag: selectTag,
            maxTagNum: maxTagNum,
            publish: publish,
            getATBeans: getATBeans,
            verifyType: verifyType,
          );
        },
        settings: const RouteSettings(name: '/TagSelectScreen'),
      ),
    );
  }

  @override
  _TagSelectScreenState createState() => _TagSelectScreenState();
}

class _TagSelectScreenState extends State<TagSelectScreen>
    with TickerProviderStateMixin
    implements IPublishView {
  final GlobalKey _key = GlobalKey<SearchBarState>();
  Timer? _cancelTimer;
  bool _loading = true;
  String? _errorMessage;
  TabController? _tabController;

  List<TagCate> _tabs = [];

  List<String> _selectTags = [];
  int tabIndex = 0;
  late PublishPresenter mPresenter;
  final DialogLoadingController _controller = DialogLoadingController();
  static const int MAX_TEXT_LENGTH = 10;
  List<String> _matchedTags = []; // 搜索匹配到的标签
  bool _showSearchLayer = false;
  bool _searching = false;
  String? _tagCreateError;
  String? _searchKey;
  IMomentManager momentManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);

  @override
  void initState() {
    super.initState();
    Tracker.instance
        .track(TrackEvent.send_moment, properties: {'choose_tag_show': ''});
    mPresenter = PublishPresenter(context, widget.model, this,
        from: widget.from,
        fromTag: widget.selectTag,
        getATBeans: widget.getATBeans,
        verifyType: widget.verifyType);
    _selectTags = widget.model.selectTags ?? [];
    _initTabs();
  }

  @override
  void dispose() {
    _cancelTimer?.cancel();
    _tabController?.dispose();
    super.dispose();
  }

  void _reload() {
    _errorMessage = null;
    _loading = true;
    if (mounted) setState(() {});
    _initTabs();
  }

  _initTabs() async {
    DataRsp<List<TagCate>> response = await Api.getTagCate();
    if (response.success == true) {
      _tabs = response.data!;
      safeRun(() {
        _tabController =
            TabController(initialIndex: 0, length: _tabs.length, vsync: this);
      });
    } else {
      _errorMessage = response.msg;
    }
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  _onPublishMomentTaped() {
    if (widget.publish == false) {
      widget.model.selectTags = _selectTags;
      Navigator.of(context).pop(_selectTags);
    } else {
      widget.model.selectTags = _selectTags;
      mPresenter.onPublishTaped();
    }
  }

  void _search(String? query) async {
    if (query == null || query.isEmpty) {
      _matchedTags.clear();
      if (mounted) setState(() {});
      return;
    }

    _searchTag(query);
  }

  /// 搜索tag
  void _searchTag(String query) async {
    DataRsp<MomentTags> response = await Api.tagMatch(query);
    if (response.success == true && response.data != null) {
      _matchedTags = response.data!.tags;
    }
    _searching = false;

    if (mounted) setState(() {});
  }

  void _handleTagReport() {
    Tracker.instance.track(TrackEvent.send_moment,
        properties: {'choose_tag': json.encode(_selectTags)});
  }

  void _changeTabIndex(int index) {
    Log.d('_changeTabIndex');
    if (_tabs.length > index) {
      tabIndex = index;
    }
    if (mounted) setState(() {});
  }

  _onAddTagTaped(String tag) {
    Log.d('_onTagTaped: $tag');
    if (_selectTags.contains(tag)) {
      Fluttertoast.showToast(
          msg: K.moment_tag_already_add, gravity: ToastGravity.CENTER);
      return;
    }

    if (_selectTags.length >= widget.maxTagNum) {
      Fluttertoast.showToast(
          msg: K.moment_add_tag_max_num(['${widget.maxTagNum}']),
          gravity: ToastGravity.CENTER);
      return;
    }

    _selectTags.add(tag);
    _handleTagReport();
    _showSearchLayer = false;
    if (mounted) setState(() {});
  }

  _onDeleteSelectTag(String tag) {
    Log.d('_onDeleteSelectTag');
    if (_selectTags.isNotEmpty) {
      _selectTags.removeWhere((item) => item == tag);
      if (mounted) setState(() {});
    }
  }

  /// 创建标签
  void _onTagCreate(String? value) async {
    if (_key.currentState != null) {
      (_key.currentState as SearchBarState).clearText();
    }
    if (_selectTags.length >= widget.maxTagNum) {
      Fluttertoast.showToast(
          msg: K.moment_add_tag_max_num(['${widget.maxTagNum}']),
          gravity: ToastGravity.CENTER);
    } else if (value == null || value.isEmpty) {
      Fluttertoast.showToast(
          msg: K.moment_input_content, gravity: ToastGravity.CENTER);
    } else {
      _tagCreateError = null;
      DataRsp response = await Api.tagSubmit(value);
      if (response.success == true) {
        Fluttertoast.showToast(msg: K.moment_tag_create_success);
        _onAddTagTaped(value);
        _showSearchLayer = false;
      } else {
        _tagCreateError = response.msg ?? K.moment_tag_create_failed;
      }
    }

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        backgroundColor: R.colors.homeBgColor,
        leading: _buildBackBtn(),
        title: Text(K.moment_select_tag,
            style: R.textStyle.title.copyWith(color: R.colors.mainTextColor)),
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: Row(
              children: <Widget>[
                GradientButton(
                  widget.publish ? K.moment_publish : K.moment_confirm,
                  onTap: _onPublishMomentTaped,
                  textStyle: TextStyle(
                      color: R.colors.brightTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                  colors: R.colors.mainBrandGradientColors,
                  height: 32,
                  width: 58,
                ),
              ],
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBackBtn() => IconButton(
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
              color: R.colors.mainTextColor,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      );

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 12),
        _buildSearchBar(),
        const SizedBox(height: 12),
        _buildSelected(),
        Expanded(child: _buildTagList()),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: SearchBar(
        _onQueryChanged,
        key: _key,
        hintText: K.moment_search_or_create_tag,
        height: 36,
        maxLength: MAX_TEXT_LENGTH,
        hintStyle: TextStyle(color: R.colors.thirdTextColor, fontSize: 13),
        textStyle: TextStyle(color: R.colors.mainTextColor, fontSize: 13),
        bgColor: R.colors.mainBgColor,
        showSearchIcon: false,
        showLeftTextNum: true,
        padding: const EdgeInsetsDirectional.only(start: 8),
        suppDark: true,
      ),
    );
  }

  void _onQueryChanged(String text) {
    Log.d('_onQueryChanged: $text');
    if (text.runes.length > MAX_TEXT_LENGTH) return;
    _tagCreateError = null;
    if (text.isEmpty || text.trim().isEmpty) {
      _searchKey = '';
      setState(() {
        _showSearchLayer = false;
      });
    } else {
      if (_searchKey == text.trim()) {
        return;
      }
      _searchKey = text.trim();
      setState(() {
        _showSearchLayer = true;
        _searching = true;
      });
      _cancelTimer?.cancel();
      _cancelTimer = Timer(
          Duration(milliseconds: text.isEmpty ? 0 : 800), () => _search(text));
    }
  }

  /// 已选标签
  Widget _buildSelected() {
    if (_selectTags.isEmpty) {
      return Container();
    }
    return Padding(
      padding:
          const EdgeInsetsDirectional.only(top: 8.0, start: 20, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                K.moment_already_select_tag,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: R.colors.mainTextColor,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${_selectTags.length}/${widget.maxTagNum}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: R.colors.secondTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSelectedTags(_selectTags),
        ],
      ),
    );
  }

  Widget _buildSelectedTags(List<String> tags) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: tags
          .map(
            (e) => TagItem(
              tag: e,
              supportDark: true,
              bgColors: R.colors.tagGradientColors,
              textStyle: TextStyle(color: R.colors.tagTextColor, fontSize: 13),
              onDeleteTap: () => _onDeleteSelectTag(e),
            ),
          )
          .toList(),
    );
  }

  /// 标签列表
  Widget _buildTagList() {
    if (_showSearchLayer) {
      return _buildSearchLayer();
    } else {
      if (_tabs.isEmpty) {
        return Container();
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0),
            child: _buildTabBar(),
          ),
          _buildTabPages(),
        ],
      );
    }
  }

  /// 搜索标签界面
  Widget _buildSearchLayer() {
    if (_searching) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildCreateTag(),
        Expanded(child: _buildRecommend(_matchedTags)),
      ],
    );
  }

  /// 创建新标签
  Widget _buildCreateTag() {
    if (_matchedTags.contains(_searchKey)) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              K.moment_create_new_tag,
              style: TextStyle(color: R.colors.thirdTextColor, fontSize: 13),
            ),
          ),
          if (_tagCreateError == null)
            TagItem(
              tag: _searchKey,
              background: R.colors.moduleBgColor,
              supportDark: true,
              textStyle: TextStyle(
                color: R.colors.tagTextColor,
                fontSize: 13,
                fontFamily: Util.fontFamily,
              ),
              onTap: () {
                _onTagCreate(_searchKey);
              },
            )
          else
            Text(
              _tagCreateError!,
              style: TextStyle(color: R.colors.thirdBrightColor, fontSize: 13),
            ),
        ],
      ),
    );
  }

  /// 推荐标签
  Widget _buildRecommend(List<String>? tags) {
    if (tags == null || tags.isEmpty) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            K.moment_tag_guess,
            style: TextStyle(color: R.colors.thirdTextColor, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: ListView.builder(
              itemCount: tags.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 44,
                  alignment: AlignmentDirectional.centerStart,
                  child: TagItem(
                    tag: tags[index],
                    background: momentManager.themeConfig.tagBackground ??
                        R.colors.fourthBgColor,
                    textStyle: TextStyle(
                      color: momentManager.themeConfig.tagTextColor ??
                          R.colors.secondaryBrandColor,
                      fontSize: 13,
                      fontFamily: Util.fontFamily,
                    ),
                    onTap: () {
                      if (_key.currentState != null) {
                        (_key.currentState as SearchBarState).clearText();
                      }
                      _onAddTagTaped(tags[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    List<Widget> tabs = <Widget>[];
    for (int i = 0; i < _tabs.length; i++) {
      tabs.add(Tab(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(_tabs[i].name ?? '',
              style: TextStyle(color: R.colors.mainTextColor)),
        ),
      ));
    }
    return CommonTabBar(
      onTap: (index) {
        _changeTabIndex(index);
        Tracker.instance.track(TrackEvent.send_moment,
            properties: {'tab': _tabs[index].name});
      },
      tabs: tabs,
      controller: _tabController,
      isScrollable: true,
      labelStyle: TextStyle(
          color: R.colors.mainTextColor,
          fontSize: 22,
          fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          TextStyle(color: R.colors.mainTextColor, fontSize: 15),
      indicatorColor: R.colors.mainTextColor,
      indicator: const BoxDecoration(),
      unselectedLabelColor: R.colors.thirdTextColor,
      indicatorWeight: 6,
      indicatorPadding: const EdgeInsets.only(top: 6),
      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
    );
  }

  Widget _buildTabPages() {
    List<Widget> tabViews = <Widget>[];

    for (int i = 0; i < _tabs.length; i++) {
      if (_tabs[i].sub.isNotEmpty) {
        tabViews.add(_buildGamePage(_tabs[i].sub));
      } else {
        tabViews.add(TagListPage(id: _tabs[i].id, onTagTaped: _onAddTagTaped));
      }
    }
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: tabViews,
      ),
    );
  }

  Widget _buildGamePage(List<TagCate> subCate) {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 12),
      child: VerticalTabs(
        tabsWidth: 90,
        tabsHeight: 48,
        indicatorColor: R.colors.brightTextColor,
        tabBackgroundColor: R.colors.secondBgColor,
        backgroundColor: R.colors.homeBgColor,
        tabItemBackgroundColor: R.colors.secondBgColor,
        selectedTabBackgroundColor: R.colors.mainBrandColor,
        selectedTabTextStyle: TextStyle(
            color: R.colors.brightTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
        tabTextStyle: TextStyle(
            color: R.colors.secondTextColor,
            fontSize: 13,
            fontWeight: FontWeight.w500),
        selectItemBorderRadius: const BorderRadiusDirectional.only(
          topEnd: Radius.circular(12),
          bottomEnd: Radius.circular(12),
        ),
        tabBorderRadius: const BorderRadiusDirectional.only(
          topEnd: Radius.circular(12),
        ),
        tabs: subCate.map((e) => e.name ?? '').toList(growable: false),
        contents: subCate
            .map((e) => TagListPage(onTagTaped: _onAddTagTaped, id: e.id))
            .toList(),
        onTabTap: (index) {
          Tracker.instance.track(TrackEvent.send_moment,
              properties: {'tab': subCate[index].name});
        },
      ),
    );
  }

  @override
  void dismissLoading() {
    _controller.close();
  }

  @override
  String getInputValue() {
    return widget.text ?? '';
  }

  @override
  void onRefresh() {
    if (mounted) setState(() {});
  }

  @override
  void showLoading({String? message, bool canPop = false}) {
    _controller.show(
        context: context,
        message: message ?? K.moment_uploading,
        canPop: canPop);
  }
}
