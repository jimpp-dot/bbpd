import 'package:shared/shared.dart';
import 'package:chat_room/src/vindicate/model/vindicate_data.dart';
import 'package:loading_more_list/loading_more_list.dart';

/// 表白活动历史记录数据
class VindicateRecordHistory<T extends VindicateRecordData>
    extends LoadingMoreBase<T> {
  int _page = 0;
  int _lastId = 0;
  bool _hasMore = true;

  final int onlyMe;

  VindicateRecordHistory({this.onlyMe = 0});

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
    try {
      final dataRsp = await _request();
      if (!(dataRsp.success == true)) return false;

      List<T>? data = dataRsp.data?.cast<T>();
      if (_page == 0) {
        // Log.d('VindicateRecordHistory refresh clear() <<<<<<<<<<<<');
        clear();
      }

      if (data != null && data.isNotEmpty) {
        addAll(data);
      }

      return true;
    } catch (e) {
      Log.d('加载表白活动历史记录失败：$e');

      return false;
    }
  }

  Future<DataRsp<List<VindicateRecordData>>> _request() async {
    try {
      const offsetKey = 'offset';
      const lastIdKey = 'last_id';

      final params = {
        offsetKey: _page,
        lastIdKey: _lastId,
        'only_me': onlyMe,
      };

      String url = '${System.domain}go/yy/confess/history';
      XhrResponse response = await Xhr.getJson(
        url,
        params: params,
        throwOnError: true,
        formatJson: true,
      );

      /// 请求go接口需要设置formatJson ： true
      return DataRsp<List<VindicateRecordData>>.fromXhrResponse(response,
          (json) {
        if (json is Map) {
          _page = Util.parseInt(json[offsetKey], 0);
          _lastId = Util.parseInt(json[lastIdKey], 0);
          _hasMore = Util.parseBool(json['more'], false);
          final itemDataList = json['items'] as List;
          return itemDataList
              .map((json) => VindicateRecordData.fromJson(json))
              .toList();
        } else {
          return [];
        }
      });
    } catch (e) {
      return DataRsp(success: false, msg: '获取表白记录请求异常');
    }
  }
}
