import 'package:flutter/material.dart';

class WolfHighLightWidget extends StatelessWidget {
  final String? message;
  final List highLightContent;
  final double textSize;

  const WolfHighLightWidget(this.message, this.highLightContent,
      {super.key, this.textSize = 12.0});

  @override
  Widget build(BuildContext context) {
    if (message?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }

    String messageStr = message ?? '';
    List<TextSpan> children = [];
    for (int i = 0; i < highLightContent.length; i++) {
      if (messageStr.isEmpty) {
        break;
      }
      String element = highLightContent[i];
      List<String?> arry = messageStr.split(element);

      if (arry.isNotEmpty && arry[0] != null && arry[0]!.isNotEmpty) {
        children.add(
          TextSpan(
            text: arry[0],
            style: TextStyle(color: Colors.white, fontSize: textSize),
          ),
        );
      }

      if (arry.length > 1) {
        children.add(TextSpan(
            text: element,
            style:
                TextStyle(color: const Color(0xFFF8B32D), fontSize: textSize)));
        messageStr = arry[1] ?? '';
      } else {
        messageStr = '';
      }
    }

    if (messageStr.isNotEmpty) {
      children.add(
        TextSpan(
          text: message,
          style: TextStyle(color: Colors.white, fontSize: textSize),
        ),
      );
    }
    return Text.rich(TextSpan(children: children), softWrap: true);
  }
}
