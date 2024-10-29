import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/base/config.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:chat_room/src/ktv/utils/ktv_theme.dart';
import 'package:chat_room/src/ktv/model/song_sheet_beans.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/ktv/utils/reporter.dart';
import '../../../k.dart';
import '../../base/widget/song_order/music_order_dialog.dart';
import '../ktv_report_dialog.dart';
import 'ktv_room_song_history_page.dart';

/// ktv已点歌曲列表(播放列表)
///
class RequestedSongListWidget extends StatefulWidget {
  final bool isRoomMaster;
  final ChatRoomData room;
  final VoidCallback? onBottomClicked;

  const RequestedSongListWidget({
    Key? key,
    required this.room,
    this.isRoomMaster = false,
    this.onBottomClicked,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SongListState();
}

enum PageState { Loading, Error, Empty, Normal }

class _SongListState extends State<RequestedSongListWidget>
    with AutomaticKeepAliveClientMixin {
  PageState pageState = PageState.Loading;

  final ScrollController _controller = ScrollController();

  List<RequestedSong> list = [];

  bool showShow = true;

  int orderedNum = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
    widget.room.addListener(RoomConstant.Event_Ktv_Info, _onKtvInfo);
    _controller.addListener(() {
      double dis = _controller.position.maxScrollExtent - _controller.offset;
      if (dis < 20 && showShow) {
        showShow = false;
        refresh();
      }
      if (dis >= 20 && !showShow) {
        showShow = true;
        refresh();
      }
    });
  }

  @override
  void dispose() {
    widget.room.removeListener(RoomConstant.Event_Ktv_Info, _onKtvInfo);
    super.dispose();
  }

  void _loadData() async {
    RequestedSongListRsp rsp =
        await KtvRepo.getRequestedSongList(widget.room.rid, Session.uid);
    if (rsp.success == true) {
      list.clear();
      if (rsp.songs.isNotEmpty) {
        pageState = PageState.Normal;
        list.addAll(rsp.songs);
      } else {
        pageState = PageState.Empty;
      }
      orderedNum = rsp.orderedNum;
    } else {
      pageState = PageState.Error;
    }

    refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (pageState != PageState.Loading && pageState != PageState.Error) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRoomHistory(),
          Container(
            height: 1,
            width: Util.width - 32,
            margin: const EdgeInsetsDirectional.only(
                start: 16, end: 16, top: 20, bottom: 20),
            color: R.color.secondTextColor.withOpacity(0.1),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Text(
              '${K.room_music_playlist} ${list.length}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: R.color.mainTextColor,
                height: 1.2,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 20, top: 8, bottom: 8),
            child: Text(
              K.room_ktv_has_order_tips,
              style: TextStyle(
                fontSize: 13,
                color: R.color.secondTextColor,
                height: 1.2,
              ),
            ),
          ),
          _buildContent(),
        ],
      );
    }

    return _buildContent();
  }

  Widget _buildRoomHistory() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        KtvRoomSongHistoryPage.show(context, widget.room, autoMic: true);
        Tracker.instance.track(TrackEvent.click,
            properties: {'click_page': 'click_historyoder'});
      },
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text(
            K.room_ktv_room_history,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: R.color.mainTextColor,
                height: 1.1),
          ),
          const Spacer(),
          Text(
            '$orderedNum${K.room_song_unit}',
            style: TextStyle(
                fontSize: 13, color: R.color.secondTextColor, height: 1.1),
          ),
          R.img(
            'ic_next_small.svg',
            color: R.color.secondTextColor,
            width: 16,
            height: 16,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (pageState) {
      case PageState.Loading:
        return const Center(child: CupertinoActivityIndicator());
      case PageState.Error:
        return Center(
          child: ErrorData(
            onTap: () {
              pageState = PageState.Loading;
              setState(() {});
              _loadData();
            },
          ),
        );
      case PageState.Empty:
        return Expanded(
          child: Stack(
            children: <Widget>[
              EmptyWidget(desc: K.room_ktv_empty_song),
              Positioned(
                bottom: 0,
                child: _buildBottomButton(),
              )
            ],
          ),
        );
      case PageState.Normal:
        return _buildList();
      default:
        return _buildList();
    }
  }

  Expanded _buildList() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 72),
            child: ListView.builder(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return _buildItem(index);
                }),
          ),
          if (showShow && list.length > 9)
            Positioned(
              bottom: 48,
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x00FFFFFF), Colors.white],
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            child: _buildBottomButton(),
          )
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return GestureDetector(
      onTap: () {
        widget.onBottomClicked?.call();
        Tracker.instance
            .track(TrackEvent.click, properties: {'click_page': 'click_want'});
      },
      child: Container(
        height: 48,
        width: Util.width - 40,
        alignment: Alignment.center,
        margin: EdgeInsetsDirectional.only(
            bottom: Util.iphoneXBottom + 10, start: 20, end: 20, top: 12),
        decoration: BoxDecoration(
          color: KtvTheme.mainBrandColor,
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: KtvTheme.gradientColors,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            R.img("ktv_icon_mic.png",
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: 24,
                height: 24),
            const SizedBox(width: 4),
            Text(
              K.ktv_choose_song,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    RequestedSong song = list[index];
    String songName = song.name;
    if (song.singerName.isNotEmpty) {
      songName = "$songName-${song.singerName}";
    }

    double height = 72;

    Color titleColor = KtvTheme.mainTextColor;
    if (index == 0) {
      titleColor = KtvTheme.mainBrandColor;
    }

    bool isShowDeleteIcon = false;
    if (index > 0 && (widget.isRoomMaster || song.requestUid == Session.uid)) {
      isShowDeleteIcon = true;
    }

    bool isShowTopIcon = false;
    if (index > 1 && widget.isRoomMaster) {
      isShowTopIcon = true;
    }

    return Container(
      height: height,
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Row(
        children: <Widget>[
          NumText(
            "${index + 1}.",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontSize: 12,
              color: KtvTheme.secondTextColor,
            ),
          ),
          if (Util.validStr(song.icon)) ...[
            const SizedBox(width: 8),
            CommonAvatar(
              path: song.icon,
              size: 52,
              borderRadius: BorderRadius.circular(8),
              suffix: null,
            ),
          ],
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // SizedBox(height: 11),
                Row(
                  children: <Widget>[
                    if (index == 0)
                      R.img(
                        'in_room_status.webp',
                        package: ComponentManager.MANAGER_BASE_CORE,
                        width: 15,
                        height: 15,
                        color: KtvTheme.mainBrandColor,
                      ),
                    Expanded(
                      child: Text(
                        songName,
                        style: TextStyle(
                          fontSize: 13,
                          color: titleColor,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  K.ktv_who_ordered_song([song.requestUName]),
                  style:
                      TextStyle(fontSize: 11, color: KtvTheme.secondTextColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          if (isShowTopIcon)
            InkWell(
              onTap: () {
                _onClickTop(index);
              },
              child: Container(
                height: 72,
                alignment: AlignmentDirectional.topStart,
                padding: const EdgeInsetsDirectional.only(
                    start: 10, top: 15, end: 10),
                child: R.img(
                  RoomAssets.chat_room$ic_top_svg,
                  color: KtvTheme.secondTextColor,
                  width: 20,
                  height: 20,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
          if (isShowDeleteIcon)
            InkWell(
              onTap: () {
                _onClickDelete(index);
              },
              child: Container(
                height: 72,
                alignment: AlignmentDirectional.topStart,
                padding: const EdgeInsetsDirectional.only(
                    start: 10, top: 15, end: 10),
                child: R.img(
                  RoomAssets.chat_room$ic_delete_svg,
                  width: 20,
                  height: 20,
                  color: KtvTheme.secondTextColor,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
          if (song.showAccuse)
            InkWell(
              onTap: () {
                _onClickReport(index);
              },
              child: Container(
                height: 72,
                alignment: AlignmentDirectional.topStart,
                padding: const EdgeInsetsDirectional.only(
                    start: 10, top: 15, end: 10),
                child: R.img(
                  RoomAssets.chat_room$ktv_ic_report_flag_svg,
                  width: 20,
                  height: 20,
                  color: KtvTheme.secondTextColor,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
          if (song.requestUid != Session.uid && index == 0)
            GestureDetector(
              onTap: () async {
                /// 跳转礼物打赏
                sendGift(song.requestUid);
                Tracker.instance.track(TrackEvent.click, properties: {
                  'click_page': 'click_support',
                });
              },
              child: Container(
                height: 32,
                margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
                padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                alignment: AlignmentDirectional.center,
                child: Text(
                  K.room_ktv_send_gift,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ),
            ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  void sendGift(int uid) {
    if (mounted) {
      Navigator.of(context).pop();
    }
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.showRoomGiftPanel(context,
        room: widget.room, uid: uid, refer: 'ktv_song_order');
  }

  void _onClickReport(int index) {
    KtvReportDialog.showDialog(context, list[index].id);
  }

  void _onClickTop(int index) async {
    bool success = await KtvRepo.singUp(
        widget.room.rid, list[index].id, list[index].requestUid);
    if (success) {
      _loadData();
    }
    KtvReporter.placeSongTop(
        widget.room.rid, list[index].id, list[index].requestUid);
    Toast.showCenter(
        context, success ? K.ktv_sing_up_success : K.ktv_sing_up_failure);
  }

  void _onClickDelete(int index) async {
    bool? res = await MusicOrderDialog.show(context,
        content: K.music_order_delete_sure);
    if (res != true) {
      return;
    }
    bool success = await KtvRepo.singDel(
        widget.room.rid, list[index].id, list[index].requestUid);
    if (success) {
      _loadData();
    }
    KtvReporter.deleteSong(
        widget.room.rid, list[index].id, list[index].requestUid);
    Toast.showCenter(
        context, success ? K.ktv_del_song_success : K.ktv_del_song_failure);
  }

  _onKtvInfo(String type, Object? data) {
    if (data == null || data is! KtvInfo || !mounted) return;
    KtvInfo ktvInfo = data;
    if (ktvInfo.listCount != list.length ||
        isSongOrderChange(ktvInfo.songList)) {
      // 排歌列表数目/排序发生变化，重新加载
      _loadData();
    }
  }

  bool isSongOrderChange(List<int> songList) {
    if (songList.isEmpty && list.isEmpty) {
      return false;
    }

    if (songList.length != list.length) {
      return true;
    }

    for (int i = 0; i < songList.length; i++) {
      if (songList[i] != list[i].id) {
        return true;
      }
    }

    return false;
  }

  @override
  bool get wantKeepAlive => true;
}
