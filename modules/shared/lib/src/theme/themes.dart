// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ota_resource_bundle/ota_resource_bundle.dart';

import '../../shared.dart';
import 'dimension.dart';
import 'text_styles.dart';
import 'theme_dark_colors.dart';

const String DARK_MODE = 'dark_mode.key';
bool darkMode = true;

class R {
  static Brightness brightness =
      WidgetsBinding.instance.window.platformBrightness;

  /// 支持暗黑模式的页面
  static ThemeColors get colors => darkMode ? dColor : color;

  /// 直接使用浅色模式下的色值
  static ThemeColors? _theme;

  static ThemeColors get color => _theme ??= ThemeColors();

  /// 直接使用暗黑模式下的色值
  static ThemeColors? _darkTheme;

  static ThemeColors get dColor => _darkTheme ??= ThemeDarkColors();

  static Dimensions? _dimen;

  static Dimensions get dimen => _dimen ??= Dimensions();

  static TextStyles? _textStyle;

  static TextStyles get textStyle => _textStyle ??= TextStyles();

  static const String LANG_ZH = 'zh';
  static const String LANG_EN = 'en';

  static setCurrentTheme({bool supportMultipleLan = false}) {
    ComponentManager.instance.initResources();
  }

  static bool containsRes(String resPath) {
    return otaResourceBundle.otaContains(resPath) ||
        otaResourceBundle.localContains(resPath);
  }

  static Future<void> initialize() async {
    otaAssetBundle = otaResourceBundle;
    otaAssetBundleLogger = OtaAssetLogger();

    await otaResourceBundle.loadLocalManifest();
    // Try loading the OTA (Over-The-Air) manifest firstly
    otaResourceBundle.loadOtaManifest().then((_) {
      // Once the manifest is loaded successfully, ensure the Flutter binding is initialized
      // and perform a reassemble of the widget tree
      WidgetsFlutterBinding.ensureInitialized().performReassemble();
    }, onError: (e, s) {
      // If an error occurs during the initial load attempt
      // Try loading the OTA manifest again
      Future.delayed(Durations.short4, () {
        otaResourceBundle.loadOtaManifest().then((_) {
          // If the second attempt is successful, ensure the Flutter binding is initialized
          // and perform a reassemble of the widget tree
          WidgetsFlutterBinding.ensureInitialized().performReassemble();
        });
      });
    });
  }

  /// 获取图片路径
  ///
  /// [package]为null时正常取图片，不为空时优先取模块内部的资源，但是App内assets/module/$package下的相同子路径存在时，优先从App取图
  static String imagePath(String path, {String? package}) {
    String shortPath = path;
    if (shortPath.startsWith('assets/images/')) {
      shortPath = shortPath.replaceFirst('assets/images/', '');
    } else if (shortPath.startsWith('packages/') &&
        shortPath.contains('assets/images/')) {
      package = shortPath.substring(
          shortPath.indexOf('/') + 1, shortPath.indexOf('/assets/images'));
      shortPath = shortPath.substring(
          shortPath.indexOf('assets/images/') + 'assets/images/'.length);
    }
    String result = path;
    if (package == null) {
      if (path.startsWith('assets/images/') || path.startsWith('packages/')) {
        result = path;
      } else {
        result = 'assets/images/$shortPath';
      }
    } else {
      result = 'packages/$package/assets/images/$shortPath';
    }

    String lan = Translations.getLan();
    if (Translations.isSupportMultiple) {
      String lanImgPath = result.replaceFirst('images/', 'images_$lan/');
      bool lanImgContains = otaResourceBundle.localContains(lanImgPath);

      if (lanImgContains) {
        return lanImgPath;
      }
    }

    return result;
  }

  /// path 相对路径
  static Widget img(
    String? path, {
    String? package,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    Key? key,
    bool wholePath = false,
    int? cachedWidth,
    int? cachedHeight,
    bool matchTextDirection = false,
  }) {
    if (path == null || path.isEmpty) {
      return const SizedBox.shrink();
    }
    if (path.startsWith('http')) {
      return CachedNetworkImage(
        key: key,
        imageUrl: path,
        width: width,
        height: height,
        color: color,
        colorBlendMode: colorBlendMode,
        cachedWidth: cachedWidth,
        cachedHeight: cachedHeight,
        fit: fit,
        matchTextDirection: matchTextDirection,
      );
    }
    if (path.startsWith(Platform.pathSeparator)) {
      return Image.file(
        File(path),
        key: key,
        width: width,
        height: height,
        color: color,
        colorBlendMode: colorBlendMode,
        cacheWidth: cachedWidth,
        cacheHeight: cachedHeight,
        matchTextDirection: matchTextDirection,
        fit: fit,
      );
    }
    String imgPath =
        wholePath ? _genWholeImgPath(path) : imagePath(path, package: package);
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        imgPath,
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.fill,
        colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
        key: key,
        matchTextDirection: matchTextDirection,
      );
    } else {
      return Image.asset(
        imgPath,
        width: width,
        height: height,
        fit: fit,
        key: key,
        color: color,
        colorBlendMode: colorBlendMode,
        cacheWidth: cachedWidth,
        cacheHeight: cachedHeight,
        matchTextDirection: matchTextDirection,
      );
    }
  }

  static String _genWholeImgPath(String path) {
    String lan = Translations.getLan();
    if (path.contains('images_$lan')) {
      return path;
    }
    if (Translations.isSupportMultiple) {
      String lanImgPath = path.replaceFirst('images/', 'images_$lan/');

      bool lanImgContains = otaResourceBundle.localContains(lanImgPath);
      if (lanImgContains) return lanImgPath;
    }

    return path;
  }

  static String string(String key, {List<String>? args, String? package}) {
    String str = '';
    if (package != null && package.isNotEmpty) {
      str = Translations.text('${package}_$key');
    }

    if (str.isEmpty) {
      str = Translations.text(key);
    }

    if (str.isEmpty) {
      // Log.e('R.string $key not found', upload: false);
      Log.w('R.string $key not found');
    }

    if (args != null && args.isNotEmpty) {
      int count = args.length;
      for (int i = 1; i <= count; i++) {
        String placeholder = '%$i';
        str = str.replaceAll(placeholder, args[i - 1] ?? '');
      }
    }
    return str.replaceAll('\\%', '%');
  }

  static List<String> array(String key, {String? package}) {
    List<String> results = [];
    if (package != null && package.isNotEmpty) {
      results = Translations.array('${package}_$key').cast<String>();
    }
    if (results.isEmpty) {
      results = Translations.array(key).cast<String>();
    }

    if (results.isEmpty) {
      // Log.e('R.array $key not found', upload: false);
      Log.w('R.array $key not found');
    }

    return results;
  }
}
