import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/k.dart';

/// 商城首页收藏室入口
///
class MallCollectionRoomEntranceWidget extends StatelessWidget {
  const MallCollectionRoomEntranceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
          color: R.colors.mallTopTipBgColor,
          borderRadius: BorderRadius.circular(19)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            R.img('ic_collection_room_entrance.webp',
                width: 20, height: 21, package: ComponentManager.MANAGER_VIP),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                K.vip_collection_room_enter,
                style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 4),
            TextButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                minimumSize: WidgetStateProperty.all(const Size(1, 1)),
              ),
              onPressed: () {
                IPersonalDataManager personalManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalManager.showCollectionRoomPage(context,
                    targetUid: Session.uid);
              },
              child: Container(
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: R.colors.mainBrandGradientColors,
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    K.vip_collection_room_title,
                    style: TextStyle(
                        color: R.colors.brightTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
