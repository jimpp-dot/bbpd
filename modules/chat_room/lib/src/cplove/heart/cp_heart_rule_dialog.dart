import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class CpHeartRuleDialog extends StatelessWidget {
  const CpHeartRuleDialog({Key? key}) : super(key: key);

  static void showCpHeartRuleDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return const CpHeartRuleDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = Util.width - 64;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          width: width,
          height: width * 1.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(16),
          ),
          child: Stack(
            children: [
              BaseWebviewScreen(
                url:
                    "https://page.${System.mainDomain}/tools/rule-room-heartbeat/rule",
                transparent: true,
                embeddedWidget: true,
              ),
              PositionedDirectional(
                  top: 8,
                  end: 8,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: R.img(
                      'icon_close.svg',
                      width: 40,
                      height: 40,
                      color: Colors.white,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
