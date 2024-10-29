import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';

import '../../k.dart';

class HomeGroupFansItemData {
  final String title;
  final String icon;
  final String type;
  final List<Color> bgColors;

  HomeGroupFansItemData(
      {required this.title,
      required this.icon,
      required this.type,
      required this.bgColors});
}

class HomeGroupFansWidget extends StatefulWidget {
  final int groupId;

  const HomeGroupFansWidget(this.groupId, {super.key});

  @override
  HomeGroupFansState createState() {
    return HomeGroupFansState();
  }
}

class HomeGroupFansState extends State<HomeGroupFansWidget> {
  List<HomeGroupFansItemData> datas = [];

  // 小屏幕手机需要缩放
  double ratio = 1.0;

  @override
  void initState() {
    super.initState();
    // 排行榜
    datas.add(
      HomeGroupFansItemData(
          title: K.rank_page_title,
          icon: Assets.ic_home_group_rank_webp,
          type: 'rank',
          bgColors: [const Color(0xFFF38A2A), const Color(0xFFFFD452)]),
    );
    // 超级福利
    datas.add(
      HomeGroupFansItemData(
          title: K.rank_home_group_welfare,
          icon: Assets.ic_home_group_welfare_webp,
          type: 'welfare',
          bgColors: [const Color(0xFF8161FF), const Color(0xFF9D93FF)]),
    );
    // 组队开黑
    datas.add(
      HomeGroupFansItemData(
          title: K.rank_home_group_premade,
          icon: Assets.ic_home_group_premade_webp,
          type: 'premade',
          bgColors: [const Color(0xFFCD6DFF), const Color(0xFFEFA8FF)]),
    );
    // 语音派对
    datas.add(
      HomeGroupFansItemData(
          title: K.rank_home_group_chat,
          icon: Assets.ic_home_group_chat_webp,
          type: 'chat',
          bgColors: [const Color(0xFFFF6FB7), const Color(0xFFFFA0EC)]),
    );

    if (Util.width < 20 * 2 + 91 * 4 + 3 * 8) {
      ratio = (Util.width - 20 * 2 - 3 * 8) / 4 / 91;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (var item in datas) {
      widgets.add(_buildItem(item));
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 8, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widgets,
      ),
    );
  }

  Widget _buildItem(HomeGroupFansItemData item) {
    return GestureDetector(
      onTap: () async {
        _onTap(item.type);
      },
      child: SizedBox(
        height: 75 * ratio,
        width: 91 * ratio,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: 91 * ratio,
              height: 67 * ratio,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.bottomStart,
                  end: AlignmentDirectional.topEnd,
                  colors: item.bgColors,
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 15 * ratio,
              child: R.img(
                item.icon,
                width: 60 * ratio,
                height: 60 * ratio,
                package: ComponentManager.MANAGER_RANK,
              ),
            ),
            Container(
              width: 91 * ratio,
              height: 50 * ratio,
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(12),
                  bottomEnd: Radius.circular(12),
                ),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.bottomCenter,
                  end: AlignmentDirectional.topCenter,
                  colors: [item.bgColors[0], item.bgColors[1].withOpacity(0)],
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 5 * ratio,
              child: Container(
                constraints: BoxConstraints(maxWidth: 80 * ratio),
                alignment: AlignmentDirectional.center,
                child: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTap(String type) {
    if (type == 'rank') {
      IRankManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
      manager.showAnchorZoneRank(context, widget.groupId, 'home');
    } else if (type == 'welfare') {
      IVipManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
      manager.showAnchorZoneWelfare(context, widget.groupId);
    } else {
      IRoomManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      manager.openStartParty(context, type, refer: 'home');
    }

    Tracker.instance.track(TrackEvent.kol_button_click, properties: {
      'kol_uid': widget.groupId,
      'kol_type': type,
    });
  }
}
