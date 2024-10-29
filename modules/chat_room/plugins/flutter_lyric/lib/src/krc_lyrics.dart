import 'lyric_util.dart';

class KrcLyrics {
  String? author;
  String? title;
  int? total;
  List<KrcLine> krcLines = [];

  KrcLyrics(String content, {String platform = ''}) {
    RegExp divider = RegExp((r'\r\n|\n'));
    List<String> lines = content.split(divider);
    lines.removeWhere((element) => element.trim().isEmpty);
    RegExp timeDivider = RegExp(r"\d{2}:\d{2}:\d{2}.\d{3}");

    for (int i = 0; i < lines.length; i++) {
      String trimmedLine = lines[i].trim();
      if (trimmedLine.startsWith('[ar:')) {
        author = trimmedLine.substring(4, trimmedLine.length - 1);
      } else if (trimmedLine.startsWith('[ti:')) {
        title = trimmedLine.substring(4, trimmedLine.length - 1);
      } else if (trimmedLine.startsWith('[total:')) {
        total = LyricUtil.parseInt(
            trimmedLine.substring(7, trimmedLine.length - 1));
      } else if (trimmedLine.startsWith(RegExp(r'\[[0-9]'))) {
        KrcLine krcLine = KrcLine(trimmedLine);
        krcLines.add(krcLine);
      } else if (platform == 'ame' && timeDivider.hasMatch(trimmedLine)) {
        List<String> temp = trimmedLine.split(' --> ');

        /// 分割字符串
        int start = dateToMilliseconds(temp[0]);
        int duration = dateToMilliseconds(temp[1]) - start;
        String ameLine = '[$start,$duration]';

        i++;
        ameLine += lines[i].trim();
        KrcLine krcLine = KrcLine(ameLine);
        krcLines.add(krcLine);
      }
    }
  }

  int dateToMilliseconds(String inputString) {
    int milliseconds = -1;
    RegExp pattern = RegExp(r"(\d{2}):(\d{2}):(\d{2}).(\d{3})");
    Match? matcher = pattern.firstMatch(inputString);
    if (matcher != null && matcher.groupCount >= 4) {
      milliseconds = LyricUtil.parseInt(matcher.group(1)) * 3600000 +
          LyricUtil.parseInt(matcher.group(2)) * 60000 +
          LyricUtil.parseInt(matcher.group(3)) * 1000 +
          LyricUtil.parseInt(matcher.group(4));
    }
    return milliseconds;
  }
}

class KrcLine with KrcTimeInterval {
  List<KrcWord> words = [];
  String content = '';

  KrcLine(String line) {
    int wordsStart = line.indexOf(']') + 1;
    String lineHead = line.substring(0, wordsStart);
    _parseLineHead(lineHead);
    String wordsSubStr = line.substring(wordsStart);
    _parseLineWords(wordsSubStr);
  }

  void _parseLineHead(String lineHead) {
    RegExp reg = RegExp(r'\d+');
    Iterable<Match> matches = reg.allMatches(lineHead);

    int index = 0;
    for (Match m in matches) {
      int time = LyricUtil.parseInt(m.group(0));
      if (index == 0) {
        start = time;
      } else if (index == 1) {
        duration = time;
      } else {
        break;
      }
      index++;
    }
  }

  void _parseLineWords(String wordsSubStr) {
    List<String> splits = wordsSubStr.split('<');
    for (var split in splits) {
      if (split.isNotEmpty) {
        KrcWord krcWord = KrcWord(split);
        words.add(krcWord);
        content += krcWord.word;
      }
    }
  }
}

class KrcWord with KrcTimeInterval {
  String word = '';

  KrcWord(String wordsSubStr) {
    RegExp reg = RegExp(r'\d+');
    Iterable<Match> matches = reg.allMatches(wordsSubStr);

    int index = 0;
    for (Match m in matches) {
      int time = LyricUtil.parseInt(m.group(0));
      if (index == 0) {
        start = time;
      } else if (index == 1) {
        duration = time;
      } else {
        break;
      }
      index++;
    }

    List<String> splits = wordsSubStr.split('>');
    if (splits.length > 1) {
      word = splits[1];
    }
  }
}

mixin KrcTimeInterval {
  int start = 0;
  int duration = 0;
}
