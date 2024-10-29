import '../shared.dart';

const bool debug = false;
const String tag = 'SmallAlarmDialog';

/// 小闹钟数据仓库
class SmallAlarmRepository {
  SmallAlarmRepository._();

  static String get _isNewKey => 'Small_Alarm_Is_New_${Session.uid}';

  static String get _dismissTimeKey =>
      'Small_Alarm_Dismiss_Time_${Session.uid}';

  /// 当前用户当天，弹出闹钟的次数
  static String get _showTimesKey =>
      'Small_Alarm_Dialog_Show_Times_${Session.uid}';

  /// 获取上次弹窗次数信息
  static Pair<String, int> _getShowTimesCache() {
    String str = Config.get(_showTimesKey, '');
    if (debug) Log.d('$tag, str: $str');
    if (str.isEmpty) return Pair('', 0);
    List<String> array = str.split('_');
    if (debug) Log.d('$tag, array: $array');
    if ((array.length) < 2) return Pair<String, int>('', 0);
    String date = Util.notNullStr(array[0]);
    String times = Util.notNullStr(array[1]);
    if (debug) Log.d('$tag, date: $date, times: $times');
    if ((date.isEmpty) || (times.isEmpty)) return Pair<String, int>('', 0);
    return Pair<String, int>(date, Util.parseInt(times, 0));
  }

  /// 是否在允许的次数中
  static bool _isInShowTimes(int limitTimes) {
    String curr = DateUtils.format(DateUtils.nowSinceEpoch, DateUtils.format1);
    if (debug) Log.d('$tag, curr: $curr');
    Pair<String, int> cache = _getShowTimesCache();
    if (curr != cache.first) return true;

    /// 非今天的记录
    return cache.second < limitTimes;
  }

  /// 缓存当前用户弹窗次数
  static void _cacheShowTimes() {
    Pair<String, int> cache = _getShowTimesCache();
    String curr = DateUtils.format(DateUtils.nowSinceEpoch, DateUtils.format1);
    int times = cache.first == curr ? (cache.second + 1) : 1;
    Config.set(_showTimesKey, '${curr}_$times');
  }

  static bool get isNew => 'true' == Config.get(_isNewKey, 'true');

  /// 弹窗时间是否受限
  static bool get isDismissTimeLimit {
    int lastDismiss = Util.parseInt(Config.get(_dismissTimeKey), 0);
    if (lastDismiss > 0) {
      DateTime lastDismissTime =
          DateTime.fromMillisecondsSinceEpoch(lastDismiss);
      DateTime now = DateTime.now();
      if (now.isBefore(lastDismissTime) ||
          now.difference(lastDismissTime).inMinutes <= 30) return true;
    }
    return false;
  }
}

class SmallAlarmResponse extends BaseResponse {
  late bool isNew;

  SmallAlarmInfo? data;

  SmallAlarmResponse.fromJson(Map<String, dynamic> json) {
    isNew = Util.parseBool(json['is_new'], true);
    success = Util.parseBool(json['success'], false);
    msg = Util.parseStr(json['msg']);
    data = json['data'] is Map ? SmallAlarmInfo.fromJson(json['data']) : null;
  }

  @override
  String toString() {
    return 'isNew: $isNew, data: $data';
  }
}

class SmallAlarmInfo {
  int id;
  int pid;
  String clockTitle;
  String clockIcon;

  /// 对话框左上方标题，如"小闹钟"
  String description;

  /// 用户uid
  int uid;

  /// 用户年龄
  int age;

  /// 用户性别
  int sex;

  /// 用户称呼
  String name;

  /// 用户头像icon
  String icon;

  /// 音频网路地址
  String audio;

  /// 展示音频椭圆正中间的文本
  String audioText;

  /// 对话框底部提交按钮的文本
  String buttonText;

  /// 弹窗最大限制次数
  int limitTimes;

  SmallAlarmInfo.fromJson(Map<String, dynamic> json)
      : id = Util.parseInt(json['id'], 0),
        pid = Util.parseInt(json['pid'], 0),
        clockTitle = Util.notNullStr(json['clock_title']),
        clockIcon = Util.getRemoteImgUrl(Util.notNullStr(json['clock_icon'])),
        description = Util.notNullStr(json['description']),
        uid = Util.parseInt(json['uid'], 0),
        age = Util.parseInt(json['age'], 0),
        sex = Util.parseInt(json['sex'], 0),
        name = Util.notNullStr(json['name']),
        icon = Util.getRemoteImgUrl(Util.notNullStr(json['icon'])),
        audioText = Util.notNullStr(json['audio_text']),
        audio = Util.notNullStr(json['audio']),
        buttonText = Util.notNullStr(json['button_text']),
        limitTimes = Util.parseInt(json['limit_times'], 5);

  String? _audioUrl;

  String? get audioUrl {
    if (_audioUrl?.isEmpty ?? true) _parse();
    return _audioUrl;
  }

  int? _audioTime;

  int? get audioTime {
    if ((_audioTime ?? 0) <= 0) _parse();
    return _audioTime;
  }

  /// 解析音频url，和音频时长
  /// 音频时长，如"10s"
  /// 其中"audio"格式是这样的：audio/202101/14/600004eca8af64.67828478.m4a:9
  void _parse() {
    if (audio.isEmpty) return;
    List<String> array = audio.split(':');
    if ((array.length) < 2) return;
    String url = Util.notNullStr(array[0]);
    _audioUrl = (url.isNotEmpty) ? '${System.imageDomain}$url' : '';
    String time = Util.notNullStr(array[1]);
    _audioTime = (time.isNotEmpty) ? Util.parseInt(time) : 0;
  }
}
