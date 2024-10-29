import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rank/rank.dart';
import 'package:rank/src/model/entity/rank_rush_prize_beans.dart';

class RankRushPrizeScreen extends StatefulWidget {
  final List<PageConfig> pageConfigList;
  final int? selectTabIndex;

  const RankRushPrizeScreen(
      {super.key, required this.pageConfigList, this.selectTabIndex});

  @override
  _RankRushPrizeScreenState createState() {
    return _RankRushPrizeScreenState();
  }
}

class _RankRushPrizeScreenState extends State<RankRushPrizeScreen>
    with SingleTickerProviderStateMixin<RankRushPrizeScreen> {
  late ExtendedTabController _tabController;
  List<Widget> _pages = [];
  final List<String> _tabs = [];
  final List<Widget> _tabsWidget = [];

  @override
  void initState() {
    super.initState();

    _tabController = ExtendedTabController(
        initialIndex: widget.selectTabIndex ?? 0,
        length: widget.pageConfigList.length,
        vsync: this);

    _tabs.addAll(widget.pageConfigList.map((config) => config.name).toList());
    _tabsWidget.addAll(_tabs.map((name) => Tab(child: Text(name))).toList());

    _pages = widget.pageConfigList.map((e) {
      if (e.type == 'charm' || e.type == 'achieve' || e.type == "hand_book") {
        //魅力或成就榜
        return PrizePage(
          tabs: [K.rank_charm_achieve_day, K.rank_charm_achieve_week],
          pageType: e.type,
        );
      } else if (e.type == 'gift') {
        //礼物榜
        return PrizePage(
          tabs: [K.rank_gift_king, K.rank_gift_star],
          pageType: e.type,
        );
      } else if (e.type == 'sweet') {
        //守护榜
        return const PrizePage(pageType: 'defend');
      } else {
        return PrizePage(pageType: e.type);
      }
    }).toList();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.rank_rush_prize),
      body: _renderBody(),
    );
  }

  Widget _renderBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTab(),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: _pages,
        ))
      ],
    );
  }

  Widget _buildTab() {
    return _tabs.isNotEmpty
        ? Container(
            height: 36.0,
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            margin: const EdgeInsets.only(bottom: 2.0, top: 2.0),
            child: CommonTabBar(
              tabs: _tabsWidget,
              isScrollable: true,
              controller: _tabController,
              labelColor: R.color.mainTextColor,
              unselectedLabelColor: R.color.secondTextColor,
              labelStyle: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              indicator: CommonUnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 3.0, color: R.color.mainBrandColor),
                  insets: const EdgeInsetsDirectional.only(bottom: 0),
                  wantWidth: 16,
                  draggingWidth: 12.0),
              indicatorWeight: 0,
              marginStart: 8,
              marginEnd: 60,
              labelPadding:
                  const EdgeInsetsDirectional.only(start: 12, end: 12),
            ),
          )
        : Container();
  }
}

class PrizePage extends StatefulWidget {
  final String pageType;
  final List<String>? tabs;

  const PrizePage({super.key, required this.pageType, this.tabs});

  @override
  _PrizePageState createState() {
    return _PrizePageState();
  }
}

class _PrizePageState extends State<PrizePage>
    with AutomaticKeepAliveClientMixin<PrizePage> {
  List<String>? _tabs;
  PageController? _pageController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    if (widget.tabs != null && widget.tabs!.length == 2) {
      _tabs = widget.tabs;
      _pageController = PageController(initialPage: 0, keepPage: true);
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();

    super.dispose();
  }

  void _jump(int page) {
    _pageController?.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_tabs != null && _tabs!.length == 2) {
      return Column(
        children: [
          SubTabWidget(
            tabLabels: _tabs!,
            onTabSelected: (page) => _jump(page),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                ListPage(pageType: widget.pageType, tabIndex: 1),
                ListPage(pageType: widget.pageType, tabIndex: 2),
              ],
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Expanded(child: ListPage(pageType: widget.pageType)),
      ],
    );
  }
}

class ListPage extends StatefulWidget {
  final String pageType;
  final int? tabIndex;

  const ListPage({super.key, required this.pageType, this.tabIndex = 0});

