import 'dart:async';
import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'translations.pb.dart' as pb;

class Translations {
  static const String TAG = "Translations";

  pb.Translations? _translations;
  Locale? _locale;
  bool _inited = false;
  bool _supportMultiple = false;
  Locale? _defLocale;

  static final Translations _instance = Translations(null);

  bool _lock = false;

  set inited(bool init) {
    _inited = init;
  }

  set defLocaled(Locale? init) {
    _defLocale = init;
  }

  set locale(Locale locale) {
    _locale = locale;
  }

  set supportMultiple(bool support) {
    _supportMultiple = support;
  }

  Translations(Locale? locale) {
    _locale = locale;
  }

  static String text(String key) {
    try {
      String? value = _instance._translations?.texts[key];
      if (value == null) {
        Log.v('$TAG $key not found');
        return '';
      } else {
        return value;
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
      return '';
    }
  }

  static List<String> array(String key) {
    try {
      List? value = _instance._translations?.array[key]?.values;
      if (value == null) {
        Log.d('$TAG $key not found');
        return [];
      } else {
        return value.map<String>((e) => e.stringValue).toList();
      }
    } catch (e) {
      Log.d('$TAG $key not found exception: ${e.toString()}');
      return [];
    }
  }

  static void setText(String? key, String? value) {
    if (key == null || value == null) return;
    if (_instance._translations == null) return;
    _instance._translations!.texts[key] = value;
  }

  static void setArray(String key, List value) {
    if (_instance._translations == null) return;

    pb.ListValue parseListValue(dynamic value) {
      pb.ListValue listvalue = pb.ListValue();

      if (value is List) {
        for (var element in value) {
          listvalue.values.addAll(parseListValue(element).values);
        }

        return listvalue;
      }

      parseValue(dynamic value) {
        if (value is num) {
          value = pb.Value()..numberValue = value.toDouble();
        } else if (value is String) {
          value = pb.Value()..stringValue = value;
        } else if (value is bool) {
          value = pb.Value()..boolValue = value;
        }
        return value;
      }

      value = parseValue(value);
      listvalue.values.add(value);
      return listvalue;
    }

    _instance._translations!.array[key] = parseListValue(value);
  }

  static Future<Translations> init(Locale? locale,
      {bool isFirst = false}) async {
    if (locale != null) {
      _instance.locale = locale;
    }

    if (_instance._lock) {
      return _instance;
    }

    _instance._lock = true;

    String lan = getLan();

    try {
      ByteData data =
          await otaResourceBundle.load('assets/generated/lan/$lan.pb');
      _instance._translations =
          pb.Translations.fromBuffer(data.buffer.asUint8List());
    } catch (e) {
      Log.d(() => '$TAG assets/locale/$lan.pb FormatException');
    }

    _instance._lock = false;
    if (isFirst) {
      Get.locale = locale;
    } else {
      Get.updateLocale(locale!);
    }

    // TODO: This forces a refresh on the home tabs to update language. Need to find a better place to put.
    eventCenter.emit(EventConstant.EventHomeTabChange);
    return _instance;
  }

  static Locale get currentLanguage => _instance._locale!;

  static String getLan({Locale? locale, String split = '_'}) {
    locale ??= _instance._locale;
    if (locale != null) {
      if (locale.countryCode == null || locale.countryCode == '*') {
        return locale.languageCode;
      }
      return "${locale.languageCode}$split${locale.countryCode!}";
    }
    return "zh${split}CN";
  }

  static int get lanIndex => SupportLanguage.index(_instance._locale!);

  // static SplayTreeMap<String, String> all() {
  //   return _instance.localizedValues;
  // }

  static bool get isInited => _instance._inited;

  static set isInited(bool inited) {
    _instance.inited = inited;
  }

  static Locale get defLocale =>
      _instance._defLocale ?? SupportLanguage.ZH.locale;

  static set defLocale(Locale? inited) {
    _instance.defLocaled = inited;
  }

  ///是否支持多语言
  static bool get isSupportMultiple => _instance._supportMultiple;

  /// support 是否支持多语言，默认简体中文
  static Future initMain({bool support = true, Locale? defLocale}) async {
    await R.initialize();

    if (support) {
      _instance.supportMultiple = true;
      Translations.defLocale = defLocale;
      String selectLan = Config.get('current_language', '');
      Locale? selectLocale = SupportLanguage.getLocale(selectLan);
      if (selectLocale != null) {
        await Translations.init(selectLocale, isFirst: true);
        isInited = true;
      } else {
        Locale? sysLocale = DeviceInfo.systemLocale;
        if (sysLocale != null) {
          await Translations.init(SupportLanguage.match(sysLocale),
              isFirst: true);
          isInited = true;
        }
      }
    } else {
      _instance.supportMultiple = false;
      await Translations.init(defLocale ?? SupportLanguage.ZH._locale,
          isFirst: true);
      isInited = true;
    }
  }

  static Future<String> load(String key,
      [String? package, String? curLan]) async {
    String lan = curLan ?? getLan(locale: defLocale);
    String fileName = '${package ?? 'app'}_${key}_$lan.json';
    String assetKey = 'assets/generated/lan/$fileName';
    // TODO: Add ota assets back
    // bool exits = otaResourceBundle.conta(assetKey);
    // if (!exits) {
    //   assetKey = fileName;
    //   exits = ptResourceBundle.localContains(assetKey);
    // }
    // if (!exits) {
    //   fileName = '${package ?? 'app'}_${key}_$lan.json';
    // }

    String finalPath = 'assets/generated/lan/$fileName';
    return await otaResourceBundle.loadString(finalPath);
  }
}

class SupportLanguage {
  static final SupportLanguage ZH =
      SupportLanguage(const Locale('zh', 'CN'), '简体中文'); //zh_CN

