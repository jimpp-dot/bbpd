import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:video/src/page/video_player_list_screen.dart';

import 'page/local_video_player.dart';

class VideoManager extends IVideoManager {
  @override
  Future playVideo(BuildContext context,
      {required List<VideoInfo> videoList, int index = 0}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        settings: const RouteSettings(name: '/VideoPlayScreen'),
        builder: (context) =>
            VideoPlayerListScreen(index: index, videos: videoList),
      ),
    );
  }

  @override
  Future playVideoFromFile(BuildContext context, File file) {
    return LocalVideoPlayerScreen.openLocalVideoPlayerScreen(context, file);
  }

  static openImageAndPop(BuildContext context, int uid) {
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    mainManager.openImageAndPop(context, uid, const PageRefer('VideoPlayer'));
  }
}
