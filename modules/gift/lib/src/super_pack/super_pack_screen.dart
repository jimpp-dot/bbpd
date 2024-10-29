import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/model/super_pack_beans.dart';
import 'package:gift/src/repo/super_pack_repo.dart';
import 'package:gift/src/super_pack/gift_pack_item.dart';

import '../../assets.dart';
import '../recharge_packet_center/recharge_pack_center_screen.dart';

/// 超值礼包页面
class SuperPackScreen extends StatefulWidget {
  final int from;
  final bool needAppBar;
  final SubTabScrollCallback? scrollCallback;
  final double appBarHeight;

  const SuperPackScreen({
    Key? key,
    this.from = 0,
    this.needAppBar = true,
    this.scrollCallback,
    this.appBarHeight = 0,
  }) : super(key: key);

  @override
  SuperPackScreenState createState() => SuperPackScreenState();

  static Future<bool?> show(BuildContext context, {int from = 0}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SuperPackScreen(),
      settings: const RouteSettings(name: '/SuperValueGiftPackScreen'),
    ));
  }
}

class SuperPackScreenState extends BaseScreenState<SuperPackScreen>
    with AutomaticKeepAliveClientMixin {
  final double _headerHeight = Util.width * 0.715;
  final ScrollController _scrollController = ScrollController();

  double _opacity = 0.0;

  dynamic _superPackList;
  int _leftSeconds = 0;

  final Map<int, double> _cardHeightMap = {};

  final List<double> _cardHeights = [];

  bool _haveRuleIntro = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    _loadData();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _loadData() async {
    SuperPackResp resp = await SuperPackRepo.getSuperPacks();
    if (resp.success == true && resp.data != null) {
      SuperPackList superPackList = resp.data!;
      _haveRuleIntro = superPackList.introduction.isNotEmpty;
      if (!Util.isCollectionEmpty(superPackList.packages)) {
        setScreenReady();
      } else {
        setScreenEmpty();
      }
      _leftSeconds = superPackList.leftDays;
      _superPackList = superPackList;
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  @protected
  void onTapErrorWidget() {
    _loadData();
  }

  _onScroll() {
    if (!_scrollController.hasClients) return;

    if (widget.scrollCallback != null) {
      widget.scrollCallback!(_scrollController.offset);
    }

    double r = _scrollController.offset / (_headerHeight - 40.0);
    if (r < 0) {
      r = 0;
    }
    if (r > 1) {
      r = 1;
    }
    setState(() {
      _opacity = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            R.imagePath(Assets.gift_pack_gift_pack_main_bg_webp,
                package: ComponentManager.MANAGER_GIFT),
          ),
          fit: BoxFit.fill,
        )),
        child: Stack(
          children: [
            PositionedDirectional(
              start: 0,
              end: 0,
              top: 0,
              bottom: 0,
              child: buildStatusContent(),
            ),
            if (widget.needAppBar == true)
              PositionedDirectional(
                start: 0,
                end: 0,
                top: 0,
                child: buildAppBar(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: widget.needAppBar
                ? R.img(
                    Assets.gift_pack_gift_pack_header_bg_webp,
                    width: Util.width,
                    height: _headerHeight,
                    package: ComponentManager.MANAGER_GIFT,
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: widget.appBarHeight > 80
                        ? '${System.imageDomain}static/gift_pack_center_bg.webp'
                        : '${System.imageDomain}static/gift_pack_center_small_bg.webp',
                    width: Util.width,
                    height: widget.appBarHeight + 200,
                  ),
          ),
          _buildGiftPack(),
          ..._buildRedPack(),
          _buildTimeLeft(),
        ],
      ),
    );
  }

  Widget _buildTimeLeft() {
    Map map = Utility.timeDistance((_leftSeconds));
    int day = map['day'];
    int hour = map['hour'];

    String str = '';
    if (day > 0) {
      str = K.gift_time_left_day(['$day']);
    } else if (hour > 0) {
      str = K.gift_time_left_hour(['$hour']);
    } else {
      str = K.gift_time_left_day(['0']);
    }

    Widget child = Text(
      str,
      style: const TextStyle(
          fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
    );

    return PositionedDirectional(
      top: widget.needAppBar
          ? (MediaQuery.of(context).padding.top + kToolbarHeight + 65)
          : (widget.appBarHeight + 70),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30,
            padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: Colors.black.withOpacity(0.4),
            ),
            child: Center(
              child: child,
            ),
          ),
          SizedBox(
            width: Util.width,
          )
        ],
      ),
    );
  }

  Widget _buildGiftPack() {
    List<SuperPackItem> sourcePackages = _superPackList.packages;

    List<dynamic> packages = [];
    packages.addAll(sourcePackages.where((element) => !element.send));
    packages.addAll(sourcePackages.where((element) => element.send));

    List<Widget> children = [];
    children.add(SizedBox(
      height: widget.needAppBar
          ? _headerHeight - 35
          : widget.appBarHeight + 185 - 35,
    ));

    for (int i = 0; i < sourcePackages.length; i++) {
      children.add(GiftBoxCard(
        index: i,
        data: packages[i],
        onCardLayout: _onCardLayout,
        onPayEnd: _loadData,
      ));
      children.add(const SizedBox(
        height: 12,
      ));
    }

    children.add(SizedBox(
      height: Util.iphoneXBottom,
    ));

    return Column(
      children: children,
    );
  }

  void _onCardLayout(int index, double cardHeight) {
    //Log.d('_onCardLayout....cardHeight = $cardHeight');
    if (_cardHeightMap[index] != cardHeight) {
      _cardHeightMap[index] = cardHeight;

      if (_cardHeightMap.length == _superPackList.packages.length) {
        _cardHeights.clear();
        for (int i = 0; i < _superPackList.packages.length; i++) {
          _cardHeights.add(_cardHeightMap[i] ?? 0);
        }
        setState(() {});
      }
    }
  }

  List<Widget> _buildRedPack() {
    List<Widget> widgets = [];

    if (_cardHeights.length != _superPackList.packages.length) {
      return widgets;
    }

    for (int i = 0; i < _superPackList.packages.length; i++) {
      if (i % 2 == 0) {
        widgets.add(PositionedDirectional(
            top: _getPreTotalCardHeight(i) +
                i * 12 +
                (widget.needAppBar
                    ? (_headerHeight - 45)
                    : widget.appBarHeight + 185 - 45) -
                15,
            start: 20,
            child: R.img(
              Assets.gift_pack_gift_pack_top_red_pkg_webp,
              width: 74,
              height: 74,
              package: ComponentManager.MANAGER_GIFT,
              fit: BoxFit.contain,
            )));
      } else {
        widgets.add(PositionedDirectional(
            top: _getPreTotalCardHeight(i) +
                i * 12 -
                16 +
                (widget.needAppBar
                    ? (_headerHeight - 45)
                    : widget.appBarHeight + 185 - 45) -
                15,
            end: 2,
            child: R.img(
              Assets.gift_pack_gift_pack_bottom_red_pkg_webp,
              width: 70,
              height: 79,
              package: ComponentManager.MANAGER_GIFT,
              fit: BoxFit.contain,
            )));
      }
    }
    return widgets;
  }

  double _getPreTotalCardHeight(int index) {
    double h = 0.0;

    for (int i = 0; i < index; i++) {
      h += _cardHeights[i];
    }
    return h;
  }

  _showRule() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.width * 0.7,
                ),
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 6.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              K.gift_super_pack_rule,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: R.color.mainBrandColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 12.0,
                                  end: 12.0,
                                  bottom: 12.0,
                                  top: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...(_superPackList.introduction
                                      .split('\\n')
                                      .map((e) => Text(
                                            e,
                                            maxLines: 10,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: R.color.mainTextColor,
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ))
                                      .toList()),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    PositionedDirectional(
                      end: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          alignment: Alignment.center,
                          child: R.img(
                            'rank_dialog_close.svg',
                            package: ComponentManager.MANAGER_RANK,
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  PreferredSizeWidget buildAppBar() {
    String title = K.gift_super_gift_pack;
    return BaseAppBar(
      title,
      titleColor: ColorTween(begin: Colors.white, end: const Color(0xFF313131))
          .transform(_opacity),
      backColor: ColorTween(begin: Colors.white, end: const Color(0xFF313131))
          .transform(_opacity),
      backgroundColor: Colors.white.withOpacity(_opacity),
      actionTitle: _haveRuleIntro ? K.gift_super_pack_rule : '',
      onPressed: _haveRuleIntro ? _showRule : null,
    );
  }

  @override
  Widget buildContent() {
    return _buildBody();
  }
}
