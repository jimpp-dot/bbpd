import 'package:shared/shared.dart';

import '../../k.dart';

class Welfare {
  int mark;
  int stagePoint = 0;
  String stage;
  String icon;
  String image;
  String title;
  String desc;
  int completed;
  int lotteryCodeCount;

  /// 完成百分比（辅助属性）
  double _progressPercent = 0;

  /// 上一阶段完成百分比（辅助属性）
  double _previousProgressPercent = 0;

  /// 完成百分比
  double get progressPercent => _progressPercent;

  /// 上一阶段完成百分比
  double get previousProgressPercent => _previousProgressPercent;

  bool get isCompleted => completed == 1;

  bool _first = false;

  bool get first => _first;

  bool _last = false;

  bool get last => _last;

  Welfare.fromJson(Map<String, dynamic>? json)
      : mark = Util.parseInt(json?['mark'], 0),
        stagePoint = Util.parseInt(json?['stage_point'], 0),
        stage = Util.parseStr(json?['stage_name']) ?? '',
        icon = Util.parseStr(json?['stage_image']) ?? '',
        image = Util.parseStr(json?['award_image']) ?? '',
        title = Util.parseStr(json?['award_title']) ?? '',
        desc = Util.parseStr(json?['award_desc']) ?? '',
        lotteryCodeCount = Util.parseInt(json?['lottery_code_count'], 99999),
        completed = Util.parseInt(json?['completed'], 0);

  String get point {
    if (stagePoint < 0) stagePoint = 0;
    if (stagePoint < 10000) {
      return stagePoint.toString();
    }
    return _formatPoint(stagePoint);
  }

  String get imageUrl => Util.parseIcon(image);

  String get iconUrl => Util.parseIcon(icon);

  static String _formatPoint(int point) {
    if (point % 10000 > 1000) {
      return '${(point / 10000.0).toStringAsFixed(1)}W';
    }
    return '${point / 10000.0}W';
  }
}

class Task {
  int mark;
  String name;
  int todayPoint = 0;
  String pointDesc;
  String dailyLimitDesc;

  String get desc {
    bool pointDescNotEmpty = pointDesc.isNotEmpty;
    bool dailyLimitDescNotEmpty = pointDesc.isNotEmpty;
    if (pointDescNotEmpty && dailyLimitDescNotEmpty) {
      return '$pointDesc $dailyLimitDesc';
    }
    if (pointDescNotEmpty) return pointDesc;
    if (dailyLimitDescNotEmpty) return dailyLimitDesc;
    return '';
  }

  String get point {
    if (todayPoint < 0) todayPoint = 0;
    if (todayPoint < 10000) {
      return K.vip_popular_upgrade_desc(['$todayPoint']);
    }
    String p = Welfare._formatPoint(todayPoint);
    return K.vip_popular_upgrade_desc([p]);
  }

  Task.fromJson(Map<String, dynamic>? json)
      : mark = Util.parseInt(json?['mark'], 0),
        name = Util.parseStr(json?['name']) ?? '',
        todayPoint = Util.parseInt(json?['today_point'], 0),
        pointDesc = Util.parseStr(json?['point_desc']) ?? '',
        dailyLimitDesc = Util.parseStr(json?['daily_limit_desc']) ?? '';
}

/// 粉丝团积分信息
class FanGroupIntegral {
  /// user_point, 用户积分
  int userCurrentPoint = 0;

  /// 当前团积分
  int groupPoint = 0;

  /// previous_stage_point, 上个阶段目标积分
  int previousStagePoint = 0;

  /// now_stage_point, 当前阶段目标积分
  int currentStagePoint = 0;

  /// now_stage_name, 当前阶段名称
  String currentStage;

  /// next_stage_name, 下个阶段名称，为空标识没有
  String nextStage;

  /// lack_point, 到下个阶段还需要多少积分
  int lackPoint = 0;

  /// end_date, 结束日期
  String endDate;

  /// previous_stage_image, 左边图片
  String previousStageImage;

  /// now_stage_image, 右边图片
  String currentStageImage;

  /// award_statement, 底部奖励声明
  String statement;

  /// group_name, 粉丝团名称
  String groupName;

  /// previous_stage_name, 上一个前阶段名称，为空表示没有
  String previousStageName;

  /// 福利说明
  String descUrl;

  /// 主播标识，取值为1，表示是主播
  int anchor = 0;

