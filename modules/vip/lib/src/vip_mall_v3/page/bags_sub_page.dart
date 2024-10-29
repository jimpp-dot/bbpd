import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:vip/src/pb/generated/rpc_shop.pb.dart';
import 'package:vip/src/vip_mall_v3/widget/vip_mall_v3_bags_item.dart';
import '../../pb/generated/slp_shop_resp.pb.dart';
import '../mall_api.dart';

class BagsSubPage extends StatefulWidget {
  final int bagType;

  const BagsSubPage({Key? key, required this.bagType}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BagsSubPageState();
}

class BagsSubPageState extends State<BagsSubPage>
    with BaseScreenStateMixin, AutomaticKeepAliveClientMixin {
  late String _tag;
  late ShopBagListResp rsp;
  final List<ShopBag> _bagsList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    rsp = await MallApi.getBagList(widget.bagType);
    if (rsp.success) {
      _bagsList.addAll(rsp.data);
      if (_bagsList.isNotEmpty) {
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
          children: [..._bagsList.map((e) => _renderItem(e)).toList()],
        )));
  }

  Widget _renderItem(ShopBag bagItem) {
    return VipMallV3BagsItem(bag: bagItem);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
