import 'dart:core';
import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/explain_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall/api.dart';
import 'package:vip/src/vip_mall/model/commodity_bean.dart';
import 'package:vip/src/vip_mall/model/vip_mall_second_bean.dart';
import 'package:vip/src/vip_mall/widget/bag_button.dart';
import 'package:vip/src/vip_mall/widget/vip_mall_goods_item.dart';

import '../../../k.dart';
import '../widget/filter_menu_widget.dart';

class _TabItem {
  final String name;

  _TabItem(this.name);
}

/// 列表没项的顶部、尾部位置
class _ItemOffset {
  final double head;
  final double tail;

  _ItemOffset(this.head, this.tail);
}

/// VIP二级页面
class VipMallSecondPage extends StatefulWidget {
  static const String routeName = 'VipMallSecondPage';

  final String? title;
  final String type;

  const VipMallSecondPage(this.title, this.type, {super.key});

  @override
  _VipMallSecondPageState createState() => _VipMallSecondPageState();

  static Future show(BuildContext context, String? title, String type) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VipMallSecondPage(title, type),
        settings: const RouteSettings(name: routeName),
      ),
    );
  }
}

class _VipMallSecondPageState extends State<VipMallSecondPage>
    with TickerProviderStateMixin {
  final AutoScrollController _scrollController =
      AutoScrollController(axis: Axis.vertical);

  final List<_ItemOffset> _itemOffsetList = [];
  final List<_TabItem> _tabList = [];
  TabController? _tabController;
  String? _error;
  bool _isLoading = true;
  List<VipMallSecondBean> _dataList = [];
  bool _showTab = false; // 是否显示顶部tab，当tab数据小于等于1时不显示
  bool _scrolling = false;
  CouponTip? _couponTip;

  /// 过滤选项
  final GlobalKey<FilterMenuWidgetState> _filterKey = GlobalKey();
  List<String> _filterConfigs = [];
  Set<String> _selectLevel = {};
  bool _showFilter = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollChange);
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    _scrollController.removeListener(_onScrollChange);
    _scrollController.dispose();
  }

  _loadData() async {
    DataRsp<List<VipMallSecondBean>> response =
        await Api.getCommodityList(widget.type);
    _filterConfigs = await Api.getFilterInfo(widget.type);
    DataRsp<CouponTip> couponResponse = await Api.getCouponTip(widget.type);
    _couponTip = couponResponse.success == true ? couponResponse.data : null;

    if (response.success == true) {
      _dataList = response.data ?? [];
      _dataList.removeWhere(
          (element) => (Util.needHideAllTitle() && element.title == '爵位专属'));
      _tabList.clear();
      for (VipMallSecondBean element in _dataList) {
        _tabList.add(_TabItem(element.title));
      }
      if (_tabList.length > 1 || _filterConfigs.isNotEmpty) {
        safeRun(() {
          _tabController = TabController(length: _tabList.length, vsync: this);
        });
        _showTab = true;
      } else {
        _showTab = false;
      }
      _calcOffset();
    } else {
      _error = response.msg ?? '';
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _reload() {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _error = null;
        _dataList.clear();
        _tabList.clear();
        _filterConfigs.clear();
        _itemOffsetList.clear();
        _selectLevel.clear();
      });
    }
    _loadData();
  }

  // 计算滑动偏移
  _calcOffset() {
    _itemOffsetList.clear();
    double itemHeight = 0;
    // 计算单个卡片高度
    double cardItemHeight = (Util.width - 20 * 2 - 12 * 2) / 3 * 139 / 104;
    for (VipMallSecondBean element in _dataList) {
      List<ShopMailCommodity> displayItems = _filterCommodity(element.items);

      int length = displayItems.length;
      int cardRow = 0;
      if (element.displayCategory) {
        if (element.selectKey == K.vip_all) {
          cardRow = (length / 3).ceil();
        } else {
          Map<String, List<ShopMailCommodity>> select = element.getCategory();
          cardRow = ((select[element.selectKey]?.length ?? 0) / 3).ceil();
        }
      } else {
        // 占位高度
        if (length == 0 && _filterConfigs.isNotEmpty) {
          length = 1;
        }
        cardRow = (length / 3).ceil();
      }

      double tail = cardRow * cardItemHeight + cardRow * 12 + 38 + 28;
      if (element.displayCategory &&
          displayItems.isNotEmpty &&
          element.getCategory().length > 1) {
        tail += 44;
      }
      _itemOffsetList.add(_ItemOffset(itemHeight, tail + itemHeight));
      itemHeight += tail;
    }
  }

  void _onTabChange(int index) {
    if (_showFilter) {
      _filterKey.currentState?.hideFilter();
      _showFilter = false;
    }
    _scrolling = true;
    _tabController?.animateTo(index);
    _scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .whenComplete(() {
      _scrolling = false;
    });
  }

  void _onScrollChange() {
    if (_scrolling) return;
    double offset = _scrollController.offset;
    int index = -1;
    for (var item in _itemOffsetList) {
      index++;
      if (offset > item.head - 60 && offset < item.tail) {
        _tabController?.index = index;
        break;
      }
    }
  }

  _onSelectChanged(Set<String> select) {
    _showFilter = false;
    _selectLevel = select;
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 150), curve: Curves.easeOut);
    _calcOffset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: _buildAppBar(),
      body: Container(
        color: R.color.secondBgColor,
        child: _renderBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar.custom(
      title: Text(
        widget.title ?? '',
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: R.color.mainTextColor),
      ),
      actions: <Widget>[
        const BagButton(from: 'second'),
        ExplainButton(onTap: _onExplainTap),
      ],
    );
  }

  void _onExplainTap() {
    String url = Util.getPageUrlQA('shopQA');
    BaseWebviewScreen.show(context, url: url, title: K.explain);
  }

  Widget _renderBody() {
    if (_isLoading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (_error != null) {
      return ErrorData(error: _error, onTap: _reload);
    }

    if (_dataList.isEmpty) {
      return EmptyWidget(onTap: _reload);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            color: R.color.mainBgColor,
            width: MediaQuery.of(context).size.width,
            child: _renderTab()),
        if (_couponTip != null) _renderCoupons(),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return AutoScrollTag(
                    controller: _scrollController,
                    index: index,
                    key: ValueKey(index),
                    child: _renderGroupItem(_dataList[index]),
                  );
                },
                itemCount: _dataList.length,
                controller: _scrollController,
              ),
              FilterMenuWidget(
                key: _filterKey,
                filterInfo: _filterConfigs,
                onValueChanged: _onSelectChanged,
                onHide: () {
                  _showFilter = false;
                  setState(() {});
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _renderTab() {
    if (_showTab != true) {
      return const SizedBox.shrink();
    }
    double tabHeight = 44;
    List<Widget> tabs = [];

    for (int i = 0; i < _tabList.length; i++) {
      tabs.add(Tab(
        child: Container(
          height: tabHeight,
          alignment: AlignmentDirectional.center,
          child: Text(_tabList[i].name),
        ),
      ));
    }
    return Row(
      children: [
        Expanded(
          child: CommonTabBar(
            tabs: tabs,
            onTap: (value) {
              _onTabChange(value);
            },
            isScrollable: true,
            controller: _tabController,
            labelStyle: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(
                color: R.color.secondTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
            indicator: CommonUnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
              insets: const EdgeInsetsDirectional.only(bottom: 4),
              wantWidth: 16,
              draggingWidth: 12.0,
            ),
            indicatorWeight: 0,
            marginStart: 8,
            marginEnd: 60,
            labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
          ),
        ),
        _buildFilter(),
      ],
    );
  }

  Widget _renderCoupons() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20),
      color: const Color(0xFF69D1FF).withOpacity(0.2),
      height: 40,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(_couponTip?.icon ?? ''),
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              _couponTip?.tips ?? '',
              style: const TextStyle(color: Color(0xFF369CFF), fontSize: 14),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: _couponTipHelpAction,
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  start: 10, end: 10, top: 5, bottom: 5),
              child: R.img(
                BaseAssets.ic_help_webp,
                package: ComponentManager.MANAGER_BASE_CORE,
                width: 20,
                height: 20,
                color: const Color(0xFF369CFF),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  void _couponTipHelpAction() {
    if (_couponTip == null || _couponTip!.explainUrl.isEmpty) {
      return;
    }
    BaseWebviewScreen.show(context, url: _couponTip!.explainUrl);
  }

  Widget _buildFilter() {
    if (_filterConfigs.isEmpty) {
      return const SizedBox.shrink();
    }

    bool select = _selectLevel.isNotEmpty;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (_showFilter) {
          _filterKey.currentState?.hideFilter();
        } else {
          _filterKey.currentState?.showFilter(_selectLevel);
        }
        _showFilter = !_showFilter;

        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: [Colors.white.withOpacity(0), Colors.white],
          ),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Text(
                  '稀有度',
                  style: TextStyle(
                      color: select
                          ? R.color.mainBrandColor
                          : R.color.secondTextColor,
                      fontSize: 12),
                ),
                Transform.rotate(
                  angle: _showFilter ? pi : 0,
                  child: R.img(
                    'mall/ic_dropdown.svg',
                    package: ComponentManager.MANAGER_VIP,
                    width: 12,
                    height: 12,
                    color: select
                        ? R.color.mainBrandColor
                        : R.color.thirdTextColor,
                  ),
                ),
                const SizedBox(width: 16),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _renderGroupItem(VipMallSecondBean item) {
    List<ShopMailCommodity> displayItems =
        _filterCommodity(item.getSelectCategories());

    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 12, bottom: 12, start: 16, end: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: TextStyle(
                fontSize: 18,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          if (item.displayCategory) _buildCategories(item),
          GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 104 / 139,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              if (displayItems.isEmpty)
                const EmptyCommodityWidget()
              else
                ...displayItems.map((e) => _renderItem(e)).toList(),
            ],
          ),
        ],
      ),
    );
  }

  List<ShopMailCommodity> _filterCommodity(List<ShopMailCommodity> items) {
    if (_selectLevel.isEmpty) return items;
    return items
        .where((element) => _selectLevel.contains(element.grade))
        .toList();
  }

  Widget _buildCategories(VipMallSecondBean item) {
    List<String> keys = item.getCategory().keys.toList();
    if (keys.length <= 1) return const SizedBox.shrink();
    keys.insert(0, K.vip_all);
    return Container(
      height: 28,
      margin: const EdgeInsetsDirectional.only(top: 4, bottom: 16),
      child: ListView.separated(
        itemCount: keys.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildCategory(keys[index], item);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
      ),
    );
  }

  Widget _buildCategory(String name, VipMallSecondBean item) {
    if (name.isEmpty) return const SizedBox.shrink();
    bool select = item.selectKey == name;

    return GestureDetector(
      onTap: () {
        item.selectKey = name;
        _calcOffset();
        setState(() {});
      },
      child: Container(
        height: 28,
        alignment: Alignment.center,
        padding: const EdgeInsetsDirectional.only(end: 12.0, start: 12),
        decoration: BoxDecoration(
          color: select ? R.color.mainBrandColor : Colors.transparent,
          borderRadius: BorderRadius.circular(14.5),
          border: select
              ? null
              : Border.all(color: R.color.mainTextColor.withOpacity(0.1)),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: select ? Colors.white : R.color.thirdTextColor,
            fontSize: 13,
            fontWeight: select ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _renderItem(ShopMailCommodity item) {
    return VipMallGoodsItem(commodity: item, from: 'second', onBuy: _loadData);
  }
}
