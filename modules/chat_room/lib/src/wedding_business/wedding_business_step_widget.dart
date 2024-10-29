import 'package:shared/shared.dart';
import 'package:chat_room/src/wedding_business/model/wedding_business_repo.dart';
import 'package:flutter/material.dart';
import '../../k.dart';
import '../wedding/widget/wedding_step_widget.dart';

/// 商业婚礼房：状态Widget
class WeddingBusinessStepWidget extends StatelessWidget {
  final int state;

  /// 0:初始状态, 1:开幕, 2: 交换戒指, 3: 闭幕
  final String? leftName;
  final String? rightName;
  final bool showOperation;
  final int rid;

  const WeddingBusinessStepWidget(
      {required this.state,
      required this.showOperation,
      required this.rid,
      this.leftName,
      this.rightName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 263,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: const Color(0xFFFFC9F3), width: 1.0),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xCCF26FFF), Color(0xCC785BFF)],
            ),
          ),
          padding: const EdgeInsetsDirectional.only(top: 13, bottom: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildName(),
              const Spacer(),
              _buildStep(),
            ],
          ),
        ),
        PositionedDirectional(
          start: 23,
          top: 13,
          child: R.img(
            'wedding/business_wedding_step_icon_1.webp',
            width: 17,
            height: 13,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
        ),
        PositionedDirectional(
          end: 23,
          top: 13,
          child: R.img(
            'wedding/business_wedding_step_icon_2.webp',
            width: 17,
            height: 13,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
        ),
        PositionedDirectional(
          top: 0,
          end: 0,
          child: GestureDetector(
            onTap: () {
              /// 蒙面互动说明
              String url = Util.getHelpUrlWithQStr('k113');
              BaseWebviewScreen.show(
                context,
                url: url,
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 8, end: 8, top: 6, bottom: 6),
              child: R.img(
                'ic_help.svg',
                width: 16,
                height: 16,
                color: Colors.white,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildName() {
    String title = K.room_wedding_ready;
    if (state != 0) {
      title = '$leftName&$rightName${K.room_wedding_step_title}';
    }
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        height: 1.1,
      ),
      maxLines: 1,
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
      widgets.add(_buildStepItem(steps[i], state > i));
      if (i < steps.length - 1) {
        widgets.add(Container(
          width: 8,
          height: 2,
          decoration: const BoxDecoration(
            color: Color(0xFFDFCAC9),
          ),
        ));
      }
    }
    if (showOperation) {
      widgets.add(const SizedBox(width: 8));
      widgets.add(_buildOperation());
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }

  Widget _buildStepItem(String title, bool isActive) {
    return Container(
      width: showOperation ? 56 : 62,
      height: 20,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: isActive ? Colors.white : Colors.white30,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? const Color(0xFF802AFE) : Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          height: 1.1,
        ),
        maxLines: 1,
      ),
    );
  }

  Widget _buildOperation() {
    /// 根据状态换文案
    String text = K.next_step;
    if (state == 0) {
      text = K.start;
    } else if (state == 3) {
      text = K.end;
    }
    return GestureDetector(
      onTap: nextStep,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 52,
        height: 20,
        alignment: AlignmentDirectional.center,
        decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(color: WeddingTheme.stepBtnBorder, width: 1),
          ),
          color: WeddingTheme.stepNextBtnBg,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
      ),
    );
  }

  /// 下一步
  void nextStep() async {
    int nextState = state + 1;
    if (nextState > 3) {
      nextState = 0;
    }
    WeddingBusinessRepo.setState(rid, nextState);
  }
}
