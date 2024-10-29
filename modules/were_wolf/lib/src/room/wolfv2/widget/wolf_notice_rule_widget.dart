import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:were_wolf/wolf_manager.dart';
import 'high_light_item_widget.dart';

class MessageRuleWidget extends StatelessWidget {
  final List? list;

  const MessageRuleWidget({super.key, this.list});

  @override
  Widget build(BuildContext context) {
    if (list == null || list!.isEmpty) {
      return const SizedBox.shrink();
    }
    List<Widget> res = [];
    for (var element in list!) {
      String content = element['content'] ?? '';
      List highLightContent = element['highLightContent'] ?? [];
      res.add(
        Padding(
            padding: const EdgeInsetsDirectional.only(top: 2, bottom: 2),
            child: WolfHighLightWidget(content, highLightContent)),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: res,
    );
  }
}
