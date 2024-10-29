import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/lottery/model/lottery_model.dart';
import 'package:shared/assets.dart';

/// Lottery功能的UI工具类
class LotteryUiHelper {
  LotteryUiHelper._();

  static Widget buildUserItem(BuildContext context, LotteryWinner item,
      double itemWidth, String refer) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          IPersonalDataManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          await manager.openImageScreen(context, item.uid,
              refer: PageRefer(refer));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipOval(
              child: (item.icon.isNotEmpty)
                  ? CachedNetworkImage(
                      imageUrl: item.icon,
                      errorWidgetType: ErrorWidgetType.defaultUserIcon,
                      suffix: '!head150',
                      width: 52.0,
                      height: 52.0)
                  : R.img(BaseAssets.shared$ic_user_none_png,
                      package: ComponentManager.MANAGER_BASE_CORE,
                      width: 52.0,
                      height: 52.0),
            ),
            const SizedBox(width: 12, height: 72),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: itemWidth,
                    child: Text(
                      item.name,
                      style: TextStyle(
                          color: R.color.mainTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  IDWidget(
                    uid: item.uid,
                    fontSize: 13,
                    fontColor: R.color.thirdTextColor,
                    fontWeight: FontWeight.w600,
                  )
                ])
          ],
        ));
  }

  static Future<T?> showLotteryDialog<T>(BuildContext context, Widget dialog) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
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
        pageBuilder: (BuildContext buildContext, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            dialog);
  }
}
