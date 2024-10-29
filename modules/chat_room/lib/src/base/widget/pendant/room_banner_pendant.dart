import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/common_banner_extension.dart';
import 'package:flutter/material.dart';
import 'package:pulse_log/pulse_log.dart';

import 'room_base_pendant.dart';

/// 房间Banner挂件
class RoomBannerPendant extends RoomBasePendant {
  const RoomBannerPendant({
    super.key,
    required super.room,
    required super.controller,
    required super.wrapListener,
    required super.tickNotifier,
  });

  @override
  State<RoomBasePendant> createState() => _RoomBannerPendantState();
}

class _RoomBannerPendantState extends RoomBasePendantState {
  final List<BannerItemEntity> _listData = [];

  bool _showClose = false;

  @override
  Size get pendantSize => const Size(60, 60);

  @override
  bool get canClose => _showClose;

  @override
  VoidCallback? get onClose => _onClose;

  @override
  ValueSetter<int>? get onIndexChanged => _onIndexChanged;

  @override
  void initState() {
    super.initState();
    _loadBannerData();
  }

  void _loadBannerData() async {
    ResBanner resp = await RoomApi.getRoomBanner(
        widget.room.rid, Session.sex, Session.getInt('role', 0));
    if (resp.success) {
      List list = Util.isVerify ? resp.data.verifyItems : resp.data.items;
      for (var item in list) {
        BannerItemEntity? entity =
            BannerItemEntity.formatBanner(item, rid: widget.room.rid);
        if (entity != null) {
          _listData.add(entity);
        }
      }
      _showClose = resp.data.opt.showClose;
      refresh();
    }
  }

  @override
  List<PendantItem> buildPendantList() {
    List<PendantItem> list = [];
    for (var item in _listData) {
      list.add(PendantItem(
        '$bannerKey.${item.item.id}',
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 5.5, end: 5.5),
          child: GestureDetector(
            onTap: () => _onItemTap(item),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: R.img(
                Util.squareResize(item.item.image, 150),
                width: pendantSize.width,
                height: pendantSize.height,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ));
    }
    return list;
  }

  void _onItemTap(BannerItemEntity itemData) {
    PulseLog.instance.event(
      'click_event',
      properties: {'click_tag': 'room_banner_${itemData.jumpUrl}'},
    );
    Tracker.instance.track(
      TrackEvent.banner_click,
      properties: {
        'adid': '${itemData.item.id}',
        'banner_position': itemData.item.position
      },
    );
    SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, itemData.jumpUrl);
  }

  void _onIndexChanged(int index) {
    if (index < _listData.length) {
      var banner = _listData[index];
      if (banner.hasReport) return;
      // 上报曝光事件
      Tracker.instance.track(
        TrackEvent.banner_expose,
        properties: {
          'adid': '${banner.item.id}',
          'banner_position': banner.item.position
        },
      );
    }
  }

  void _onClose() {
    _listData.clear();
    refresh();
  }
}
