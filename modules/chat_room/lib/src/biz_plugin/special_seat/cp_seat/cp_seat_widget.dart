import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';

import 'cp_seat_rank_panel.dart';

/// cp 麦位
///
class CpSeatWidget extends StatelessWidget {
  final double iconSize;
  final String? icon1;
  final String? icon2;
  final int uid1;
  final int uid2;
  final VoidCallback? onTap;

  const CpSeatWidget(
      {Key? key,
      this.iconSize = 80,
      this.icon1,
      this.icon2,
      this.uid1 = 0,
      this.uid2 = 0,
      this.onTap})
      : super(key: key);

  _onUserTaped(BuildContext context, int uid) {
    if (uid <= 0) {
      Log.d('_onUserTaped');
      onTap?.call();
      return;
    }
    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, uid,
        refer: const PageRefer('CpRank'));
  }

  @override
  Widget build(BuildContext context) {
    double ratio = iconSize / 80;

    return SizedBox(
      height: 104 * ratio,
      width: 160 * ratio,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          PositionedDirectional(
            bottom: 0,
            start: 0,
            child: R.img('cp_seat/ic_wing.webp',
                fit: BoxFit.fitHeight,
                height: 50 * ratio,
                package: ComponentManager.MANAGER_BASE_ROOM),
          ),
          PositionedDirectional(
            start: 6 * ratio,
            child: GestureDetector(
              onTap: () => _onUserTaped(context, uid1),
              child: _buildCircle(icon1, ratio),
            ),
          ),
          PositionedDirectional(
            end: 6 * ratio,
            child: GestureDetector(
              onTap: () => _onUserTaped(context, uid2),
              child: _buildCircle(icon2, ratio),
            ),
          ),
          PositionedDirectional(
            bottom: 6 * ratio,
            child: R.img('cp_seat/ic_heart.webp',
                height: 44 * ratio,
                fit: BoxFit.fitHeight,
                package: ComponentManager.MANAGER_BASE_ROOM),
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(String? icon, double ratio) {
    return Container(
      width: iconSize + 2,
      height: iconSize + 2,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFFFEF71), width: 2),
      ),
      child: _buildAvatar(icon, ratio),
    );
  }

  Widget _buildEmpty(double ratio) {
    return Container(
      width: iconSize,
      height: iconSize,
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF940B61), Color(0xFF85088A)],
        ),
      ),
      child: R.img(RoomAssets.chat_room$wait_svg,
          width: 32 * ratio,
          height: 32 * ratio,
          package: ComponentManager.MANAGER_BASE_ROOM),
    );
  }

  Widget _buildAvatar(String? icon, double ratio) {
    if (Util.isStringEmpty(icon)) return _buildEmpty(ratio);
    return CommonAvatar(
      path: icon,
      size: iconSize,
      shape: BoxShape.circle,
    );
  }
}

class CpSeatEntranceWidget extends StatelessWidget {
  final VipMicCPInfo? info;
  final int rid;

  const CpSeatEntranceWidget(this.rid, {Key? key, this.info}) : super(key: key);

  _onSeatTaped(BuildContext context) {
    CPSeatRankPanel.show(context, rid);
  }

  @override
  Widget build(BuildContext context) {
    if (info == null) return const SizedBox.shrink();
    return GestureDetector(
      onTap: () => _onSeatTaped(context),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CpSeatWidget(
                icon1: info!.user1.icon,
                icon2: info!.user2.icon,
                iconSize: 44,
                onTap: () => _onSeatTaped(context)),
            const Text(
              '昨日最佳CP',
              style: TextStyle(
                  color: Color(0xFFFFEE71),
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
