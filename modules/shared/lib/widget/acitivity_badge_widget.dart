import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/dart_extensions/cached_network_image_ext.dart';
import '../dart_extensions/text_extension.dart';
import '../shared.dart';

/// 运营活动勋章
class ActivityBadgeWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final double height;
  final bool? isMask;
  final String? icon;

  const ActivityBadgeWidget({super.key, this.padding, this.isMask = false, this.height = 26.0, this.icon});

  @override
  Widget build(BuildContext context) {
    CachedNetworkImage cachedNetworkImage = CachedNetworkImage(
      imageUrl: Util.resizeUrl(icon ?? '', rh: 68),
      height: height,
      cachedHeight: height.px,
      fit: BoxFit.fitHeight,
      errorWidget: const SizedBox.shrink(),
    );

    return Container(
      padding: padding ?? EdgeInsetsDirectional.zero,
      child: isMask == false ? cachedNetworkImage : cachedNetworkImage.toShaderMaskBlack(),
    );
  }
}
