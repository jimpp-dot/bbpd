import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/generated/connector_bar.pb.dart';
import 'label_edit_logic.dart';

/// 编辑座位标签
///
class LabelEditPanel extends StatefulWidget {
  final ChatRoomData room;

  const LabelEditPanel(this.room, {super.key});

  @override
  State<LabelEditPanel> createState() => _LabelEditPanelState();

  static Future show(BuildContext context, ChatRoomData room) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(16)),
      ),
      routeSettings: const RouteSettings(name: '/LabelEditPanel'),
      builder: (context) => LabelEditPanel(room),
    );
  }
}

class _LabelEditPanelState extends State<LabelEditPanel> {
  late LabelEditLogic _logic;

  @override
  void initState() {
    super.initState();
    _logic = LabelEditLogic(widget.room.rid);
    GetManager().put(_logic);
  }

  @override
  void dispose() {
    GetManager().delete<LabelEditLogic>();
    super.dispose();
  }

  void _submit() async {
    bool result = await _logic.saveLabel();
    if (result == true) {
      Navigator.of(context).maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 611,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          const SizedBox(height: 4),
          Expanded(child: _buildBody()),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).maybePop();
                    },
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(
                          color: Color(0xFFF7F8FA), shape: StadiumBorder()),
                      child: Text(
                        '取消',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: _submit,
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        '提交',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Util.iphoneXBottom + 14),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 69,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '编辑座位标签',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.9),
                      fontWeight: FontWeight.w600),
                ),
                Obx(
                  () {
                    if (_logic.auditStatus.value == 0) {
                      return Text(
                        '标签审核中',
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: R.img(
                BaseAssets.close_icon_svg,
                width: 20,
                height: 20,
                color: Colors.black.withOpacity(0.5),
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget _buildBody() {
    // double keyboard = MediaQuery.of(context).viewInsets.bottom;
    return _logic.obx(
      (state) => ListView.builder(
        // padding: EdgeInsetsDirectional.only(bottom: keyboard),
        itemBuilder: (context, index) => _TagInputItem(_logic.state![index]),
        itemCount: _logic.state?.length ?? 0,
      ),
      onError: (msg) => ErrorData(
        error: msg,
        onTap: () => _logic.load(),
      ),
      onLoading: const Loading(),
    );
  }
}

class _TagInputItem extends StatefulWidget {
  final PosLabelInfo item;

  const _TagInputItem(this.item);

  @override
  State<_TagInputItem> createState() => _TagInputItemState();
}

class _TagInputItemState extends State<_TagInputItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Row(
        children: [
          Container(
            width: 52.5,
            alignment: Alignment.center,
            child: NumText(
              '${widget.item.pos}',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _displayInputMessage(context),
              child: Container(
                height: 44,
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const ShapeDecoration(
                    color: Color(0xFFF7F8FA), shape: StadiumBorder()),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.label.isEmpty ? '普通' : widget.item.label,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: widget.item.label.isEmpty
                              ? Colors.black12
                              : Colors.black,
                          fontWeight: widget.item.label.isEmpty
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    if (widget.item.desc.isNotEmpty)
                      Text(
                        widget.item.desc,
                        style: const TextStyle(
                            fontSize: 11, color: Color(0xFFFD7B08)),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  _displayInputMessage(BuildContext context) async {
    String? result = await displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      builder: (BuildContext context) {
        return _LabelTextField(widget.item.label);
      },
      maxHeightRatio: 0.75,
    );
    if (result != null && mounted) {
      setState(() {
        widget.item.label = result;
      });
    }
  }
}

class _LabelTextField extends StatefulWidget {
  final String currentText;

  const _LabelTextField(this.currentText);

  @override
  State<_LabelTextField> createState() => _LabelTextFieldState();
}

class _LabelTextFieldState extends State<_LabelTextField> {
  final TextEditingController _textController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _textController.text = widget.currentText;
  }

  _onSubmitted(String value) async {
    Navigator.of(context).pop(value);
  }

  @override
  Widget build(BuildContext context) {
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      height: 50.0 + keyboard,
      padding: EdgeInsets.only(bottom: keyboard),
      decoration: const BoxDecoration(color: Color(0xFFF7F8FA)),
      child: Container(
        height: 50.0,
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(start: 16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                cursorColor: R.color.mainBrandColor,
                keyboardAppearance: Brightness.light,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.black12),
                  hintText: '普通',
                  isDense: true,
                  counterText: '',
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                maxLines: 1,
                minLines: 1,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontFamily: Util.fontFamily),
                controller: _textController,
                autocorrect: true,
                autofocus: true,
                inputFormatters: [LengthLimitingTextInputFormatter(4)],
                onSubmitted: _onSubmitted,
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _onSubmitted(_textController.value.text),
              child: Container(
                width: 58,
                height: 28,
                margin: const EdgeInsetsDirectional.only(end: 12, start: 8),
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: R.color.mainBrandColor,
                ),
                alignment: AlignmentDirectional.center,
                child: Text(
                  K.room_confirm,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
