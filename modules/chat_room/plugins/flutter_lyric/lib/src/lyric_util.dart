import 'lyric.dart';
import 'krc_lyrics.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'lrc.dart';

class LyricUtil {
  static String decryptXorStr(Uint8List inputBytes) {
//  List<int> key = [-50, -45, 110, 105, 64, 90, 97, 119, 94, 50, 116, 71, 81, 54, -91, -68]; //Can be any chars, and any size array
    List<int> key = [
      -100,
      -88,
      55,
      30,
      97,
      67,
      110,
      138,
      92,
      49,
      35,
      11,
      61,
      34,
      -26,
      -67
    ]; //Can be any chars, and any size array

    List<int> output = [];
    for (int i = 0; i < inputBytes.length; i++) {
      int keyByte = key[i % key.length];
      int outByte = inputBytes[i] ^ keyByte;
      output.add(outByte);
    }

    ByteData data = ByteData.view(Uint8List.fromList(output).buffer);
    List<int> outBytes = [];
    for (int i = 0; i < data.lengthInBytes; i++) {
      int char = data.getUint8(i);
      outBytes.add(char);
    }
    return utf8.decode(outBytes);
  }

  static List<Lyric> formatKrcLyric(String lyricStr) {
    var krcLyrics = KrcLyrics(lyricStr);
    List<Lyric> lyrics = [];
    for (int i = 0; i < krcLyrics.krcLines.length; i++) {
      KrcLine curLine = krcLyrics.krcLines[i];
      int start = curLine.start;
      int end = curLine.start + curLine.duration;
      if (i + 1 < krcLyrics.krcLines.length) {
        KrcLine nextLine = krcLyrics.krcLines[i + 1];
        int nextLineStart = nextLine.start;
        if (nextLineStart > end) {
          end = nextLineStart;
        }
      }
      Lyric lyric = Lyric(curLine.content,
          startTime: Duration(milliseconds: start),
          endTime: Duration(milliseconds: end));
      lyrics.add(lyric);
    }

    return lyrics;
  }

  static List<Lyric> formatKrcLyricWithGap(
      String lyricStr, int totalDuration, String platform) {
    KrcLyrics krcLyrics = KrcLyrics(lyricStr, platform: platform);
    const int maxGap = 5000;
    const String gapLine = '~ ~ ~';
    List<Lyric> lyrics = [];
    int lastEnd = 0;
    for (int i = 0; i < krcLyrics.krcLines.length; i++) {
      KrcLine curLine = krcLyrics.krcLines[i];
      int start = curLine.start;
      int end = curLine.start + curLine.duration;

      if (start - lastEnd > maxGap) {
        Lyric lyric = Lyric(gapLine,
            startTime: Duration(milliseconds: lastEnd),
            endTime: Duration(milliseconds: start));
        lyrics.add(lyric);
      }

      if (i + 1 < krcLyrics.krcLines.length) {
        KrcLine nextLine = krcLyrics.krcLines[i + 1];
        int nextLineStart = nextLine.start;
        if (nextLineStart - end < maxGap) {
          end = nextLineStart;
        }
      } else {
        //最后一行
        if (curLine.duration == 0) {
          //最后一行歌词的duration为0，通常是由LRC转换来的KRC歌词，作特殊处理
          end = totalDuration;
        }
      }
      lastEnd = end;

      Lyric lyric = Lyric(curLine.content,
          startTime: Duration(milliseconds: start),
          endTime: Duration(milliseconds: end));
      lyrics.add(lyric);
    }

    if (totalDuration - lastEnd > maxGap) {
      Lyric lyric = Lyric(gapLine,
          startTime: Duration(milliseconds: lastEnd),
          endTime: Duration(milliseconds: totalDuration));
      lyrics.add(lyric);
    }

    return lyrics;
  }

  /// 格式化歌词
  static List<Lyric> formatLyric(String lyricStr) {
    RegExp reg =
        RegExp(r"(?<=\[)\d{2}:\d{2}.\d{2,3}.*?(?=\[)|[^\[]+$", dotAll: true);

    var matches = reg.allMatches(lyricStr);
    var lyrics = matches.map((m) {
      var matchStr = m.group(0)?.replaceAll("\n", "") ?? '';
      var symbolIndex = matchStr.indexOf("]");
      var time = matchStr.substring(0, symbolIndex);
      var lyric = matchStr.substring(symbolIndex + 1);
      var duration = lyricTimeToDuration(time);
      return Lyric(lyric, startTime: duration);
    }).toList();
    //移除所有空歌词
    lyrics.removeWhere((lyric) => lyric.lyric.trim().isEmpty);
    for (int i = 0; i < lyrics.length - 1; i++) {
      lyrics[i].endTime = lyrics[i + 1].startTime;
    }
    lyrics.last.endTime = const Duration(hours: 200);
    return lyrics;
  }

  static Duration lyricTimeToDuration(String time) {
    int hourSeparatorIndex = time.indexOf(":");
    int minuteSeparatorIndex = time.indexOf(".");

    var milliseconds = time.substring(minuteSeparatorIndex + 1);
    var microseconds = 0;
    if (milliseconds.length > 3) {
      microseconds = int.parse(milliseconds.substring(3, milliseconds.length));
      milliseconds = milliseconds.substring(0, 3);
    }
    return Duration(
      minutes: int.parse(
        time.substring(0, hourSeparatorIndex),
      ),
      seconds: int.parse(
          time.substring(hourSeparatorIndex + 1, minuteSeparatorIndex)),
      milliseconds: int.parse(milliseconds),
      microseconds: microseconds,
    );
  }

  static List<Lyric> formatEnhancedLrc(String parsed) {
    var lrc = Lrc.parse(parsed);
    var lyrics = <Lyric>[];
    for (var l in lrc.lyrics) {
      var lyric = Lyric(l.lyricsString);
      lyric.startTime = l.starTime;
      if (l.endTime != null) {
        lyric.endTime = l.endTime!;
      }
      lyrics.add(lyric);
    }
    for (int i = 0; i < lyrics.length - 1; i++) {
      if (lyrics[i].endTime == Duration.zero) {
        lyrics[i].endTime = lyrics[i + 1].startTime;
      }
    }
    if (lyrics.last.endTime == Duration.zero) {
      lyrics.last.endTime = const Duration(hours: 200);
    }

    return lyrics;
  }

  static int parseInt(dynamic value, [int defaultValue = 0]) {
    if (value == null) return defaultValue;
    if (value is String) {
      try {
        return int.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    if (value is int) return value;
    if (value is double) return value.toInt();
    return defaultValue;
  }

  static String parseStr(dynamic value) {
    if (value == null) return '';
    return '$value';
  }
}
