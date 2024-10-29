import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_beans.dart';

import '../../../k.dart';

class WeddingStepWidget extends StatelessWidget {
  const WeddingStepWidget({
    super.key,
    required this.weddingState,
    required this.weddingTitle,
    this.operationBuilder,
  });

  final WeddingState weddingState;
  final String weddingTitle;
  final Widget Function()? operationBuilder;

  int get _stepIndex {
    return WeddingState.values.indexOf(weddingState);
  }

  bool get _needBuildStep {
    return _stepIndex > 0 || _showOperation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: WeddingTheme.stepBgBorder, width: 2.0),
        color: WeddingTheme.stepBgColor,
      ),
      padding: const EdgeInsetsDirectional.only(top: 11, bottom: 13),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildName(),
          if (_needBuildStep) ...[
            const SizedBox(height: 11),
            _buildStep(),
          ],
        ],
      ),
    );
  }

  Widget _buildName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 21.dp),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              R.img(
                'wedding_step_flower_left.png',
                width: 17,
                height: 13,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
              const SizedBox(width: 20),
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 23),
                  child: Text(
                    weddingTitle,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              R.img(
                'wedding_step_flower_right.png',
                width: 17,
                height: 13,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ],
          ),
        ),
        SizedBox(width: 21.dp),
      ],
    );
  }

  Widget _buildStep() {
    List<String> steps = [
      K.room_wedding_state_opening,
      K.room_wedding_state_ring,
      K.room_wedding_state_ending
    ];
    List<Widget> widgets = [];
    for (int i = 0; i < steps.length; i++) {
      widgets.add(_buildStepItem(steps[i], _stepIndex > i, _showOperation()));
      if (i < steps.length - 1) {
        widgets.add(Container(
          width: 8,
          height: 2,
          decoration: BoxDecoration(
            color: WeddingTheme.stepBtnBorder,
          ),
        ));
      }
    }
    if (_showOperation()) {
      widgets.add(const SizedBox(width: 10));
      widgets.add(operationBuilder!());
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }

  bool _showOperation() => operationBuilder != null;

  static Widget buildNext(GestureTapCallback onTapNext) {
    return InkWell(
      onTap: onTapNext,
      child: _buildOperation(K.next_step),
    );
  }

  static Widget buildEnd(GestureTapCallback onTapEnd) {
    return InkWell(
      onTap: onTapEnd,
      child: _buildOperation(K.room_wedding_end),
    );
  }

  static Widget _buildOperation(String title) {
    final String text = title;
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 10, end: 10, top: 2, bottom: 2),
      decoration: ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(color: WeddingTheme.stepBtnBorder, width: 1),
        ),
        color: WeddingTheme.stepNextBtnBg,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }

  Widget _buildStepItem(String title, bool isActive, bool showNext) {
    final double horPadding = showNext ? 6 : 9;
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: horPadding, end: horPadding, top: 2, bottom: 2),
      decoration: ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(color: WeddingTheme.stepBtnBorder, width: 1),
        ),
        color: isActive
            ? WeddingTheme.stepBtnActive
            : WeddingTheme.stepBtnNotActive,
      ),
      child: Text(
        title,
        style: TextStyle(
            color: isActive
                ? WeddingTheme.stepBtnTextActive
                : WeddingTheme.stepBtnTextNotActive,
            fontSize: 10),
      ),
    );
  }
}

class WeddingTheme {
  static Color get stepBgBorder => const Color(0xFFFFD9AA);

  static Color get stepBgColor => const Color(0x80A14646);

  static Color get stepBtnBorder => const Color(0xFFDFCAC9);

  static Color get stepBtnActive => Colors.white;

  static Color get stepBtnNotActive => const Color(0xFFE49696);

  static Color get stepBtnTextActive => const Color(0xFFFF5252);

  static Color get stepNextBtnBg => const Color(0xFFFF6060);

  static Color get stepBtnTextNotActive => Colors.white;
}
