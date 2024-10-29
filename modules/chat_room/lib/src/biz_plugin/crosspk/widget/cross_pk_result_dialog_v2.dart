import 'package:shared/shared.dart' hide RoomCrossPkWinState;
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';
import 'package:flutter/material.dart';

/// 魅力榜、贡献榜
class CrossPKResultDialogV2 extends StatefulWidget {
  final RoomCrossPkResultV2 data;

  const CrossPKResultDialogV2({Key? key, required this.data}) : super(key: key);

  @override
  _CrossPKResultDialogStateV2 createState() {
    return _CrossPKResultDialogStateV2();
  }

  static Future<void> show(
      BuildContext context, RoomCrossPkResultV2? result) async {
    result ??= RoomCrossPkResultV2();
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CrossPKResultDialogV2(data: result!),
    );
  }

  static Future<void> showByRecord(
      BuildContext context, int pkId, int rid) async {
    if (pkId <= 0 || rid <= 0) return;
    ApiRoomCrossPkExploitsDetailsResponse resp =
        await CrossPKRepo.getPKResultV2(pkId, rid);
    if (resp.success && resp.hasData()) {
      return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => CrossPKResultDialogV2(data: resp.data.result),
      );
    }
  }
}

class _CrossPKResultDialogStateV2 extends State<CrossPKResultDialogV2>
    with SingleTickerProviderStateMixin {
  int result = 0; // 未知

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    safeRun(() {
      _tabController = TabController(length: 2, vsync: this);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.result == RoomCrossPkWinState.CROSSPK_WIN) {
      result = 1; // 胜利
    } else if (widget.data.result == RoomCrossPkWinState.CROSSPK_FAIL) {
      result = 2; // 失败
    } else if (widget.data.result == RoomCrossPkWinState.CROSSPK_DRAW) {
      result = 3; // 平局
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 885.dp / 2,
        height: 1221.dp / 2,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            R.img(
              (result == 1)
                  ? RoomAssets.chat_room$crosspk_ic_cross_pk_result_bg_win_webp
                  : RoomAssets
                      .chat_room$crosspk_ic_cross_pk_result_bg_fail_webp,
              width: 885.dp / 2,
              height: 1221.dp / 2,
              fit: BoxFit.contain,
            ),
            PositionedDirectional(
              top: 220.dp,
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
                      labelColor: Colors.black,
                      unselectedLabelColor: const Color(0xFFD8D8D8),
                      indicatorColor: const Color(0xFF9EFF4E),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const CommonUnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 3, color: Color(0xFF9EFF4E)),
                        wantWidth: 12,
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
            // if (result > 0)
            //   PositionedDirectional(
            //     top: -63.dp,
            //     child: Stack(
            //       alignment: Alignment.center,
            //       children: [
            //         R.img(
            //           (result == 1)
            //               ? RoomAssets.chat_room$crosspk_ic_cross_pk_result_top_win_webp
            //               : (result == 2)
            //                   ? RoomAssets.chat_room$crosspk_ic_cross_pk_result_top_fail_webp
            //                   : RoomAssets.chat_room$crosspk_ic_cross_pk_result_top_draw_webp,
            //           width: 236.dp,
            //           height: 138.dp,
            //           fit: BoxFit.contain,
            //         ),
            //         Container(
            //           width: 57.dp,
            //           height: 57.dp,
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: (result == 1)
            //                 ? const Color(0xFFFBC55B)
            //                 : (result == 2)
            //                     ? const Color(0xFFB78BFF)
            //                     : const Color(0xFF8499DD),
            //           ),
            //           child: CommonAvatar(
            //             path: widget.data.icon,
            //             size: 54.dp,
            //             shape: BoxShape.circle,
            //             resizeCacheWidth: true,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
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
                      style: TextStyle(
                        color: (result == 1)
                            ? const Color(0xFFE2BB70)
                            : const Color(0xFFB8B8B8),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
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
                        color: Color(0xFF313131), fontWeight: FontWeight.w600),
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
              style: TextStyle(
                color: (result == 1)
                    ? const Color(0xFFB6811B)
                    : const Color(0xFF7C7C7C),
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
