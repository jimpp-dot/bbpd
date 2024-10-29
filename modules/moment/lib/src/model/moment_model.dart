import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/collection.dart';

import 'moment_bean.dart';

/// 全局缓存moment
///
class MomentModel with ChangeNotifier {
  final LruMap<int, Moment> _cachedMoments =
      LruMap<int, Moment>(maximumSize: 300);

  MomentModel() {
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
  }

  void _onLogin(String type, dynamic data) {
    clear();
  }

  void clear() {
    clearMoments();
    _cachedMoments.clear();
  }

  clearMoments() {
    _cachedMoments.clear();
  }

  Moment? getCachedMoment(int key) {
    return _cachedMoments[key];
  }

  void putCachedMoment(Moment? moment, {bool notify = true}) {
    if (moment == null) {
      return;
    }
    _cachedMoments[moment.topicId] = moment;
    if (notify) {
      notifyListeners();
    }
  }

  void putCachedMoments(List<Moment>? moments, {bool notify = true}) {
    if (moments == null || moments.isEmpty) {
      return;
    }

    for (var element in moments) {
      _cachedMoments[element.topicId] = element;
    }
    if (notify) {
      notifyListeners();
    }
  }

  void deleteMomentById(int topicId, {bool notify = true}) async {
    _cachedMoments.remove(topicId);
    if (notify) {
      notifyListeners();
    }
  }

  void deleteCommentById(int topicId, int commentId,
      {bool notify = true}) async {
    Moment? moment = _cachedMoments[topicId];
    if (moment != null) {
      moment.deleteComment(commentId);
    }
    if (notify) {
      notifyListeners();
    }
  }

  // 刷新
  void notify() async {
    notifyListeners();
  }
}
