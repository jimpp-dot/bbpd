import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import '../pbModel/generated/boot_app_dialog.pb.dart';

class BootActivityDialog extends StatefulWidget {
  final BootAppPopupCommon commonData;
  final int bizId;
  const BootActivityDialog({
    Key? key,
    required this.commonData,
    required this.bizId,
  }) : super(key: key);

  static Future show(
      BuildContext context, BootAppPopupCommon commonData, int bizId) async {
    return DialogQueue.root.enqueue(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        routeSettings: RouteSettings(name: 'BootActivityDialog_$bizId'),
        builder: (context) {
          return BootActivityDialog(commonData: commonData, bizId: bizId);
        });
  }

  @override
  _BootActivityDialogState createState() => _BootActivityDialogState();
}

class _BootActivityDialogState extends State<BootActivityDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        key: ValueKey('BootActivityDialog_${widget.bizId}'),
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  SchemeUrlHelper.instance()
                      .checkSchemeUrlAndGo(context, widget.commonData.schema);
                },
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: Util.getRemoteImgUrl(widget.commonData.image),
                  width: 280.dp,
                ),
              ),
            ),
            SizedBox(height: 30.dp),
            GestureDetector(
              child: R.img(BaseAssets.shared$ic_close_with_circle_border_svg,
                  width: 48.dp, height: 48.dp, fit: BoxFit.contain),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
