import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/vote/create/vote_create_view_model.dart';
import 'package:flutter/material.dart';

/// 创建投票-按选项投票
class VoteCreateTextOptionWidget extends StatefulWidget {
  final VoteCreateViewModel viewModel;

  const VoteCreateTextOptionWidget({super.key, required this.viewModel});

  @override
  _VoteCreateTextOptionWidgetState createState() =>
      _VoteCreateTextOptionWidgetState();
}

class _VoteCreateTextOptionWidgetState
    extends State<VoteCreateTextOptionWidget> {
  final List<TextEditingController> _textController = [];

  // 移除的controller，dispose时要处理
  final List<TextEditingController> _removedController = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var element in _textController) {
      element.dispose();
    }
    for (var element in _removedController) {
      element.dispose();
    }
    super.dispose();
  }

  TextEditingController _getEditController(int index) {
    TextEditingController controller;
    if (_textController.length > index) {
      controller = _textController[index];
    } else {
      controller = TextEditingController();
      controller.addListener(() {
        widget.viewModel.info.texts[index] = controller.text;
      });
      _textController.add(controller);
    }
    return controller;
  }

  /// 删除选项
  void _delItem(int index) {
    setState(() {
      _removedController.add(_textController.removeAt(index));
      widget.viewModel.info.texts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _renderTextOption(),
    );
  }

  /// 文本选择
  List<Widget> _renderTextOption() {
    VoteCreateViewModel viewModel = widget.viewModel;
    List<Widget> children = viewModel.info.texts
        .mapIndexed((i, e) => _renderTextOptionItem(i, _getEditController(i)))
        .toList();
    if (children.length < viewModel.voteRule!.optionMaxNum) {
      children.add(Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                viewModel.info.texts.add('');
              });
            },
            child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 16.dp, end: 16.dp, bottom: 12.dp),
                child: Row(
                  children: [
                    Container(
                      width: 36.dp,
                      height: 36.dp,
                      margin: EdgeInsetsDirectional.only(end: 12.dp),
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.dp),
                        color: R.color.secondBgColor,
                      ),
                      child: Icon(Icons.add,
                          size: 20.dp, color: R.color.secondTextColor),
                    ),
                    Text(
                        K.vote_add_item_tip(
                            ['${viewModel.voteRule!.optionMaxNum}']),
                        style: TextStyle(
                            color: R.color.secondTextColor, fontSize: 15)),
                  ],
                )),
          ),
        ],
      ));
    }
    return children;
  }

  /// 文本选项item
  Widget _renderTextOptionItem(int index, TextEditingController controller) {
    int len = widget.viewModel.info.texts.length;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              EdgeInsetsDirectional.only(top: 12.dp, start: 16.dp, end: 16.dp),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(K.vote_item_tip(['${index + 1}']),
                  style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              if (len > 2)
                GestureDetector(
                    onTap: () {
                      _delItem(index);
                    },
                    child: Text(K.room_delete,
                        style: TextStyle(
                            color: R.color.mainBrandColor, fontSize: 15))),
            ],
          ),
        ),
        Container(
          width: Util.width - 16.dp * 2,
          height: 48.dp,
          margin: EdgeInsetsDirectional.only(
              start: 16.dp, end: 16.dp, bottom: 12.dp, top: 8.dp),
          padding: EdgeInsetsDirectional.only(start: 12.dp, end: 12.dp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.dp),
            color: R.color.secondBgColor,
          ),
          child: TextField(
            controller: controller,
            style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
            maxLength: 15,
            textInputAction:
                index < len - 1 ? TextInputAction.next : TextInputAction.done,
            decoration: InputDecoration(
                hintText: K.vote_create_text_option_input_hint,
                hintStyle:
                    TextStyle(color: R.color.thirdTextColor, fontSize: 15),
                border: InputBorder.none,
                counterText: ''),
          ),
        ),
      ],
    );
  }
}
