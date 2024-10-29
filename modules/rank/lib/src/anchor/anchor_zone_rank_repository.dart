import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'anchor_zone_rank_model.dart';
import 'package:loading_more_list/loading_more_list.dart';

/// 主播专题排行榜仓库
class AnchorZoneRankRepository {
  static const bool debug = false;

  /// 从网络获取，主播专区排行初始数据
  static Future<AnchorZoneRankModel?> loadTabFromNetwork(int groupId) async {
    try {
      String url = '${System.domain}kolfans/rankTab?kfg_id=$groupId';
      if (debug)
        Log.d('AnchorZoneRankRepository#loadTabFromNetwork, url: $url');
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      DataRsp resp = DataRsp<AnchorZoneRankModel>.fromXhrResponse(
          response,
          (object) =>
              AnchorZoneRankModel.fromJson(object as Map<String, dynamic>));
      if (resp.success == true && resp.data is AnchorZoneRankModel) {
        return resp.data;
      }
      return null;
    } catch (e) {
      if (debug) Log.d('AnchorZoneRankRepository#loadTabFromNetwork, e: $e');
      return null;
    }
  }

  /// 从网络获取，指定排行榜数据
  static Future<AnchorZoneRankPageModel?> loadRankFromNetwork(
      int groupId, int type, int page) async {
    try {
      String url =
          '${System.domain}/kolfans/rank?kfg_id=$groupId&type=$type&page=$page';
      if (debug)
        Log.d('AnchorZoneRankRepository#loadRankFromNetwork, url: $url');
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      DataRsp resp = DataRsp<AnchorZoneRankPageModel>.fromXhrResponse(
          response,
          (object) =>
              AnchorZoneRankPageModel.fromJson(object as Map<String, dynamic>));
      if (resp.success == true && resp.data is AnchorZoneRankPageModel) {
        return resp.data;
      }
      return null;
    } catch (e) {
      if (debug) Log.d('AnchorZoneRankRepository#loadRankFromNetwork, e: $e');
      return null;
    }
  }
}

class AnchorZoneRankPageRepository
    extends LoadingMoreBase<AnchorZoneRankItemModel> {
  final BuildContext context;
  final int groupId;
  final int type;
  int _page = 0;
  bool _hasMore = true;
  bool _forceRefresh = false;

  AnchorZoneRankPageRepository(this.context, this.groupId, this.type);

  @override
  bool get hasMore => _hasMore || _forceRefresh;

  bool _first = false;

  void init(AnchorZoneRankPageModel? model) {
    if (model == null) return;
    _page = 1;
    _first = model.list.isNotEmpty == true;
    _hasMore = model.hasMore;
    for (var element in model.list) {
      add(element);
    }
  }

  @override
  Future<bool> loadData([bool isLoadMoreAction = false]) async {
    if (_first) {
      _first = false;
      return true;
    }
    int page = isLoadMoreAction ? (_page + 1) : 1;
    AnchorZoneRankPageModel? model =
        await AnchorZoneRankRepository.loadRankFromNetwork(groupId, type, page);
    _hasMore = model?.hasMore ?? true;
    if (model != null) {
      if (model.page == 1) clear();
      _page = model.page;
      for (var element in model.list) {
        add(element);
      }
      return true;
    }
    return false;
  }

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;

    /// _page = 1;
    _forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    _forceRefresh = false;
    return result;
  }
}
