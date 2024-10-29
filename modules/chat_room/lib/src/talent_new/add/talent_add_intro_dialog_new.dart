import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../talent_constants_new.dart';

// 编辑节目信息输入框
class TalentAddIntroNewDialog extends StatefulWidget {
  final String text;

  const TalentAddIntroNewDialog({super.key, required this.text});

  @override
  _TalentAddIntroNewDialogState createState() =>
      _TalentAddIntroNewDialogState();

  static Future<String?> show(BuildContext context, String text) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: TalentAddIntroNewDialog(
              text: text,
            ),
          );
        });
  }
}

class _TalentAddIntroNewDialogState extends State<TalentAddIntroNewDialog> {
  late String _content;

  @override
  void initState() {
    super.initState();
    _content = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312.dp,
      height: 204.dp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.dp),
      ),
      child: Column(
        children: [
          SizedBox(height: 24.dp),
          Text(
            K.room_talent_edit_intro_dialog,
            style: TextStyle(
              color: const Color(0xFF313131),
              fontSize: 16.dp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 19.dp),
          Container(
            margin: EdgeInsetsDirectional.only(start: 23.dp, end: 25.dp),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7F9),
              borderRadius: BorderRadius.circular(23.dp),
            ),
            child: TextFormField(
              initialValue: _content,
              onChanged: (text) {
                Log.d(tag: TAG, ' onchange intro->$text');
                _content = text;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: K.room_talent_edit_intro_hit,
                hintStyle: TextStyle(
                  color: const Color(0x33313131),
                  fontSize: 13.dp,
                ),
                counterText: '',
                // hide maxLength hit
                contentPadding: EdgeInsetsDirectional.only(
                  start: 15.dp,
                  bottom: 3.dp,
                ), // for text center
              ),
              keyboardType: TextInputType.text,
              maxLength: 20,
              style: TextStyle(color: const Color(0xFF313131), fontSize: 13.dp),
            ),
          ),
          SizedBox(height: 24.dp),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(_content);
            },
            child: Container(
              height: 55.dp,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 23.dp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: buttonColors,
                ),
                borderRadius: BorderRadius.circular(27.5.dp),
              ),
              child: Text(
                K.room_confirm,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.dp,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
