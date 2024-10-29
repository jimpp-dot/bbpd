import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import '../shared.dart';

/// 爵位类型
enum NobilityType {
  Null, //无爵位
  Knight, //骑士（豆蔻隐士）
  Baron, //男爵（青黛楼主）
  Viscount, //子爵（酡颜香主）
  Earl, //伯爵（玉髓堂主）
  Marquis, //侯爵（鸢尾殿主）
  Duke, //公爵（金盏阁主）
  Prince, //亲王（辰砂谷主）
  King, //国王（苏芳宫主）
  Emperor, //皇帝（月白仙子）
  ZhiZun, // 九五至尊（天青仙师）
}

const Map<String, NobilityType> NobilityTypeValuesNew = {
  '0': NobilityType.Null,
  '10': NobilityType.Knight,
  '20': NobilityType.Baron,
  '30': NobilityType.Viscount,
  '40': NobilityType.Earl,
  '50': NobilityType.Marquis,
  '60': NobilityType.Duke,
  '70': NobilityType.Prince,
  '80': NobilityType.King,
  '90': NobilityType.Emperor,
  '100': NobilityType.ZhiZun,
};

const Map<String, NobilityType> NobilityTypeValuesOld = {
  '0': NobilityType.Null,
  '1': NobilityType.Viscount,
  '2': NobilityType.Earl,
  '3': NobilityType.Duke,
  '4': NobilityType.King,
  '5': NobilityType.Emperor,
};

const Map<NobilityType, int> NobilityIntValuesNew = {
  NobilityType.Null: 0,
  NobilityType.Knight: 10,
  NobilityType.Baron: 20,
  NobilityType.Viscount: 30,
  NobilityType.Earl: 40,
  NobilityType.Marquis: 50,
  NobilityType.Duke: 60,
  NobilityType.Prince: 70,
  NobilityType.King: 80,
  NobilityType.Emperor: 90,
  NobilityType.ZhiZun: 100,
};

const Map<NobilityType, int> NobilityIntValuesOld = {
  NobilityType.Null: 0,
  NobilityType.Viscount: 1,
  NobilityType.Earl: 2,
  NobilityType.Duke: 3,
  NobilityType.King: 4,
  NobilityType.Emperor: 5,
};

const Map<String, String> NobilityImageMapNew = {
  '10': 'normal_knight.webp',
  '20': 'normal_baron.webp',
  '30': 'normal_viscount.webp',
  '40': 'normal_earl.webp',
  '50': 'normal_marquis.webp',
  '60': 'normal_duke.webp',
  '70': 'normal_prince.webp',
  '80': 'normal_king.webp',
  '90': 'normal_emperor.webp',
  '100': 'normal_zhizun.webp',
};

const Map<String, String> NobilityBigImageMapNew = {
  '10': 'big_knight.webp',
  '20': 'big_baron.webp',
  '30': 'big_viscount.webp',
  '40': 'big_earl.webp',
  '50': 'big_marquis.webp',
  '60': 'big_duke.webp',
  '70': 'big_prince.webp',
  '80': 'big_king.webp',
  '90': 'big_emperor.webp',
  '100': 'big_zhizun.webp',
};

class NobilityUtil {
  static String imgUrlPrefix({int oldNobility = 0, int newNobility = 0}) {
    return 'static/core/noble/';
  }

  /// 贵族爵位改版(保留了useNewNobility的爵位等级，修改了爵位升降级逻辑)
  static bool useNewNobilitySystem = false;

  /// int类型
  static int currentIntNobility({int oldNobility = 0, int newNobility = 0}) {
    return newNobility;
  }

  /// 枚举类型
  static NobilityType currentEnumNobility(
      {int oldNobility = 0, int newNobility = 0}) {
    NobilityType newType =
        NobilityTypeValuesNew['$newNobility'] ?? NobilityType.Null;
    return newType;
  }

  /// 转int
  static int getInt(NobilityType type) {
    return NobilityIntValuesNew[type] ?? 0;
  }

  /// desType 拥有该权限的起始爵位
  static bool compareNobility(
      {NobilityType startTypeOld = NobilityType.Viscount,
      NobilityType startTypeNew = NobilityType.Knight}) {
    if (startTypeNew == NobilityType.Null) return false;
    return Session.titleNew >= Util.parseInt(NobilityIntValuesNew[startTypeNew])
        ? true
        : false;
  }

  static bool titleIsInvalid(int? titleNew) {
    return (titleNew == null ||
        titleNew <= 0 ||
        !NobilityTypeValuesNew.keys.contains('$titleNew'));
  }

  static Widget titleTagImage(int title, double width, double height) {
    String? imageUrl = NobilityImageMapNew['$title'];
    Log.d('imageUrl:${imageUrl}');
    if (imageUrl == null) {
      return const SizedBox.shrink();
    }
    imageUrl = imgUrlPrefix() + imageUrl;
    Log.d('imageUrl:${imageUrl}');
    return CachedNetworkImage(
        imageUrl: imageUrl, width: width, height: height, fit: BoxFit.fill);
  }

  static Widget titleBigImage(int title, double width, double height) {
    String? imageUrl = NobilityBigImageMapNew['$title'];
    if (imageUrl == null) {
      return const SizedBox.shrink();
    }
    imageUrl = imgUrlPrefix() + imageUrl;
    return CachedNetworkImage(
        imageUrl: Util.squareResize(imageUrl, 150),
        width: width,
        height: height,
        fit: BoxFit.fill);
  }

  static String nobilityName({int newNobility = 0}) {
    NobilityType type = currentEnumNobility(newNobility: newNobility);
    switch (type) {
      case NobilityType.Knight:
        return '灵使';
      case NobilityType.Baron:
        return '圣侍';
      case NobilityType.Viscount:
        return '圣灵';
      case NobilityType.Earl:
        return '天卿';
      case NobilityType.Marquis:
        return '天侯';
      case NobilityType.Duke:
        return '圣使';
      case NobilityType.Prince:
        return '天君';
      case NobilityType.King:
        return '帝君';
      case NobilityType.Emperor:
        return '神皇';
      case NobilityType.ZhiZun:
        return '天尊';
      default:
        return '';
    }
  }
}
