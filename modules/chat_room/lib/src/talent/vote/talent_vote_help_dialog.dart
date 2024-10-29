import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/talent/data/talent_repo.dart';

// 编辑节目信息输入框
class TalentVoteHelpDialog extends StatefulWidget {
  final int rid;

  const TalentVoteHelpDialog({super.key, required this.rid});

  @override
  _TalentAddIntroDialogState createState() => _TalentAddIntroDialogState();

  static Future<String?> show(BuildContext context, int rid) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: TalentVoteHelpDialog(
              rid: rid,
            ),
          );
        });
  }
}

class _TalentAddIntroDialogState extends State<TalentVoteHelpDialog> {
  String? _manualContent;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    DataRsp<String> resp = await TalentRepo.starManual();
    if (resp.success == true && !resp.isEmpty) {
      setState(() {
        _manualContent = resp.data;
      });
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312.dp,
      height: 330.dp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.dp),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 56.dp,
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.center,
              children: [
                Center(
                  child: Text(
                    K.room_talent_help_title,
                    style: TextStyle(
                      color: const Color(0xFF202020),
                      fontSize: 17.dp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: EdgeInsets.all(16.dp),
                      child: Icon(
                        Icons.close_rounded,
                        size: 24.dp,
                        color: const Color(0xFFA5A5A5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dp),
            child: const Divider(height: 0.5, color: Color(0x14202020)),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.dp),
              child: Text(
                _manualContent ?? '',
                style: TextStyle(
                  color: const Color(0xFF202020),
                  fontSize: 14.dp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
