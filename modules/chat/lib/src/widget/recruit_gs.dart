import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

/// 显示狼人杀gs招募按钮
/// 功能不可用、代码逻辑不显示
///
class RecruitGs extends StatefulWidget {
  final int targetId;
  final GestureTapCallback? onTap;

  const RecruitGs({super.key, required this.targetId, this.onTap});

  @override
  _RecruitGsState createState() => _RecruitGsState();
}

class _RecruitGsState extends State<RecruitGs> {
  bool _recruit = false; //显示狼人杀gs招募按钮

  _postRecruit() async {
    XhrResponse response =
        await Xhr.postJson('${System.domain}userPromote/sendInvite', {
      'to_uid': '${widget.targetId}',
    });
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        if (mounted) {
          setState(() {
            _recruit = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_recruit) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (widget.onTap != null) widget.onTap!();
          _postRecruit();
        },
        child: Row(
          children: <Widget>[
            const Spacer(),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: R.colors.secondBgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                K.chat_recruit_gs,
                style: TextStyle(fontSize: 15, color: R.colors.secondTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
