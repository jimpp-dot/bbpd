import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base_k;
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/star_exchange/cplink_star_exchange_custom_page.dart';
import 'package:personaldata/src/star_exchange/cplink_star_exchange_record_page.dart';
import 'package:personaldata/src/star_exchange/pb/generated/relation_conver.pb.dart';
import 'package:personaldata/src/star_exchange/star_exchange_repo.dart';

/// 集星兑换页
class CpLinkStarExchangePage extends StatefulWidget {
  const CpLinkStarExchangePage({super.key});

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CpLinkStarExchangePage(),
      settings: const RouteSettings(name: '/CpLinkStarExchangePage'),
    ));
  }

  @override
  State<CpLinkStarExchangePage> createState() => _CpLinkStarExchangePageState();
}

class _CpLinkStarExchangePageState
    extends BaseScreenState<CpLinkStarExchangePage> {
  final double _padding = 16.dp;
  late ConvertHomeData _data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    setScreenLoading();
    _loadData();
  }

  void _loadData() async {
    final rsp = await StarExchangeRepo.exchangeHomePage();
    if (rsp.success) {
      _data = rsp.data;
      CachedImageManager.preCache(
          context, Util.getRemoteImgUrl(_data.customData.bg));
      setScreenReady();
    } else {
      setScreenError(errorMsg: rsp.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF5F5F5);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: BaseAppBar.custom(
        title: Text(K.personal_star_exchange),
        backgroundColor: bgColor,
        actions: [
          _buildHelpWidget(),
        ],
      ),
      body: buildStatusContent(),
    );
  }

  Widget _buildHelpWidget() {
    return InkWell(
      onTap: () => BaseWebviewScreen.show(context,
          url: Util.getProductHelpUrl('k224'),
          title: K.personal_star_exchange + base_k.K.base_explain),
      child: Container(
        padding: const EdgeInsetsDirectional.only(end: 16, start: 16),
        alignment: Alignment.center,
        child: R.img(RoomAssets.chat_room$cplink_cplink_rank_question_webp,
            width: 24, height: 24, color: R.color.mainTextColor),
      ),
    );
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        _buildTopBlock(),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _data.list.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildGoods(_data.list[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTopBlock() {
    int starCount = _data.my.starNum;
    int expireCount = _data.my.expiredStarNum;
    return Container(
      margin: EdgeInsetsDirectional.only(
          start: _padding, end: _padding, bottom: 25.dp),
      padding: EdgeInsetsDirectional.only(
          start: 10.dp, end: 12.dp, top: 9.dp, bottom: 9.dp),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 5.dp),
                      child: Text(
                        K.personal_available_star_prefix,
                        style: TextStyle(
                            fontSize: 12.dp,
                            color: R.color.mainTextColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    NumText(
                      '$starCount',
                      style: TextStyle(
                          fontSize: 21.dp,
                          fontWeight: FontWeight.bold,
                          color: R.color.mainTextColor),
                    ),
                  ],
                ),
                SizedBox(height: 2.dp),
                Row(
                  children: [
                    Text(K.personal_x_a_star(['$expireCount']),
                        style: TextStyle(
                            fontSize: 12.dp, color: const Color(0xFFFF5F7D))),
                    Text(
                      K.personal_star_will_x_expired([
                        DateTime.fromMillisecondsSinceEpoch(
                                _data.my.expiredTime * 1000)
                            .toyyyyMMddHHmm()
                      ]),
                      style: TextStyle(
                          fontSize: 12.dp,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => CpLinkStarExchangeRecordPage.show(context),
            child: Container(
              width: 44.dp,
              height: 20.dp,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: Colors.black.withOpacity(0.06),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(K.personal_detail,
                  style: TextStyle(
                      fontSize: 12.dp, color: Colors.black.withOpacity(0.5))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoods(ConvertHomeData_TypeData item) {
    final list = item.list;
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: _padding, end: _padding, bottom: 22.dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.typeName,
              style: TextStyle(
                  fontSize: 16.dp,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 8.dp),
          GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8.dp,
            crossAxisSpacing: 8.dp,
            childAspectRatio: 109 / 158.5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: list.map((e) => _buildItem(e, item.typeId == 1)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(ConvertHomeData_TypeData_ShowItem item, bool custom) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            width: 109.dp,
            height: 96.dp,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  Color(0xFF2E3FE6),
                  Color(0xFF3654E7),
                  Color(0xFF6B9AEE),
                  Color(0xFF78C0F0)
                ],
              ),
            ),
            alignment: AlignmentDirectional.center,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CachedNetworkImage(
                  imageUrl: item.icon,
                  width: 80.dp,
                  height: 80.dp,
                ),
                if (custom)
                  YouSheText(K.personal_diy,
                      style: TextStyle(
                          fontSize: 24, color: Colors.black.withOpacity(0.5))),
              ],
            ),
          ),
          Container(
            width: 109.dp,
            height: 62.5.dp,
            color: Colors.white,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                if (custom)
                  PositionedDirectional(
                    end: 0,
                    bottom: 0,
                    child: R.img(Assets.personaldata$star_exchange_ic_diy_webp,
                        width: 70.dp, height: 28.dp),
                  ),
                Column(
                  children: [
                    Container(
                      width: 100.dp,
                      height: 28.5.dp,
                      alignment: AlignmentDirectional.center,
                      child: Text(item.desc,
                          style: TextStyle(
                              fontSize: 12.dp, color: R.color.secondTextColor)),
                    ),
                    _buildBtn(item, custom),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onTapCustom(ConvertHomeData_TypeData_ShowItem item) async {
    final res = await CpLinkStarExchangeCustomPage.show(
        context, item, _data.customData);
    if (res == true) {
      _loadData();
    }
  }

  void _onTapExchange(ConvertHomeData_TypeData_ShowItem item) async {
    CommonLoading.show();
    final rsp =
        await StarExchangeRepo.exchange(item.goodsType, item.goodsId, item.id);
    CommonLoading.dismiss();
    if (rsp.success) {
      Fluttertoast.showCenter(msg: K.personal_exchange_success);
      _loadData();
    } else {
      Fluttertoast.showCenter(msg: rsp.msg);
    }
  }

  Widget _buildBtn(ConvertHomeData_TypeData_ShowItem item, bool custom) {
    return GestureDetector(
      onTap: () {
        if (custom) {
          _onTapCustom(item);
        } else {
          _onTapExchange(item);
        }
      },
      child: Container(
        width: 70.dp,
        height: 28.dp,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: R.color.mainBrandColor,
        ),
        alignment: AlignmentDirectional.center,
        child: Text(item.buttonText,
            style: TextStyle(fontSize: 12.dp, color: Colors.white)),
      ),
    );
  }
}
