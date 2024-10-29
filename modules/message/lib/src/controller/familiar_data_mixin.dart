import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/api_relation.pb.dart';
import 'package:message/src/controller/conversation_extra_info.dart';

import '../api/message_repo.dart';
import '../model/accost_and_hi_group.dart';
import '../model/pb/generated/slp_gs.pb.dart';
import 'package:pulse_log/pulse_log.dart';

/// familiar数据
mixin FamiliarDataMixin on ConversationExtraInfo {
  late FamiliarCache _familiarCache; // familiar、临时群
  final Completer _completer = Completer();

  final Set<int> _innerByFateIDs = {}; // 将 二级HiData中的数据 放入 新的二级GS列表中
  final Set<int> _innerByGsIDs = {}; // 将 二级HiData中的数据 放入 新的二级GS列表中
  final Set<int> _outIDs = {}; // 将 二级HiData中的数据 放入 一级 列表中

  final Set<int> _innerByGsIDsOld =
      {}; // 将 二级HiData中的数据 放入 新的二级GS列表中 ,兼容老接口，后续废弃
  final Set<int> _outIDsOld = {}; // 将 二级HiData中的数据 放入 一级 列表中 兼容老接口，后续废弃

  @override
  void initExtra() async {
    super.initExtra();

    PulseLog.instance.console('FamiliarDataMixin initExtra', tag: 'msgLoading');

    _familiarCache = FamiliarCache.instance;

    // 同步familiar、临时群数据；GS白名单；老接口Boss和Gs（兼容）
    await _familiarCache.familiarReady;

    _familiarCache.addFamiliarListener(_onFamiliarCacheUpdate);
    _familiarCache.addGroupListener(_onTempGroupCacheUpdate);

    _completer.complete(true);

    PulseLog.instance
        .console('FamiliarDataMixin initExtra end', tag: 'msgLoading');

    reloadFamiliar();
  }

  @override
  void disposeExtra() {
    super.disposeExtra();
    _familiarCache.rmFamiliarListener(_onFamiliarCacheUpdate);
    _familiarCache.rmGroupListener(_onTempGroupCacheUpdate);
  }

  Future reloadFamiliar() async {
    /// 会话已显示，此时拉取到的familiar 需要 通知刷新
    await _familiarCache.sync(notify: true); //familiar and group
    await _loadFamiliarGs(); // 白名单
    await loadGsAndBossData(); // 老的gs 和 boss （兼容）
  }

  Future get familiarReady => _completer.future;

  _onFamiliarCacheUpdate(List<FamiliarItem> items) =>
      _onCacheUpdate(FamiliarType.familiar, items);

  _onTempGroupCacheUpdate(List<FamiliarItem> items) =>
      _onCacheUpdate(FamiliarType.group, items);

  void _onCacheUpdate(FamiliarType type, List<FamiliarItem> items) {
    Set<int> needUpdatedIds = {};
    for (var _ in items) {
      needUpdatedIds.add(_.toId);
    }

    if (needUpdatedIds.isNotEmpty) onFamiliarUpdate(type, needUpdatedIds);
  }

  /// White ID
  void _updateWhiteIds(Set<int>? oldIds, Set<int>? newIds, Set<int> changed,
      {bool newApi = true}) {
    if (oldIds == null) return;
    if (newIds == null) return;

    Set<int> inOld = oldIds.difference(newIds);
    Set<int> inNew = newIds.difference(oldIds);
    if (newApi) {
      oldIds.clear();
    }
    oldIds.addAll(newIds);

    changed.addAll(inOld);
    changed.addAll(inNew);
  }

  bool isOutId(int targetId) {
    return _outIDs.contains(targetId) || _outIDsOld.contains(targetId);
  }

  bool isInnerByGsId(int targetId) {
    return _innerByGsIDs.contains(targetId) ||
        _innerByGsIDsOld.contains(targetId);
  }

  bool isInnerByFateId(int targetId) {
    return _innerByFateIDs.contains(targetId);
  }

  Future<bool> isFamiliar(int targetId) async {
    FamiliarItem familiarItem = await _familiarCache.familiar.get(targetId);
    return familiarItem.familiar;
  }

  Future<bool> isTempGroup(int targetId) async {
    FamiliarItem familiarItem = await _familiarCache.tempGroup.get(targetId);
    return familiarItem.familiar;
  }

  void onFamiliarUpdate(FamiliarType type, Set<int> targetIds);

  /// 拉取 GS 和 Boss
  Future<bool> loadGsAndBossData() async {
    bool ok = false;
    if (BaseConfig.instance.autoAccost) {
      /// 快乐星球搭讪相关接口独立
      ResFriendMsgGroup msgGroup = await MessageRepo.bbAccostAndHiList();
      ok = msgGroup.success;
      if (ok && msgGroup.hasData()) {
        Set<int>? newInnerByGsIds = msgGroup.data.bossList.toSet();

        /// 放accost里
        Set<int>? newOutIds = msgGroup.data.gsList.toSet();

        /// 放外层

        Set<int> changed = {};
        _updateWhiteIds(_innerByGsIDsOld, newInnerByGsIds, changed,
            newApi: false);
        _updateWhiteIds(_outIDsOld, newOutIds, changed, newApi: false);
        if (changed.isNotEmpty)
          onFamiliarUpdate(FamiliarType.familiar, changed);
      }
    }
    return ok;
  }

  /// gs白名单，这些用户的消息放在外面
  Future<void> _loadFamiliarGs() async {
    ResImFamiliarGs resp = await RelationshipApi.getGsIds();
    if (resp.success) {
      Set<int> newInnerByFateIds = {};
      Set<int> newInnerByGsIds = {};
      Set<int> newOutIds = {};
      for (var e in resp.data) {
        if (e.type == 1) {
          newOutIds.add(e.uid);
        } else if (e.type == 2) {
          newInnerByGsIds.add(e.uid);
        } else if (e.type == 3) {
          newInnerByFateIds.add(e.uid);
        }
      }

      Set<int> changed = {};
      _updateWhiteIds(_innerByFateIDs, newInnerByFateIds, changed);
      _updateWhiteIds(_innerByGsIDs, newInnerByGsIds, changed);
      _updateWhiteIds(_outIDs, newOutIds, changed);
      if (changed.isNotEmpty) onFamiliarUpdate(FamiliarType.familiar, changed);
    }
  }

  void clearFamiliar() {
    if (BaseConfig.instance.autoAccost) {
      _innerByGsIDs.clear();
      _innerByGsIDsOld.clear();
      _outIDs.clear();
      _outIDsOld.clear();
    }
  }
}
