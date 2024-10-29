import 'package:shared/dart_extensions/widget/box_extension.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall_v3/mall_api.dart';
import 'package:vip/src/vip_mall_v3/page/base_page.dart';
import 'package:vip/src/vip_mall_v3/page/hot_page.dart';

import '../../../assets.dart';
import '../../../k.dart';
import '../../pb/generated/rpc_shop.pb.dart';
import '../../pb/generated/slp_shop_resp.pb.dart';
import '../../theme/vip_theme.dart';
import '../../vip_mall/mixin/bag_item_mixin.dart';
import '../../vip_mall/widget/bag_button.dart';
import '../../vip_mall/widget/mall_goods_widget.dart';

class VipMallV3Screen extends StatefulWidget {
  static const String routeName = 'VipMallV3Screen';
  final int mainIndex;
  final int subIndex;

  const VipMallV3Screen({super.key, this.mainIndex = 0, this.subIndex = 0});

  @override
  State<StatefulWidget> createState() => VipMallV3ScreenState();

  static Future show(BuildContext context,
      {int mainIndex = 0, int subIndex = 0}) {
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    int index = mainManager.appNavigatorObserverGetIndex(routeName);
    if (index > -1) {
      Navigator.of(context).popUntil(ModalRoute.withName(routeName));
      return Future.value(null);
    } else {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            VipMallV3Screen(mainIndex: mainIndex, subIndex: subIndex),
        settings: const RouteSettings(name: routeName),
      ));
    }
  }
}

