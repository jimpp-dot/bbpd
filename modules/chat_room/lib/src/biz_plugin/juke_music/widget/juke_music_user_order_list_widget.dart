import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_beans.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_repos.dart';
import 'package:chat_room/src/biz_plugin/juke_music/widget/juke_music_order_confirm_widget.dart';
import 'juke_music_base_state.dart';

/// 用户点歌页面
class JukeMusicUserOrderListWidget extends StatefulWidget {
  final int rid;
  final int uid;

  const JukeMusicUserOrderListWidget(
      {super.key, required this.rid, required this.uid});

  static void open(BuildContext context, int rid, int uid) async {
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        disableTapDismissible: true,
        maxHeightRatio: 1,
        builder: (BuildContext context) {
          return JukeMusicUserOrderListWidget(
            rid: rid,
            uid: uid,
          );
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
  }

  @override
  _JukeMusicUserOrderListWidgetState createState() =>
      _JukeMusicUserOrderListWidgetState();
}

class _JukeMusicUserOrderListWidgetState
    extends JukeMusicBaseState<JukeMusicUserOrderListWidget> {
  JukeUserOrderList? _data;

  /// 加载数据
  @override
  loadData() async {
    setScreenLoading();
    DataRsp dataResp =
        await JukeMusicRepos.userOrderMusicList(widget.rid, widget.uid);
    _data = dataResp.data;
    if (_data?.singer == null) {
      setScreenError(
          errorMsg: dataResp.msg, errorMsgColor: Colors.white.withOpacity(0.6));
    } else if (_data?.list == null || _data!.list.isEmpty) {
      setScreenEmpty(emptyMsgColor: Colors.white);
    } else {
      setScreenReady();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 550.dp + Util.iphoneXBottom,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(RoomAssets.chat_room$jukemusic_juke_bg_webp),
            fit: BoxFit.fill),
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(16.dp)),
      ),
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      child: buildBody(),
    );
  }

  @override
  Widget buildTitle() {
    return const SizedBox.shrink();
  }

  @override
  Widget buildContent() {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.dp),
            Container(
              width: 76.dp,
              height: 76.dp,
              alignment: AlignmentDirectional.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GradientBorder(
                      borderWidth: 2,
                      borderRadius: 38.dp,
                      borderGradient: LinearGradient(colors: [
                        const Color(0xFFFF3186),
                        const Color(0xFFFF5ECB).withOpacity(0.42)
                      ]),
                      child: Container(
                        width: 76.dp,
                        height: 76.dp,
                        padding: EdgeInsets.all(2.dp),
                        child: CommonAvatar(
                            path: _data!.singer!.icon,
                            size: 72.dp,
                            shape: BoxShape.circle),
                      )),
                  PositionedDirectional(
                      bottom: 0.dp,
                      end: 0.dp,
                      child: R.img(RoomAssets.chat_room$jukemusic_ic_tag_png,
                          width: 29.dp, height: 29.dp)),
                ],
              ),
            ),
            SizedBox(height: 7.dp),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
              child: Text(
                _data!.singer!.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            if (_data!.singer!.desc.isNotEmpty)
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 12.dp, end: 12.dp, top: 8.dp),
                child: Text(
                  _data!.singer!.desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 10),
                ),
              ),
            SizedBox(height: 10.dp),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 78.dp,
                  height: 1.dp,
                  margin: EdgeInsetsDirectional.only(end: 12.dp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.dp),
                    gradient: LinearGradient(colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.7)
                    ]),
                  ),
                ),
                Text(K.room_juke_ta_song,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.4), fontSize: 16)),
                Container(
                  width: 78.dp,
                  height: 1.dp,
                  margin: EdgeInsetsDirectional.only(start: 12.dp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.dp),
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.7),
                      Colors.transparent
                    ]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.dp),
            Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _data!.list.length,
                    itemBuilder: (context, index) {
                      return _renderMusicItem(_data!.list[index], index);
                    }))
          ],
        ),
        PositionedDirectional(
          top: 0,
          start: 0,
          end: 0,
          height: 56.dp,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.maybePop(context);
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
                  child: R.img(RoomAssets.chat_room$jukemusic_ic_juke_back_png,
                      width: 24.dp, height: 24.dp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _renderMusicItem(JukeMusic item, int index) {
    return SizedBox(
      width: double.infinity,
      height: 52.dp,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48.dp,
            alignment: AlignmentDirectional.center,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                R.img(RoomAssets.chat_room$jukemusic_bg_num_png,
                    width: 15.dp, height: 24.dp),
                Text(
                  '${++index}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.dp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.songName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(height: 4.dp),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      K.room_juke_total_order,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6), fontSize: 12),
                    ),
                    SizedBox(width: 2.dp),
                    Text(
                      '${item.orderCount}${K.room_ci}',
                      style: const TextStyle(
                          color: Color(0xFFFDA252),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _renderOrderBtn(item),
        ],
      ),
    );
  }

  _renderOrderBtn(JukeMusic item) {
    return GestureDetector(
      onTap: () {
        JukeMusicOrderConfirmWidget.open(context, widget.rid, item.id);
      },
      child: Container(
        width: 52,
        height: 52,
        margin: EdgeInsetsDirectional.only(start: 6.dp, end: 6.dp),
        alignment: AlignmentDirectional.center,
        child: R.img(RoomAssets.chat_room$jukemusic_ic_order_music_png,
            width: 24.dp, height: 24.dp),
      ),
    );
  }
}
