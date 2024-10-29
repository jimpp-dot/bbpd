import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class PackageAtMicBottom extends StatelessWidget {
  final int package;
  final bool display;
  final double width;

  const PackageAtMicBottom(
      {super.key,
      required this.package,
      required this.display,
      required this.width});

  String _getValue() {
    if (package < 1000 * 100) {
      return (package / 100).toStringAsFixed(1).toString();
    } else if (package < 10000 * 100) {
      return (package ~/ 100).toString();
    } else {
      return '${(package ~/ (100 * 1000)).toStringAsFixed(1)}k';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (display == false) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 12,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: const Color(0xFFFEFEFE).withOpacity(0.12),
      ),
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(
            'ic_package_at_mic.png',
            width: 8,
            height: 8,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
          const SizedBox(
            width: 1,
          ),
          Text(
            _getValue(),
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
