import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// 首页主播
///
class PartyGodWidget extends StatelessWidget {
  static Set<int> godUids = HashSet();

  final PartyGodBean? bean;

  const PartyGodWidget({Key? key, this.bean}) : super(key: key);

  _onItemTaped(BuildContext context) {
    Tracker.instance.track(TrackEvent.home_peiban_click, properties: {
      'peipei_uid': bean?.uid ?? 0,
      'peipei_status': bean?.status ?? 0,
      'skills': bean?.reportSkillNames,
    });
    if (bean != null && bean!.rid > 0) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, bean!.rid,
          uid: bean!.uid, refer: 'home_party_god');
      return;
    }

    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, bean?.uid ?? 0,
        initialTab: ImageScreenTabType.skill,
        refer: const PageRefer('home_party_god'));
  }

  _onWidgetVisible(bool visible) {
    if (visible && !godUids.contains(bean?.uid ?? 0)) {
      godUids.add(bean?.uid ?? 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (bean == null) return const SizedBox.shrink();

    return VisibilityDetector(
      key: ValueKey('PartyGodWidget_${bean!.uid}'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 0.0) {
          _onWidgetVisible(false);
        } else if (visibilityInfo.visibleFraction == 1.0) {
          _onWidgetVisible(true);
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onItemTaped(context),
        child: SizedBox(
          width: 108,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              const SizedBox(height: 6),
              Text(
                bean!.name ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              if (bean!.skills != null && bean!.skills!.isNotEmpty) ...[
                _buildSkillList(),
                const SizedBox(height: 4),
              ],
              Text(
                bean?.desc ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: R.color.fourthBrightColor, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() => Stack(
        children: [
          CommonAvatar(
            path: bean?.icon,
            size: 108,
            borderRadius: BorderRadius.circular(12),
          ),
          PositionedDirectional(
            start: 0,
            top: 0,
            child: _buildCorner(),
          ),
        ],
      );

  Widget _buildCorner() => Container(
        height: 16,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(12), bottomEnd: Radius.circular(8)),
        ),
        padding: const EdgeInsetsDirectional.only(start: 3, end: 6),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (bean?.status == 1)
              ..._buildOnline()
            else if (bean?.status == 2)
              ..._buildLivingRoom()
            else if (bean?.status == 3)
              ..._buildFastOrder()
            else
              const SizedBox.shrink(),
          ],
        ),
      );

  List<Widget> _buildOnline() => [
        OnlineDot(
            color: R.color.mainBrandColor,
            borderColor: Colors.transparent,
            size: 12,
            padding: 5),
        const SizedBox(width: 1),
        Text(
          K.base_order_online,
          style: const TextStyle(color: Colors.white, fontSize: 9),
        ),
      ];

  List<Widget> _buildLivingRoom() => [
        RoomLivingWidget(size: 12, color: R.color.mainBrandColor),
        const SizedBox(width: 1),
        Text(
          K.base_order_living,
          style: const TextStyle(color: Colors.white, fontSize: 9),
        ),
      ];

  List<Widget> _buildFastOrder() => [
        R.img(
          'ic_flash_small.png',
          width: 12,
          height: 12,
          package: ComponentManager.MANAGER_BASE_CORE,
        ),
        const SizedBox(width: 1),
        Text(
          K.base_order_fast,
          style: const TextStyle(color: Colors.white, fontSize: 9),
        ),
      ];

  Widget _buildSkillList() {
    List<Widget> skills = [];
    if (bean?.skills != null && bean!.skills!.isNotEmpty) {
      for (int i = 0; i < bean!.skills!.length && i < 3; ++i) {
        skills.add(PositionedDirectional(
          start: i * 16.0,
          top: 0,
          child: CommonAvatar(
            path: bean!.skills![i]?.icon,
            shape: BoxShape.circle,
            size: 20,
          ),
        ));
      }
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 1, end: 6),
      child: SizedBox(
        width: skills.length * 16 + 4.0,
        height: 20,
        child: Stack(children: skills),
      ),
    );
    // return Container(
    //   height: 22,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(11),
    //     color: R.color.secondBgColor,
    //   ),
    //   padding: EdgeInsetsDirectional.only(start: 1, end: 6),
    //   // alignment: AlignmentDirectional.centerStart,
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       if (skills.isNotEmpty)
    //         SizedBox(
    //           width: skills.length * 16 + 4.0,
    //           height: 20,
    //           child: Stack(children: skills),
    //         ),
    //       // SizedBox(width: 4),
    //       // Text(
    //       //   K.base_skill_list,
    //       //   style: TextStyle(color: R.color.secondTextColor, fontSize: 9),
    //       // ),
    //     ],
    //   ),
    // );
  }
}
