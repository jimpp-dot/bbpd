import 'dart:io';

import 'package:flutter/material.dart' hide DateUtils;
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:gift/src/repo/gift_activity_repo.dart';
import 'package:gift/k.dart';
import 'package:gift/src/model/generated/slp_gift_pack.pb.dart';
import 'package:gift/src/recharge_packet_center/gift_pack_daily_bless_dialog.dart';
import 'package:gift/src/recharge_packet_center/gift_pack_daily_pray_record_dialog.dart';
import 'package:gift/src/recharge_packet_center/gift_pack_daily_coupon_record_dialog.dart';
import 'package:gift/src/recharge_packet_center/gift_pack_daily_packet_dialog.dart';

import '../../assets.dart';
import 'recharge_pack_center_screen.dart';

enum RechargeRewardLevel { primaryReward, middleReward, seniorReward }

class RechargeDailyPackPage extends StatefulWidget {
  final SubTabScrollCallback scrollCallback;
  final double appBarHeight;

  const RechargeDailyPackPage({
    required this.scrollCallback,
    required this.appBarHeight,
    Key? key,
  }) : super(key: key);

  @override
  State<RechargeDailyPackPage> createState() => RechargeDailyPackPageState();
}

class RechargeDailyPackPageState extends State<RechargeDailyPackPage>
    with AutomaticKeepAliveClientMixin {
  final IPersonalDataManager _personalDataManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);
  final String _refer = 'package_center_daily';
  int _pack_price = 0;
  final bool _openLimit = false; //打开宝箱达到上线
  GiftPackDailyConfig _dailyConfig = GiftPackDailyConfig();
  final ScrollController _scrollController = ScrollController();
  List<PrayAwardPreviewList> _prayAwardPreviewList = [];
  List<PrayAwardItem> _primaryList = [];
  List<PrayAwardItem> _middleList = [];
  List<PrayAwardItem> _seniorList = [];
  List<PrayAwardList> _prayAwardList = [];
  List<PayDutyItem> _payDutyList = [];
  List<PrevPrayAwardResult> _awardResultList = [];
  final SliverGridDelegate _primaryDelegate =
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 30,
    crossAxisSpacing: 50,
    childAspectRatio: 80.0 / 135.0,
  );

  final SliverGridDelegate _middleDelegate =
      SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 25,
    crossAxisSpacing: (Util.width - 90 - 3 * 80) / 2,
    childAspectRatio: 80.0 / 135.0,
  );

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadGiftPackDailyConfig();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  _onScroll() {
    if (!_scrollController.hasClients) return;

    widget.scrollCallback(_scrollController.offset);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Container(
        decoration: commonBoxDecorationWithParamsBeginAndEnd(
            [const Color(0xff2A0084), const Color(0xff200539)],
            0,
            const Alignment(0, 1),
            const Alignment(0, -1)),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: _buildWinningGift(),
            ),
            if (_payDutyList.isNotEmpty)
              SliverToBoxAdapter(
                child: _buildDailyRecharge(),
              ),
            if (_dailyConfig.openBoxType.isNotEmpty ||
                _dailyConfig.openedBoxType.isNotEmpty)
              SliverToBoxAdapter(
                child: _buildOpenGiftBox(),
              ),
            if (_awardResultList.isNotEmpty)
              SliverToBoxAdapter(
                child: _buildLastWinner(),
              ),
            if (_prayAwardList.isNotEmpty)
              SliverToBoxAdapter(
                child: _buildBlessingReward(),
              ),
            SliverToBoxAdapter(
              child: _buildAwardAnnouncement(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 0, start: 16, end: 16),
                child: Text(
                  K.gift_pack_bottom_tips_1,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.5),
                    height: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (Platform.isIOS)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 40, start: 16, end: 16),
                  child: Text(
                    K.gift_pack_bottom_tips_2,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.3),
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            SliverPadding(
              padding: EdgeInsetsDirectional.only(
                  bottom: Util.isIphoneX ? Util.iphoneXBottom : 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWinningGift() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: widget.appBarHeight + 240,
          minHeight: widget.appBarHeight + 200),
      child: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 10),
        width: Util.width,
        height: widget.appBarHeight + 200,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: '${System.imageDomain}static/gift_pack_daily_bg.webp',
              width: Util.width,
              height: widget.appBarHeight + 200,
              fit: BoxFit.fill,
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: widget.appBarHeight + 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(
                        'static/gift_pack_daily_title.webp'),
                    width: 320,
                    height: 69,
                    cachedWidth: 320.px,
                    cachedHeight: 69.px,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  buildPreviewList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPreviewList() {
    if (_prayAwardPreviewList.isEmpty) {
      return const SizedBox.shrink();
    }
    List<Widget> widgets = [];

    for (int i = 0; i < _prayAwardPreviewList.length && i < 4; i++) {
      widgets.add(buildPreviewItem(_prayAwardPreviewList[i]));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        ...widgets,
      ],
    );
  }

  Widget buildPreviewItem(PrayAwardPreviewList item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            R.img(
              width: 172 / 2,
              height: 140 / 2,
              Assets.daliy_gift_icon_bg_webp,
              package: ComponentManager.MANAGER_GIFT,
            ),
            CachedNetworkImage(
              imageUrl:
                  '${Util.getRemoteImgUrl(item.icon)}${Util.getGiftUrlSuffix()}',
              width: 62,
              height: 62,
              fit: BoxFit.contain,
            ),
          ],
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(
              top: 4, bottom: 4, start: 6, end: 6),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                R.imagePath(
                  Assets.btn_gift_name_bg_webp,
                  package: ComponentManager.MANAGER_GIFT,
                ),
              ),
            ),
          ),
          child: Text(
            item.name,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.1,
            ),
            maxLines: 1,
          ),
        ),
        Text(
          (item.type == 'gift' && item.price > 0)
              ? '${item.price}${K.gift_pack_diamond}'
              : '',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.7),
            height: 1.2,
          ),
          maxLines: 1,
        ).paddingOnly(top: 2),
      ],
    );
  }

  Widget _buildDailyRecharge() {
    List<Widget> widgets = [];

    for (var element in _payDutyList) {
      widgets.add(
          _buildDailyTaskItem(element.title, element.progress, element.limit));
    }

    Widget body = Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildGiftBoxTitle(K.gift_pack_center_daily_pay, 196),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 26),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                physics: const NeverScrollableScrollPhysics(),
                children: widgets,
              ),
            ),
            _buildRechargePacketButton(),
          ],
        ),
        PositionedDirectional(
          end: 10,
          top: 10,
          height: 20,
          width: 20,
          child: GestureDetector(
            child: Opacity(
              opacity: 0.6,
              child: R.img(
                Assets.gift_pack_recharge_daily_gift_info_webp,
                width: 20,
                height: 20,
                package: ComponentManager.MANAGER_GIFT,
              ),
            ),
            onTap: () {
              BaseWebviewScreen.show(context,
                  url: Util.getHelpUrlWithQStr('k108'));
            },
          ),
        ),
      ],
    );
    return _buildContainerFrame(body);
  }

  Widget _buildDailyTaskItem(String content, int progress, int limit) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              content,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            "($progress/$limit)",
            style: const TextStyle(
                color: Color(0xFFFFD476),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftBoxTitle(String title, double width) {
    double rate = 162 / 495;
    return Container(
      height: 28,
      alignment: AlignmentDirectional.center,
      margin: const EdgeInsetsDirectional.only(top: 12),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          R.img(Assets.gift_title_bgn_webp,
              width: width,
              height: width * rate,
              package: ComponentManager.MANAGER_GIFT,
              fit: BoxFit.fill
              //fit: BoxFit.contain,
              ),
        ],
      ),
    );
  }

  Widget _buildOpenGiftBox() {
    String packetLevel = _dailyConfig.openBoxType;
    switch (packetLevel) {
      case 'primary':
        {
          _pack_price = _dailyConfig.primaryBoxPrice;
        }
        break;
      case 'middle':
        {
          _pack_price = _dailyConfig.middleBoxPrice;
        }
        break;
      case 'senior':
        {
          _pack_price = _dailyConfig.seniorBoxPrice;
        }
        break;
    }
    String imgPath = Util.getRemoteImgUrl(
        'static/gift_pack_daily_${packetLevel}_packet.webp');

    Log.d('imgPath:$imgPath');

    Widget body = Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment : CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: imgPath,
                height: 139,
                fit: BoxFit.contain,
              ),
              packetLevel == 'senior'
                  ? Container(
                      width: Util.width - 37 * 2,
                      height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCouponButton(
                              K.gift_pack_open_again, _pack_price, 1),
                          const SizedBox(width: 16),
                          _buildCouponButton(
                              K.gift_pack_open_ten_again, _pack_price * 10, 10),
                        ],
                      ),
                    )
                  : _buildCouponButton(K.gift_pack_open_again, _pack_price, 1,
                      width: Util.width - 40 - 31 * 2),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  GiftPackDailyCouponRecordDialog.show(context);
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  margin: const EdgeInsetsDirectional.only(top: 10, bottom: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        K.gift_pack_coupon_history,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.navigate_next_rounded,
                          color: Colors.white.withOpacity(0.6)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(top: 10, end: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 24,
                padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    R.img(Assets.gift_pack_gift_pack_daily_coupon_webp,
                        width: 24,
                        height: 24,
                        package: ComponentManager.MANAGER_GIFT,
                        fit: BoxFit.fill
                        //fit: BoxFit.contain,
                        ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${_dailyConfig.couponNum}',
                      style: const TextStyle(
                          color: Color(0xFFFCD315),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (_openLimit && packetLevel != 'senior') {
      return Opacity(
        opacity: 0.5,
        child: _buildContainerFrame(body),
      );
    }

    return _buildContainerFrame(body);
  }

  Widget _buildCouponButton(
    String title,
    int price,
    int count, {
    double width = 142.5,
  }) {
    return GestureDetector(
      onTap: () {
        _openGiftPack(count);
      },
      child: Container(
        width: width,
        height: 36,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: [Color(0xFfC94AFF), Color(0xFFFFC941)],
          ),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 8,
            ),
            R.img(Assets.gift_pack_gift_pack_daily_coupon_webp,
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_GIFT,
                fit: BoxFit.fill
                //fit: BoxFit.contain,
                ),
            Text(
              "x$price",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildOpenPacketButton(String title) {
  //   Widget content = Container(
  //     margin: EdgeInsetsDirectional.only(bottom: 17),
  //     child: LayoutBuilder(
  //       builder: (BuildContext context, BoxConstraints constraints) {
  //         return GradientButton(
  //           title,
  //           //'充值',
  //           width: constraints.maxWidth - 31 * 2,
  //           height: 46,
  //           begin: AlignmentDirectional.centerStart,
  //           end: AlignmentDirectional.centerEnd,
  //           colors: [Color(0xFFFC6BFF), Color(0xFF72E0FF)],
  //           textStyle: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
  //           onTap: _openGiftPack,
  //           //_saveCustomGift();,
  //         );
  //       },
  //     ),
  //   );
  //
  //   if (title == K.gift_pack_open_limit) {
  //     return Opacity(
  //       opacity: 0.5,
  //       child: content,
  //     );
  //   }
  //   return content;
  // }

  Widget _buildRechargePacketButton() {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 17),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GradientButton(
            K.gift_recharge,
            width: constraints.maxWidth - 40 * 2,
            height: 32,
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: const [Color(0xFFC94AFF), Color(0xFFFFC941)],
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
            onTap: _forwardRechargeCenter,
            //_saveCustomGift();,
          );
        },
      ),
    );
  }

  /// 跳转到充值中心
  void _forwardRechargeCenter() async {
    // bool payed = await RechargeScreen.show(context, refer: this.widget.refer ?? 'homepage');
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    bool payed =
        await settingManager.openRechargeScreen(context, refer: _refer);
    if (payed) {
      //充值成功刷新
      _loadGiftPackDailyConfig();
      //this._onPayed();
    }
  }

  Widget _buildReceivePrayButton() {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 25),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GradientButton(
            K.gift_pack_receive_pray,
            width: constraints.maxWidth - 90 * 2,
            height: 46,
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: const [Color(0xFFFC6BFF), Color(0xFF72E0FF)],
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            onTap: () {
              _receivePrayAward();
              //_saveCustomGift();
            },
          );
        },
      ),
    );
  }

  Widget _buildLastWinner() {
    PrevPrayAwardResult champion = _awardResultList[0];

    PrevPrayAwardResult? second;

    PrevPrayAwardResult? third;

    if (_awardResultList.length > 1) {
      second = _awardResultList[1];
    }

    if (_awardResultList.length == 3) {
      third = _awardResultList[2];
    }

    Widget body = SizedBox(
      width: 311,
      child: Stack(
        children: [
          Column(
            children: [
              _buildGiftBoxTitle(K.gift_pack_center_last_winner, 150),
              const SizedBox(
                height: 100,
              ),
              R.img(
                Assets.gift_pack_gift_pack_daily_podium_webp,
                width: 311,
                height: 132,
                fit: BoxFit.fill,
                package: ComponentManager.MANAGER_GIFT,
              ),
              GestureDetector(
                onTap: () {
                  GiftPackPrayRecordDialog.show(context);
                },
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        K.gift_pack_recent_pray,
                        style: const TextStyle(
                          color: Color(0xFFD8AAFF),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: R.img(
                          Assets.gift_pack_gift_pack_daily_coupon_next_webp,
                          width: 16,
                          height: 16,
                          package: ComponentManager.MANAGER_GIFT,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (second != null)
            PositionedDirectional(
              start: 10,
              bottom: 54,
              child: _buildWinnerSecond(second),
            ),
          PositionedDirectional(
            start: 311 / 2 - 40,
            bottom: 54,
            child: _buildWinnerPodium(champion),
          ),
          if (third != null)
            PositionedDirectional(
              end: 10,
              bottom: 54,
              child: _buildWinnerThird(third),
            ),
        ],
      ),
    );
    return _buildContainerFrame(body);
  }

  Widget _buildWinnerPodium(PrevPrayAwardResult result) {
    String imgUrl = System.imageDomain +
        (result.commodityIcon.isNotEmpty
            ? result.commodityIcon
            : result.badgeIcon);
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(24),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: GestureDetector(
              onTap: () {
                _personalDataManager.openImageScreen(context, result.uid,
                    refer: PageRefer(_refer));
              },
              child: CommonAvatar(
                size: 46,
                shape: BoxShape.circle,
                path: System.imageDomain + result.icon,
              ),
            ),
          ),
          Text(
            result.name.safeSubstring(0, 5),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          CachedNetworkImage(
            width: 80,
            height: 80,
            imageUrl: imgUrl,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 12),
            child: Text(
              result.commodityName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWinnerSecond(PrevPrayAwardResult result) {
    String imgUrl = System.imageDomain +
        (result.commodityIcon.isNotEmpty
            ? result.commodityIcon
            : result.badgeIcon);
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(24),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: GestureDetector(
              onTap: () {
                _personalDataManager.openImageScreen(context, result.uid,
                    refer: PageRefer(_refer));
              },
              child: CommonAvatar(
                size: 46,
                shape: BoxShape.circle,
                path: System.imageDomain + result.icon,
              ),
            ),
          ),
          Text(
            result.name.safeSubstring(0, 5),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          CachedNetworkImage(
            width: 80,
            height: 80,
            imageUrl: imgUrl,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 5),
            child: Text(
              result.commodityName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWinnerThird(PrevPrayAwardResult result) {
    String imgUrl = System.imageDomain +
        (result.commodityIcon.isNotEmpty
            ? result.commodityIcon
            : result.badgeIcon);
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(24),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: GestureDetector(
              onTap: () {
                _personalDataManager.openImageScreen(context, result.uid,
                    refer: PageRefer(_refer));
              },
              child: CommonAvatar(
                size: 46,
                shape: BoxShape.circle,
                path: System.imageDomain + result.icon,
              ),
            ),
          ),
          Text(
            result.name.safeSubstring(0, 5),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          CachedNetworkImage(
            width: 80,
            height: 80,
            imageUrl: imgUrl,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 5),
            child: Text(
              result.commodityName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlessingReward() {
    PrayAwardList item = _prayAwardList[0];
    Widget body = Stack(
      children: [
        Column(
          children: [
            _buildGiftBoxTitle(K.git_pack_center_pending_blessing_reward, 172),
            Container(
              padding: const EdgeInsetsDirectional.only(top: 20, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (item.commodityIcon.isNotEmpty)
                    _buildPrayAwardItem(item.commodityIcon, item.commodityName),
                  if (item.badgeIcon.isNotEmpty)
                    _buildPrayAwardItem(item.badgeIcon, item.badgeName),
                ],
              ),
            ),
            _buildReceivePrayButton(),
          ],
        ),
        PositionedDirectional(
          top: 0,
          end: 0,
          child: Container(
            width: 78,
            height: 20,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(0),
                topEnd: Radius.circular(12),
                bottomStart: Radius.circular(12),
                bottomEnd: Radius.circular(0),
              ),
              gradient: LinearGradient(
                  colors: [Color(0x7FFFA536), Color(0x7FFF6767)]),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              DateUtils.format(item.awardTime * 1000, 'yyyy.MM.dd'),
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
                height: 1.1,
              ),
            ),
          ),
        ),
      ],
    );
    return _buildContainerFrame(body);
  }

  Widget _buildAwardAnnouncement() {
    Widget body = Column(
      children: [
        _buildGiftBoxTitle(K.gift_pack_center_award_announcement, 90),
        _buildAwardGiftBox(RechargeRewardLevel.primaryReward),
        _buildAwardGiftBox(RechargeRewardLevel.middleReward),
        _buildAwardGiftBox(RechargeRewardLevel.seniorReward),
      ],
    );
    return _buildContainerFrame(body);
  }

  Widget _buildPrayAwardItem(String image, String name) {
    //_prayAwardList
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          alignment: AlignmentDirectional.center,
          child: CachedNetworkImage(
            width: 80,
            imageUrl: System.imageDomain + image,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          //name,
          name,
          style: const TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildAwardGiftBox(RechargeRewardLevel level) {
    String title = '';
    List<PrayAwardItem> list = [];
    SliverGridDelegate delegate = _primaryDelegate;
    double width = 210;
    switch (level) {
      case RechargeRewardLevel.primaryReward:
        {
          title = K.gift_pack_primary_award;
          delegate = _primaryDelegate;
          list.addAll(_primaryList);
        }
        break;
      case RechargeRewardLevel.middleReward:
        {
          width = Util.width - 90;
          title = K.gift_pack_middle_award;
          delegate = _middleDelegate;
          list.addAll(_middleList);
        }
        break;
      case RechargeRewardLevel.seniorReward:
        {
          width = Util.width - 90;
          title = K.gift_pack_senior_award;
          delegate = _middleDelegate;
          list.addAll(_seniorList);
        }
        break;
    }

    return Container(
      margin: const EdgeInsetsDirectional.only(
          start: 14, end: 14, top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.1),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              SizedBox(
                height: 58,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    R.img(
                      Assets.gift_start_icon_webp,
                      width: 12,
                      height: 12,
                      package: ComponentManager.MANAGER_GIFT,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          color: Color(0xFFFFEFBF),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    R.img(
                      Assets.gift_start_icon_webp,
                      width: 12,
                      height: 12,
                      package: ComponentManager.MANAGER_GIFT,
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                alignment: AlignmentDirectional.topCenter,
                margin: const EdgeInsetsDirectional.only(
                    start: 15, end: 15, bottom: 30),
                //decoration: BoxDecoration(color: Colors.blue),
                child: _buildGridView(constraints, list, delegate),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGridView(BoxConstraints constraints, List<PrayAwardItem> items,
      SliverGridDelegate delegate) {
    return GridView.builder(
      padding: EdgeInsetsDirectional.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: delegate,
      itemBuilder: (context, index) {
        PrayAwardItem item = items[index];
        return _createGridViewItem(item);
      },
      itemCount: items.length,
    );
  }

  _createGridViewItem(PrayAwardItem item) {
    return SizedBox(
      width: 80,
      height: 135,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 22,
            //margin: EdgeInsetsDirectional.only(bottom: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE675),
              borderRadius: BorderRadiusDirectional.circular(11),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              item.tips,
              style: const TextStyle(
                color: Color(0xFF5A007B),
                fontSize: 12,
                height: 1.1,
              ),
              maxLines: 1,
            ),
          ),
          R.img(
            Assets.gift_pack_gift_pack_triangle_webp,
            width: 11,
            height: 5,
            package: ComponentManager.MANAGER_GIFT,
          ),
          const SizedBox(
            height: 2,
          ),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: 80,
                height: 80,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadiusDirectional.circular(4),
                ),
                child: CachedNetworkImage(
                  imageUrl: Util.getRemoteImgUrl(item.awardIcon),
                  fit: BoxFit.contain,
                  width: 70,
                ),
              ),
              if ('gift' == item.type && item.price > 0)
                Container(
                  height: 20,
                  padding: const EdgeInsetsDirectional.only(
                      start: 5, end: 5, top: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    gradient: const LinearGradient(
                        colors: [Color(0x99FFA536), Color(0x99FF6767)]),
                  ),
                  child: Text(
                    '${item.price}${K.gift_pack_diamond}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.1,
                    ),
                    maxLines: 1,
                  ),
                ),
            ],
          ),
          Container(
            width: 80,
            height: 18,
            margin: const EdgeInsetsDirectional.only(
              top: 2,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              item.awardName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.1,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainerFrame(Widget content) {
    double leftImageWidth = 254 / 6;
    double leftImageHeight = 249 / 6;

    double rightImageWidth = 339 / 6;
    double rightImageHeight = 237 / 6;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              top: leftImageHeight / 2 - 4,
              start: 16,
              bottom: rightImageHeight / 2 - 6,
              end: 16),
          child: Container(
            width: Util.width,
            decoration: BoxDecoration(
                border: const GradientBoxBorder(
                  gradient: LinearGradient(
                      colors: [Colors.white, Color(0xFFA500D7)],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: content,
          ),
        ),
        Positioned(
            top: 0,
            left: 26,
            child: R.img(Assets.top_left_icon_webp,
                width: leftImageWidth,
                height: leftImageHeight,
                fit: BoxFit.cover,
                package: ComponentManager.MANAGER_GIFT)),
        Positioned(
            bottom: 0,
            right: 14,
            child: R.img(Assets.bottom_right_icon_webp,
                width: rightImageWidth,
                fit: BoxFit.cover,
                height: rightImageHeight,
                package: ComponentManager.MANAGER_GIFT)),
      ],
    );
  }

  /// 开启礼盒
  void _openGiftPack(int count) async {
    ResGiftPackOpen resp = await GiftPackCenterRepo.openDailyGiftPack(
        _dailyConfig.openBoxType, count);
    if (resp.success) {
      Tracker.instance.track(TrackEvent.package_center_rewards, properties: {
        'coupons': _pack_price,
        'cid': resp.data.cid,
        'item_num': 1,
        'item_name': resp.data.commodityName,
      });

      //刷新券数量
      _loadGiftPackDailyConfig();
      // 服务端不想做版本判断，客户端来
      if (resp.dataList.isNotEmpty) {
        GiftPackDailyPacketDialog.show(context, dataList: resp.dataList);
      } else {
        GiftPackDailyPacketDialog.show(context, data: resp.data);
      }
    }
    if (resp.msg.isNotEmpty) {
      Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
    }
  }

  /// 领取祈福奖励
  void _receivePrayAward() async {
    PrayAwardList award = _prayAwardList[0];
    int itemNum =
        (award.commodityName.isNotEmpty && award.badgeName.isNotEmpty) ? 2 : 1;

    ResGiftPackGetPrayAward resp =
        await GiftPackCenterRepo.getPrayAward(award.id);
    if (resp.success) {
      if (mounted) {
        setState(() {
          _prayAwardList.removeAt(0);
        });
      }

      if (resp.data.commodityName.isNotEmpty ||
          resp.data.badgeName.isNotEmpty) {
        Tracker.instance
            .track(TrackEvent.package_center_lucky_prize, properties: {
          'cid': resp.data.cid,
          'item_num': itemNum,
          'item_name': award.commodityName,
          'medal_name': award.badgeName,
          'hit_date': award.awardTime,
        });

        GiftPackBlessGetDialog.show(context, resp.data);
      }
    }

    if (resp.msg.isNotEmpty) {
      Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
    }
  }

  void _loadGiftPackDailyConfig() async {
    ResGiftPackDailyConfig resp =
        await GiftPackCenterRepo.getGiftPackDailyConfig();
    if (resp.success) {
      if (mounted) {
        setState(() {
          _dailyConfig = resp.data;
          _prayAwardPreviewList = resp.data.prayAwardPreview;
          _primaryList = resp.data.primaryPrayAwardConfig;
          _middleList = resp.data.middlePrayAwardConfig;
          _seniorList = resp.data.seniorPrayAwardConfig;
          _payDutyList = resp.data.payDutyList;
          _prayAwardList = resp.data.prayAwardList;
          _awardResultList = resp.data.prevPrayAwardResult;
          Log.d('$_primaryList');
        });
      }
    }
  }
}
