import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 全局主题
///
ThemeData getDefaultThemeData() {
  TextTheme textTheme = TextTheme(
    titleLarge: R.textStyle.title,
    titleSmall: R.textStyle.subtitle,
    titleMedium: R.textStyle.subhead,
    bodyMedium: R.textStyle.body1,
    bodyLarge: R.textStyle.body2,
    labelLarge: R.textStyle.button,
    bodySmall: R.textStyle.caption,
  );

  TextTheme primaryTextTheme = TextTheme(
    titleLarge: textTheme.titleLarge!.copyWith(color: R.color.mainBgColor),
    titleSmall: textTheme.titleSmall!.copyWith(color: R.color.mainBgColor),
    titleMedium: textTheme.titleMedium!.copyWith(color: R.color.mainBgColor),
    labelLarge: textTheme.labelLarge!.copyWith(color: R.color.mainBgColor),
    bodyMedium: textTheme.bodyMedium!.copyWith(color: R.color.mainBgColor),
    bodyLarge: textTheme.bodyLarge!.copyWith(color: R.color.mainBgColor),
    bodySmall: textTheme.bodySmall!.copyWith(color: R.color.mainBgColor),
  );

  Color disableColor = R.color.secondBgColor;

  ThemeData theme = ThemeData(
    platform: TargetPlatform.iOS,
    brightness: Util.brightness,
    useMaterial3: true,
    fontFamily: Util.fontFamily,
    primaryColor: R.color.mainBrandColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: R.color.mainBrandColor,
    ),
    hintColor: R.color.thirdTextColor,
    scaffoldBackgroundColor: R.color.mainBgColor,
    unselectedWidgetColor: disableColor,
    disabledColor: disableColor,
    cardColor: R.color.mainBgColor,
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,
    buttonTheme: ButtonThemeData(
      height: 38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),
      ),
      buttonColor: R.color.mainBrandColor,
      disabledColor: R.color.thirdBgColor,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: R.color.mainBrandColor,
      brightness: Util.brightness,
    ),
    iconTheme: IconThemeData(size: 24, color: R.color.mainTextColor),
    primaryIconTheme:
        IconThemeData(size: 24, color: primaryTextTheme.titleLarge!.color),
    dialogTheme: DialogTheme(
      elevation: 0,
      backgroundColor: const Color(0xFF08032B).withOpacity(0.85),
    ),
    // colorScheme: ColorScheme(surface: R.color.mainBgColor, brightness: null),
    switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return R.color.mainBrandColor;
        }
        return null;
      }),
      trackColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return R.color.mainBrandColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return R.color.mainBrandColor;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return R.color.mainBrandColor;
        }
        return null;
      }),
    ),
  );

  return theme.copyWith(
    inputDecorationTheme: InputDecorationTheme(
      fillColor: disableColor,
      hintStyle: theme.textTheme.bodyMedium
          ?.copyWith(color: R.color.mainTextColor.withOpacity(0.2)),
      labelStyle: theme.textTheme.bodyMedium,
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      color: R.color.appBarColor,
      systemOverlayStyle: Util.brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: R.color.mainTextColor, size: 24),
      titleTextStyle: R.textStyle.title,
      actionsIconTheme: IconThemeData(color: R.color.mainTextColor, size: 24),
    ),
    tabBarTheme: TabBarTheme(
      indicator: CommonUnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
        wantWidth: 8,
        draggingWidth: 12.0,
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: R.color.mainTextColor,
      labelStyle: theme.textTheme.titleLarge,
      labelPadding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 0.0),
      unselectedLabelColor: R.color.thirdTextColor,
      unselectedLabelStyle:
          theme.textTheme.titleMedium?.copyWith(color: R.color.secondTextColor),
    ),
    switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return R.color.mainBrandColor;
        }
        return null;
      }),
      trackColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return R.color.mainBrandColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return R.color.mainBrandColor;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return R.color.mainBrandColor;
        }
        return null;
      }),
    ),
  );
}

LocaleResolutionCallback defaultLocaleResolutionCallback =
    (Locale? locale, Iterable<Locale> supportedLocales) {
  if (Translations.isInited) return Translations.currentLanguage;

  if (Translations.isSupportMultiple) {
    String selectLan = Config.get('current_language');
    Locale? selectLocale = SupportLanguage.getLocale(selectLan);
    if (selectLocale != null) {
      locale = selectLocale;
      Translations.init(selectLocale);
    } else {
      locale = SupportLanguage.match(locale);
      Translations.init(locale);
    }
  } else {
    Translations.init(null);
  }
  return locale;
};
