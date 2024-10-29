import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/bomb/model/digit_bomb_info_model.dart';
import 'package:chat_room/src/biz_plugin/bomb/repo/digit_bomb_game_repository.dart';
import 'package:chat_room/src/biz_plugin/bomb/widget/digit_bomb_game_controller.dart';

/// 输入数字炸弹,规则描述
class DigitBombEditWidget extends StatefulWidget {
  final DigitBombInfoData bombData;
  final EditWidgetType type;

  const DigitBombEditWidget(
      {super.key, required this.bombData, this.type = EditWidgetType.rule});

  static Future<T?> show<T>(
      BuildContext context, DigitBombInfoData bombData, EditWidgetType type) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black45,
      builder: (context) => DigitBombEditWidget(
        bombData: bombData,
        type: type,
      ),
    );
  }

  @override
  _DigitBombEditWidgetState createState() => _DigitBombEditWidgetState();
}

class _DigitBombEditWidgetState extends State<DigitBombEditWidget> {
  late TextEditingController _textEditController;
  late FocusNode _textFocusNode;
  bool enableEdit = false;
  bool isRule = true;
  bool canEditRule = false; //能否修改公告
  @override
  void initState() {
    super.initState();
    _textEditController = TextEditingController();
    _textFocusNode = FocusNode();
    enableEdit = widget.type != EditWidgetType.rule;
    isRule = widget.type == EditWidgetType.rule;
    canEditRule = Session.uid == widget.bombData.uid;
    if (isRule) _loadRule();
  }

  _loadRule() async {
    String rule = await DigitBombGameRepository.getDigitBombHelp(
        widget.bombData.rid, widget.bombData.id);
    _textEditController.value = TextEditingValue(
      text: rule,
    );
    _refresh();
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _textEditController.dispose();
    _textFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 312,
        height: widget.type == EditWidgetType.rule ? 287 : 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: R.color.mainBgColor,
        ),
        child: Column(
          children: [
            titleWidget(),
            if (isRule) ...[
              ruleContent(),
              if (canEditRule) createBtn(),
              const SizedBox(height: 16),
            ],
            if (!isRule) ...[
              digitContent(),
              createBtn(),
              const SizedBox(height: 16),
            ]
          ],
        ),
      ),
    );
  }

  Widget createBtn() {
    return GestureDetector(
      onTap: _onConfirm,
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
          borderRadius: BorderRadius.circular(27),
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
          height: 58,
          alignment: Alignment.center,
          child: Text(
            isRule ? K.rule_description : K.input_number,
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

  Widget ruleContent() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: SizedBox(
        height: 149.0 + (canEditRule ? 0 : 48),
        child: textFieldWidget(true),
      ),
    );
  }

  /// 设置数字
  Widget digitContent() {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 28, end: 28, top: 12, bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 48,
        ),
        child: textFieldWidget(false),
      ),
    );
  }

  Widget textFieldWidget(bool isRule) {
    return TextField(
      controller: _textEditController,
      focusNode: _textFocusNode,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
      maxLines: isRule ? 100 : 1,
      readOnly: isRule ? !canEditRule : false,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        hintText: isRule ? '' : K.click_input_number,
        isDense: true,
        hintStyle: TextStyle(color: R.color.thirdTextColor, fontSize: 14),
        counterText: '',
        enabledBorder: OutlineInputBorder(
          /*边角*/
          borderRadius: BorderRadius.all(
            Radius.circular(isRule ? 8 : 24),
          ),
          borderSide: BorderSide(
            color: R.color.secondBgColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: R.color.secondBgColor,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(isRule ? 8 : 24),
          ),
        ),
        filled: true,
        fillColor: R.color.secondBgColor,
      ),
      autofocus: false,
      autocorrect: false,
    );
  }

  _onConfirm() async {
    // 关闭键盘
    FocusScope.of(context).requestFocus(FocusNode());
    String text = _textEditController.value.text.toString();
    if (widget.type == EditWidgetType.rule) {
      if (Util.isStringEmpty(text)) {
        Fluttertoast.showToast(msg: K.content_can_not_null);
        return;
      }
      Navigator.of(context).pop();
      // 调用修改公告接口
      BaseResponse resp = await DigitBombGameRepository.digitBombSetAnnotation(
          widget.bombData.rid, widget.bombData.id, text);
      if (resp.success == true) {
        Fluttertoast.showCenter(msg: K.room_operate_success);
      } else if (resp.success == false && resp.msg != null) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    } else {
      if (Util.isStringEmpty(text)) {
        Fluttertoast.showToast(msg: K.content_can_not_null);
        return;
      }
      Navigator.of(context).pop();
      // 调用修改输入炸弹接口
      BaseResponse resp = await DigitBombGameRepository.digitBombInput(
          widget.bombData.rid, widget.bombData.id, Util.parseInt(text));
      if (resp.success == false && resp.msg != null) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    }
  }
}
