import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../k.dart';

class ChineseCupertinoLocalizations extends DefaultCupertinoLocalizations {
  const ChineseCupertinoLocalizations();

  static const List<String> _chinesMonths = <String>[
    '1月',
    '2月',
    '3月',
    '4月',
    '5月',
    '6月',
    '7月',
    '8月',
    '9月',
    '10月',
    '11月',
    '12月',
  ];

  @override
  String get selectAllButtonLabel => K.common_choose_all;

  @override
  String get pasteButtonLabel => K.common_paste;

  @override
  String get copyButtonLabel => K.common_copy;

  @override
  String get cutButtonLabel => K.common_cut;

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.ymd;

  @override
  String datePickerMonth(int monthIndex) => _chinesMonths[monthIndex - 1];

  @override
  String datePickerYear(int yearIndex) => '$yearIndex年';

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) => '$dayIndex日';

  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(
        const ChineseCupertinoLocalizations());
  }

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _ChineseDelegate();
}

class _ChineseDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _ChineseDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return ChineseCupertinoLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<CupertinoLocalizations> old) {
    return false;
  }
}