  /// 本阶段到下一阶段的，完成进度
  /// a--------b-------c
  /// a = previousStagePoint; b = userCurrentPoint; c = currentStagePoint
  double get nextStageProgress {
    if (groupPoint <= 0) return 0;
    if (currentStagePoint <= 0) return 0;
    if (isFullLevel) return 1;
    int a = previousStagePoint;
    int c = currentStagePoint;
    if (a >= c) return 1;
    int b = groupPoint;
    double progress = 1.0 * (b - a) / (c - a);
    if (progress < 0) return 0;
    if (progress > 1) return 1;
    return progress;
  }

  String get point {
    if (userCurrentPoint < 0) userCurrentPoint = 0;
    if (userCurrentPoint < 10000) {
      return userCurrentPoint.toString();
    }
    String p = '${(userCurrentPoint / 10000.0).toStringAsFixed(1)}W';
    return p;
  }

  String get previousStageImageUrl => Util.parseIcon(previousStageImage);

  String get currentStageImageUrl => Util.parseIcon(currentStageImage);

  /// 是否为主播
  bool get isAnchor => anchor == 1;

  /// 用户积分处于第1阶段，比如0-10W
  bool get isFirstStage => previousStagePoint <= 0;

  /// 是否已达到顶级
  bool get isFullLevel =>
      currentStagePoint > 0 && groupPoint >= currentStagePoint;

  FanGroupIntegral.fromJson(Map<String, dynamic>? json)
      : userCurrentPoint = Util.parseInt(json?['user_point'], 0),
        groupPoint = Util.parseInt(json?['group_point'], 0),
        currentStagePoint = Util.parseInt(json?['now_stage_point'], 0),
        previousStagePoint = Util.parseInt(json?['previous_stage_point'], 0),
        currentStage = Util.parseStr(json?['now_stage_name']) ?? '',
        nextStage = Util.parseStr(json?['next_stage_name']) ?? '',
        lackPoint = Util.parseInt(json?['lack_point'], 0),
        endDate = Util.parseStr(json?['end_date']) ?? '',
        previousStageImage = Util.parseStr(json?['previous_stage_image']) ?? '',
        currentStageImage = Util.parseStr(json?['now_stage_image']) ?? '',
        statement = Util.parseStr(json?['award_statement']) ?? '',
        groupName = Util.parseStr(json?['group_name']) ?? '',
        previousStageName = Util.parseStr(json?['previous_stage_name']) ?? '',
        descUrl = Util.parseStr(json?['desc_url']) ?? '',
        anchor = Util.parseInt(json?['is_anchor'], 0);
}

class WelfareInfo {
  FanGroupIntegral? info;
  List<Welfare>? welfares;
  List<Task>? tasks;

  /// 计算已完成的进度条的高度
  void _computeCompletedProgress() {
    if (welfares?.isEmpty ?? true) return;

    /// 团当前拥有的分数
    int groupPoint = info?.groupPoint ?? 0;
    double previousProgress = 0;
    for (var i = 0, size = welfares!.length; i < size; i++) {
      Welfare current = welfares![i];
      if (i == 0) {
        /// 第一个
        current._first = true;
        current._last = false;
      } else if (i == size - 1) {
        /// 最后一个
        current._first = false;
        current._last = true;
      } else {
        /// 中间的
        current._first = false;
        current._last = false;
      }
      if (groupPoint <= 0) {
        current._progressPercent = 0;
        current._previousProgressPercent = 0;
        continue;
      }
      if (current._last) {
        current._previousProgressPercent = previousProgress;
        return;
      }
      Welfare next = welfares![i + 1];
      if (groupPoint >= next.stagePoint) {
        current._progressPercent = 1.0;
      } else if (groupPoint < current.stagePoint) {
        current._progressPercent = 0.0;
      } else {
        current._progressPercent = 1.0 *
            (groupPoint - current.stagePoint) /
            (next.stagePoint - current.stagePoint);
      }
      current._previousProgressPercent = previousProgress;
      previousProgress = current._progressPercent;
    }
  }

  WelfareInfo.fromJson(Map<String, dynamic>? json) {
    if (json?.isNotEmpty ?? false) {
      info = FanGroupIntegral.fromJson(json!['info']);
      welfares = Util.parseList(json['welfare_list'],
          (e) => Welfare.fromJson(e is Map<String, dynamic> ? e : null));
      tasks = Util.parseList(json['task_list'],
          (e) => Task.fromJson(e is Map<String, dynamic> ? e : null));
      _computeCompletedProgress();
    }
  }
}
