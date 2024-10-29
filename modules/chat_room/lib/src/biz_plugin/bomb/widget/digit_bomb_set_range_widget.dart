import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/bomb/model/digit_bomb_info_model.dart';
import 'package:chat_room/src/biz_plugin/bomb/repo/digit_bomb_game_repository.dart';

enum contentType {
  setRange, // 设置炸弹范围
  setBomb, // 设置炸弹
}

/// 数字炸弹设置炸弹的widget
class DigitBombSetRangeWidget extends StatefulWidget {
  final DigitBombInfoData bombData;

  const DigitBombSetRangeWidget({super.key, required this.bombData});

  static Future<T?> show<T>(BuildContext context, DigitBombInfoData bombData) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black45,
      builder: (context) => DigitBombSetRangeWidget(
        bombData: bombData,
      ),
    );
  }

  @override
  _DigitBombSetRangeWidgetState createState() =>
      _DigitBombSetRangeWidgetState();
}

class _DigitBombSetRangeWidgetState extends State<DigitBombSetRangeWidget> {
  late TextEditingController _digitBombRangeEndController;
  late FocusNode _digitBombRangeFocusNode;
  late FocusNode _digitBombValueFocusNode;
  late TextEditingController _digitBombValueController;

  @override
  void initState() {
    super.initState();
    _digitBombRangeEndController = TextEditingController();
    _digitBombValueController = TextEditingController();
    _digitBombRangeFocusNode = FocusNode();
    _digitBombValueFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _digitBombRangeEndController.dispose();
    _digitBombRangeFocusNode.dispose();
    _digitBombValueFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: R.color.mainBgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          titleWidget(),
          content(contentType.setRange),
          content(contentType.setBomb),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 24),
            child: createBtn(),
          ),
        ],
      ),
    );
  }

  Widget createBtn() {
    return GestureDetector(
      onTap: _digitBombSetRangeWidget,
      child: Container(
        width: 197,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: R.color.mainBrandGradientColors,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          K.room_confirm,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }

  Widget titleWidget() {
    return Stack(
      children: [
        Container(
          height: 70,
          alignment: Alignment.center,
          child: Text(
            K.set_bomb,
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        PositionedDirectional(
          end: 0,
          top: 0,
          child: GestureDetector(
            onTap: () => {Navigator.of(context).pop()},
            child: const SizedBox(
              width: 50,
              height: 50,
            ),
          ),
        ),
        PositionedDirectional(
          end: 15,
          top: 15,
          child: GestureDetector(
            onTap: () => {Navigator.of(context).pop()},
            child: R.img("tour/tour_create_close.webp",
                width: 20,
                height: 20,
                package: ComponentManager.MANAGER_BASE_ROOM),
          ),
        ),
      ],
    );
  }

  Widget content(contentType type) {
    String title;
    String placeholderTitle;

    if (type == contentType.setRange) {
      title = K.set_range;
      placeholderTitle = K.no_more_than_10000;
    } else {
      title = K.set_bomb;
      placeholderTitle = K.setNumberOrDefaultRandom;
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 4),
            child: Text(
              title,
              style: TextStyle(color: R.color.mainTextColor, fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 48,
              ),
              child: TextField(
                controller: type == contentType.setRange
                    ? _digitBombRangeEndController
                    : _digitBombValueController,
                focusNode: type == contentType.setRange
                    ? _digitBombRangeFocusNode
                    : _digitBombValueFocusNode,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                enableInteractiveSelection: true,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  hintText: placeholderTitle,
                  isDense: true,
                  hintStyle:
                      TextStyle(color: R.color.thirdTextColor, fontSize: 14),
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    /*边角*/
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24), //边角为5
                    ),
                    borderSide: BorderSide(
                      color: R.color.secondBgColor,
                      width: 1, //边线宽度为2
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: R.color.secondBgColor,
                      width: 1, //宽度为5
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(45), //边角为30
                    ),
                  ),
                  filled: true,
                  fillColor: R.color.secondBgColor,
                ),
                autofocus: false,
                autocorrect: false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _digitBombSetRangeWidget() async {
    // 关闭键盘
    FocusScope.of(context).requestFocus(FocusNode());
    String bombRangeEnd = _digitBombRangeEndController.value.text.toString();
    String bombValue = _digitBombValueController.value.text.toString();

    if (Util.isStringEmpty(bombRangeEnd)) {
      Fluttertoast.showToast(msg: K.bomb_range_cannot_be_empty);
      return;
    }

    // 调用设置数字炸弹接口
    var resp = await DigitBombGameRepository.setDigitBomb(
      rid: widget.bombData.rid,
      id: widget.bombData.id,
      min: 0,
      max: Util.parseInt(bombRangeEnd),
      bomb: Util.parseInt(bombValue),
      bombMode: Util.isStringEmpty(bombValue) ? 1 : 2,
    );
    if (!(resp.success == true)) {
      Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
    }

    Navigator.of(context).pop();
  }
}
