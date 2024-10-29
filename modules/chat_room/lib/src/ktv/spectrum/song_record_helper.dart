import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/src/ktv/spectrum/song_spectrum_model.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import 'package:path/path.dart';

/// 录歌业务帮助类
class SongRecordHelper {
  /// 合成文件后缀
  static const String composeSuffix = "-compose.mp4";

  /// 获取试听起始的毫秒值
  static int getSkipPreludeTime(int firstLyricStartMs) {
    int start = firstLyricStartMs - 5000;
    if (start <= 0) {
      start = 0;
    }
    return start;
  }

  static Future<List<Lyric>?> loadLyric(String lrcPath) async {
    try {
      final file = File(lrcPath);
      final songLyc = await file.readAsString();
      return LyricUtil.formatEnhancedLrc(songLyc);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return null;
  }

  static Future<SpectrumModel?> loadBidi2Spectrum(String bidiPath) async {
    try {
      final file = File(bidiPath);
      List<String> lines = await file.readAsLines();
      List<SoundSpectrumNode> nodeList = [];
      int i = 0;
      double minPitch = 0;
      double maxPitch = 0;
      for (var line in lines) {
        List<String> parts = line.split(" ");
        var startTime = Duration(milliseconds: double.parse(parts[0]).round());
        var endTime = Duration(milliseconds: double.parse(parts[1]).round());
        double pitch = double.parse(parts[2]);

        if (minPitch == 0 || pitch < minPitch) {
          minPitch = pitch;
        }

        if (maxPitch == 0 || pitch > maxPitch) {
          maxPitch = pitch;
        }

        nodeList.add(
            SoundSpectrumNode(TimeRegion(startTime, endTime), i, value: pitch));
        i++;
      }

      for (var node in nodeList) {
        node.setPercent(minPitch, maxPitch);
      }
      // if (System.debug) {
      //   for (var element in nodeList) {
      //     Log.d(recordTag, 'loadBidi2Spectrum element=$element  ');
      //   }
      // }
      return SpectrumModel(
          minVal: minPitch, maxVal: maxPitch, nodeList: nodeList);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return null;
  }

  /// [firstLyricStartMs] 用来做midi文件矫正优化，去掉第一句歌词前面的矩形
  static SpectrumModel fillBlankSpectrum(
      SpectrumModel model, int totalMillisecondTime,
      {int firstLyricStartMs = 0}) {
    List<SoundSpectrumNode> newList = [];
    Duration start = Duration.zero;

    for (var node in model.nodeList) {
      var startTime = node.time.startTime;
      var endTime = node.time.endTime;

      // 去掉第一句歌词前面的midi片段
      if (firstLyricStartMs > 0) {
        if (endTime.inMilliseconds <= firstLyricStartMs) {
          continue;
        }
        if (startTime.inMilliseconds <= firstLyricStartMs &&
            firstLyricStartMs <= endTime.inMilliseconds) {
          startTime = Duration(milliseconds: firstLyricStartMs);
        }
      }

      // 增加无歌词的间隙
      var interval = startTime - start;
      if (interval.inMilliseconds > 0) {
        var intervalStart = Duration(milliseconds: start.inMilliseconds);
        newList.add(SoundSpectrumNode(
            TimeRegion(intervalStart, intervalStart + interval), -1)
          ..isblank = true);
      }
      newList.add(node);
      start = endTime;
    }

    // 增加末尾无歌词的间隙
    if (totalMillisecondTime > 0 &&
        start.inMilliseconds < totalMillisecondTime) {
      var intervalStart = Duration(milliseconds: start.inMilliseconds);
      newList.add(
        SoundSpectrumNode(
          TimeRegion(
            intervalStart,
            intervalStart +
                Duration(
                    milliseconds: totalMillisecondTime - start.inMilliseconds),
          ),
          -1,
        )..isblank = true,
      );
    }
    // if (System.debug) {
    //   for (var element in newList) {
    //     Log.d(recordTag, 'fillblankSpectrum element=$element  ');
    //   }
    // }
    return SpectrumModel(
        minVal: model.minVal, maxVal: model.maxVal, nodeList: newList);
  }

  /// 两个时间段是否重叠
  static bool isTimeOverlap(TimeRegion t1, TimeRegion t2) {
    return t1.startTime <= t2.endTime && t2.startTime <= t1.endTime;
  }

  /// 获取音频录制保持的文件路径
  static String getRecordAudioProductPath(int id) {
    var dir = join(Constant.temporaryDirectory.path, 'song_record');
    Directory(dir).createSync(recursive: true);
    String time =
        DateUtils.format(DateUtils.nowSinceEpoch, 'yyyy-MM-dd-HH-mm-ss');
    return join(dir, 'record_${id}_$time.mp3');
  }

  /// 获取视频录制保持的文件路径
  static String getRecordVideoProductPath(int id) {
    var dir = join(Constant.temporaryDirectory.path, 'song_record');
    Directory(dir).createSync(recursive: true);
    String time =
        DateUtils.format(DateUtils.nowSinceEpoch, 'yyyy-MM-dd-HH-mm-ss');
    return join(dir, 'record_${id}_$time$composeSuffix');
  }

  /// 获取人声部分
  static String getRecordVoicePCMPath(int id) {
    var dir = join(Constant.temporaryDirectory.path, 'song_record');
    Directory(dir).createSync(recursive: true);
    String time =
        DateUtils.format(DateUtils.nowSinceEpoch, 'yyyy-MM-dd-HH-mm-ss');
    return join(dir, 'record_${id}_$time.pcm');
  }

  /// 获取Avatar录制保持的文件路径
  static String getRecordAvatarPath() {
    var dir = join(Constant.temporaryDirectory.path, 'song_record');
    Directory(dir).createSync(recursive: true);
    String time =
        DateUtils.format(DateUtils.nowSinceEpoch, 'yyyy-MM-dd-HH-mm-ss');
    return join(dir, 'record_avatar_$time.webp');
  }

  static Future<void> deleteFile(String? path) async {
    if (path != null) {
      var file = File(path);
      if (file.existsSync()) {
        await file.delete();
      }
      path = null;
    }
  }

  /// 返回给定时间段的歌词数组
  static List<Lyric> singTimeLyric(
      List<Lyric> lyricList, int startMs, int endMs) {
    List<Lyric> singList = [];
    for (int i = 0; i < lyricList.length; i++) {
      var item = lyricList[i];
      if (i == lyricList.length - 1) {
        if (endMs > item.startTime.inMilliseconds) {
          singList.add(item);
        }
      } else if (startMs <= item.startTime.inMilliseconds &&
          endMs >= item.endTime.inMilliseconds) {
        singList.add(item);
      }
    }
    return singList;
  }

  /// 返回新的偏移了所有歌词的时间列表
  /// [editStartMs] 编辑开始时长，相对时间，从0开始
  /// [offset] 相对于原唱的录歌开始时间
  static List<Lyric> offSetLyricTime(
      List<Lyric> lyricList, int editStartMs, int offsetMs) {
    var offSetMs = Duration(milliseconds: editStartMs + offsetMs);
    newOffSetLyric(Lyric oldLyric) {
      return Lyric(
        oldLyric.lyric,
        startTime: oldLyric.startTime - offSetMs,
        endTime: oldLyric.endTime - offSetMs,
        isRemark: oldLyric.isRemark,
      );
    }

    return lyricList.map((e) => newOffSetLyric(e)).toList();
  }

  /// 返回给定时间点的歌词
  static Lyric? getCurrentLyric(List<Lyric> lyricList, int currentMs) {
    for (var item in lyricList) {
      if (currentMs >= item.startTime.inMilliseconds &&
          currentMs <= item.endTime.inMilliseconds) {
        return item;
      }
    }
    return null;
  }

  /// 获取给定时间点范围唱过的歌词行数
  static int getLyricSingCount(List<Lyric> lyricList, int startMs, int endMs) {
    assert(startMs <= endMs);
    int singCount = 0;
    for (var item in lyricList) {
      if (endMs < item.startTime.inMilliseconds) {
        break;
      }
      if (startMs <= item.startTime.inMilliseconds &&
          endMs >= item.endTime.inMilliseconds) {
        singCount++;
      }
    }
    return singCount;
  }

  static void printLyric(List<Lyric>? lyricList) {}
}