  @override
  _ListPageState createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  Map<dynamic, List<ShopMailCommodity>>? _awards;
  RankRushPrizeResponse? _rsp;

  @override
  void initState() {
    super.initState();

    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _load() async {
    _rsp = await RankRushPrizeRepository.getRankPrize(widget.pageType,
        tab: widget.tabIndex);
    if (mounted) {
      setState(() {
        if (_rsp != null && _rsp!.awards != null) {
          _awards = _rsp!.awards;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_rsp == null) return const CupertinoActivityIndicator();

    if (_rsp!.success != true) {
      return EmptyWidget(
        desc: _rsp!.msg ?? BaseK.K.no_data,
        onTap: _load,
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.pageType == 'gift') ...[
            const SizedBox(height: 25),
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.tabIndex == 1
                    ? '${K.rank_gift_king}：'
                    : '${K.rank_gift_star}：',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2E2F31),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                K.rank_gift_king_star_desc(
                    ['${_rsp!.top > 0 ? _rsp!.top : 30}']),
                style: TextStyle(
                  fontSize: 14,
                  color: R.color.mainTextColor.withOpacity(0.6),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                if (_rsp?.newAwards != null &&
                    Util.validStr(_rsp?.newAwards?.image))
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: GiftKingOrStarTag(
                            icon: _rsp!.newAwards!.image,
                          ),
                        ),
                        Text(
                          K.gift_no_awake_statue,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                if (_rsp?.newAwards != null &&
                    Util.validStr(_rsp?.newAwards?.imageBg))
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: GiftKingOrStarTag(
                            icon: _rsp!.newAwards!.imageBg,
                          ),
                        ),
                        Text(
                          K.gift_awake_statue,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        )
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 42),
            _buildGiftKingOrStarRuleTitle(
                '1. ${K.rank_is_text(widget.tabIndex == 1 ? [
                    K.rank_gift_king
                  ] : [K.rank_gift_star])}'),
            const SizedBox(height: 12),
            _buildGiftKingOrStarRuleText(widget.tabIndex == 1
                ? K.rank_gift_king_text
                : K.rank_gift_star_text),
            const SizedBox(height: 30),
            _buildGiftKingOrStarRuleTitle(
                '2. ${K.rank_how_get_king_star_reward_title([
                  widget.tabIndex == 1 ? K.rank_gift_king : K.rank_gift_star
                ])}'),
            const SizedBox(height: 12),
            _buildGiftKingOrStarRuleText(K.rank_how_get_king_star_reward_text([
              widget.tabIndex == 1 ? K.rank_gift_king : K.rank_gift_star,
              '${_rsp!.top > 0 ? _rsp!.top : 30}'
            ])),
            const SizedBox(height: 30),
            _buildGiftKingOrStarRuleTitle('3. ${K.rank_how_wear_medal_reward}'),
            const SizedBox(height: 12),
            _buildGiftKingOrStarRuleText(K
                .rank_how_wear_king_star_medal_reward_text([
              widget.tabIndex == 1 ? K.rank_gift_king : K.rank_gift_star
            ])),
            const SizedBox(height: 30),
            _buildGiftKingOrStarRuleTitle('4. ${K.rank_what_awake_time}'),
            const SizedBox(height: 12),
            _buildGiftKingOrStarRuleText(
              K.rank_awake_time_detail([
                widget.tabIndex == 1 ? K.rank_send : K.rank_receive
              ]), //赠送/收到
            ),
            const SizedBox(
              height: 20,
            ),
          ] else ...[
            _buildLabel(K.rank_rush_prize_top),
            if (widget.pageType == 'impress_tag')
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: _buildRuleText(K.rank_impress_reward_des),
              )
            else ...[
              if (_awards != null &&
                  _awards!['1'] != null &&
                  _awards!['1'] is List)
                _buildPrizeItem(0, _awards!['1']),
              if (_awards != null &&
                  _awards!['2'] != null &&
                  _awards!['2'] is List)
                _buildPrizeItem(1, _awards!['2']),
              if (_awards != null &&
                  _awards!['3'] != null &&
                  _awards!['3'] is List)
                _buildPrizeItem(2, _awards!['3']),
            ],
            const SizedBox(height: 20),
            _buildLabel(K.rank_rush_prize_rule),
            _buildRule(),
          ]
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Container(
      alignment: AlignmentDirectional.bottomStart,
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: R.color.mainTextColor),
      ),
    );
  }

  Widget _buildItemTitle(int index) {
    if (index < 0 || index > 2) return const SizedBox(height: 4);
    String rankStr = '';
    List<Color> gradientColors = [];
    if (index == 0) {
      rankStr = K.rank_rush_prize_rank_1;
      gradientColors = [const Color(0X00FFCF00), const Color(0XFFFFCF00)];
    } else if (index == 1) {
      rankStr = K.rank_rush_prize_rank_2;
      gradientColors = [const Color(0X0060C8FF), const Color(0XFF60C8FF)];
    } else if (index == 2) {
      rankStr = K.rank_rush_prize_rank_3;
      gradientColors = [const Color(0X00FDA252), const Color(0XFFFFCF8A)];
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsetsDirectional.only(end: 2),
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              colors: gradientColors,
            ),
          ),
        ),
        Text(
          rankStr,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: R.color.mainTextColor),
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(start: 2),
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.centerEnd,
              end: AlignmentDirectional.centerStart,
              colors: gradientColors,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPrizeItem(int index, List<ShopMailCommodity>? items,
      {bool showBorder = true}) {
    if (index < 0 || index > 2 || items == null || items.isEmpty)
      return Container();

    double containerWidth = (112 * items.length - 12) * Util.ratio;

    return Container(
      margin: const EdgeInsetsDirectional.only(top: 6, bottom: 6),
      width: Util.width - 40,
      padding: const EdgeInsetsDirectional.only(top: 16),
      decoration: showBorder
          ? BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 8.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 4.0),
                  color: Color(0x0A000000),
                ),
              ],
            )
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildItemTitle(index),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
                start: 20 * Util.ratio, end: 20 * Util.ratio),
            width: containerWidth,
            height: 149 * Util.ratio,
            child: Center(
              child: ListView.builder(
                physics: items.length <= 3
                    ? const NeverScrollableScrollPhysics()
                    : null,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _buildImageItem(context, items[index]);
                },
                itemCount: items.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(ShopMailCommodity item) {
    IVipManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          _buildImageBg(item),
          if (ShopMailCommodityType.RoomBackground != item.commodityType)
            manager.getCommodityListItemTop(ratio: 90 / 104, commodity: item),
        ],
      ),
    );
  }

  Widget _buildImageBg(ShopMailCommodity item) {
    String imageUrl = ShopMailCommodityType.RoomBackground == item.commodityType
        ? (item.image ?? '')
        : item.itemCover;

    if (imageUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: 90 * Util.ratio,
        height: 93 * Util.ratio,
        fit: BoxFit.cover,
      );
    }

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        colors: [Color(0XFF492376), Color(0XFF211940)],
      )),
      width: 90 * Util.ratio,
      height: 93 * Util.ratio,
    );
  }

  Widget _buildImageItem(BuildContext context, ShopMailCommodity item) {
    return Column(
      children: [
        Container(
          width: 90 * Util.ratio,
          height: 93 * Util.ratio,
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildBackground(item),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.center,
            width: 98 * Util.ratio,
            height: 49 * Util.ratio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, color: R.color.mainTextColor),
                ),
                if (item.desc != null && item.desc!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      item.desc ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12, color: R.color.thirdTextColor),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGiftKingOrStarRuleTitle(String text) {
    if (text.isEmpty) return Container();

    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xFF2E2F31)),
      ),
    );
  }

  Widget _buildGiftKingOrStarRuleText(String text) {
    if (text.isEmpty) return Container();

    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, color: R.color.mainTextColor.withOpacity(0.6)),
      ),
    );
  }

  Widget _buildRuleTitle(String text) {
    if (text.isEmpty) return Container();

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: R.color.mainTextColor),
      ),
    );
  }

  Widget _buildRuleText(String text) {
    if (text.isEmpty) return Container();

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: R.color.thirdTextColor),
      ),
    );
  }

  Widget _buildRule() {
    List<Widget> res = [];
    int? tabIndex = widget.tabIndex;
    String type = widget.pageType;

    if (type == 'charm') {
      //魅力
      res.add(_buildRuleTitle(K.rank_is_text([K.rank_is_charm])));
      res.add(_buildRuleText(K.rank_charm_text));
      // res.add(_buildRuleTitle(K.rank_is_text(tabIndex == 1 ? [K.rank_day_text] : [K.rank_week_text])));
      // res.add(_buildRuleText(tabIndex == 1 ? K.rank_charm_day_text : K.rank_charm_week_text));
      res.add(_buildRuleTitle(K.rank_how_get_prize_title));
      res.add(_buildRuleText(K.rank_how_get_prize));
    } else if (type == 'achieve') {
      //成就
      res.add(_buildRuleTitle(K.rank_is_text([K.rank_is_achieve])));
      res.add(_buildRuleText(K.rank_achieve_text));
      // res.add(_buildRuleTitle(K.rank_is_text(tabIndex == 1 ? [K.rank_day_text] : [K.rank_week_text])));
      // res.add(_buildRuleText(tabIndex == 1 ? K.rank_achieve_day_text : K.rank_achieve_week_text));
      res.add(_buildRuleTitle(K.rank_how_get_prize_title));
      res.add(_buildRuleText(K.rank_how_get_prize));
    } else if (type == 'gift') {
      //礼物
      res.add(_buildRuleTitle(K.rank_is_text(
          tabIndex == 1 ? [K.rank_gift_king] : [K.rank_gift_star])));
      res.add(_buildRuleText(
          tabIndex == 1 ? K.rank_gift_king_text : K.rank_gift_star_text));

      res.add(_buildRuleTitle(K.rank_how_get_king_star_reward_title(
          [tabIndex == 1 ? K.rank_gift_king : K.rank_gift_star])));
      res.add(_buildRuleText(K.rank_how_get_king_star_reward_text([
        tabIndex == 1 ? K.rank_gift_king : K.rank_gift_star,
        '${_rsp!.top > 0 ? _rsp!.top : 30}'
      ])));

      res.add(_buildRuleTitle(K.rank_how_wear_medal_reward));
      res.add(_buildRuleText(K.rank_how_wear_king_star_medal_reward_text(
          [tabIndex == 1 ? K.rank_gift_king : K.rank_gift_star])));
    } else if (type == 'title') {
      //贵族
      res.add(_buildRuleTitle(K.rank_is_text([K.rank_is_title])));
      res.add(_buildRuleText(K.rank_title_text));
      res.add(_buildRuleTitle(K.rank_how_get_prize_title));
      res.add(_buildRuleText(K.rank_how_get_prize));
    } else if (type == 'defend') {
      //守护
      res.add(_buildRuleTitle(K.rank_is_text([K.rank_is_defend])));
      res.add(_buildRuleText(K.rank_defend_text));
      res.add(_buildRuleTitle(K.rank_how_get_prize_title));
      res.add(_buildRuleText(K.rank_how_get_prize));
    } else if (type == "hand_book") {
      ///图鉴
      res.add(_buildRuleTitle(K.rank_handbook_desc_title));
      res.add(_buildRuleText(K.rank_handbook_desc_content));
      res.add(_buildRuleTitle(K.rank_how_get_prize_title));
      res.add(_buildRuleText(K.rank_how_get_prize));
    } else if (type == 'impress_tag') {
      res.addAll(impressTagRule());
    }

    return Container(
        margin: EdgeInsetsDirectional.only(
            start: 20, top: 10, end: 20, bottom: 20 + Util.iphoneXBottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: res,
        ));
  }

  List<Widget> impressTagRule() {
    return [
      _buildRuleTitle(K.rank_impress_palace),
      _buildRuleText(K.rank_impress_palace_des),
      _buildRuleTitle(K.rank_how_get_prize_title),
      _buildRuleText(K.rank_impress_prize_des),
      if ((_awards?.isNotEmpty ?? false) &&
          _awards!['1'] is List &&
          (_awards!['1']?.isNotEmpty ?? false))
        CachedNetworkImage(
          imageUrl: _awards!['1']!.first.imageBackground,
          width: Util.width,
          fit: BoxFit.fitWidth,
        )
    ];
  }
}
