import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import 'package:path/path.dart';
import 'package:archive/archive.dart';
import 'package:xml/xml.dart';

/// 点歌者下载模块
class AgoraMusicUtil {
  static const String lyricPath = 'agora_lyric';

  static Map<int, Completer<bool>> downloadingList =
      HashMap<int, Completer<bool>>();

  static String getLyricPath() {
    return join(Constant.documentsDirectory.path, lyricPath);
  }

  static Directory getLyricDirectory() {
    String baseDir = getLyricPath();
    return Directory(baseDir);
  }

  static File getLyricLrc(int songId) {
    String path = getLyricLrcPath(songId);
    return File(path);
  }

  static File getMidiFile(int songId) {
    String path = getMidiSrcPath(songId);
    return File(path);
  }

  static String getLyricLrcPath(int songId) {
    if (Util.parseInt(songId) == 0) {
      return "";
    }

    String baseDir = getLyricPath();
    String fileName = 'agora_$songId.lrc';

    return join(baseDir, fileName);
  }

  static String getMidiSrcPath(int songId) {
    if (Util.parseInt(songId) == 0) {
      return "";
    }

    String baseDir = getLyricPath();
    String fileName = 'agora_$songId.midi';

    String filePath = join(baseDir, fileName);

    return filePath;
  }

  static Future<bool> isMidiDownload(int songId) async {
    File file = getMidiFile(songId);

    return await file.exists();
  }

  static File getLyricZip(int songId) {
    String path = getLyricZipPath(songId);
    return File(path);
  }

  static String getLyricZipPath(int songId) {
    if (Util.parseInt(songId) == 0) {
      return "";
    }

    String baseDir = getLyricPath();
    String fileName = 'agora_$songId.zip';
    return join(baseDir, fileName);
  }

  static File getLyricXML(int songId) {
    String path = getLyricXMLPath(songId);
    return File(path);
  }

  static String getLyricXMLPath(int songId) {
    if (Util.parseInt(songId) == 0) {
      return "";
    }

    String baseDir = getLyricPath();
    String fileName = 'agora_$songId.xml';

    return join(baseDir, fileName);
  }

  static Future<bool> isLyricDownload(int songId) async {
    File file = getLyricLrc(songId);

    return await file.exists();
  }

  static Future<bool> isFullLyricDownload(int songId) async {
    bool hasLyric = await isLyricDownload(songId);
    bool hasMidi = await isMidiDownload(songId);
    return hasLyric && hasMidi;
  }

  /// 点歌者下载的是 agora歌词 是xml格式的zip
  /// 听众下载的是 .lrc格式的歌词 [aa,bb]xxxx aa: 起始时间 毫秒 bb: 结束时间 毫秒 xxxx：歌词内容
  static Future<bool> downloadLyric(int songId, String url,
      {bool force = false}) async {
    if (Util.isStringEmpty(url)) return false;

    if (downloadingList.containsKey(songId)) {
      return downloadingList[songId]!.future;
    }

    Completer<bool> completer = Completer<bool>();
    downloadingList.putIfAbsent(songId, () => completer);

    Directory baseDirectory = getLyricDirectory();
    await baseDirectory.create(recursive: true);

    bool downloadSuccess = false;
    File file = getLyricLrc(songId);
    bool isLrc = url.contains('.lrc');

    if (await file.exists()) {
      // 最好做下MD5校验 但是做不了
      downloadSuccess = true;
    }

    if (force || !downloadSuccess) {
      try {
        await DownloadManager.download(
            url, isLrc ? getLyricLrcPath(songId) : getLyricZipPath(songId));
      } catch (e) {
        Log.d(e);
      }

      if (isLrc) {
        // 下载lrc
        if (await getLyricLrc(songId).exists()) {
          downloadSuccess = true;
        }
      } else {
        // 下载zip
        File zipFile = getLyricZip(songId);

        if (await zipFile.exists()) {
          // 解压
          final bytes = zipFile.readAsBytesSync();
          final archive = ZipDecoder().decodeBytes(bytes);

          File xmlFile = getLyricXML(songId);
          if (archive[0].isFile) {
            xmlFile.writeAsBytesSync(archive[0].content);

            if (await xmlFile.exists()) {
              bool res = await _converXMLToLrc(
                  xmlFile, getLyricLrc(songId), getMidiFile(songId));

              if (res) {
                downloadSuccess = true;
              }
            }
          }
        }
      }
    }

    downloadingList.remove(songId);
    completer.complete(downloadSuccess);

    return completer.future;
  }

  /// timeStr:20.002 20.8...
  static int getTotalMs(String timeStr) {
    List<String> timeArr = timeStr.split('.');
    int seconds = Util.parseInt(timeArr[0]);
    String secMSStr = timeArr[1];

    while (secMSStr.length < 3) {
      secMSStr += '0';
    }

    int secMs = Util.parseInt(secMSStr);
    int totalSecMs = seconds * 1000 + secMs;

    return totalSecMs;
  }

