import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:flutter/material.dart';
import '../../k.dart';

class DefendAccessoryDetail extends StatelessWidget {
  final DefendAccessory? accessory;
  const DefendAccessoryDetail({super.key, this.accessory});
  static void show(BuildContext context, DefendAccessory accessory) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Center(
          child: DefendAccessoryDetail(
            accessory: accessory,
          ),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
      useRootNavigator: true,
      routeSettings: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = 312;
    if (Util.width - 2 * 30 < width) {
      width = Util.width - 2 * 30;
    }
    return Container(
      width: width,
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 25, bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        color: R.color.mainBgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            accessory?.widgetName ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: R.color.mainTextColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 68,
            height: 97,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(16),
              color: R.color.secondBgColor,
            ),
            alignment: AlignmentDirectional.topCenter,
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(accessory?.widgetImg ?? ''),
              width: 22,
              height: 79,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            K.personal_defend_accessory_desc(
                [accessory?.widgetSendAt ?? '', accessory?.roomName ?? '']),
            style: TextStyle(
              fontSize: 16,
              color: R.color.secondTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            K.remain(['', "${accessory?.widgetExpire}"]),
            style: TextStyle(
              fontSize: 12,
              color: R.color.mainTextColor.withOpacity(0.5),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