class VipMallV3ScreenState extends State<VipMallV3Screen>
    with BaseScreenStateMixin, BagItemMixin {
  int _currIndex = 0;
  final List<ShopCateInfo> _cateList = [];
  PageController? _pageController;
  bool _showPreview = false;
  IShopMailCommodity? bagGoods;
  @override
  void initState() {
    super.initState();
    _load();
    // eventCenter.addListener(EventConstant.EventShopGoodItemChanged, _onFlushTop);
  }

  Future<void> _load() async {
    ShopCateListResp rsp = await MallApi.getMallTabs();
    if (rsp.success) {
      if (rsp.data.isNotEmpty) {
        _cateList.clear();
        _cateList.addAll(rsp.data);
        _pageController?.dispose();
        int initIndex =
            widget.mainIndex < _cateList.length ? widget.mainIndex : 0;
        _currIndex = initIndex;
        _pageController = PageController(initialPage: initIndex);
        setScreenReady();
      } else {
        setScreenEmpty(emptyMsgColor: R.colors.mainTextColor);
      }
    } else {
      setScreenError(errorMsg: rsp.msg, errorMsgColor: R.colors.mainTextColor);
    }
  }

  @override
  void onTapErrorWidget() {
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: R.colors.homeSecondBgColor,
            appBar: _buildAppBar(),
            body: buildStatusContent())
        .withCommonBgBlack();
  }

  @override
  Widget buildContent() {
    return Stack(children: [
      Padding(
        padding: EdgeInsetsDirectional.only(
            top: (_showPreview == true ? 141 + 50.dp : 50.dp)),
        child: _buildSubPages(),
      ),
      PositionedDirectional(child: _buildCategories()),
    ]);
  }

  /// 顶部分类
  Widget _buildCategories() {
    List<Widget> res = [];
    for (int i = 0; i < _cateList.length; i++) {
      res.add(_buildCateItem(i, _cateList[i].category, _cateList[i].descIcon));
    }
    return Container(
        width: Util.width,
        alignment: AlignmentDirectional.topCenter,

        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(darkMode ? Assets.vip$mall_header_bg_dark_webp : Assets.vip$mall_header_bg_webp),
        //         fit: BoxFit.fitWidth)),
        child: Column(
          children: [
            _showPreview
                ? Container(
                    height: 141,
                    width: double.infinity,
                    margin: const EdgeInsetsDirectional.only(
                        start: 12, end: 12, top: 8, bottom: 0),
                    decoration:
                        commonBoxDecorationWithParamsAndBorderRadiusBeginAndEnd(
                      [
                        const Color(0xFF000000).withOpacity(0),
                        const Color(0xFF8527FF)
                      ],
                      const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      Alignment.topCenter,
                      Alignment.bottomCenter,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        // _buildInnerImage()
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            Container(
              padding: EdgeInsetsDirectional.only(
                  start: 25.dp, end: 25.dp, top: 12.dp),
              margin: EdgeInsetsDirectional.only(top: 12.dp, bottom: 12.dp),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: res),
            )
          ],
        ));
  }

  Widget _buildCateItem(int index, String name, String icon) {
    bool selected = index == _currIndex;
    return GestureDetector(
      onTap: () {
        if (_currIndex != index) {
          _currIndex = index;
          _pageController?.jumpToPage(index);
          refresh();
        }
      },
      child: Container(
        padding:
            const EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 0.5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFFFF8AEC).withOpacity(selected ? 0.2 : 0.0),
                  const Color(0xFFB363FF).withOpacity(selected ? 0.2 : 0.0)
                ],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFF8AEC).withOpacity(selected ? 0.7 : 0.0),
                    const Color(0xFFFF8AEC).withOpacity(selected ? 0.7 : 0.0)
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30)),
        child: Text(name,
            style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 14,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400)),
      ),
    );

    // child: SizedBox(
    //   height: 78.5.dp,
    //   child: Stack(alignment: AlignmentDirectional.topCenter, children: [
    //     R.img(Util.getRemoteImgUrl(icon), width: 52.dp, height: 52.dp, fit: BoxFit.fill),
    //     Container(
    //       width: 60.dp,
    //       height: 31.dp,
    //       margin: EdgeInsetsDirectional.only(top: 47.5.dp),
    //       alignment: Alignment.center,
    //       decoration: selected
    //           ? BoxDecoration(
    //               borderRadius: BorderRadius.all(Radius.circular(15.5.dp)),
    //               gradient: LinearGradient(
    //                   colors: VipTheme.colors.tabSelected,
    //                   begin: AlignmentDirectional.topStart,
    //                   end: AlignmentDirectional.bottomEnd))
    //           : null,
    //       child: Text(name,
    //           style: TextStyle(
    //               color: R.colors.mainTextColor,
    //               fontSize: 14,
    //               fontWeight: selected ? FontWeight.w600 : FontWeight.w400)),
    //     )
    //   ]),
    // ),
  }

  Widget _buildSubPages() {
    List<Widget> pages = [];
    for (int i = 0; i < _cateList.length; i++) {
      if (_cateList[i].page == "recommend") {
        pages.add(const HotPage());
      } else {
        pages.add(BasePage(
            mainType: _cateList[i].page,
            subSets: _cateList[i].subsets,
            subIndex: widget.subIndex));
      }
    }
    return Padding(
      padding: EdgeInsets.only(top: 8.dp, bottom: 0),
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar.custom(
      statusBrightness: darkMode ? Brightness.dark : Brightness.light,
      backgroundColor: Colors.transparent,
      backColor: R.colors.mainTextColor,
      title: Text(
        K.mall,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: R.colors.mainTextColor,
        ),
      ),
      actions: <Widget>[const BagButton(), SizedBox(width: 16.dp)],
    );
  }

  Widget _buildInnerImage() {
    var commodity = bagGoods as ShopMailCommodity;
    if (bagGoods is ShopMailCommodity) {
      Log.d('commodity.commodityType:${commodity.commodityType}');
    }

    Log.d('commodity.commodityType:${commodity.commodityType}');

    switch (commodity.commodityType) {
      case ShopMailCommodityType.EnterEffect:
        return buildEnterEffect(commodity);
      case ShopMailCommodityType.Frame:
      case ShopMailCommodityType.Bubble:
        return buildBubble(commodity);
      case ShopMailCommodityType.MicrophoneEffect:
        return MicEffectWidget(
            commodity.commodityAvatar, commodity.commodityImage, 160.dp);
      case ShopMailCommodityType.DummyHonor:
      case ShopMailCommodityType.DummyMedal:
        return buildAchievementMedal(commodity);
      case ShopMailCommodityType.RoomListDecorate:
        return RoomListDecorate(
            commodity.commodityAvatar, commodity.commodityImage, 328.dp);
      default:
        return buildGift(commodity);
    }
  }

  _onFlushTop(type, data) {
    Log.d('_onFlushTop data:$data');

    bagGoods = data;
    if (bagGoods != null) {
      setState(() {
        _showPreview = true;
        bagGoods = data;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }
}
