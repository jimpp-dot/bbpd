import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class HelpButton extends StatelessWidget {
  final int keyNumber;

  final double size;

  final Color color;

  const HelpButton({
    Key? key,
    required this.keyNumber,
    this.size = 24,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BaseWebviewScreen.show(
        context,
        url: Util.parseHelpUrl(keyNumber),
      ),
      child: R.img('ic_help.svg',
          color: color,
          width: size,
          height: size,
          package: ComponentManager.MANAGER_BASE_CORE),
    );
  }
}
