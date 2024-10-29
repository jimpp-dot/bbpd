import 'package:get/get.dart';

import '../../util/log/log.dart';

/// GetX的logic的创建与删除管理
class GetManager with Loggable {
  /// 全局Logic的引用计数Map
  final Map<String, int> _logicSignalMap = {};

  /// 初始化Logic的引用计数为0
  final int _defaultLogicSignalValue = 0;

  static GetManager? _sharedInstance;

  factory GetManager() => _sharedInstance ??= GetManager._internal();

  GetManager._internal();

  /// Get.delete
  delete<S extends GetxController>({String? tag}) {
    /// map key
    String key = _getKey<S>(tag: tag);

    _log(key, 'getDelete() called');

    /// 获取当前logic引用计数并执行一次减1操作
    /// 判断该logic的引用计数
    /// > 0   - 表示当前logic仍有其他地方被标记引用，此时不执行Get.delete操作
    /// <=0   - 表示当前logic的所有引用标记都被移除，可以对logic进行删除操作
    ///
    int logicS = _logicSignalMap[key] ?? _defaultLogicSignalValue;
    logicS--;
    _log(key, '引用计数减1后，值 = $logicS');
    if (logicS > 0) {
      _log(key, 'Get.put引用计数大于0,不执行Get.delete操作');
    } else {
      _log(key, 'Get.put引用计数<=0,可执行Get.delete操作');

      /// 当信号量值 >= 0 时，表示当前已没有其他模块在使用该logic,可以对其进行删除
      if (Get.isRegistered<S>(tag: tag)) {
        Get.delete<S>(tag: tag);
      } else {
        _log(key, '该logic不存在');
      }

      /// 该logic的引用计数量重置为初始值0
      logicS = _defaultLogicSignalValue;
    }
    _logicSignalMap[key] = logicS;
  }

  /// Get.put
  S put<S extends GetxController>(S dependency, {String? tag}) {
    /// map key
    String key = _getKey<S>(tag: tag);

    _log(key, 'Get.put() called');

    /// 该logic当前的引用计数
    int logicS = _logicSignalMap[key] ?? _defaultLogicSignalValue;
    _log(key, '当前引用计数 = $logicS');

    /// 判断是否已存在该logic
    bool existLogic = Get.isRegistered<S>(tag: tag);
    S logic;
    if (existLogic) {
      _log(key, '该logic 已存在');

      /// 当前已存在该logic，虽然没有进行创建，但仍被记为一次资源注册
      logic = Get.find<S>(tag: tag);
    } else {
      logic = Get.put(dependency, tag: tag);
    }

    /// 该logic的引用计数加1
    logicS++;
    _log(key, '资源标记使用后引用计数 = $logicS');
    _logicSignalMap[key] = logicS;
    return logic;
  }

  _log(
    String key,
    String? data,
  ) {
    log.d('--$key--: $data');
  }

  String _getKey<S extends GetxController>({String? tag}) =>
      S.toString() + (tag ?? 'None');
}
