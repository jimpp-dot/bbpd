import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/heartpass/model/heart_pass_repos.dart';
import 'package:chat_room/src/chatRoomData.dart';

/// 心动闯关-规则描述，房主可以修改
class HeartPassRuleDialog extends StatefulWidget {
  final ChatRoomData room;

  const HeartPassRuleDialog({super.key, required this.room});

  static Future show(BuildContext context, ChatRoomData room) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black45,
        builder: (context) => HeartPassRuleDialog(
              room: room,
            ));
  }

  @override
  _HeartPassRuleDialogState createState() => _HeartPassRuleDialogState();
}

class _HeartPassRuleDialogState extends State<HeartPassRuleDialog> {
  late TextEditingController _textEditController;
  late FocusNode _textFocusNode;
  bool canEditRule = false; //能否修改公告

  @override
  void initState() {
    super.initState();
    _textEditController = TextEditingController();
    _textFocusNode = FocusNode();
    canEditRule = widget.room.isCreator || widget.room.isReception;
    _loadRule();
  }

  _loadRule() async {
    String rule = await HeartPassRepos.gameRule(widget.room.rid);
    if (!mounted) return;
    if (rule.isEmpty) {
      rule = K.room_heart_pass_rule_default;
    }
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
    return Center(
      child: Material(
        child: Container(
          width: 312,
          height: 287,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            color: R.color.mainBgColor,
          ),
          child: Column(
            children: [
              _renderTitle(),
              ...[
                _renderRuleContent(),
                if (canEditRule) _createBtn(),
                const SizedBox(
                  height: 16,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _createBtn() {
    return GestureDetector(
      onTap: _onConfirm,
      child: Container(
        width: 197,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: [Color(0xFF2DF9F8), Color(0xFF26A6FF)],
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

  Widget _renderTitle() {
    return Stack(
      children: [
        Container(
          height: 58,
          alignment: Alignment.center,
          child: Text(
            K.rule_description,
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

  Widget _renderRuleContent() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 28, end: 28, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 149.0 + (canEditRule ? 0 : 48),
        child: _renderTextField(),
      ),
    );
  }

  Widget _renderTextField() {
    return TextField(
      controller: _textEditController,
      focusNode: _textFocusNode,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
      maxLines: 100,
      readOnly: !canEditRule,
      // decoration: canEditRule ? InputDecoration(
      //   contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      //   hintText: '',
      //   isDense: true,
      //   hintStyle: TextStyle(color: R.color.thirdTextColor, fontSize: 14),
      //   counterText: '',
      //   enabledBorder: OutlineInputBorder(
      //     /*边角*/
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8),
      //     ),
      //     borderSide: BorderSide(
      //       color: R.color.secondBgColor,
      //       width: 1,
      //     ),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderSide: BorderSide(
      //       color: R.color.secondBgColor,
      //       width: 1,
      //     ),
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8),
      //     ),
      //   ),
      //   filled: true,
      //   fillColor: R.color.secondBgColor,
      // ) : null,
      decoration: null,
      autofocus: false,
      autocorrect: false,
    );
  }

  _onConfirm() async {
    // 关闭键盘
    FocusScope.of(context).requestFocus(FocusNode());
    String content = _textEditController.value.text.toString();
    if (Util.isStringEmpty(content)) {
      Fluttertoast.showToast(msg: K.content_can_not_null);
      return;
    }
    Navigator.pop(context);
    await HeartPassRepos.editGameRule(widget.room.rid, content);
  }
}
