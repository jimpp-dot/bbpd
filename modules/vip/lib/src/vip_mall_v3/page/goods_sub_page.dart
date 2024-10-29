import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

import '../../pb/generated/store.pb.dart';
import '../mall_api.dart';
import '../widget/vip_mall_v3_goods_item.dart';

class GoodsSubPage extends StatefulWidget {
  final String type;
  final StoreWhere? extra;

  const GoodsSubPage({super.key, this.extra, required this.type});

  @override
  State<StatefulWidget> createState() => GoodsSubPageState();
}

class GoodsSubPageState extends State<GoodsSubPage>
    with BaseScreenStateMixin, AutomaticKeepAliveClientMixin {
  late String _tag;
  late ApiStorePageResponse rsp;
  final List<StoreCommodityItem> _goodsList = [];

  @override
  void initState() {
    super.initState();
    _tag = "GoodsSubPageState${widget.type}";
    _loadData();
  }

  _loadData() async {
    Map<String, String> map = {};
    if (widget.extra != null) {
      if (widget.extra?.type.isNotEmpty == true)
        map["type"] = "${widget.extra?.type}";
      if ((widget.extra?.ductionRate ?? 0) > 0)
        map["duction_rate"] = "${widget.extra?.ductionRate}";
      if (widget.extra?.subtype.isNotEmpty == true)
        map["subtype"] = "${widget.extra?.subtype}";
      if (widget.extra?.vip.isNotEmpty == true)
        map["vip"] = "${widget.extra?.vip}";
      if (widget.extra?.nobility.isNotEmpty == true)
        map["nobility"] = "${widget.extra?.nobility}";
      if (widget.extra?.recommend.isNotEmpty == true)
        map["recommend"] = "${widget.extra?.recommend}";
    }
    rsp = await MallApi.getStorePageData(widget.type, extra: map);
    if (rsp.success) {
      if (rsp.data.partition.isNotEmpty) {
        for (int i = 0; i < rsp.data.partition.length; i++) {
          _goodsList.addAll(rsp.data.partition[i].list);
        }
      }
      if (_goodsList.isNotEmpty) {
        setScreenReady();
      } else {
        setScreenEmpty(emptyMsgColor: R.colors.mainTextColor);
      }
    } else {
      setScreenError(
          errorMsg: rsp.message, errorMsgColor: R.colors.mainTextColor);
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildStatusContent();
  }

  @override
  Widget buildContent() {
    return Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 16, bottom: 12, start: 16, end: 16),
        child: SingleChildScrollView(
            child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 8,
          childAspectRatio: 104 / 139,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [..._goodsList.map((e) => _renderItem(e)).toList()],
        )));
  }

  Widget _renderItem(StoreCommodityItem item) {
    return VipMallV3GoodsItem(commodity: item, onBuy: () {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
