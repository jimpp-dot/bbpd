import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';

/// 魅力榜、贡献榜
class CrossPKResultDialog extends StatefulWidget {
  final RoomCrossPkResult data;

  const CrossPKResultDialog({Key? key, required this.data}) : super(key: key);

  @override
  _CrossPKResultDialogState createState() {
    return _CrossPKResultDialogState();
  }

  static Future<void> show(
      BuildContext context, RoomCrossPkResult result) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CrossPKResultDialog(data: result),
    );
  }
}

class _CrossPKResultDialogState extends State<CrossPKResultDialog>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    safeRun(() {
      _tabController = TabController(length: 2, vsync: this);
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 335.dp,
        height: 457.dp,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            R.img(
              RoomAssets.chat_room$crosspk_result_bg_webp,
              width: 335.dp,
              height: 457.dp,
              fit: BoxFit.contain,
            ),
            PositionedDirectional(
              top: 63.dp,
              bottom: 0,
              start: 0,
              end: 0,
              child: Column(
                children: [
                  SizedBox(
                    height: 32.dp,
                    child: CommonTabBar(
                      tabs: [
                        Tab(text: K.room_tab_item_beauty),
                        Tab(text: K.room_tab_item_week),
                      ],
                      isScrollable: false,
                      controller: _tabController,
                      labelStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                      labelColor: const Color(0xFFB6811B),
                      unselectedLabelColor:
                          const Color(0xFFB6811B).withOpacity(0.3),
                      indicatorColor: const Color(0xFFB6811B),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const CommonUnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 3, color: Color(0xFFB6811B)),
                        wantWidth: 30,
                        draggingWidth: 12,
                      ),
                      marginStart: 20,
                      marginEnd: 20,
                    ),
                  ),
                  SizedBox(height: 4.dp),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        showRankListByKey(roomCharmKey)
                            ? ListView.builder(
                                itemBuilder: (context, index) {
                                  RoomCrossPkMember user =
                                      widget.data.receiverRank[index];
                                  return _buildItem(0, index, user);
                                },
                                itemExtent: 52.dp,
                                itemCount: widget.data.receiverRank.length,
                              )
                            : const SizedBox.shrink(),
                        showRankListByKey(roomContributeKey)
                            ? ListView.builder(
                                itemBuilder: (context, index) {
                                  RoomCrossPkMember user =
                                      widget.data.senderRank[index];
                                  return _buildItem(1, index, user);
                                },
                                itemExtent: 52.dp,
                                itemCount: widget.data.senderRank.length,
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  SizedBox(height: 48.dp),
                ],
              ),
            ),
            if (widget.data.result == RoomCrossPkWin.ROOM_CROSS_PK_WIN_NORMAL)
              PositionedDirectional(
                top: -70.dp,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: Util.getImgUrl('room/crosspk/result_win.webp'),
                      width: 235.dp,
                      height: 138.dp,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      width: 57.dp,
                      height: 57.dp,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFFDCB6E)),
                      child: CommonAvatar(
                        path: widget.data.icon,
                        size: 54.dp,
                        shape: BoxShape.circle,
                        resizeCacheWidth: true,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// type 0：魅力；1：贡献
  Widget _buildItem(int type, int index, RoomCrossPkMember user) {
    return Row(
      children: [
        if (_showRankByType(type))
          Container(
            width: 54.dp,
            alignment: Alignment.center,
            child: index < 3
                ? R.img(
                    RoomAssets.chat_room$gpk_contribution_x_webp(index + 1),
                    width: 32.dp,
                    height: 20.dp,
                    fit: BoxFit.contain,
                  )
                : FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                          color: Color(0xFFE2BB70),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
          ),
        CommonAvatar(
          path: user.icon,
          size: 36.dp,
          shape: BoxShape.circle,
        ),
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 8.dp, end: 4.dp),
                  child: Text(
                    user.name,
                    style: const TextStyle(
                      color: Color(0xFF313131),
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              UserSexWidget(sex: user.sex, size: 14),
            ],
          ),
        ),
        if (_showRankScoreByType(type))
          Padding(
            padding: EdgeInsetsDirectional.only(start: 8.dp, end: 16.dp),
            child: Text(
              Util.numberToSizeString(user.score),
              style: const TextStyle(
                color: Color(0xFFB6811B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}

bool _showRankByType(int type) {
  if (type == 0) {
    /// 魅力榜单
    return showRankByKey(roomCharmKey);
  }
  if (type == 1) {
    /// 贡献榜单
    return showRankByKey(roomContributeKey);
  }
  return false;
}

bool _showRankScoreByType(int type) {
  if (type == 0) {
    /// 魅力榜单
    return showRankByKey(roomCharmKey);
  }
  if (type == 1) {
    /// 贡献榜单
    return showRankByKey(roomContributeKey);
  }
  return false;
}
