import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/ktv/rank/ktv_music_count_widget.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/protobuf/generated/common_ktv.pb.dart';

/// 单曲榜
class KtvSongRankWidget extends StatefulWidget {
  final int songId;

  const KtvSongRankWidget({Key? key, required this.songId}) : super(key: key);

  @override
  _KtvSongRankWidgetState createState() => _KtvSongRankWidgetState();

  static show(BuildContext context, int songId) {
    return displayModalBottomSheet(
      context: context,
      isBarrierDismissible: true,
      disableTapDismissible: true,
      maxHeightRatio: 0.6,
      builder: (BuildContext context) {
        return KtvSongRankWidget(songId: songId);
      },
    );
  }
}

class _KtvSongRankWidgetState extends BaseScreenState<KtvSongRankWidget> {
  ResKtvSingleSongRank? _respData;

  static const double COVER_HEIGHT = 62.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        image: DecorationImage(
          image: AssetImage(
              R.imagePath(RoomAssets.chat_room$ktv_ktv_rank_song_bg_webp)),
          fit: BoxFit.cover,
        ),
      ),
      child: buildStatusContent(),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    ResKtvSingleSongRank resp = await KtvRepo.getSongRank(widget.songId);
    if (resp.success) {
      if (Util.isCollectionEmpty(resp.data)) {
        setScreenEmpty();
      } else {
        _respData = resp;
        setScreenReady();
      }
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  Widget _buildTitle() {
    return SizedBox(
      height: 56,
      child: Center(
        child: Text(
          K.ktv_single_song_rank,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSongName() {
    return SizedBox(
      height: 64,
      width: 166,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          PositionedDirectional(
            start: 20,
            child: Container(
              width: 145,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    R.imagePath(
                      'ktv/ktv_rank_song_name_bg.png',
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsetsDirectional.only(start: 26),
                  padding: const EdgeInsetsDirectional.only(
                      start: 8, end: 8, top: 8, bottom: 8),
                  child: Text(
                    _respData?.songName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          PositionedDirectional(
            start: 0,
            child: R.img('ktv/ktv_rank_song_music_flag.png',
                width: 64,
                height: 64,
                package: ComponentManager.MANAGER_BASE_ROOM),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return Stack(
      children: [
        ListView.builder(
          itemBuilder: _buildListItem,
          padding: EdgeInsetsDirectional.only(
              start: 12, end: 12, bottom: Util.iphoneXBottom + COVER_HEIGHT),
          itemCount: _respData?.data.length ?? 0,
          itemExtent: 56.0 + 8.0,
        ),
        PositionedDirectional(bottom: 0, child: _buildBottomCover()),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    KtvSingleSongRankData itemData = _respData!.data[index];

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 8),
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Text(
            '${itemData.rank}',
            style: TextStyle(
                color: const Color(0xFF313131).withOpacity(0.4),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 18),
          CommonAvatar(
            path: itemData.singerIcon,
            size: 36,
            shape: BoxShape.circle,
            onTap: () {
              IPersonalDataManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              manager.openImageScreen(context, itemData.singerUid,
                  refer: const PageRefer('ktv_rank'));
            },
          ),
          const SizedBox(width: 12),
          Text(
            itemData.singerName,
            style: const TextStyle(color: Color(0xFF313131), fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          const SizedBox(width: 8),
          MusicCountWidget(count: itemData.score),
        ],
      ),
    );
  }

  Widget _buildBottomCover() {
    return Container(
      height: COVER_HEIGHT,
      width: Util.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF170066).withOpacity(0),
            const Color(0xFF120064).withOpacity(0.9),
            const Color(0xFF130059)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        _buildTitle(),
        _buildSongName(),
        Expanded(child: _buildListView()),
      ],
    );
  }
}
