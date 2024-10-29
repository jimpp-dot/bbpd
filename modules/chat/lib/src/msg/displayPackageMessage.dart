import 'dart:convert';

import 'package:chat/k.dart';
import 'package:shared/shared.dart' hide SliverAppBar, Icon;
import 'package:chat/src/msg/config.dart';
import 'package:flutter/material.dart';

import '../page/group_package_detail.dart';
import '../page/package_dialog.dart';

/// 红包消息
class DisplayPackageMessage extends StatelessWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;
  final PageRefer? refer;

  const DisplayPackageMessage(
      {super.key,
      required this.message,
      required this.extra,
      this.direction,
      this.refer});

  void _showPackageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PackageDialog(
          id: Util.parseInt(extra['id'], 0),
          type: message.conversationType,
          messageId: message.messageId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!extra.containsKey('type')) {
          return;
        }
        if (message.inlineExtra != null && message.inlineExtra!.isNotEmpty) {
          try {
            dynamic res = json.decode(message.inlineExtra!);
            if (res is Map &&
                res.containsKey('display') &&
                res['display'] == 'result') {
              GroupPackageDetail.openGroupPackageDetail(
                  context, Util.parseInt(extra['id'], 0), refer);
              return;
            }
          } catch (e) {}
        }
        _showPackageDialog(context);
      },
      child: SizedBox(
        width: 192.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffFFA844),
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              ),
              padding: const EdgeInsets.only(left: 14.0, top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    R.imagePath('chat_package.svg',
                        package: ComponentManager.MANAGER_CHAT),
                    width: 26.0,
                    height: 36.0,
                  ),
                  PackageText(
                    extra: extra,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: direction != MessageDisplayDirection.Left
                    ? R.colors.thirdBgColor
                    : R.colors.secondBgColor,
                borderRadius: direction != MessageDisplayDirection.Left
                    ? const BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(8.0))
                    : const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(8.0)),
              ),
              height: 22.0,
              width: 192.0,
              padding: const EdgeInsets.only(left: 10.0),
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                Util.appName + K.red_envelope,
                style:
                    TextStyle(fontSize: 10.0, color: R.colors.secondTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PackageText extends StatelessWidget {
  final Map extra;

  const PackageText({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    if (extra['type'] == 'package' || extra['description'] == null) {
      return Container(
        height: 38.0,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10.0),
        child: SizedBox(
          width: 138,
          child: Text(
            K.red_envelope,
            style: TextStyle(color: R.colors.mainTextColor, fontSize: 14.0),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    } else {
      String desc = extra['description'] ?? ' ';
      return Container(
        height: 38.0,
        margin: const EdgeInsets.only(left: 10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 138,
                child: Text(
                  desc,
                  maxLines: 1,
                  style:
                      TextStyle(color: R.colors.mainTextColor, fontSize: 14.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                height: 2.0,
              ),
              Text(K.get_red_envelope,
                  style:
                      TextStyle(color: R.colors.mainTextColor, fontSize: 10.0))
            ]),
      );
    }
  }
}
