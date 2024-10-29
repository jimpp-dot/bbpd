import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/history_party_model.dart';
import 'package:rank/src/widget/home_active_friends_widget.dart';
import 'package:shared/assets.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';

import 'home_follow_up_sub_page_controller.dart';

class HomeFollowUpPartyListWidget extends StatelessWidget {
  final BuildContext context;

  const HomeFollowUpPartyListWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        _buildMyPartyTitle(),
        const SizedBox(height: 10),
        _buildMyPartyList(),
      ],
    );
  }

  Widget _buildMyPartyTitle() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(width: 16),
        Text(
          K.rank_home_my_party,
          style: TextStyle(color: R.colors.mainTextColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        _buildAll(),
        const SizedBox(width: 10),
      ],
    );
  }

  /// 查看全部
  Widget _buildAll() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        text12(K.rank_go_all_friend, textColor: R.colors.secondTextColor),
        const SizedBox(width: 6),
        R.img(
          BaseAssets.icon_next_fq_svg,
          width: 16,
          height: 16,
          package: ComponentManager.MANAGER_BASE_CORE,
          color: R.colors.secondTextColor,
        ),
      ],
    ).onTap(() {
      IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
      manager.openContactPage(context, showFootprint: true);
    });
  }

  /// 派对列表
  Widget _buildMyPartyList() {
    return GetBuilder<HomeFollowUpSubPageController>(
      builder: (controller) {
        List list = [...controller.recentPartyList, ...controller.activeFriendList];
        int recentPartyListLength = controller.recentPartyList.length;
        return SizedBox(
          width: Util.width,
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              double marginStart = index == 0 ? 16 : 4;
              double marginEnd = (index == list.length - 1) ? 16 : 4;
              var item = list[index];
              if (item is HistoryPartyModel) {
                return _buildItem(
                  'home_my_party_room_${item.displayName}',
                  () => _onPartyItemClick(item),
                  _buildPartyItem(item),
                  marginStart: marginStart,
                  marginEnd: marginEnd,
                );
              }
              if (item is HomeActiveFriendItemData) {
                return _buildItem(
                  'home_my_party_user_${item.uid}',
                  () => _onFriendItemClick(item, index - recentPartyListLength),
                  _buildFriendItem(item),
                  marginStart: marginStart,
                  marginEnd: marginEnd,
                );
              }
              return const SizedBox.shrink();
            },
            itemCount: list.length,
          ),
        );
      },
    );
  }

  Widget _buildItem(String tag, VoidCallback onTap, Widget child, {double marginStart = 4, double marginEnd = 4}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Rext.themeCardContainer(
        width: 90,
        height: 120,
        alignment: AlignmentDirectional.center,
        margin: EdgeInsetsDirectional.only(start: marginStart, end: marginEnd),
        cornerRadius: 12,
        child: child,
      ),
    );
  }

  void _onPartyItemClick(HistoryPartyModel item) {
    if (item.extra == 'create' || item.isMine) {
      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openInitOperateDisplay(context, refer: 'create_room_page_friend_tab');
    } else {
      IRoomManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      manager.openChatRoomScreenShow(context, item.rid, refer: 'flow_friendplaying_friend_tab');
    }
  }

  /// 派对
  Widget _buildPartyItem(HistoryPartyModel item) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 9),
        SizedBox(
          width: 63,
          height: 63,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              _buildAvatar(item),
              _buildSymbol(item),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 80,
          alignment: AlignmentDirectional.center,
          child: Text(
            item.displayName,
            style: TextStyle(color: R.colors.mainTextColor, fontSize: 12, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        Container(
          width: 80,
          alignment: AlignmentDirectional.center,
          child: Text(
            item.extra != 'create' && !item.isMine ? K.rank_recent_join : '',
            style: TextStyle(color: R.colors.secondTextColor, fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildAvatar(HistoryPartyModel item) {
    if (item.icon.isNotEmpty == true) {
      return CommonAvatar(path: item.icon, size: 64, shape: BoxShape.circle, onlyFirstFrame: true);
    } else if (item.extra == 'create') {
      return CommonAvatar(path: Session.icon, size: 64, shape: BoxShape.circle, onlyFirstFrame: true);
    }
    return const SizedBox.shrink();
  }

  Widget _buildSymbol(HistoryPartyModel item) {
    if (item.typeName != null) {
      return Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          gradient: (item.typeName?.bg.isNotEmpty == true) ? LinearGradient(colors: item.typeName!.bgColors) : null,
          color: item.typeName?.color,
          shape: BoxShape.circle,
          border: Border.all(color: R.colors.symbolBorderColor, width: 2),
        ),
        alignment: AlignmentDirectional.center,
        child: CachedNetworkImage(
          imageUrl: Util.squareResize(item.typeName?.smallIcon ?? item.typeName?.icon ?? '', 50),
          width: 14,
          height: 14,
          fit: BoxFit.fill,
        ),
      );
    } else if (item.extra == 'create') {
      return _buildNormalIcon(Assets.ic_home_create_add_webp);
    }
    return const SizedBox.shrink();
  }

  Widget _buildNormalIcon(String icon) {
    return Rext.autoStyleImg(
      icon,
      width: 22,
      height: 22,
      package: ComponentManager.MANAGER_RANK,
    );
  }

  void _onFriendItemClick(HomeActiveFriendItemData item, int position) async {
    Tracker.instance.track(
      TrackEvent.recentlyactive_click,
      properties: {'to_uid': item.uid, 'position': position},
    );
    List<SheetItem> res = [
      // SheetItem(base.K.base_start_party, "start_party"),
      SheetItem(K.rank_send_message, "send_message"),
      SheetItem(K.rank_go_detail, "detail"),
    ];
    SheetCallback? result = await displayModalBottomSheet(
      context: context,
      builder: (BuildContext context) => RadioBottomSheet(title: K.rank_operate, data: res),
    );
    if (result == null || result.reason == SheetCloseReason.Active) {
      Tracker.instance.track(
        TrackEvent.recentlyactive_pop_click,
        properties: {'to_uid': item.uid, 'click_type': 4},
      );
      return;
    }

    int clickType;
    if (result.value?.key == "start_party") {
      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openAccompanyRoom(context, [item.uid], [item.name], 'accompany', 'accompany');
      clickType = 1;
    } else if (result.value?.key == "send_message") {
      IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
      chatManager.openUserChatScreen(context, type: 'private', targetId: item.uid);
      clickType = 2;
    } else {
      IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
      personalDataManager.openImageScreen(context, item.uid);
      clickType = 3;
    }

    Tracker.instance.track(
      TrackEvent.recentlyactive_pop_click,
      properties: {'to_uid': item.uid, 'click_type': clickType},
    );
  }

  /// 活跃好友
  Widget _buildFriendItem(HomeActiveFriendItemData item) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              width: 64,
              height: 64,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CommonAvatar(path: item.icon, size: 64, shape: BoxShape.circle),
                  _buildNormalIcon(Assets.ic_home_phone_webp),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 80,
              alignment: AlignmentDirectional.center,
              child: Text(
                item.name,
                style: TextStyle(color: R.colors.mainTextColor, fontSize: 12, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Container(
              width: 80,
              alignment: AlignmentDirectional.center,
              child: Text(
                item.getStatus,
                style: TextStyle(color: R.colors.secondTextColor, fontSize: 10),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
        if (Util.validStr(item.ticketMark))
          PositionedDirectional(
            top: 0,
            end: 0,
            child: R.img(Assets.ic_nobility_crown_webp, width: 20, height: 20, package: ComponentManager.MANAGER_RANK),
          ),
      ],
    );
  }
}
