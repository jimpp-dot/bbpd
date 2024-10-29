import 'package:rank/k.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/api/api.dart';
import 'package:rank/src/model/pb/generated/god_recommend.pb.dart';

import 'god_recommend_item_player.dart';
import 'god_recommend_page.dart';

class GodRecommendList extends StatefulWidget {
  final int cid;
  final int filterType;
  final Map<int, GameInfo> gameInfoMap;

  const GodRecommendList(
      {super.key,
      required this.cid,
      required this.filterType,
      required this.gameInfoMap});

  @override
  State<GodRecommendList> createState() => _GodRecommendListState();
}

class _GodRecommendListState extends State<GodRecommendList>
    with
        RefreshAndLoadMoreListMixin<GodRecommendList,
            BodyGodRecommendList_Item> {
  @override
  Color? get tipsColor => R.colors.mainTextColor;

  @override
  bool onFilter(BodyGodRecommendList_Item item) =>
      widget.filterType == 0 || item.gender == widget.filterType;

  @override
  Future<RespModel<BodyGodRecommendList_Item>> loadData(
      int pageIndex, int lastId) async {
    RspGodRecommendList resp = await Api.getGodRecommendList(widget.cid);
    return RespModel(
        isSuccess: resp.success, hasMore: false, list: resp.data.list);
  }

  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  @override
  Widget buildItem(int index, BodyGodRecommendList_Item item) {
    return Rext.themeCardContainer(
      width: 343.dp,
      height: 118.dp,
      cornerRadius: 16.dp,
      margin: EdgeInsetsDirectional.only(start: 16.dp, top: 10.dp, end: 16.dp),
      padding: EdgeInsetsDirectional.only(
          start: 9.dp, top: 9.dp, end: 6.dp, bottom: 9.dp),
      child: Row(
        children: [
          _buildIcon(index, item),
          SizedBox(width: 10.dp),
          Expanded(child: _buildInfo(item)),
          _buildActionBtn(item),
        ],
      ),
    );
  }

  Widget _buildIcon(int index, BodyGodRecommendList_Item item) {
    return SizedBox(
      width: 100.dp,
      height: 100.dp,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.dp),
            child: R.img(Util.squareResize(item.icon, 200),
                width: 100.dp, height: 100.dp),
          ),
          PositionedDirectional(
            start: 0,
            bottom: 0,
            child: _buildPlayer(item),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayer(BodyGodRecommendList_Item item) {
    List<String> list = item.audio.split(':');
    if (list.length < 2) return const SizedBox.shrink();
    return GodRecommendItemPlayer(
      audioUrl: Util.getRemoteImgUrl(list.first),
      duration: Util.parseInt(list[1]),
      gender: item.gender,
    );
  }

  Widget _buildInfo(BodyGodRecommendList_Item item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 16.dp,
              fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 3.dp),
        Row(
          children: [
            _buildGenderAndAge(item.gender, item.age),
            SizedBox(width: 3.dp),
            Expanded(child: _buildGameInfo(item)),
          ],
        ),
        SizedBox(height: 3.dp),
        Text(
          item.description,
          style: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 14.dp,
              fontWeight: FontWeight.w400),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 3.dp),
        item.rid > 0 ? _buildInRoomIng(item.roomDesc) : SizedBox(height: 18.dp),
      ],
    );
  }

  Widget _buildGenderAndAge(int gender, int age) {
    return UserSexAndAgeWidget(
      sex: gender,
      age: age,
    );
  }

  Widget _buildGameInfo(BodyGodRecommendList_Item item) {
    if (widget.cid > 0) {
      GameInfo? gameInfo = widget.gameInfoMap[widget.cid];
      return gameInfo == null
          ? const SizedBox.shrink()
          : Row(
              children: [
                R.img(gameInfo.icon, width: 18.dp, height: 18.dp),
                ColorfulTextWidget(
                  text: gameInfo.levelNames[item.level] ?? '',
                  gradient: LinearGradient(colors: gameInfo.colors),
                  style:
                      TextStyle(fontSize: 12.dp, fontWeight: FontWeight.w600),
                ),
              ],
            );
    } else {
      List<Widget> list = [];
      for (var item in item.certList) {
        GameInfo? gameInfo = widget.gameInfoMap[item.cid];
        if (gameInfo != null) {
          list.add(R.img(gameInfo.icon, width: 18.dp, height: 18.dp));
          list.add(
            ColorfulTextWidget(
              text: gameInfo.levelNames[item.level] ?? '',
              gradient: LinearGradient(colors: gameInfo.colors),
              style: TextStyle(fontSize: 12.dp, fontWeight: FontWeight.w600),
            ),
          );
          list.add(SizedBox(width: 3.dp));
        }
      }
      return list.isEmpty
          ? const SizedBox.shrink()
          : SizedBox(
              height: 18.dp,
              child: MarqueeWidget(
                speed: 0.2,
                ratioOfBlankToScreen: 30,
                child: Row(mainAxisSize: MainAxisSize.min, children: list),
              ),
            );
    }
  }

  Widget _buildInRoomIng(String roomDesc) {
    Color color = darkMode ? Colors.white : const Color(0xFF8D6BF7);
    return Container(
      height: 18.dp,
      padding: EdgeInsetsDirectional.only(start: 5.dp),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: darkMode
              ? [const Color(0x556CFFFF), const Color(0x006CFFFF)]
              : [const Color(0x55CFB6FA), const Color(0x00A5A6FB)],
        ),
        borderRadius:
            BorderRadiusDirectional.horizontal(start: Radius.circular(9.dp)),
      ),
      child: Row(
        children: [
          R.img(
            BaseAssets.shared$in_room_status_webp,
            width: 12.dp,
            height: 12.dp,
            color: darkMode ? null : const Color(0xFF8D6BF7),
          ),
          SizedBox(width: 3.dp),
          Text(
            K.in_room,
            style: TextStyle(
                color: color, fontSize: 10.dp, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 6.dp),
          Text(
            roomDesc,
            style: TextStyle(
                color: color, fontSize: 11.dp, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn(BodyGodRecommendList_Item item) {
    if (item.rid > 0) {
      return QuickTapFilterWidget(
        onTap: () {
          IRoomManager roomManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(context, item.rid);
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 3.dp, end: 8.dp),
          child: GradientBorder(
            borderGradient: LinearGradient(
              colors: darkMode
                  ? [
                      const Color(0xFF99FFBC),
                      const Color(0xFF5492F3),
                      const Color(0xFF8964F2)
                    ]
                  : [R.color.mainBrandColor, R.color.mainBrandColor],
            ),
            borderRadius: 12.dp,
            child: Container(
              width: 52.dp,
              height: 24.dp,
              alignment: AlignmentDirectional.center,
              child: Text(
                K.go_to_gang_up,
                style: TextStyle(
                  color: darkMode
                      ? const Color(0xFF6CFFFF)
                      : R.color.mainBrandColor,
                  fontSize: 12.dp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return QuickTapFilterWidget(
        onTap: () {
          IChatManager chatManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_CHAT);
          chatManager.openUserChatScreen(context,
              type: 'private', targetId: item.uid, title: item.name);
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 15.dp),
          child: R.img(
            darkMode
                ? Assets.rank$god_ic_chat_dark_webp
                : Assets.rank$god_ic_chat_webp,
            width: 48.dp,
            height: 48.dp,
          ),
        ),
      );
    }
  }
}
