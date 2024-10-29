import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

const String recordTag = 'SongRecord';

/// 打开录制的debug log
const bool recordDebug = true;

var lyricStyle = TextStyle(
  color: const Color(0x80FFFFFF),
  fontWeight: FontWeight.w600,
  fontSize: 16.dp,
);

var currLyricStyle = TextStyle(
  color: R.color.mainBrandColor,
  fontWeight: FontWeight.w600,
  fontSize: 21.dp,
);

var draggingLyricStyle = currLyricStyle.copyWith(color: Colors.white);

var lyricGap = 13.dp;
