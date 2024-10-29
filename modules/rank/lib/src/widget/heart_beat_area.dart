import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/page/rank_heart_beat_page.dart';

import '../../k.dart';
import '../../rank.dart';
import 'loveItem.dart';

/// 心动专区
///
class HeartBeatArea extends StatefulWidget {
  const HeartBeatArea({super.key});

  @override
  State<HeartBeatArea> createState() => _HeartBeatAreaState();
}

class _HeartBeatAreaState extends State<HeartBeatArea> {
  final IPersonalDataManager _personalDataManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);
  LoveItemData? _item;
  List _data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    String url = "${System.domain}room/topheart";
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (!mounted) return;
      Map res = response.value();
      if (!res.containsKey('data') || res['data'] == null) {
        return;
      }
      setState(() {
        _data = res['data'];
        Map item = _data[0];
        _item = LoveItemData.fromJson(item);
      });
    } catch (e) {
      Log.d(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_item == null) {
      return const SizedBox();
    }

    return _buildBody(context, _item!);
  }

  Widget _buildBody(BuildContext context, LoveItemData item) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => RankHeartBeatPage.show(context),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 18, top: 12, bottom: 14, end: 18),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  K.rank_heart_beat_area,
                  style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(K.rank_go_all_friend,
                    style:
                        TextStyle(color: R.color.thirdTextColor, fontSize: 13)),
                const SizedBox(width: 4),
                Icon(Icons.chevron_right,
                    color: R.color.thirdTextColor, size: 16)
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (item.rId <= 0) return;
            RankManager.showRoom(context, item.rId);
          },
          child: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            alignment: Alignment.center,
            margin: const EdgeInsetsDirectional.only(start: 18, end: 18),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.imagePath(Assets.bg_rank_heart_beat_webp,
                    package: ComponentManager.MANAGER_RANK)),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(31)),
                        border: Border.all(color: Colors.white, width: 1.0),
                      ),
                      child: CommonAvatarWithFrame(
                        uid: item.userFrom.uid,
                        overflow: -3.0,
                        childWidget: CommonAvatar(
                          path: item.userFrom.icon,
                          size: 50,
                          shape: BoxShape.circle,
                          onTap: () {
                            if (item.userFrom.uid <= 0) return;
                            _personalDataManager.openImageScreen(
                                context, item.userFrom.uid);
                          },
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            item.giftId > 0
                                ? CachedNetworkImage(
                                    imageUrl: Util.squareResize(
                                        Util.giftImgUrl(item.giftId), 150),
                                    width: 56,
                                    height: 56,
                                  )
                                : R.img(RoomAssets.radio_buy_icon_1_png,
                                    width: 56,
                                    height: 56,
                                    package:
                                        ComponentManager.MANAGER_BASE_ROOM),
                            if (item.giftNum > 1)
                              PositionedDirectional(
                                end: -4,
                                top: -6,
                                child: Text(
                                  'x${item.giftNum}',
                                  style: const TextStyle(
                                    color: Color(0xFFFF5F7D),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Text(
                          Utility.getDateDiff(item.dateLine),
                          maxLines: 1,
                          textScaleFactor: 1.0,
                          style: R.textStyle.subCaption.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(31)),
                        border: Border.all(color: Colors.white, width: 1.0),
                      ),
                      child: CommonAvatarWithFrame(
                        uid: item.userTo.uid,
                        overflow: -3.0,
                        childWidget: CommonAvatar(
                          path: item.userTo.icon,
                          size: 50,
                          shape: BoxShape.circle,
                          onTap: () {
                            if (item.userTo.uid <= 0) return;
                            _personalDataManager.openImageScreen(
                                context, item.userTo.uid);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserNobilityWidget(titleNew: item.userFrom.titleNew),
                        if (item.userFrom.vip > 0)
                          UserVipWidget(vip: item.userFrom.vip),
                        const SizedBox(width: 2),
                        LimitedBox(
                          maxWidth: 88.dp,
                          child: Text(
                            item.userFrom.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: R.textStyle.subhead.copyWith(
                                color: Color(Utility.getVipColor(
                                    item.userFrom.vip, false)),
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      ' ${item.giftId > 0 ? K.rank_reward : R.string('room_protect')} ',
                      style:
                          TextStyle(color: R.color.mainTextColor, fontSize: 14),
                    ),
                    LimitedBox(
                      maxWidth: 88.dp,
                      child: Text(
                        item.userTo.name,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: R.textStyle.subhead.copyWith(
                            color: Color(
                                Utility.getVipColor(item.userTo.vip, false)),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                if (item.rId > 0)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      R.img(
                        Assets.room_little_svg,
                        // color: R.color.thirdTextColor,
                        width: 16,
                        height: 16,
                        package: ComponentManager.MANAGER_RANK,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        item.rName,
                        maxLines: 1,
                        textScaleFactor: 1.0,
                        style: R.textStyle.subCaption,
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        Container(
          width: Util.width,
          padding: const EdgeInsetsDirectional.only(start: 18),
          child: Text(
            K.rank_send_gift_list,
            style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
