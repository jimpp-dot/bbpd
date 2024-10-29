import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/music/music_to_play.dart';
import 'package:chat_room/src/base/widget/music/playing_gif_icon.dart';
import 'package:chat_room/src/music/model/muisc_play_list_model.dart';
import 'package:flutter/material.dart';

/// 播放列表 单个音乐item
///
class MusicPlayListItemWidget extends StatelessWidget {
  final MusicPlayListItem data;
  final bool isPlaying;
  final bool slideEnabled;
  final VoidCallback? toPlayPressed;

  /// 删除按钮点击
  final Function(MusicPlayListItem data)? onTapPlayListDelete;

  /// 置顶按钮点击
  final Function(MusicPlayListItem data)? onTapPlayListTop;

  final VoidCallback? onTapUserIcon;

  const MusicPlayListItemWidget({
    super.key,
    required this.data,
    required this.isPlaying,
    required this.slideEnabled,
    this.toPlayPressed,
    this.onTapPlayListDelete,
    this.onTapPlayListTop,
    this.onTapUserIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(data.sid),
      enabled: slideEnabled,
      endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            /// 置顶逻辑暂时隐藏，服务端接trtc服务端推流后认为太复杂
            // _buildOption(K.room_music_op_top, Colors.grey, () {
            //   onTapPlayListTop?.call(data);
            // }),
            _buildOption(K.room_music_op_rm, Colors.red, () {
              onTapPlayListDelete?.call(data);
            }),
          ]),
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            const SizedBox(width: 16),
            CommonAvatar(
              path: data.fromUser.icon,
              size: 32,
              shape: BoxShape.circle,
              onTap: onTapUserIcon,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: InkWell(
                onTap: () {
                  if (isPlaying == false) {
                    toPlayPressed?.call();
                  }
                },
                child: Text(
                  data.name,
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            _buildPlayStatusIcon()
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String text, Color bgColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 71,
        color: bgColor,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildPlayStatusIcon() {
    if (isPlaying == true) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: MusicPlayingGifIcon(size: 28),
      );
    } else {
      return InkWell(
        onTap: toPlayPressed,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: MusicToPlayIcon(size: 28),
        ),
      );
    }
  }
}
