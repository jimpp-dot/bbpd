import 'package:shared/shared.dart';
import 'package:shared/widget/explain_button.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall/page/vip_mall_second_page.dart';
import 'package:vip/src/vip_mall/widget/bag_button.dart';
import 'package:vip/src/vip_mall/widget/vip_mall_goods_item.dart';
import 'package:vip/src/vip_mall/widget/vip_mall_tab_item.dart';

import '../../../k.dart';
import '../api.dart';
import '../model/vip_mall_bean.dart';
import '../widget/mall_collection_room_entrance_widget.dart';
import 'package:provider/provider.dart' hide Selector;

/// 会员商城
class VipMallScreen extends StatefulWidget {
  static const String routeName = 'VipMallScreen';
  final String goToSecondType;

  const VipMallScreen({super.key, this.goToSecondType = ''});

  @override
  _VipMallScreenState createState() => _VipMallScreenState();

  static Future show(BuildContext context, {String goToSecondType = ''}) {
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    int index = mainManager.appNavigatorObserverGetIndex(routeName);
    if (index > -1) {
      Navigator.of(context).popUntil(ModalRoute.withName(routeName));
      return Future.value(null);
    } else {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VipMallScreen(goToSecondType: goToSecondType),
        settings: const RouteSettings(name: routeName),
      ));
    }
  }
}

class _VipMallScreenState extends State<VipMallScreen>
    with SingleTickerProviderStateMixin<VipMallScreen> {
  bool _loading = true;
  String? _errorMessage;

  List<VipMallTab> _tabs = [];
  List<RecommendGoods> _items = [];

  @override
  void initState() {
    super.initState();

    _loadData(goToSecondType: widget.goToSecondType);
  }

  _loadData({String goToSecondType = ''}) async {
    DataRsp<VipMallBean> response = await Api.getCommodity();
    if (response.success == true && response.data != null) {
      _tabs = response.data!.tab;
      _items = response.data!.items;
    } else {
      _errorMessage = response.msg;
    }

    _loading = false;
    if (mounted) setState(() {});
    context.read<ProfilePayload>().resetVipMallRedPoint();

    if (goToSecondType.isNotEmpty) {
      Future.delayed(
        const Duration(milliseconds: 300),
        () {
          if (!mounted) {
            return;
          }
          if (_tabs.isNotEmpty) {
            int index = _tabs.indexWhere((element) {
              return element.type == 'prop';
            });
            if (index > -1) {
              VipMallTab vipMallTab = _tabs[index];
              VipMallSecondPage.show(context, vipMallTab.name, vipMallTab.type);
            }
          }
        },
      );
    }
  }

  Future<void> _onReload() async {
    if (mounted) {
      setState(() {
        _errorMessage = null;
        _loading = true;
        _loadData();
      });
    }
  }

  _onExplainTap() {
    String url = Util.getPageUrlQA('shopQA');
    BaseWebviewScreen.show(context, url: url, title: K.explain);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.secondBgColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar.custom(
      backgroundColor: R.color.secondBgColor,
      title: Text(
        K.mall,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: R.color.mainTextColor,
        ),
      ),
      actions: <Widget>[
        const BagButton(),
        ExplainButton(onTap: _onExplainTap),
      ],
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(error: _errorMessage, onTap: () => _onReload());
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: _items.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) return _buildTabs();
        return _buildCommodity(_items[index - 1]);
      },
    );
  }

  Widget _buildTabs() {
    if (_tabs.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsetsDirectional.only(
          top: 12, start: 20, end: 20, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const MallCollectionRoomEntranceWidget(),
          GridView.count(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 0,
            crossAxisSpacing: 5,
            crossAxisCount: 5,
            childAspectRatio: 59.0 / 87.0,
            children: _tabs
                .map((e) => VipMallTabItem(key: ValueKey(e.name), tab: e))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCommodity(RecommendGoods goods) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 20, start: 20, end: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(goods.title),
          const SizedBox(height: 12),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 104 / 139,
            children: goods.items
                .map((e) => VipMallGoodsItem(commodity: e, onBuy: _loadData))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String? title) {
    return Text(
      title ?? '',
      style: TextStyle(
        color: R.color.mainTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
