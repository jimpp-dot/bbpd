import 'package:chat/k.dart';
import 'package:chat/src/model/pbModel/generated/ka_touch.pb.dart';
import 'package:chat/src/quick_reply/model/quick_reply_model.dart';
import 'package:chat/src/repo/etc_repo.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'etc_controller_key.dart';

class ETCHiHistoryController extends GetxController {
  /// 全部历史数据
  List<KaTouchStatModule>? _historyList;

  int curHistoryIndex = 0;

  KaTouchStatModule get curHistoryData =>
      _historyList?[curHistoryIndex] ?? _emptyData;

  List<SheetItem> get historyPoolFilterItems =>
      _historyList
          ?.mapIndexed((i, e) => SheetItem(e.name, i.toString()))
          .toList() ??
      [];

  KaTouchStatDailyData? _dailyData;

  /// 选中的日期
  DateTime _selectedDate = DateTime.now();

  /// 选中的招呼id
  int _selectTagId = 0;
  String selectedMsg = K.chat_all;

  /// 选中的池子索引
  int _selectedPoolIndex = 0;

  /// 筛选数据池子筛选项
  List<SheetItem> get dailyPoolFilterItems => _map2List(_dailyData?.poolMap);

  String get selectedDailyPool => _selectedPoolIndex == 0
      ? K.chat_all
      : dailyPoolFilterItems[_selectedPoolIndex].label;

  List<QuickReply>? cacheTagList;

  List<SheetItem> _map2List(Map<int, String>? map) {
    List<SheetItem> list = [];
    if (map != null) {
      List<int> sortedKeys = map.keys.toList()..sort();
      for (var e in sortedKeys) {
        list.add(SheetItem(map[e] ?? '', e.toString()));
      }
    }
    return list;
  }

  String? getPoolNameById(int poolId) => _dailyData?.poolMap[poolId];

  /// 指定日期统计数据
  KaTouchStatModule get selectedDateData {
    List<KaTouchPoolUser> list = selectedDateUserList;
    int replyCount = 0;
    for (var item in list) {
      if (item.hasReplied > 0) {
        replyCount++;
      }
    }
    int length = list.length;
    String rate =
        length == 0 ? '0' : (replyCount * 100 / length).toStringAsFixed(0);
    return KaTouchStatModule(
        sendCount: length.toString(),
        replyCount: replyCount.toString(),
        replyPercent: '$rate%');
  }

  /// 指定日期用户列表
  List<KaTouchPoolUser> get selectedDateUserList {
    List<KaTouchPoolUser> list = _dailyData?.list ?? [];
    if (list.isNotEmpty && (_selectTagId > 0 || _selectedPoolIndex > 0)) {
      List<KaTouchPoolUser> newList = [];
      for (var item in list) {
        bool tagMatch = _selectTagId == 0 || item.contentId == _selectTagId;
        bool poolMatch =
            _selectedPoolIndex == 0 || item.poolId == _selectedPoolIndex;
        if (tagMatch && poolMatch) {
          newList.add(item);
        }
      }
      return newList;
    }
    return list;
  }

  String get selectedDateText => _formatDate(_selectedDate, withDot: true);

  ScreenStatus _historyDataStatus = ScreenStatus.Loading;

  ScreenStatus get historyDataStatus => _historyDataStatus;

  ScreenStatus _dateDataStatus = ScreenStatus.Loading;

  ScreenStatus get dateDataStatus => _dateDataStatus;

  final KaTouchStatModule _emptyData = KaTouchStatModule(
    idx: 0,
    name: K.chat_all,
    sendCount: '0',
    replyCount: '0',
    replyPercent: '0%',
  );

  @override
  void onInit() {
    super.onInit();
    loadAllHistoryData(showLoading: false);
  }

  /// 加载全部历史数据
  Future<void> loadAllHistoryData({bool showLoading = true}) async {
    if (showLoading) {
      _historyDataStatus = ScreenStatus.Loading;
      update([pageKey]);
    }
    ResKaTouchStatHistory resp = await ETCRepo.getETCAllHiHistoryData();
    if (resp.success) {
      if (resp.data.list.isEmpty) {
        _historyList = null;
      } else {
        _historyList = resp.data.list;
      }
      _historyDataStatus = ScreenStatus.Ready;

      loadDataByDate(showLoading: false);
    } else {
      _historyDataStatus = ScreenStatus.Error;
    }
    update([pageKey]);
  }

  /// 加载指定日期的数据
  Future<void> loadDataByDate(
      {bool showLoading = true, DateTime? dateTime}) async {
    if (showLoading) {
      _dateDataStatus = ScreenStatus.Loading;
      update([dateDataKey]);
    }
    dateTime ??= _selectedDate;
    ResKaTouchStatDaily resp =
        await ETCRepo.getETCHiListDataByDate(_formatDate(dateTime));
    if (resp.success) {
      _dailyData = resp.data;
      _selectedDate = dateTime;
      _dateDataStatus = ScreenStatus.Ready;
    } else {
      _dateDataStatus = ScreenStatus.Error;
    }
    update([dateDataKey]);
  }

  String _formatDate(DateTime dateTime, {bool withDot = false}) =>
      DateFormat(withDot ? 'yyyy.MM.dd' : 'yyyyMMdd').format(dateTime);

  void updateHistoryFilter(int index) {
    if (curHistoryIndex != index) {
      curHistoryIndex = index;
      update([historyDataKey]);
    }
  }

  void updateDailyTagFilter(int tagId, String title) {
    if (_selectTagId != tagId) {
      _selectTagId = tagId;
      selectedMsg = title;
      update([dateDataKey]);
    }
  }

  void updateDailyPoolFilter(int index) {
    if (_selectedPoolIndex != index) {
      _selectedPoolIndex = index;
      update([dateDataKey]);
    }
  }
}