  /// xml转非标准Lrc
  /// [aa,bb]xxxxx aa: 起始时间 毫秒 bb: 结束时间 毫秒 xxxx：歌词内容
  /// agora歌词每句最后一个字被换行符替代 暂时如下处理
  static Future<bool> _converXMLToLrc(
      File xmlFile, File lrcFile, File midiFile) async {
    String xmlString = xmlFile.readAsStringSync();
    final document = XmlDocument.parse(xmlString);

    String author = document.findAllElements('name').map((e) => e.text).first;
    String singer = document.findAllElements('singer').map((e) => e.text).first;

    Iterable<XmlElement> sentences = document.findAllElements('sentence');

    String lrcStr = '';
    String midiStr = '';

    for (int i = 0; i < sentences.length; i++) {
      XmlElement element = sentences.elementAt(i);
      Iterable<XmlElement> tones = element.findAllElements('tone');

      String beginTime = tones.first.getAttribute('begin')!;
      String endTime = '';

      if (i == 0) {
        // 歌手信息
        lrcStr += '[0,${getTotalMs(beginTime)}]$author-$singer\n';
      }

      /// 结束时间是下一句歌词开始时间
      if (i + 1 < sentences.length) {
        endTime = sentences
            .elementAt(i + 1)
            .findAllElements('tone')
            .first
            .getAttribute('begin')!;
      } else {
        endTime = tones.last.getAttribute('end')!;
      }

      lrcStr += '[${getTotalMs(beginTime)},${getTotalMs(endTime)}]';

      for (var tone in tones) {
        lrcStr += tone.findAllElements('word').map((e) => e.text).first;

        //提取 midi 信息
        int beginTime = getTotalMs(tone.getAttribute('begin')!);
        int endTime = getTotalMs(tone.getAttribute('end')!);
        int pitch = Util.parseInt(tone.getAttribute('pitch')!);
        midiStr += '$beginTime $endTime $pitch\n';
      }

      if (i + 1 < sentences.length) {
        lrcStr += '\n';
      }
    }

    if (!await lrcFile.exists()) {
      lrcFile.createSync(recursive: true);
    }

    lrcFile.writeAsStringSync(lrcStr);

    if (!await midiFile.exists()) {
      midiFile.createSync(recursive: true);
    }

    midiFile.writeAsStringSync(midiStr);

    return true;
  }

  static bool _converXMLToMidi(File xmlFile, File midiFile) {
    String xmlString = xmlFile.readAsStringSync();
    final document = XmlDocument.parse(xmlString);

    Iterable<XmlElement> sentences = document.findAllElements('sentence');
    String midiStr = '';

    for (int i = 0; i < sentences.length; i++) {
      XmlElement element = sentences.elementAt(i);
      Iterable<XmlElement> tones = element.findAllElements('tone');
      for (var tone in tones) {
        //提取 midi 信息
        int beginTime = getTotalMs(tone.getAttribute('begin')!);
        int endTime = getTotalMs(tone.getAttribute('end')!);
        int pitch = Util.parseInt(tone.getAttribute('pitch')!);
        midiStr += '$beginTime $endTime $pitch\n';
      }
    }

    if (!midiFile.existsSync()) {
      midiFile.createSync(recursive: true);
    }

    midiFile.writeAsStringSync(midiStr);

    return true;
  }

  static bool justParseMidi(int songId) {
    File zipFile = getLyricZip(songId);

    if (zipFile.existsSync()) {
      // 解压
      final bytes = zipFile.readAsBytesSync();
      final archive = ZipDecoder().decodeBytes(bytes);
      for (var i = 0; i < archive.length; i++) {
        Log.d(archive[0]);
      }

      File xmlFile = getLyricXML(songId);
      if (archive[0].isFile) {
        xmlFile.writeAsBytesSync(archive[0].content);

        if (xmlFile.existsSync()) {
          bool res = _converXMLToMidi(xmlFile, getMidiFile(songId));

          if (res) {
            return true;
          }
        }
      }
    }

    return false;
  }

  static Future<String> getLyricString(int songId) async {
    File file = getLyricLrc(songId);

    if (await file.exists()) {
      return file.readAsStringSync();
    }

    return '';
  }

  static Future<String> getMidiString(int songId) async {
    File file = getMidiFile(songId);

    if (await file.exists()) {
      return file.readAsStringSync();
    }

    return '';
  }

  static Future<List<Lyric>?> loadLyric(int songId, String url) async {
    bool lyricDownload = true;

    if (!await isLyricDownload(songId)) {
      lyricDownload = await downloadLyric(songId, url);
    }

    List<Lyric> lyrics = [];

    if (lyricDownload) {
      String lyricString = getLyricLrc(songId).readAsStringSync();
      List<String> lyricArr = lyricString.split('\n');

      for (int i = 0; i < lyricArr.length; i++) {
        String timeLyric = lyricArr[i];
        String lyric = timeLyric.split(']').last;
        String timeStr = timeLyric.substring(1, timeLyric.indexOf(']'));
        List<String> beginEndTime = timeStr.split(',');

        lyrics.add(Lyric(
          lyric,
          startTime: Duration(milliseconds: Util.parseInt(beginEndTime.first)),
          endTime: Duration(milliseconds: Util.parseInt(beginEndTime.last)),
        ));
      }

      return lyrics;
    }

    return null;
  }
}