  /// 所有语言列表
  static final List<SupportLanguage> _ALL = [
    ZH,
  ];

  /// app支持的语言列表，仅支持中文
  static List<SupportLanguage> supports = [ZH];

  final Locale _locale;
  final String _displayName;

  SupportLanguage(this._locale, this._displayName);

  Locale get locale => _locale;

  String get displayName => _displayName;

  String get lan {
    return Translations.getLan(locale: _locale);
  }

  bool valueEqual(Locale? locale) {
    Log.d('valueEqual locale = ${locale.toString()}');
    Log.d('valueEqual curLocale = ${_locale.toString()}');
    if (locale == null) return false;
    if (_locale == locale) return true;
    if (Util.equalIgnoreCase(_locale.languageCode, locale.languageCode)) {
      if (_locale.countryCode == null ||
          Util.equalIgnoreCase(_locale.countryCode, locale.countryCode)) {
        return true;
      }

      /// 中文特殊
      if (Util.equalIgnoreCase(locale.languageCode, 'zh') &&
          !Util.equalIgnoreCase(locale.countryCode, 'CN') &&
          !Util.equalIgnoreCase(locale.countryCode, 'TW')) {
        if (Util.equalIgnoreCase(locale.countryCode, 'HK') ||
            Util.equalIgnoreCase(locale.countryCode, 'MO')) {
          return Util.equalIgnoreCase(_locale.countryCode, 'TW');
        } else {
          return Util.equalIgnoreCase(_locale.countryCode, 'CN');
        }
      }
    }
    return false;
  }

  static int index(Locale locale) {
    int i = 0;
    for (SupportLanguage lan in supports) {
      if (lan.valueEqual(locale)) {
        return i;
      }
      i++;
    }
    if (i >= supports.length) return 0;

    return 0;
  }

  static Locale? getLocale(String selectLan) {
    if (selectLan.isEmpty) return null;
    for (SupportLanguage language in supports) {
      if (Util.equalIgnoreCase(
          selectLan, Translations.getLan(locale: language.locale))) {
        return language.locale;
      }
    }
    return null;
  }

  static SupportLanguage? getSupportLanguage(String? selectLan) {
    if (selectLan == null) return null;
    for (SupportLanguage language in _ALL) {
      if (Util.equalIgnoreCase(
          selectLan, Translations.getLan(locale: language.locale))) {
        return language;
      }
    }
    return null;
  }

  static Locale match(Locale? locale) {
    for (SupportLanguage language in SupportLanguage.supports) {
      if (language.valueEqual(locale)) {
        return language.locale;
      }
    }
    return Translations.defLocale;
  }

  static List<SupportLanguage>? fromList(dynamic data) {
    if (data == null) return null;
    if (data is List) {
      List<SupportLanguage> sups = [];
      for (String lan in data) {
        SupportLanguage? sl = getSupportLanguage(lan);
        if (sl == null) continue;
        sups.add(sl);
      }
      return sups;
    }
    return null;
  }

  static void updateSupports(List<SupportLanguage>? newSupports) {
    if (newSupports == null || newSupports.isEmpty) return;
    supports.clear();
    supports.addAll(newSupports);
  }
}
