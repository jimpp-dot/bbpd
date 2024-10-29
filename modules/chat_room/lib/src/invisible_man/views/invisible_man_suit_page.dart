import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_room/k.dart';

import '../../../assets.dart';
import '../controllers/invisible_man_suit_controller.dart';
import '../controllers/invisible_man_suit_state.dart';
import '../models/InvisiblePckWrapper.dart';
import '../models/generated/common_invisible.pb.dart';
import '../providers/invisible_man_suit_repository.dart';
import '../widgets/invisible_man_recommend_buy.dart';
import '../widgets/invisible_man_shop_cart_item.dart';
import '../widgets/invisible_man_suit_item.dart';
import '../widgets/invisible_man_switch_buy_authority.dart';
import '../models/left_tab_model.dart';

/// 隐形侠套装页面

class InvisibleManSuitPage extends StatefulWidget {
  const InvisibleManSuitPage({Key? key}) : super(key: key);

  @override
  State<InvisibleManSuitPage> createState() => _InvisibleManSuitPageState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InvisibleManSuitPage(),
        settings: const RouteSettings(name: '/InvisibleManSuitPage'),
      ),
    );
  }
}

class _InvisibleManSuitPageState extends State<InvisibleManSuitPage> {
  final InvisibleManSuitController _logic = Get.put(
      InvisibleManSuitController(repository: InvisibleManSuitRepositoryImpl()));
  final InvisibleManSuitState _state =
      Get.find<InvisibleManSuitController>().state;

