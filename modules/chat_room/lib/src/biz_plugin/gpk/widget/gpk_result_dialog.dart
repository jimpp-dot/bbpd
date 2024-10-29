import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import '../gpk_helper.dart';
import '../model/gpk_model.dart';
import 'package:chat_room/src/roomNavUtil.dart';

bool _isResultDialogShowing = false;

/// 团战结果
class GPKResultDialog extends StatefulWidget {
  final ChatRoomData room;
  final GPKResultData data;

  const GPKResultDialog({
    super.key,
    required this.room,
    required this.data,
  });

  @override
  _GPKResultDialogState createState() {
    return _GPKResultDialogState();
  }

  static Future show({
    Key? key,
    required BuildContext context,
    required ChatRoomData room,
    required GPKResultData data,
  }) async {
    if (_isResultDialogShowing == true) return;
    _isResultDialogShowing = true;
    var r = await DialogQueue.root.enqueue(
      context: context,
      routeSettings: const RouteSettings(name: 'GPKResultDialog'),
      builder: (context) {
        return GPKResultDialog(key: key, room: room, data: data);
      },
    );
    _isResultDialogShowing = false;
    return r;
  }
}

class _GPKResultDialogState extends State<GPKResultDialog>
    with SingleTickerProviderStateMixin {
  late GPKResultData _data;

  TabController? _tabController;

  final double _width = 281;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: _width,
        height: 400,
        child: Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                // R.img(
                //   RoomAssets.chat_room$gpk_result_top_bg_webp,
                //   width: _width,
                //   height: 51,
                //   fit: BoxFit.fill,
                // ),
                Container(
                  height: 36,
                  decoration:
                      commonBoxDecorationWithParamsAndBorderRadiusBeginAndEnd(
                    [const Color(0xFFFFDDC1), Colors.white],
                    const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    Alignment.topCenter,
                    Alignment.bottomCenter,
                  ),
                ),

                // pk条
                _buildScoreBar(),
                const SizedBox(
                  height: 20,
                ),
                CommonTabBar(
                  tabs: [
                    Tab(text: K.room_gpk_player_rank),
                    Tab(text: K.room_gpk_contributor_rank)
                  ],
                  isScrollable: false,
                  controller: _tabController,
                  labelStyle: const TextStyle(
                    color: Color(0xFF313131),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    color: Color(0x99313131),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  labelColor: const Color(0xFF313131),
                  unselectedLabelColor: const Color(0x99313131),
                  indicatorColor: R.color.mainBrandColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CommonUnderlineTabIndicator(
                    borderSide:
                        BorderSide(width: 3, color: R.color.mainBrandColor),
                    wantWidth: 16,
                    draggingWidth: 12,
                    insets: const EdgeInsetsDirectional.only(bottom: 8),
                  ),
                  labelPadding:
                      const EdgeInsetsDirectional.only(start: 40, end: 40),
                ),
                Container(
                  height: 0.5,
                  width: _width,
                  color: const Color(0x14313131),
                  margin: const EdgeInsetsDirectional.only(top: 3),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _GPKReceiverRank(data: _data),
                      _ContributionRank(data: _data),
                    ],
                  ),
                ),
              ],
            ),
            // logo
            PositionedDirectional(
              top: -99,
              width: 256,
              height: 126,
              child: R.img(
                RoomAssets.chat_room$gpk_result_logo_webp,
                fit: BoxFit.contain,
              ),
            ),
            // 红队
            Positioned.directional(
              textDirection: TextDirection.ltr,
              start: 16,
              top: 67 - 15,
              child: Container(
                width: 67,
                height: 22,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage(RoomAssets.chat_room$gpk_result_red_bg_webp),
                    fit: BoxFit.fill,
                  ),
                ),
                padding: const EdgeInsetsDirectional.only(start: 10)
                    .resolve(TextDirection.ltr),
                alignment:
                    AlignmentDirectional.centerStart.resolve(TextDirection.ltr),
                child: Text(
                  K.room_gpk_red_team,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
            ),
            // 蓝队
            Positioned.directional(
              textDirection: TextDirection.ltr,
              end: 16,
              top: 67 - 15,
              child: Container(
                width: 67,
                height: 22,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        RoomAssets.chat_room$gpk_result_blue_bg_webp),
                    fit: BoxFit.fill,
                  ),
                ),
                padding: const EdgeInsetsDirectional.only(end: 10)
                    .resolve(TextDirection.ltr),
                alignment:
                    AlignmentDirectional.centerEnd.resolve(TextDirection.ltr),
                child: Text(
                  K.room_gpk_blue_team,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
            ),
            if (_data.draw)
              Positioned(
                top: 58,
                child: Text(
                  K.room_gpk_draw,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              )
            else
              Positioned.directional(
                textDirection: TextDirection.ltr,
                top: 50,
                start: _data.redWin ? 128 : 91,
                child: R.img(
                  RoomAssets.chat_room$gpk_result_crown_webp,
                  width: 62,
                  height: 28,
                  fit: BoxFit.contain,
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// PK条
  Widget _buildScoreBar() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        PkScoreWidget(_data.redTotal.toDouble(), _data.blueTotal.toDouble(),
            height: 18, marginLR: 10),
        // R.img(
        //   _data.redWin
        //       ? RoomAssets.chat_room$gpk_result_red_win_bar_webp
        //       : _data.blueWin
        //           ? RoomAssets.chat_room$gpk_result_blue_win_bar_webp
        //           : RoomAssets.chat_room$gpk_result_draw_bar_webp,
        //   width: _width,
        //   height: 18,
        //   fit: BoxFit.fill,
        // ),
        // Positioned.directional(
        //   textDirection: TextDirection.ltr,
        //   start: 10,
        //   child: Text(
        //     GPKHelper.getScoreText(_data.rule, _data.redTotal),
        //     style: const TextStyle(
        //       fontSize: 10,
        //       color: Colors.white,
        //       fontWeight: FontWeight.w500,
        //       height: 1,
        //     ),
        //   ),
        // ),
        // Positioned.directional(
        //   textDirection: TextDirection.ltr,
        //   end: 10,
        //   child: Text(
        //     GPKHelper.getScoreText(_data.rule, _data.blueTotal),
        //     style: const TextStyle(
        //       fontSize: 10,
        //       color: Colors.white,
        //       fontWeight: FontWeight.w500,
        //       height: 1,
        //     ),
        //   ),
        // ),
        if (_data.draw)
          Positioned.directional(
            textDirection: TextDirection.ltr,
            top: -7,
            child: R.img(
              RoomAssets.chat_room$gpk_result_draw_webp,
              width: 97,
              height: 29,
              fit: BoxFit.contain,
            ),
          )
        else
          Positioned.directional(
            textDirection: TextDirection.ltr,
            start: _data.redWin ? 140 : 104,

            child: text14('winner', textColor: Colors.white),

            // child: const GradientText(
            //   'winner',
            //   gradient: LinearGradient(
            //     colors: [
            //       Color(0xFFFFFFFF),
            //       Color(0xFFF3C8B5),
            //       Color(0xFFFBDC85),
            //     ],
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //   ),
            //   style: TextStyle(
            //     fontSize: 12,
            //     shadows: [
            //       Shadow(
            //         color: Color(0xFFE03D5F),
            //         offset: Offset(0, 2),
            //         blurRadius: 4,
            //       ),
            //       Shadow(
            //         color: Color(0xFFE84E18),
            //         offset: Offset(0, 1),
            //         blurRadius: 0,
            //       ),
            //     ],
            //   ),
            // ),
          ),
      ],
    );
  }
}

