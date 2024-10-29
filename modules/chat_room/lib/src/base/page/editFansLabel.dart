import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 编辑粉丝铭牌
class EditFansLabel extends StatefulWidget {
  final String fansLabel;
  final int uid;

  const EditFansLabel({super.key, required this.fansLabel, required this.uid});

  @override
  EditFansLabelState createState() => EditFansLabelState();

  static show(
      {required BuildContext context,
      required String fansLabel,
      required int uid}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditFansLabel(fansLabel: fansLabel, uid: uid),
        settings: const RouteSettings(name: '/edit_fans_label'),
      ),
    );
  }
}

class EditFansLabelState extends State<EditFansLabel> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text = widget.fansLabel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.room_edit_fans_label_title,
        actionTitle: K.room_save,
        onPressed: onCommit,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsetsDirectional.only(start: 12, end: 2),
                height: 48,
                width: Util.width - 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 15,
                          color: R.color.mainTextColor,
                        ),
                        decoration: null,
                        autofocus: true,
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        controller: controller,
                      ),
                    ),
                    buildClearButton(),
                  ],
                )),
            Text(
              K.room_edit_fans_label_detail_1,
              style: TextStyle(fontSize: 15, color: R.color.secondTextColor),
            ),
            const SizedBox(height: 8),
            Text(
              K.room_edit_fans_label_detail_2,
              style: TextStyle(fontSize: 15, color: R.color.secondTextColor),
            ),
            const SizedBox(height: 8),
            Text(
              K.room_edit_fans_label_detail_3,
              style: TextStyle(fontSize: 15, color: R.color.secondTextColor),
            ),
            const SizedBox(height: 8),
            Text(
              K.room_edit_fans_label_detail_4,
              style: TextStyle(fontSize: 15, color: R.color.secondTextColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClearButton() {
    if (controller.text.isNotEmpty) {
      return IconButton(
        iconSize: 14,
        icon: Icon(
          Icons.clear,
          color: Theme.of(context).hintColor,
        ),
        onPressed: _onClearText,
      );
    } else {
      return Container();
    }
  }

  void onCommit() async {
    String newLabel = controller.text;
    if (newLabel.isEmpty) {
      Fluttertoast.showCenter(msg: K.room_label_cant_be_empty);
      return;
    }

    if (newLabel.length > 3 || !Util.isChineseStr(newLabel)) {
      Fluttertoast.showCenter(msg: K.room_edit_fans_label_tip);
      return;
    }

    if (newLabel == widget.fansLabel) {
      // 新填写的铭牌与原来的相同，不需要调用接口保存
      Fluttertoast.showCenter(msg: K.room_edit_fans_label_repeat_tip);
      return;
    }

    try {
      XhrResponse response = await Xhr.postJson(
        '${System.domain}live/labeledit',
        {
          'live_uid': '${widget.uid}',
          'label': newLabel,
        },
        throwOnError: false,
      );
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(
            msg: K.room_edit_succ, gravity: ToastGravity.CENTER);
        Navigator.pop(context);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Log.d(e.toString());
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  void _onClearText() {
    setState(() {
      controller.clear();
    });
  }
}
