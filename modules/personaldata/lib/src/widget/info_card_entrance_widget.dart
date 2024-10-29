import 'package:chat_room/chat_room.dart';
import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/k.dart' as RoomK;

class _ItemData {
  final List<Color>? bgColor;
  final String? iconName;
  final String? title;
  final String? content;
  final VoidCallback? clickEvent;

  _ItemData(
      {this.bgColor, this.iconName, this.title, this.content, this.clickEvent});
}

/// 房间资料卡关系入口
class InfoCardEntranceWidget extends StatelessWidget {
  final HomeProfileData? data;
  final int uid;
  final int rid; // 房间ID
  const InfoCardEntranceWidget(
      {Key? key, this.data, this.uid = 0, this.rid = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const SizedBox.shrink();
    }

    List<Widget> res = _createWidgets(context);
    if (res.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      alignment: AlignmentDirectional.center,
      margin: const EdgeInsetsDirectional.only(bottom: 16),
      child: LimitedBox(
        maxHeight: 32,
        child: ListView(
          padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: res,
        ),
      ),
    );
  }

  List<Widget> _createWidgets(BuildContext context) {
    HomeProfileAccompanyInfo accompany = data!.accompany;
    List<HomeProfilePartyGroup> groupInfoList = data!.partyGroup;
    HomeProfileFleet fleetBean = data!.fleet;
    HomeProfileUnion unionBean = data!.union;
    HomeProfileKnightGroup knightGroup = data!.knightGroup;

    String sexString = BaseK.K.common_she;
    if (data!.base.sex == 1) {
      sexString = BaseK.K.common_he;
    }

    List<Widget> widgets = [];

    /// 点唱房--待唱歌单
    if (data!.base.musicOrderCount > 0) {
      String title = RoomK.K.room_juke_music_recommand;
      String content = '${data!.base.musicOrderCount}';
      widgets.add(_buildItem(
        context,
        _ItemData(
            bgColor: [const Color(0xFF8B30F3), const Color(0xFF52A9E9)],
            iconName: 'ic_juke_mic.png',
            title: title,
            content: content,
            clickEvent: () => _jukeMusicClick(context)),
      ));
    }

    /// 陪伴房
    String title;
    String content;
    if (data!.hasAccompany()) {
      title = K.personaldata_intimacy;
      content = accompany.degree.toString();
    } else {
      title = K.companion_list;
      content = K.personal_people_count([data!.base.accompanyNum.toString()]);
    }
    widgets.add(_buildItem(
      context,
      _ItemData(
          bgColor: [const Color(0xFFFF67A8), const Color(0xFFFFAB8F)],
          iconName: 'room_company_icon.webp',
          title: title,
          content: content,
          clickEvent: () => _companyClick(context)),
    ));

    if (data!.hasLiveTagInfo() && data!.liveTagInfo.id > 0) {
      Tracker.instance.track(TrackEvent.live_content_pv, properties: {
        'uid': Session.uid,
        'rid': rid,
        'to_uid': uid,
      });
      widgets.add(_buildLiveTagInfo(context, data!.liveTagInfo));
    }

    /// 群组
    ChatRoomData? roomData = ChatRoomData.getInstance();
    if (roomData?.config?.types == RoomTypes.Live && knightGroup.show == true) {
      String title = K.personaldata_knight_group;
      String content =
          K.personal_people_count([knightGroup.memberNum.toString()]);
      widgets.add(_buildItem(
        context,
        _ItemData(
            bgColor: [const Color(0xFFF989FF), const Color(0xFF97D2FE)],
            iconName: 'room_guard_icon.webp',
            title: title,
            content: content,
            clickEvent: () => _knightGroupClick(context)),
      ));
    }

    if (Util.validList(groupInfoList)) {
      String title = K.personal_its_group([sexString]);
      String content =
          K.personal_number_count([groupInfoList.length.toString()]);
      widgets.add(_buildItem(
        context,
        _ItemData(
            bgColor: [const Color(0xFFD670FF), const Color(0xFF91ADFF)],
            iconName: 'room_group_icon.webp',
            title: title,
            content: content,
            clickEvent: () => _groupClick(context)),
      ));
    }

    return widgets;
  }

  void _jukeMusicClick(BuildContext context) {
    Tracker.instance.track(TrackEvent.click, properties: {
      'click_page': 'singer_livepag',
    });
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openJukeMusicUserOrderList(context, rid, data!.base.uid);
  }

  void _companyClick(BuildContext context) {
    IRankManager rankManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
    rankManager.showCompanionRankPage(context, data!.base.uid, 'profile_card');
  }

  void _knightGroupClick(BuildContext context) {
    IRoomManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    // 若主播用户在自己的房间内，则该守护排行页显示【购买入口】；若主播用户不在自己房间内，则守护排行页不显示【购买】入口
    ChatRoomData roomData = ChatRoomData.getInstance()!;
    RoomPosition pos0 = roomData.positions[0];
    bool showBuyEntry = pos0.uid == data?.base.uid;
    Log.d(
        '_knightGroupClick：masterUid=${data?.knightGroup.masterUid}, uid:${data?.base.uid}, showBuyEntry:$showBuyEntry');
    manager.openKnightRankBottomSheet(
        context, data?.knightGroup.masterRid ?? 0, data?.base.uid ?? 0,
        entryType: 'personal_data_card', showBuyEntry: showBuyEntry);
  }

  void _groupClick(BuildContext context) {
    IGroupManager iGroupManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GROUP);
    iGroupManager.openUserGroupListScreen(
        context, data!.base.uid, data!.base.sex);
    Tracker.instance.track(TrackEvent.room_card_group_click);
  }

  Widget _buildItem(BuildContext context, _ItemData item) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          item.clickEvent?.call();
        },
        child: Container(
          height: 32,
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            gradient: LinearGradient(
              colors: item.bgColor ?? [],
            ),
          ),
          margin: const EdgeInsetsDirectional.only(start: 4, end: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 6),
              R.img(item.iconName,
                  width: 24,
                  height: 24,
                  package: ComponentManager.MANAGER_PERSONALDATA),
              const SizedBox(width: 3),
              Text(
                item.title ?? '',
                style: R.textStyle.regular14
                    .copyWith(color: Colors.white, fontSize: 13),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 4, end: 4),
                width: 2,
                height: 2,
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              LimitedBox(
                maxWidth: 100,
                child: Text(
                  item.content ?? '',
                  style: R.textStyle.regular14
                      .copyWith(color: Colors.white, fontSize: 13),
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 2),
              R.img(
                'ic_next_small.webp',
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_PERSONALDATA,
              ),
            ],
          ),
        ));
  }

  Widget _buildLiveTagInfo(
      BuildContext context, HomeProfileLiveTagInfo tagInfo) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Tracker.instance.track(TrackEvent.live_content_click, properties: {
          'uid': Session.uid,
          'rid': rid,
          'to_uid': uid,
        });
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openTalentAnchorRankWidget(context, type: tagInfo.id);
      },
      child: Container(
        height: 32,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [Color(0xFFC962FF), Color(0xFFB5A6FF)],
          ),
        ),
        margin: const EdgeInsetsDirectional.only(start: 4, end: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 6),
            R.img('room_talent_icon.webp',
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_PERSONALDATA),
            const SizedBox(width: 2),
            Text(
              tagInfo.text,
              style: R.textStyle.regular14
                  .copyWith(color: Colors.white, fontSize: 13),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
