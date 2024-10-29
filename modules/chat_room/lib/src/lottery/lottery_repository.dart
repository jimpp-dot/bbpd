import 'package:shared/shared.dart';
import 'package:shared/util/response_utils.dart';
import 'model/lottery_model.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;

/// 房间抽奖Repository
class LotteryRepository {
  static const debug = false;
  static const tag = "LotteryRepository";

  LotteryRepository._();

  /// 开启抽奖
  static Future<BaseResponse> createLotteryRecord(LotteryOption option) async {
    String url = '${System.domain}roomlottery/setLottery';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'rid': '${option.rid}',
            'join_way': option.joinWay,
            if (option.joinWay == LotteryType.TYPE_TEXT) 'words': option.words,
            if (option.joinWay == LotteryType.TYPE_GIFT)
              'gift_id': '${option.giftId}',
            'round_time': '${option.roundTime}',
            'round_num': '${option.roundNum}',
            'round_interval': '${option.roundInterval}',
            'winner_num': '${option.winnerNum}'
          },
          throwOnError: true);
      if (debug)
        Log.d('$tag#createLotteryRecord, response: ${response.response}');
      return ResponseUtils.buildBaseResponse(response);
    } catch (e) {
      if (debug) Log.d('$tag#createLotteryRecord:, e: $e');
      return ResponseUtils.buildErrorBaseResponse(e);
    }
  }

  /// 删除抽奖记录
  static Future<BaseResponse> deleteLotteryRecord(
      int roomId, int lotteryRecordId) async {
    String url = '${System.domain}roomlottery/delRecord';
    try {
      XhrResponse response = await Xhr.post(
          url, {'rid': '$roomId', 'id': '$lotteryRecordId'},
          throwOnError: true);
      if (debug) {
        Log.d(
            '$tag#deleteLotteryOption, response: ${response.response}, rid: $roomId, id: $lotteryRecordId');
      }
      return ResponseUtils.buildBaseResponse(response);
    } catch (e) {
      if (debug) Log.d('$tag#deleteLotteryOption:, e: $e');
      return ResponseUtils.buildErrorBaseResponse(e);
    }
  }

  /// 开奖记录
  static Future<DataRsp<LotteryRecordResponse>> _loadLotteryRecords(
      int roomId, int page) async {
    String url = '${System.domain}roomlottery/lotteryList';
    try {
      XhrResponse response = await Xhr.getJson(url,
          params: {'rid': '$roomId', 'page': '$page'}, throwOnError: true);
      if (debug)
        Log.d('$tag#loadLotteryRecords, response: ${response.response}');
      DataRsp<LotteryRecordResponse> resp =
          DataRsp<LotteryRecordResponse>.fromXhrResponse(
              response,
              (object) => LotteryRecordResponse.fromJson(
                  object as Map<String, dynamic>));
      return resp;
    } catch (e) {
      if (debug) Log.d('$tag#loadLotteryRecords:, e: $e');
      return ResponseUtils.buildErrorDataRsp<LotteryRecordResponse>(e);
    }
  }

  /// 获奖者列表
  static Future<DataRsp<LotteryWinners>> loadLotteryWinners(
      int lotteryId) async {
    String url = '${System.domain}roomlottery/lotteryWinners';
    try {
      XhrResponse response = await Xhr.getJson(url,
          params: {'id': '$lotteryId'}, throwOnError: true);
      if (debug)
        Log.d('$tag#loadLotteryWinners, response: ${response.response}');
      DataRsp<LotteryWinners> resp = DataRsp<LotteryWinners>.fromXhrResponse(
          response,
          (object) => LotteryWinners.fromJson(object as Map<String, dynamic>));
      return resp;
    } catch (e) {
      if (debug) Log.d('$tag#loadLotteryWinners:, e: $e');
      return ResponseUtils.buildErrorDataRsp<LotteryWinners>(e);
    }
  }

  /// 获取"一键参与"信息
  static Future<DataRsp<LotteryInfo>> loadLotteryInfo(int roomId) async {
    String url = '${System.domain}roomlottery/lotteryInfo';
    try {
      XhrResponse response = await Xhr.getJson(url,
          params: {'rid': '$roomId'}, throwOnError: true);
      if (debug) Log.d('$tag#loadLotteryInfo, response: ${response.response}');
      DataRsp<LotteryInfo> resp = DataRsp<LotteryInfo>.fromXhrResponse(response,
          (object) => LotteryInfo.fromJson(object as Map<String, dynamic>));
      return resp;
    } catch (e) {
      if (debug) Log.d('$tag#loadLotteryInfo:, e: $e');
      return ResponseUtils.buildErrorDataRsp<LotteryInfo>(e);
    }
  }

  /// 一键参与
  static Future<BaseResponse> joinLottery(int roomId) async {
    String url = '${System.domain}roomlottery/joinLottery';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$roomId'}, throwOnError: true);
      if (debug) Log.d('$tag#joinLottery, response: ${response.response}');
      return ResponseUtils.buildBaseResponse(response);
    } catch (e) {
      if (debug) Log.d('$tag#joinLottery:, e: $e');
      return ResponseUtils.buildErrorBaseResponse(e);
    }
  }
}

class LotteryRecordRepository extends LoadingMoreBase<LotteryRecord> {
  final int roomId;
  int _page = 0;
  bool _hasMore = true;
  bool _forceRefresh = false;
  String? _errorMessage;

  LotteryRecordRepository(this.roomId);

  @override
  bool get hasMore => _hasMore || _forceRefresh;

  String? get errorMessage => _errorMessage;

  @override
  Future<bool> loadData([bool isLoadMoreAction = false]) async {
    int page = isLoadMoreAction ? (_page + 1) : 1;
    DataRsp<LotteryRecordResponse> rsp =
        await LotteryRepository._loadLotteryRecords(roomId, page);
    if ((rsp.success) != true) {
      _errorMessage = rsp.msg ?? BaseK.K.base_net_error;
      return false;
    }
    List<LotteryRecord>? records = rsp.data?.records;

    /// Log.d('LotteryRecordRepository, page: $page, records: ${records.length}');
    if (records?.isEmpty ?? true) {
      _hasMore = false;
    } else {
      _hasMore = true;
      if (page == 1) clear();
      _page = page;
      for (var record in records!) {
        add(record);
      }
    }
    return true;
  }

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    _page = 0;
    _forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    _forceRefresh = false;
    return result;
  }
}