  @override
  void dispose() {
    Get.delete<InvisibleManSuitController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvisibleManSuitController>(builder: (logic) {
      return Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [Color(0xFF40169F), Color(0xFF1A278C)],
          ),
          image: DecorationImage(
            image: NetworkImage(
              Util.getRemoteImgUrl(
                  'static/invisible_man/invisible_man_suit_bg_new.webp'),
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            // 导航栏
            _buildAppBarWidget(),
            // 隐形侠说明
            _buildInvisibleManDescWidget(_logic),
            // 底部购买栏
            _buildBottomBarWidget(_logic),
            // home indicator
            _buildHomeIndicatorWidget(),
          ],
        ),
      );
    });
  }

  /// 导航栏
  Widget _buildAppBarWidget() {
    return BaseAppBar.custom(
      backgroundColor: Colors.transparent,
      backColor: Colors.white,
      statusBrightness: Brightness.dark,
      title: Text(
        K.room_menu_invisible_man,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 24),
          child: GestureDetector(
            onTap: () {
              BaseWebviewScreen.show(context,
                  url: Util.getHelpUrlWithQStr('k153'));
            },
            child: R.img(
              "room_fans_question_sign.png",
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 24,
              height: 24,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  /// 隐形侠说明
  Widget _buildInvisibleManDescWidget(InvisibleManSuitController logic) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 7, top: 27, bottom: 22),
                        child: R.img(
                            RoomAssets.chat_room$invisible_man_ic_title_webp,
                            width: 168,
                            height: 29),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 7, bottom: 37),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              K.room_period_buy_limit_people(
                                  ['${_state.data?.limited ?? 0}']),
                              style: const TextStyle(
                                  color: Color(0xFF9BBFFF), fontSize: 13),
                            ),
                            if (Util.parseInt(_state.data?.progress) > 0)
                              RichText(
                                text: TextSpan(
                                    style: const TextStyle(
                                        color: Color(0xFF9BBFFF), fontSize: 13),
                                    children: <InlineSpan>[
                                      TextSpan(text: K.room_purchased),
                                      TextSpan(
                                        text: '${_state.data?.progress ?? 0}',
                                        style: const TextStyle(
                                            color: Color(0xFFFFC700)),
                                      ),
                                      TextSpan(
                                          text:
                                              '/${_state.data?.limited ?? 0}'),
                                    ]),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          RoomAssets.chat_room$invisible_man_ic_banner_bg_webp,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Util.validList(logic.state.data?.myInvisibleList)
                        ? InvisibleManSwitchBuyAuthority(
                            key: logic.state.switchBuyAuthorityContainerKey,
                            switchBuyTapped:
                                logic.onSelectSwitchBuyAuthorityTapped,
                            controller: logic.state.switchController,
                            item: logic.state.selectBuyAuthorityItem,
                          )
                        : InvisibleManRecommendBuy(
                            data: logic.state.recommendData,
                            onBuyTapped: (item) {
                              if (item != null) {
                                logic.submitDebounce
                                    .call(() => logic.onBuy([item]));
                              }
                            },
                          ),
                  ),
                  _buildBuyGroupWidget(logic),
                ],
              ),
            ),
          ),
          // 切换购买权益弹框
          if (Util.validList(logic.state.data?.myInvisibleList))
            PositionedDirectional(
              top: logic.getSwitchBuyAuthorityContainerDy() -
                  kToolbarHeight -
                  MediaQuery.of(context).padding.top +
                  70,
              start: logic.getSwitchBuyAuthorityContainerDx() + 72,
              child: AnimatedContainer(
                width: 138,
                height: logic.state.isSelectedSwitchBuyAuthority
                    ? (logic.state.data?.myInvisibleList.length ?? 0) * 35
                    : 0,
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  padding: EdgeInsetsDirectional.zero,
                  itemBuilder: (context, index) {
                    InvisibleItem? item =
                        logic.state.data?.myInvisibleList[index];
                    return InkWell(
                      onTap: () => logic.onSelectBuyAuthorityItem(index),
                      child: Container(
                        height: 35,
                        alignment: AlignmentDirectional.centerStart,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          item?.name ?? '',
                          style: const TextStyle(
                              color: Color(0xFF3225C4),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                  itemCount: logic.state.data?.myInvisibleList.length ?? 0,
                ),
              ),
            ),
          // 已选套餐弹框
          if (Util.validList(logic.state.willBuyInvisibleList))
            PositionedDirectional(
              top: 0,
              start: 0,
              end: 0,
              bottom: -10,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: logic.onShopCartContainerTapped,
                    child: Container(
                      width: Util.width,
                      height: logic.state.isSelectedBottomBuyButton
                          ? Util.height
                          : 0,
                      color: Colors.transparent,
                    ),
                  ),
                  PositionedDirectional(
                    start: 0,
                    end: 0,
                    bottom: 0,
                    child: AnimatedContainer(
                      width: Util.width,
                      height: logic.state.isSelectedBottomBuyButton ? 300 : 0,
                      duration: const Duration(milliseconds: 250),
                      decoration: const BoxDecoration(
                        color: Color(0xFF6272F8),
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(12),
                          topEnd: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 20, top: 16),
                            child: Text(
                              K.room_has_choosed,
                              style: const TextStyle(
                                  color: Color(0xFFFFC936),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsetsDirectional.zero,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                InvisiblePckWrapper item =
                                    logic.state.willBuyInvisibleList[index];
                                String desc = logic.getInvisibleNames(item);
                                return InvisibleManShopCartItem(
                                  item: item,
                                  desc: desc,
                                  index: index,
                                  onAddTapped: () =>
                                      logic.onShopCartAddTapped(index),
                                  onDeleteTapped: () =>
                                      logic.onShopCartDeleteTapped(index),
                                );
                              },
                              itemCount:
                                  logic.state.willBuyInvisibleList.length,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  /// 底部购买栏
  Widget _buildBottomBarWidget(InvisibleManSuitController logic) {
    return Container(
      height: 68,
      decoration: const BoxDecoration(
        color: Color(0xFF4E5FEC),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 16),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      MoneyConfig.moneyNum(logic.state.totalPrice),
                      style: const TextStyle(
                          color: Color(0xFF5AEDFF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 2),
                    Image.asset(MoneyConfig.moneyIcon, width: 20, height: 20),
                  ],
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: logic.onBottomBuyButtonTapped,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${K.room_has_choosed} (${logic.state.totalNum})',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      const SizedBox(width: 7),
                      R.img(RoomAssets.chat_room$ic_next_small_select_webp,
                          width: 20, height: 20)
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => logic.submitDebounce.call(() => logic.onPay()),
              child: Container(
                width: 86,
                height: 40,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    border: Border.all(
                        color: const Color(0xFFD0FFFD)
                            .withOpacity(logic.state.totalNum <= 0 ? 0.5 : 1),
                        width: 1.0),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [
                        const Color(0xFFFFDC41)
                            .withOpacity(logic.state.totalNum <= 0 ? 0.5 : 1),
                        const Color(0xFFFF991C)
                            .withOpacity(logic.state.totalNum <= 0 ? 0.5 : 1),
                      ],
                    )),
                child: Text(
                  K.room_confirm,
                  style: TextStyle(
                      color: const Color(0xFFFEFEFE)
                          .withOpacity(logic.state.totalNum <= 0 ? 0.5 : 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// home indicator
  Widget _buildHomeIndicatorWidget() {
    return Container(
        height: MediaQuery.of(context).padding.bottom,
        color: const Color(0xFF4E5FEC));
  }

  /// 套餐+权益包组
  Widget _buildBuyGroupWidget(InvisibleManSuitController logic) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16),
      child: Container(
        width: Util.width - 40,
        height: 370,
        decoration: BoxDecoration(
          color: const Color(0xFF5773FF),
          borderRadius: BorderRadiusDirectional.circular(12.0),
          image: const DecorationImage(
            image: AssetImage(RoomAssets.invisible_man_ic_group_card_bg_webp,
                package: ComponentManager.MANAGER_BASE_ROOM),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 72,
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(12),
                  bottomStart: Radius.circular(12),
                ),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFF6968FF), Color(0xFF9274FF)],
                ),
                image: DecorationImage(
                  image: AssetImage(
                      RoomAssets.invisible_man_ic_tab_left_bg_webp,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                  fit: BoxFit.fill,
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsetsDirectional.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  LeftTabModel tab = logic.state.tabs[index];
                  return InkWell(
                    onTap: () => logic.onSwitchTab(index),
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: tab.selected
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (tab.selected) ...[
                            const SizedBox(width: 4),
                            Container(
                              width: 4,
                              height: 16,
                              decoration: BoxDecoration(
                                color: const Color(0xFF8AF1FF),
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                            const SizedBox(width: 15),
                          ],
                          Text(
                            tab.tab,
                            style: TextStyle(
                              color: tab.selected
                                  ? const Color(0xFF8AF1FF)
                                  : Colors.white,
                              fontSize: 12.0,
                              fontWeight: tab.selected
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: logic.state.tabs.length,
              ),
            ),
            Expanded(
              child: Util.validList(logic.state.invisibleList)
                  ? SingleChildScrollView(
                      controller: logic.listScrollController,
                      child: Column(
                        children: [
                          for (int i = 0;
                              i < logic.state.invisibleList.length;
                              i++)
                            InvisibleManSuitItem(
                              key: logic.state.invisibleItemKeys[i],
                              item: logic.state.invisibleList[i],
                              padding: EdgeInsetsDirectional.only(
                                start: 8,
                                end: 8,
                                top: 8,
                                bottom:
                                    (i == logic.state.invisibleList.length - 1
                                        ? 8
                                        : 0),
                              ),
                              onAddTapped: () => logic.onAddTapped(i),
                              onDeleteTapped: () => logic.onDeleteTapped(i),
                            )
                        ],
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
