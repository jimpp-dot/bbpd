import 'package:chat/k.dart';
import 'package:chat/src/model/pbModel/generated/ka_touch.pb.dart';
import 'package:shared/assets.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'etc_controller_key.dart';
import 'etc_user_pool_controller.dart';

class ETCUserPoolPage extends StatefulWidget {
  const ETCUserPoolPage({super.key});

  @override
  State<ETCUserPoolPage> createState() => _ETCUserPoolPageState();
}

class _ETCUserPoolPageState extends State<ETCUserPoolPage> {
  late final ETCUserPoolController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetManager().put(ETCUserPoolController());
  }

  @override
  void dispose() {
    GetManager().delete<ETCUserPoolController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_controller.selectable) {
          _controller.cancelSelect();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar.custom(
      statusBrightness: Brightness.light,
      backgroundColor: Colors.transparent,
      backColor: R.color.mainTextColor,
      onBackPressedCallback: () => Navigator.maybePop(context),
      title: Text(
        K.chat_make_friend_users,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: R.color.mainTextColor,
        ),
      ),
      actions: <Widget>[
        Center(
          child: GetBuilder<ETCUserPoolController>(
            id: selectableKey,
            builder: (controller) {
              return _buildCommonBtn(
                K.chat_greeting_data,
                enable: !controller.selectable,
                onTap: () {
                  if (!controller.selectable) {
                    IChatManager chatManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_CHAT);
                    chatManager.showETCHiListPage(context);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return GetBuilder<ETCUserPoolController>(
      id: pageKey,
      builder: (controller) {
        if (controller.screenStatus == ScreenStatus.Loading) {
          return const Loading();
        }
        if (controller.screenStatus == ScreenStatus.Error) {
          return ErrorData(onTap: controller.loadData);
        }
        return GetBuilder<ETCUserPoolController>(
          id: selectableKey,
          builder: (controller) {
            return Column(
              children: [
                _buildTabs(),
                Expanded(child: _buildPages()),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildTabs() {
    Widget child = CommonTabBar(
      tabs: _controller.tabs.map((e) => Tab(child: Text(e.name))).toList(),
      controller: _controller.tabController,
      isScrollable: true,
      labelColor: Colors.black87,
      unselectedLabelColor: Colors.black54,
      labelStyle: R.textStyle.medium16.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle: R.textStyle.medium16,
      indicator:
          const CommonUnderlineTabIndicator(borderSide: BorderSide(width: 0)),
    );
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        _controller.selectable ? IgnorePointer(child: child) : child,
        const Spacer(),
        GetBuilder<ETCUserPoolController>(
          id: selectableKey,
          builder: (controller) {
            return controller.selectable
                ? _buildCommonBtn(K.chat_sure,
                    onTap: () => controller.changeSelectable(toastEmpty: true))
                : _buildCommonBtn(K.chat_item_menu_multi,
                    showBg: false, onTap: controller.changeSelectable);
          },
        ),
      ],
    );
  }

  Widget _buildPages() {
    return Container(
      color: R.color.homeSecondBgColor,
      child: TabBarView(
        controller: _controller.tabController,
        physics: _controller.selectable
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        children: _controller.tabs.map((e) => _buildList(e.id)).toList(),
      ),
    );
  }

  Widget _buildList(int tabId) {
    var userList = _controller.getUserList(tabId);
    if (userList == null) {
      return const Loading();
    } else if (userList.isEmpty) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 58, end: 58),
        child: EmptyWidget(
            desc: _controller.emptyTip, textAlign: TextAlign.center),
      );
    }
    return ListView.builder(
      itemBuilder: (_, index) => _buildItem(tabId, userList[index]),
      itemExtent: 86,
      itemCount: userList.length,
    );
  }

  Widget _buildItem(int tabId, KaTouchPoolUser item) {
    return GetBuilder<ETCUserPoolController>(
      id: selectableKey,
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            if (controller.selectable) {
              controller.changeUserSelectedStatus(item.uid);
            } else {
              IChatManager chatManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_CHAT);
              chatManager.openUserChatScreen(context,
                  type: 'private', targetId: item.uid, title: item.name);
            }
          },
          child: Container(
            width: Util.width,
            height: 74,
            margin:
                const EdgeInsetsDirectional.only(start: 12, top: 12, end: 12),
            padding: const EdgeInsetsDirectional.only(start: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Row(
              children: [
                CommonAvatar(
                  path: item.avatar,
                  size: 50,
                  shape: BoxShape.circle,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF222222)),
                          ),
                          const SizedBox(width: 4),
                          R.img(
                            item.sex == 1
                                ? BaseAssets.shared$ic_male_svg
                                : BaseAssets.shared$ic_female_svg,
                            width: 12,
                            height: 12,
                            color: item.sex == 1
                                ? const Color(0xFF3B82FF)
                                : const Color(0xFFFE6BA3),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.hasReplied == 1 ? K.chat_has_sent : '',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                controller.selectable
                    ? Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12),
                        child: _buildCheckbox(
                            controller.getUserSelectedStatus(item.uid)),
                      )
                    : _buildCommonBtn(K.chat_quick_reply,
                        showArrow: true,
                        onTap: () =>
                            controller.sendHiMessage(tabId, [item.uid])),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckbox(bool isSelected) {
    return isSelected
        ? const CheckBoxChecked(width: 20, height: 20)
        : const CheckBoxUnchecked(width: 20, height: 20, color: Colors.black54);
  }

  Widget _buildCommonBtn(String text,
      {bool showBg = true,
      bool enable = true,
      bool showArrow = false,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 28,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        margin: const EdgeInsetsDirectional.only(end: 12),
        decoration: showBg
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: enable
                        ? R.color.mainBrandGradientColors
                        : R.color.darkGradientColors),
                borderRadius: const BorderRadius.all(Radius.circular(14)),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: showBg ? Colors.white : R.color.mainBrandColor,
              ),
            ),
            if (showArrow)
              R.img(
                BaseAssets.shared$ic_expand_down_svg,
                width: 12,
                height: 12,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
