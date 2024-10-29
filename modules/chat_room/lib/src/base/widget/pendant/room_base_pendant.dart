import 'package:chat_room/chat_room.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const String worldBossKey = 'worldBoss';
const String redPacketKey = 'redPacket';
const String lotteryKey = 'lottery';
const String grabHatKey = 'grabHat';
const String artCenterKey = 'artCenter';
const String joinFansKey = 'joinFans';
const String honorTimeKey = 'honorTime';
const String ktvOrderKey = 'ktvOrder';
const String bannerKey = 'banner';

typedef WrapListener = Widget Function(PendantItem item);

class RoomBasePendant extends StatefulWidget {
  final ChatRoomData room;
  final SwiperController controller;
  final WrapListener wrapListener;
  final ValueNotifier<int> tickNotifier;

  const RoomBasePendant({
    super.key,
    required this.room,
    required this.controller,
    required this.wrapListener,
    required this.tickNotifier,
  });

  @override
  State<StatefulWidget> createState() => RoomBasePendantState();
}

class RoomBasePendantState extends State<RoomBasePendant> {
  /// 挂件高度
  Size get pendantSize => const Size(64, 64);

  /// 是否可关闭隐藏
  bool get canClose => false;

  /// 关闭按钮点击回调
  VoidCallback? get onClose => null;

  /// Swiper切换索引回调
  ValueSetter<int>? get onIndexChanged => null;

  @override
  void initState() {
    super.initState();
    widget.tickNotifier.addListener(onTick);
  }

  @override
  void dispose() {
    super.dispose();
    widget.tickNotifier.removeListener(onTick);
  }

  void onTick() {}

  @override
  Widget build(BuildContext context) {
    List<PendantItem> list = buildPendantList();
    return list.isEmpty ? const SizedBox.shrink() : _buildContent(list);
  }

  List<PendantItem> buildPendantList() => [];

  Widget _buildContent(List<PendantItem> list) {
    int count = list.length;
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 10),
      width: pendantSize.width + 8,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          count == 1
              ? list.first.widget
              : SizedBox(
                  width: pendantSize.width + 8,
                  height:
                      count == 1 ? pendantSize.height : pendantSize.height + 8,
                  child: Swiper(
                    key: ValueKey(_key(list)),
                    controller: widget.controller,
                    duration: 500,
                    itemCount: count,
                    outer: true,
                    pagination: _buildSwiperPagination(),
                    itemBuilder: (_, index) => widget.wrapListener(list[index]),
                    onIndexChanged: onIndexChanged,
                  ),
                ),
          if (canClose)
            PositionedDirectional(
              end: -10,
              top: -10,
              child: GestureDetector(
                onTap: onClose,
                child: R.img(
                  RoomAssets.chat_room$cp_close_svg,
                  width: 20,
                  height: 20,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
        ],
      ),
    );
  }

  SwiperPagination? _buildSwiperPagination() {
    return const SwiperPagination(
      margin: EdgeInsetsDirectional.only(top: 4),
      builder: RectSwiperPaginationBuilder(
        space: 2,
        size: Size(4, 4),
        activeSize: Size(4, 4),
        activeColor: Colors.white,
        color: Colors.white38,
        radius: 2,
      ),
    );
  }

  String _key(List<PendantItem> list) => list.map((e) => e.key).join('_');
}

class PendantItem {
  final String key;
  final Widget widget;

  PendantItem(this.key, this.widget);
}
