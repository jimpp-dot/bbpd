import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/dart_extensions/extensions_common.dart';

/// 用户头像控件
class CommonAvatar extends StatelessWidget {
  final String? path; // 图片路径，无需手动拼接cdn前缀
  final double size; // 图片大小
  final BoxFit fit; // 缩放方式，默认 BoxFit.cover
  final Widget? loadingWidget; // 加载中占位图
  final Widget? errorWidget; // 加载失败占位图
  final String? suffix; // 路径后缀，默认 !head150
  final BoxShape? shape; // 如需圆形头像，指定为 BoxShape.circle
  final BorderRadiusGeometry? borderRadius; // 如需圆角头像，传入指定的radius
  final VoidCallback? onTap; // 点击事件回调
  final int? sex; //性别，根据性别区分默认图
  final bool? resizeCacheWidth; // 根据size计算图片在内存中的大小
  final Color? color;
  final BlendMode? colorBlendMode;
  final bool isMusic;
  final String? _url;
  final bool onlyFirstFrame; //是否只取第一帧

  CommonAvatar({
    super.key,
    required this.path,
    this.size = 56,
    this.fit = BoxFit.cover,
    this.loadingWidget,
    this.errorWidget,
    this.suffix = '!head150',
    this.shape,
    this.borderRadius,
    this.onTap,
    this.sex,
    this.resizeCacheWidth,
    this.color,
    this.colorBlendMode,
    this.isMusic = false,
    this.onlyFirstFrame = false,
  }) : _url = getUrl(path, suffix);

  static String? getUrl(String? path, String? suffix) {
    String? url;
    if (path != null && path.trim().isNotEmpty) {
      url = Util.imageFullUrl(path);
      if (suffix != null &&
          !url.contains(RegExp(r'!head(\d+)')) &&
          !url.contains(RegExp(r'!cover(\d+)')) &&
          !url.contains('x-oss-process=image/resize')) {
        url = url + suffix;
      }
      url = Util.recombineUrl(url);
    }
    return url;
  }

  Widget _buildError() {
    if (isMusic) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: R.img(
          'ic_music_none.webp',
          width: size,
          height: size,
          color: Colors.white,
          package: ComponentManager.MANAGER_BASE_CORE,
        ),
      );
    }

    String iconPath = 'ic_user_none_one.png';
    // int random = randomGen(1, 4);
    // if (random == 1) {
    //   iconPath = 'ic_user_none_one.png';
    // } else if (random == 2) {
    //   iconPath = 'ic_user_none_two.png';
    // } else if (random == 3) {
    //   iconPath = 'ic_user_none_three.png';
    // } else if (random == 4) {
    //   iconPath = 'ic_user_none_four.png';
    // }
    return R.img(iconPath,
        width: size, height: size, package: ComponentManager.MANAGER_BASE_CORE);
  }

  Widget _buildLoading() {
    return SizedBox(
      width: size,
      height: size,
      child: Container(
        color: R.color.dividerColor
            .withOpacity(R.color.dividerColor.opacity * 0.8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (_url == null || _url!.trim().isEmpty) {
      child = errorWidget ?? _buildError();
    } else {
      // Log.d('_url:$_url');
      child = CachedNetworkImage(
        imageUrl: _url,
        width: size,
        height: size,
        fit: fit,
        placeholder: loadingWidget ?? _buildLoading(),
        errorWidget: errorWidget ?? _buildError(),
        alignment: Alignment.center,
        color: color,
        colorBlendMode: colorBlendMode,
        cachedWidth: resizeCacheWidth == true
            ? ((size * Util.devicePixelRatio).toInt())
            : null,
        cachedHeight: resizeCacheWidth == true
            ? ((size * Util.devicePixelRatio).toInt())
            : null,
        onlyFirstFrame: onlyFirstFrame,
        key: Key(_url!),
      );
    }

    if (shape == BoxShape.circle) {
      child = ClipOval(
        child: child,
      );
    } else if (borderRadius != null) {
      child = ClipRRect(
        borderRadius: borderRadius!.resolve(Directionality.of(context)),
        child: child,
      );
    }

    if (onTap != null) {
      child = GestureDetector(
        onTap: onTap,
        child: child,
      );
    }

    return child;
  }
}
