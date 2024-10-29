import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class IVideoManager extends IResourceLoader {
  Future<dynamic> playVideo(BuildContext context,
      {required List<VideoInfo> videoList, int index = 0});

  Future<dynamic> playVideoFromFile(BuildContext context, File file);
}
