import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';

/// 弹框输入文本并返回
class InputTextPanel extends StatefulWidget {
  final int maxLengthLimit; // 小于等于0，没有最大字数限制

  const InputTextPanel({super.key, this.maxLengthLimit = 0});

  static Future<String?> open(BuildContext context,
      {int maxLengthLimit = 0}) async {
    String? result = await displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.01),
      builder: (BuildContext context) {
        return InputTextPanel(
          maxLengthLimit: maxLengthLimit,
        );
      },
      maxHeightRatio: 0.75,
    );
    return result;
  }

  @override
  _InputTextPanelState createState() => _InputTextPanelState();
}

class _InputTextPanelState extends State<InputTextPanel> {
  late FocusNode _focusNode;
  final TextEditingController _textController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  _onSubmitted(String value) async {
    if (value.isEmpty) return;

    if (mounted) {
      Navigator.of(context).pop(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    double keyboard = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50.0,
        padding: const EdgeInsetsDirectional.only(start: 0.0),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom +
                ((keyboard == 0.0 && Util.isIphoneX) ? 34.0 : 0.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 50.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: TextField(
                        cursorColor: R.color.mainBrandColor,
                        keyboardAppearance: Brightness.light,
                        maxLength: widget.maxLengthLimit,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.2),
                            fontSize: 16,
                            fontFamily: Util.fontFamily,
                          ),
                          hintText: K.base_please_input,
                          isDense: true,
                          counterText: '',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.send,
                        textAlign: TextAlign.start,
                        maxLines: 30,
                        minLines: 1,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: Util.fontFamily),
                        focusNode: _focusNode,
                        controller: _textController,
                        autocorrect: true,
                        autofocus: true,
                        onSubmitted: _onSubmitted,
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _onSubmitted(_textController.value.text),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(end: 12, start: 8),
                      child: Container(
                        width: 58,
                        height: 28,
                        decoration: BoxDecoration(
                          color: R.color.mainBrandColor,
                          borderRadius: BorderRadius.circular(15.5),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          K.sure,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
