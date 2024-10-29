import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall_v3/mall_api.dart';

import '../../../k.dart';
import '../../pb/generated/slp_shop_resp.pb.dart';

///积分兑换页
class CreditRecordPage extends StatefulWidget {
  const CreditRecordPage({super.key});

  @override
  State<StatefulWidget> createState() => CreditRecordPageState();

  static Future show(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreditRecordPage(),
        settings: const RouteSettings(name: '/CreditRecordPage'),
      ),
    );
  }
}

class CreditRecordPageState extends State<CreditRecordPage> {
  bool _loading = true;
  final List<GetExchangeListResp_ExchangeRecord> _data = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    GetExchangeListResp rsp = await MallApi.getCreditHistory();
    _data.clear();
    if (rsp.success) {
      for (var item in rsp.data.records) {
        _data.add(item);
      }
    } else {}
    _loading = false;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(K.mall_points_record,
            backColor: R.colors.mainTextColor,
            backgroundColor: R.colors.homeSecondBgColor,
            suppDark: true),
        backgroundColor: R.colors.homeSecondBgColor,
        body: _buildBody());
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }
    if (_data.isEmpty) {
      return EmptyWidget(onTap: _load);
    }
    return RefreshIndicatorFactory.of(
      child: ListView.separated(
        itemCount: _data.length,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
        cacheExtent: 67,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: R.colors.mainTextColor.withOpacity(0.08),
            height: 0.5,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(_data[index]);
        },
      ),
      onRefresh: _load,
    );
  }

  Widget _buildItem(GetExchangeListResp_ExchangeRecord item) {
    String price = "";
    if (item.money > 0) {
      price =
          "${item.score}${K.vip_gold_credit}+${item.money}${MoneyConfig.moneyName4}";
    } else {
      price = "${item.score}${K.vip_gold_credit}";
    }
    return Container(
      height: 70.dp,
      alignment: Alignment.center,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item.desc,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16.dp,
                            color: R.colors.mainTextColor,
                            fontWeight: FontWeight.normal)),
                    Text(Utility.formatDateV1(item.createTime.toInt()),
                        style: TextStyle(
                            fontSize: 12.dp,
                            color: R.colors.mainTextColor.withOpacity(0.5),
                            fontWeight: FontWeight.normal))
                  ]),
            ),
            const SizedBox(width: 5),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GradientText(K.mall_points_total,
                      style: TextStyle(
                          fontSize: 12.dp, fontWeight: FontWeight.bold),
                      gradient: const LinearGradient(
                          colors: [Color(0xFFF0A672), Color(0xFFF0D7C1)])),
                  GradientText(price,
                      style: TextStyle(
                          fontSize: 12.dp, fontWeight: FontWeight.w600),
                      gradient: const LinearGradient(
                          colors: [Color(0xFFF0A672), Color(0xFFF0D7C1)]))
                ]),
          ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