/// 团战榜(魅力榜)
class _GPKReceiverRank extends StatelessWidget {
  final GPKResultData data;

  const _GPKReceiverRank({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsetsDirectional.only(
                start: 10, top: 10, bottom: 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFD3297),
                  Color(0xFFFFA08D),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10),
                bottomStart: Radius.circular(10),
                topEnd: Radius.circular(4),
                bottomEnd: Radius.circular(4),
              ),
            ),
            child: ListView.builder(
              itemBuilder: (_, index) {
                GPKUser user = data.redList.elementAt(index);
                return _buildUerItem(_, user);
              },
              itemCount: data.redList.length,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Container(
            margin:
                const EdgeInsetsDirectional.only(end: 10, top: 10, bottom: 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF27C3FF),
                  Color(0xFF65F6C9),
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(10),
                bottomEnd: Radius.circular(10),
                topStart: Radius.circular(4),
                bottomStart: Radius.circular(4),
              ),
            ),
            child: ListView.builder(
              itemBuilder: (_, index) {
                GPKUser user = data.blueList.elementAt(index);
                return _buildUerItem(_, user);
              },
              itemCount: data.blueList.length,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUerItem(BuildContext context, GPKUser user) {
    return GestureDetector(
      onTap: () {
        RoomNavUtil.goToImageScreenDialog(
          context,
          null,
          ChatRoomData.getInstance()!,
          userId: user.uid,
        );
      },
      child: Container(
        height: 56,
        alignment: AlignmentDirectional.center,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 9),
              child: CommonAvatar(
                path: user.icon,
                size: 36,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Text(
                      GPKHelper.getScoreText(data.rule, user.score),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
}

/// 贡献榜
class _ContributionRank extends StatelessWidget {
  final GPKResultData data;

  const _ContributionRank({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildItem(context, index, data.contributionList[index]);
      },
      itemCount: data.contributionList.length,
      padding: const EdgeInsetsDirectional.only(top: 8, bottom: 8),
      itemExtent: 52,
      physics: const ClampingScrollPhysics(),
    );
  }

  Widget _buildItem(BuildContext context, int index, GPKUser user) {
    return GestureDetector(
      onTap: () {
        RoomNavUtil.goToImageScreenDialog(
          context,
          null,
          ChatRoomData.getInstance()!,
          userId: user.uid,
        );
      },
      child: Container(
        height: 52,
        padding: const EdgeInsetsDirectional.only(start: 21, end: 16),
        child: Row(
          children: [
            if (index < 3)
              R.img(
                RoomAssets.chat_room$gpk_contribution_x_webp(index + 1),
                width: 31,
                height: 19,
              )
            else
              Container(
                width: 31,
                height: 22,
                alignment: Alignment.center,
                child: NumText(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 21,
                    color: Color(0xFF313131),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, end: 9),
              child: CommonAvatar(
                path: user.icon,
                size: 36,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF313131),
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 4),
                        child: UserSexWidget(sex: user.sex, size: 14),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 5),
                    child: Text(
                      GPKHelper.getScoreText(data.rule, user.giftValue),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF858585),
                        fontWeight: FontWeight.w500,
                      ),
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
}
