import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'song_record_constant.dart';

/// 每毫秒UI长度
double perMillisecondDp = 100.dp / 1000;

class TimeRegion {
  Duration startTime;
  Duration endTime;

  TimeRegion(this.startTime, this.endTime);

  int get durationMilliseconds =>
      endTime.inMilliseconds - startTime.inMilliseconds;

  @override
  String toString() {
    return 'TimeRegion{startTime: $startTime, endTime: $endTime}';
  }
}

/// 音频命中的区间，为 [0.0，1.0] 之间的
/// eg: 0.1-0.2 , 0.4-0.6
class HitRegion {
  double start;
  double end;

  HitRegion(this.start, this.end);

  @override
  String toString() {
    return 'HitRegion{start: $start, end: $end}';
  }
}

const maxSpectrumValue = 100;

class SpectrumModel {
  List<SoundSpectrumNode> nodeList;
  double minVal;
  double maxVal;

  SpectrumModel(
      {required this.nodeList, required this.minVal, required this.maxVal});

  double get valRange => (maxVal - minVal).abs();

  @override
  String toString() {
    return 'SpectrumModel{minVal: $minVal, maxVal: $maxVal, nodeList.size: ${nodeList.length}}';
  }
}

/// 音频打分UI上的音节点
class SoundSpectrumNode extends ChangeNotifier {
  double value;
  TimeRegion time;

  /// 音频数据的节点坐标
  int index;
  List<HitRegion> hitList = [];

  double _percent = 0;

  bool isblank = false;

  SoundSpectrumNode(this.time, this.index, {this.value = 0});

  double get length {
    return time.durationMilliseconds * perMillisecondDp;
  }

  double get valuePercent {
    return _percent;
  }

  notifyUI() {
    if (hasListeners) notifyListeners();
  }

  setPercent(double min, double max) {
    var len = max - min;
    if (len == 0) {
      _percent = 0.5;
    } else {
      _percent = (value - min) / (max - min);
    }
  }

  @override
  String toString() {
    return 'SoundSpectrumNode{index: $index, value: $value, percent:$valuePercent,time: $time, isblank: $isblank, hitList: $hitList}';
  }

  void updateHitList(TimeRegion timeRegion) {
    double start = -1;
    double end = -1;
    var t1 = timeRegion.startTime;
    var t2 = timeRegion.endTime;
    var t3 = time.startTime;
    var t4 = time.endTime;
    int duration = (t4 - t3).inMilliseconds;
    if (t1 < t3 && t2 < t4) {
      start = 0;
      end = (t2 - t3).inMilliseconds / duration;
    } else if (t3 < t1 && t2 < t4) {
      start = (t1 - t3).inMilliseconds / duration;
      end = (t2 - t3).inMilliseconds / duration;
    } else if (t1 < t3 && t4 < t2) {
      start = 0;
      end = 1;
    } else if (t3 < t1 && t4 < t2) {
      start = (t1 - t3).inMilliseconds / duration;
      end = 1;
    }
    if (start >= 0 && end >= 0) {
      var last =
          Util.getListElementSafely<HitRegion?>(hitList, hitList.length - 1);
      if (last == null) {
        hitList.add(HitRegion(start, end));
        notifyUI();
      } else {
        if ((last.end >= start && last.end < end) ||
            (last.end < start && (start - last.end) < 0.1)) {
          last.end = end;
          notifyUI();
        } else if (last.end < start) {
          hitList.add(HitRegion(start, end));
          notifyUI();
        }
      }
    }
    if (recordDebug) {
      // Log.d(recordTag, ' updateHitList hitList=$hitList');
    }
  }

  void clearHitList() {
    if (hitList.isNotEmpty) {
      hitList.clear();
    }
  }
}

enum ScoreEffect {
  perfect,
  good,
  none,
}

List<Color> getScoreColors(ScoreEffect scoreLevel) {
  List<Color> colors;
  if (scoreLevel == ScoreEffect.perfect) {
    colors = [const Color(0xFFFFD613), const Color(0xFFFF7F00)];
  } else if (scoreLevel == ScoreEffect.good) {
    colors = [const Color(0xFFBBFF42), const Color(0xFF169600)];
  } else {
    colors = [Colors.white, Colors.white];
  }
  return colors;
}

ScoreEffect getScoreLevel(int score) {
  if (score >= 80) {
    return ScoreEffect.perfect;
  } else if (score >= 50) {
    return ScoreEffect.good;
  }
  return ScoreEffect.none;
}

String getScoreEffectName(ScoreEffect effect) {
  switch (effect) {
    case ScoreEffect.perfect:
      return 'Perfect';
    case ScoreEffect.good:
      return 'Good';
    case ScoreEffect.none:
      return '';
  }
}

class SoundScore {
  String songName;
  int perfectNum = 0;
  int goodNum = 0;
  int totalScore = 0;
  int avgScore = 0;

  SoundScore({
    required this.songName,
    required this.perfectNum,
    required this.goodNum,
    required this.totalScore,
    required this.avgScore,
  });

  @override
  String toString() {
    return 'SoundScore{perfectNum: $perfectNum, goodNum: $goodNum, totalScore: $totalScore,avgScore=$avgScore}';
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'songName': songName,
      'perfectNum': perfectNum,
      'goodNum': goodNum,
      'totalScore': totalScore,
      'avgScore': avgScore,
    };
    return map;
  }
}

class SoundScoreViewModel extends ChangeNotifier {
  /// 当前每句的得分,[0,100]
  int? _perScore;

  int perfectNum = 0;
  int goodNum = 0;

  /// 当前总得分
  int currentTotalScore = 0;

  bool _showScore = false;

  Timer? _disMissTimer;

  bool get showScore => _showScore;

  notifyUI() {
    if (hasListeners) notifyListeners();
  }

  int? get perScore => _perScore;

  set perScore(int? score) {
    _perScore = score;
    if (score != null) {
      if (score > 80) {
        perfectNum++;
      } else if (score > 50) {
        goodNum++;
      }
    }
  }

  void reset() {
    _perScore = 0;
    currentTotalScore = 0;
    perfectNum = 0;
    goodNum = 0;
  }

  void initLyric() {
    _perScore = 0;
    currentTotalScore = 0;
  }

  void startDismissTimer() {
    stopDismissTimer();
    _showScore = true;
    _disMissTimer = Timer(const Duration(milliseconds: 1000), () {
      _showScore = false;
      notifyUI();
    });
  }

  void stopDismissTimer() {
    _disMissTimer?.cancel();
    _disMissTimer = null;
  }
}
