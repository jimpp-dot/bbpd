import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 明星用户加V
class UserStarVerifyWidget extends StatelessWidget {
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;

  /// 1：黄V；2：红V；3:官方；0：默认无
  final int? starVerifyTag;

  const UserStarVerifyWidget({
    super.key,
    this.width,
    this.height = 22,
    this.padding,
    this.starVerifyTag = 0,
  });

  @override
  Widget build(BuildContext context) {
    var imageNamed = '';
    if (starVerifyTag == 1) {
      /// 2023.3.8 产品说 '黄V' 改为 '管家'
      return Container(
        width: 24,
        height: 14,
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: const Color(0xFF1ECBFF), width: 1),
          color: Colors.transparent,
        ),
        alignment: AlignmentDirectional.center,
        child: Text(K.user_tag_steward,
            style: const TextStyle(
                color: Color(0xFF1ECBFF),
                fontSize: 9,
                fontWeight: FontWeight.w500)),
      );
      // imageNamed = 'ic_star_verify_user.webp';
    } else if (starVerifyTag == 2) {
      imageNamed = 'ic_red_v_user.webp';
    } else if (starVerifyTag == 3) {
      return Container(
        width: 24,
        height: 14,
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: const Color(0xFF1ECBFF), width: 1),
          color: Colors.transparent,
        ),
        alignment: AlignmentDirectional.center,
        child: Text(K.official_tag,
            style: const TextStyle(
                color: Color(0xFF1ECBFF),
                fontSize: 9,
                fontWeight: FontWeight.w500)),
      );
    }
    return imageNamed.isNotEmpty
        ? Padding(
            padding: padding ?? EdgeInsets.zero,
            child: R.img(
              imageNamed,
              package: ComponentManager.MANAGER_BASE_CORE,
              height: height,
              width: height,
              fit: BoxFit.contain,
            ),
          )
        : const SizedBox.shrink();
  }
}
