import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

class HeadIcon extends StatelessWidget {
  final String icon;
  final double width;
  final double height;

  const HeadIcon({
    Key? key,
    required this.icon,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipOval(
        child: SizedBox(
          width: width,
          height: width,
          child: CachedNetworkImage(
            placeholder: const CupertinoActivityIndicator(),
            errorWidgetType: ErrorWidgetType.defaultUserIcon,
            imageUrl: icon,
            fit: BoxFit.cover,
            width: width,
            height: height,
            fadeInDuration: const Duration(milliseconds: 0),
            fadeOutDuration: const Duration(milliseconds: 0),
          ),
        ),
      ),
    );
  }
}
