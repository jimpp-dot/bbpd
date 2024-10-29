import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat/k.dart';

import '../model/pbModel/generated/gift_sign_check.pb.dart';

class DisplayGiftSignMessage extends StatelessWidget {
  final MessageContent message;
  final Map extra;

  const DisplayGiftSignMessage(
      {Key? key, required this.message, required this.extra})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checkGiftSignOpen();
      },
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  width: 200,
                  height: 200,
                  cachedWidth: 200,
                  cachedHeight: 200,
                  imageUrl: extra['thumb'] ?? '',
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    message.content,
                    overflow: TextOverflow.clip,
                    style: Util.youSheBiaoTiYuan.copyWith(
                        fontSize: 24, color: Colors.white, height: 1.25),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  K.chat_check_detail,
                  style: TextStyle(
                      color: R.colors.highlightColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: R.colors.highlightColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void checkGiftSignOpen() async {
    final url = '${System.domain}go/mate/activity/gift_sign/checkOpen';
    try {
      final response = await Xhr.get(url,
          queryParameters: {'notice_time': message.sentTime},
          pb: true,
          throwOnError: true);
      ResGiftCheckOpen checkOpen =
          ResGiftCheckOpen.fromBuffer(response.bodyBytes);
      if (checkOpen.success) {
        String schema = checkOpen.data;
        Log.d('checkGiftSignOpen: ${checkOpen.data}');
        SchemeUrlHelper.instance().checkSchemeUrlAndGo(System.context, schema);
      } else {
        Fluttertoast.showCenter(msg: checkOpen.msg);
      }
    } catch (e) {
      Fluttertoast.showCenter(msg: e.toString());
    }
  }
}
