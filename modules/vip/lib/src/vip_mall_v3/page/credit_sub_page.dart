import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import '../../../assets.dart';
import '../../../k.dart';
import '../../pb/generated/rpc_credit_shop.pb.dart';
import '../../pb/generated/slp_shop_resp.pb.dart';
import '../../pb/generated/store.pb.dart';
import '../mall_api.dart';
import '../widget/vip_mall_v3_diy_item.dart';
import '../widget/vip_mall_v3_goods_item.dart';
import 'credit_record_page.dart';

///积分兑换
class CreditSubPage extends StatefulWidget {
  final String type;

  const CreditSubPage({super.key, required this.type});

  @override
  State<StatefulWidget> createState() => CreditSubPageState();
}

class CreditSubPageState extends State<CreditSubPage>
    with BaseScreenStateMixin, AutomaticKeepAliveClientMixin {
  final String _tag = "CreditSubPageState";
  late GetCreditGoodsIndexResp rsp;
  final List<CreditGoodsIndex_CreditGoodsMode> _cateList = [];
  bool _ready = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    rsp = await MallApi.getCreditList();
    _cateList.clear();
    if (rsp.success) {
      _ready = rsp.data.ready;
      if (rsp.data.cMode.isNotEmpty) {
        for (int i = 0; i < rsp.data.cMode.length; i++) {
          if (rsp.data.cMode[i].cType == 0 || rsp.data.cMode[i].cType == 1) {
            //过滤不支持的类型
            _cateList.add(rsp.data.cMode[i]);
          }
        }
      }
      if (_cateList.isNotEmpty || !_ready) {
        setScreenReady();
      } else {
        setScreenEmpty(
            emptyMsg: K.vip_no_head, emptyMsgColor: R.colors.mainTextColor);
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
    List<Widget> res = [];
    if (!_ready) {
      res.add(const SizedBox(height: 150));
      res.add(EmptyWidget(
          desc: rsp.data.promptText,
          imgPath: Assets.vip$mall_func_waiting_webp,
          textColor: R.colors.mainTextColor.withOpacity(0.5)));
    } else {
      for (int i = 0; i < _cateList.length; i++) {
        CreditGoodsIndex_CreditGoodsMode bean = _cateList[i];
        if (bean.cType == 0) {
          for (int j = 0; j < bean.zone.length; j++) {
            res.add(_buildCateList(bean, bean.zone[j].name, bean.zone[j].desc));
          }
        } else if (bean.cType == 1) {
          for (int j = 0; j < bean.goods.length; j++) {
            res.add(
                _buildCateList(bean, bean.goods[j].name, bean.goods[j].desc));
          }
        }
      }
    }

    return Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 16, bottom: 12, start: 16, end: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildPointsAvailable(),
              const SizedBox(height: 10),
              ...res,
            ],
          ),
        ));
  }

  Widget _buildPointsAvailable() {
    return GestureDetector(
        child: Container(
          height: 44.dp,
          decoration: BoxDecoration(
              color: R.colors.mainBgColor,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsetsDirectional.only(start: 10, end: 12),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 1),
                  Text(K.mall_points_available,
                      style: TextStyle(
                          fontSize: 12.dp,
                          color: R.colors.mainTextColor,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              Text("${rsp.data.balanceScore}",
                  style: TextStyle(
                      fontSize: 21.dp,
                      color: R.colors.mainTextColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: Util.numFontFamily,
                      package: ComponentManager.MANAGER_BASE_CORE)),
              R.img(BaseAssets.shared$icon_next_svg,
                  width: 20, color: R.colors.mainTextColor),
              const Spacer(),
              GestureDetector(
                child: Container(
                    height: 20.dp,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          R.colors.textGradientColors[0].withOpacity(0.2),
                          R.colors.textGradientColors[1].withOpacity(0.2)
                        ]),
                        borderRadius: BorderRadius.circular(14)),
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 12),
                    child: Row(children: [
                      R.img(BaseAssets.shared$ic_union_gold_money_webp,
                          width: 14),
                      const SizedBox(width: 2),
                      GradientText(K.mall_light_text,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1),
                          gradient: LinearGradient(
                              colors: R.colors.textGradientColors)),
                    ])),
                onTap: () {
                  IPersonalDataManager personalDataManager = ComponentManager
                      .instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  personalDataManager.openGiftWallScreen(context, Session.uid);
                },
              )
            ],
          ),
        ),
        onTap: () {
          if (_ready) {
            CreditRecordPage.show(context);
          }
        });
  }

  Widget _buildCateList(
      CreditGoodsIndex_CreditGoodsMode bean, String title, String subTitle) {
    List<Widget> items = [];
    if (bean.cType == 0) {
      for (CreditGoodsIndex_CustomZoneItem item in bean.zone[0].items) {
        items.add(_renderDiyItem(item));
      }
    } else if (bean.cType == 1) {
      for (StoreCommodityItem item in bean.goods[0].items) {
        items.add(_renderCommodityItem(item));
      }
    } else {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 10.dp, bottom: 10.dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(title,
                style: TextStyle(
                    fontSize: 16.dp,
                    color: R.colors.mainTextColor,
                    fontWeight: FontWeight.w600)),
            if (subTitle.isNotEmpty)
              Text(subTitle,
                  style: TextStyle(
                      fontSize: 10.dp,
                      color: R.colors.mainTextColor.withOpacity(0.5),
                      fontWeight: FontWeight.normal)),
          ]),
          const SizedBox(height: 12),
          GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 8,
              childAspectRatio: 104 / 139,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: items),
        ],
      ),
    );
  }

  Widget _renderCommodityItem(StoreCommodityItem item) {
    return VipMallV3GoodsItem(
        commodity: item,
        onBuy: () {
          _loadData();
        });
  }

  Widget _renderDiyItem(CreditGoodsIndex_CustomZoneItem item) {
    return VipMallV3DiyItem(
        diyItem: item,
        onBuy: () {
          _loadData();
        });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
