import 'package:shared/shared.dart';
import 'package:chat_room/src/confess_v2/pb/generated/confess_v2.pb.dart';
import 'package:loading_more_list/loading_more_list.dart';

/// 表白活动历史记录数据
class ConfessV2RecordHistory extends LoadingMoreBase<ConfessHistoryItem> {
  int _page = 0;
  int _lastId = 0;
  bool _hasMore = true;

  final int onlyMe;

  ConfessV2RecordHistory({this.onlyMe = 0});

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _page = 0;
    _lastId = 0;
    _hasMore = true;

    clear();

    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    ResConfessHistory res = await _request();
    if (!res.success) return false;

    if (_page == 0) {
      clear();
    }

    if (res.data.items.isNotEmpty) {
      addAll(res.data.items);
    }

    return true;
  }

  Future<ResConfessHistory> _request() async {
    String url = '${System.domain}go/yy/confess_v2/history';
    Map<String, dynamic> params = {
      'offset': _page,
      'last_id': _lastId,
      'only_me': onlyMe,
    };
    try {
      final response = await Xhr.get(url,
          queryParameters: params, pb: true, throwOnError: true);
      ResConfessHistory history =
          ResConfessHistory.fromBuffer(response.bodyBytes);
      _page = history.data.offset;
      _lastId = history.data.lastId.toInt();
      _hasMore = history.data.more > 0;
      return history;
    } catch (e) {
      return ResConfessHistory(success: false, msg: e.toString());
    }
  }
}
