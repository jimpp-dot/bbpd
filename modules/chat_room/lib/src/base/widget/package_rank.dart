import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/model/package_rank_logic.dart';
import 'package:chat_room/src/protobuf/generated/package_count_ranking.pb.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageRankScreen extends StatefulWidget {
  static void show(BuildContext context, int? uid, ChatRoomData room) {
    displayModalBottomSheet(
        context: context,
        defineBarrierColor: Colors.black.withOpacity(0.01),
        settings: const RouteSettings(name: '/package_rank'),
        disableTapDismissible: true,
        maxHeightRatio: 1,
        builder: (BuildContext context) {
          return PackageRankScreen(uid: uid ?? 0, room: room);
        });
  }

  final int uid;
  final ChatRoomData room;

  const PackageRankScreen({super.key, required this.uid, required this.room});

  @override
  _PackageRankScreenState createState() => _PackageRankScreenState();
}

class _PackageRankScreenState extends State<PackageRankScreen> {
  PackageRankLogic logic = Get.put(PackageRankLogic());

  @override
  void initState() {
    super.initState();
    logic.loadPackageRank(widget.uid, widget.room.rid);
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<PackageRankLogic>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PackageRankLogic>(builder: (logic) {
      return Container(
          height: 420.dp,
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16.dp),
                topEnd: Radius.circular(16.dp)),
            // border: Border(top: BorderSide(
            //   color: R.color.dividerColor,
            //   width: 0.5))
          ),
          child: logic.data == null
              ? const SizedBox.shrink()
              : Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 51.dp,
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            K.room_gpk_contributor_rank,
                            style: TextStyle(
                                color: R.color.mainTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount: logic.data?.rankInfo.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return RankUserItem(
                                //index: index,
                                index: logic.data!.rankInfo[index].rank,
                                info: logic.data!.rankInfo[index],
                                room: widget.room);
                          },
                        ))
                      ],
                    ),
                    if (logic.data?.selfInfo != null &&
                        widget.uid != Session.uid)
                      PositionedDirectional(
                          start: 0,
                          end: 0,
                          bottom: 0,
                          //bottom: Util.iphoneXBottom,
                          child: RankUserItem(
                              index: logic.data!.selfInfo.rank,
                              info: logic.data!.selfInfo,
                              height: 76.dp + Util.iphoneXBottom,
                              radius: 16.dp,
                              color: R.color.mainBgColor,
                              room: widget.room))
                  ],
                ));
    });
  }
}

class RankUserItem extends StatelessWidget {
  final double? height;
  final double radius;
  final int? index;
  final RankUserInfo info;
  final Color color;
  final ChatRoomData room;

  const RankUserItem(
      {super.key,
      this.index,
      required this.info,
      this.height,
      required this.room,
      this.color = Colors.transparent,
      this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 72.dp,
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(radius),
              topEnd: Radius.circular(radius)),
          border: BorderDirectional(
            top: BorderSide(
              color: height != null ? R.color.dividerColor : Colors.transparent,
              width: height != null ? 0.5.dp : 0,
            ),
            start: BorderSide(
              color: height != null ? R.color.dividerColor : Colors.transparent,
              width: height != null ? 0.5.dp : 0,
            ),
            end: BorderSide(
              color: height != null ? R.color.dividerColor : Colors.transparent,
              width: height != null ? 0.5.dp : 0,
            ),
            bottom: BorderSide(
              color: height != null ? R.color.dividerColor : Colors.transparent,
              width: height != null ? 0.5.dp : 0,
            ),
          ),
          //color: Colors.amberAccent,
          color: color),
      padding: EdgeInsetsDirectional.only(start: 7.dp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          //Row(
          //  mainAxisSize: MainAxisSize.max,
          //  children: [
          Container(
            alignment: AlignmentDirectional.center,
            width: 25.dp,
            child: _buildIndex(),
          ),
          // Container(
          //   margin: EdgeInsetsDirectional.only(start: 6.dp),
          // ),
          if (info.icon.isNotEmpty) _buildHeader(context),
          // Container(
          //   margin: EdgeInsetsDirectional.only(start: 8.dp),
          //   //color: Colors.deepOrange,
          //   constraints: BoxConstraints(
          //      maxWidth: height != null ? 56.dp : 112.dp,
          //   ),
          //   child: Text(
          //     info.name ?? '',
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(
          //         fontSize: 16,
          //         color: R.color.mainTextColor,
          //         fontWeight: FontWeight.w500
          //     ),
          //   ),
          // ),
          Expanded(
              child: Row(
            children: [
              Flexible(
                child: Text(
                  info.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      color: R.color.mainTextColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              UserVipWidget(vip: info.vip),
            ],
          )),

          //  ],
          //),
          Container(
            //width: height != null ? 140.dp : 80.dp,
            //color: Colors.grey,
            margin: EdgeInsetsDirectional.only(end: 16.dp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(K.package_settting_contribute,
                    style: TextStyle(
                        color: height == null
                            ? R.color.secondaryBrandColor
                            : R.color.secondTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
                Container(margin: EdgeInsetsDirectional.only(start: 8.dp)),
                Text(_getMoney(info.money),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: height == null
                            ? R.color.secondaryBrandColor
                            : R.color.secondTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
                if (height != null) ...ownerInfo(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  String _getMoney(int money) {
    int package = money;
    if (package < 1000 * 100) {
      return (package / 100).toStringAsFixed(1).toString();
    } else if (package < 10000 * 100) {
      return (package ~/ 100).toString();
    } else {
      return '${(package ~/ (100 * 1000)).toStringAsFixed(1)}k';
    }
  }

  List<Widget> ownerInfo(BuildContext context) {
    return [
      Container(margin: EdgeInsetsDirectional.only(start: 8.dp)),
      GestureDetector(
        onTap: () async {
          Navigator.pop(context);

          IGiftManager giftManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_GIFT);
          await giftManager.showRoomGiftPanel(context, room: room);
        },
        child: Container(
          width: 58.dp,
          height: 32.dp,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
              color: R.color.mainBrandColor,
              borderRadius: BorderRadius.circular(16.dp)),
          child: Text(
            K.package_rank_gift,
            style: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      )
    ];
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      width: 72.dp,
      height: 72.dp,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          PositionedDirectional(
            top: 10.dp,
            start: 11.dp,
            child: CommonAvatar(
              path: System.imageDomain + info.icon,
              size: 52.dp,
              shape: BoxShape.circle,
              onTap: () {
                IPersonalDataManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                manager.openImageScreen(context, Session.uid);
              },
            ),
          ),
          if (index != null && index! >= 1 && index! <= 3)
            PositionedDirectional(
                child: IgnorePointer(
              child: R.img('rank/rank_top_crown$index.webp',
                  width: 54.dp,
                  height: 62.dp,
                  fit: BoxFit.fill,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ))
        ],
      ),
    );
  }

  Widget _buildIndex() {
    if (index != null && index! >= 1 && index! <= 3) {
      return R.img('rank/rank_top_star$index.webp',
          width: 25.dp,
          height: 25.dp,
          package: ComponentManager.MANAGER_BASE_ROOM);
    }

    return Text(
      '${(index ?? 0) > 0 ? index : '-'}',
      style: TextStyle(
          fontSize: 13,
          color: R.color.secondTextColor,
          fontWeight: FontWeight.w500),
    );
  }
}
