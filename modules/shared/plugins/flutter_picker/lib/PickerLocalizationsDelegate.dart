import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Picker.dart';

/// picker localizations
class PickerLocalizationsDelegate
    extends LocalizationsDelegate<PickerLocalizations> {
  const PickerLocalizationsDelegate();

  static const PickerLocalizationsDelegate delegate =
      PickerLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<PickerLocalizations> load(Locale locale) {
    return SynchronousFuture<PickerLocalizations>(PickerLocalizations(locale));
  }

  @override
  bool shouldReload(PickerLocalizationsDelegate old) => false;
}
