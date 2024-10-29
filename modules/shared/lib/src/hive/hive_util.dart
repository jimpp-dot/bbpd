import 'dart:async';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

import '../../shared.dart';

const _hive_key_last_week = 'key_last_week';
const _hive_key_week_count = 'key_week_count';

/// Hive 数据操作
class HiveUtil {
  HiveUtil._();

  static const String hivePath = 'slp_hive';

  static Future<void> init() async {
    if (Platform.isAndroid || Platform.isIOS) {
      await Hive.initFlutter(hivePath);
    } else {
      // For web
      Hive.init(hivePath);
    }
  }

  // 获取 Box 对象
  // name：Box的名称， encryptionCipher：密钥，需要加密的使用
  static Future<Box<E>> getBox<E>(String name, {HiveAesCipher? encryptionCipher}) async {
    if (!Hive.isBoxOpen(name)) {
      Log.d('hive_util Hive.openBox === $name');
      return await Hive.openBox<E>(name, encryptionCipher: encryptionCipher);
    } else {
      Log.d('hive_util Hive.box === $name');
      return Hive.box<E>(name);
    }
  }

  // 查询Box中的单个元素,  指定了defaultValue, 并且key不存在,则返回defaultValue
  static Future<E?> get<E>(String name, {dynamic key, E? defaultValue}) async {
    Box box = await getBox<E>(name);
    key ??= name;
    E? value = box.get(key, defaultValue: defaultValue);
    Log.d('hive_util get === $key, ${value.runtimeType}');
    return value;
  }

  // 插入/更新Box中的一个元素
  static Future<void> put<E>(String name, dynamic value, {dynamic key}) async {
    var box = await getBox<E>(name);
    key ??= name;
    return box.put(key, value);
  }

  // 删除Box中的一个元素
  static Future<void> delete<E>(String name, {dynamic key}) async {
    var box = await getBox<E>(name);
    key ??= name;
    box.delete(key);
  }

  // 关闭所有box
  static Future<void> closeAll() => Hive.close();

  // 关闭当前box
  static Future<void> closeBox<E>(String name) async {
    final box = await getBox<E>(name);
    await box.close();
  }

  // 删除指定名称的Box及其数据文件
  static Future<void> deleteBoxFromDisk(String name) async {
    await Hive.deleteBoxFromDisk(name);
  }

  // 删除所有打开的Box中的数据文件，不会删除Hive的主目录及配置文件
  static Future<void> deleteAllFromDisk(String name) async {
    await Hive.deleteFromDisk();
  }

  // 查询Box中的单个元素, 按照每周的来计算的次数
  static Future putWeekCount(String name, int count) async {
    Box box = await getBox(name);
    box.put(_hive_key_last_week, Week.current().toString());
    box.put(_hive_key_week_count, count);
  }

  // 查询Box中的单个元素, 数量自增
  static Future<int> putWeekCountAutoIncrement(String name) async {
    Box box = await getBox(name);
    Week currentWeek = Week.current();
    int lastCount = await getWeekCount(name, defaultWeek: currentWeek);
    box.put(_hive_key_last_week, currentWeek.toString());
    box.put(_hive_key_week_count, ++lastCount);
    return lastCount;
  }

  // 查询Box中的单个元素, 按照每周的来计算的次数
  static Future<int> getWeekCount(String name, {Week? defaultWeek}) async {
    Box box = await getBox(name);
    String? lastWeek = box.get(_hive_key_last_week);
    if (lastWeek == null) return 0;
    String currentWeek = (defaultWeek ?? Week.current()).toString();
    if (lastWeek != currentWeek) return 0;
    int count = box.get(_hive_key_week_count, defaultValue: 0);
    return count;
  }
}
