import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;

class DeleteDefendRelationDialog extends StatelessWidget {
  final DefendRelationModel? item;
  DeleteDefendRelationDialog({super.key, this.item});

  static Future<bool?> show(
      {BuildContext? buildContext, DefendRelationModel? item}) {
    BuildContext context = buildContext ?? System.context;
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Center(
          child: DeleteDefendRelationDialog(
            item: item,
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
      // height: 316,
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 25, bottom: 23),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        color: R.color.mainBgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.personal_delete_defend_dialog_title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: R.color.mainTextColor,
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            K.personal_delete_defend_dialog_subtitle([item?.title ?? '']),
            style: TextStyle(
              fontSize: 14,
              color: R.color.mainTextColor,
            ),
            maxLines: 1,
          ),
          const SizedBox(
            height: 13,
          ),
          Container(
            width: width - 28 - 28,
            height: 87,
            decoration: BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: BorderRadiusDirectional.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0, 2),
                    blurRadius: 10,
                    spreadRadius: 2)
              ],
            ),
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DefendRelationHeader(
                  iconSize: 62,
                  showBorderIcon: true,
                  defendRelationModel: item,
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: width - 28 - 28 - 62 - 6 - 22,
                      ),
                      child: Text(
                        item?.name ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: R.color.mainTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          K.personal_defend_level,
                          style: TextStyle(
                            fontSize: 13,
                            color: R.color.thirdTextColor,
                          ),
                        ),
                        Text(
                          'Lv.${item?.level}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: R.color.mainTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  /// 强制解除,在上一个页面打开强制解除dialog，以便上一个页面刷新
                  Navigator.of(context).pop(true);
                },
                child: SizedBox(
                  height: 58,
                  width: (width - 40 - 12) / 2,
                  child: Stack(
                    children: [
                      PositionedDirectional(
                        top: 10,
                        child: Container(
                          width: (width - 40 - 12) / 2,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(24),
                            color: const Color(0xFFF5F5F5),
                          ),
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            K.personal_delete_defend_force,
                            style: TextStyle(
                              fontSize: 15,
                              color: R.color.mainTextColor.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        padding:
                            const EdgeInsetsDirectional.only(start: 8, end: 8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(66),
                            bottomStart: Radius.circular(10),
                            topEnd: Radius.circular(57),
                            bottomEnd: Radius.circular(57),
                          ),
                          gradient: LinearGradient(
                            begin: AlignmentDirectional.centerStart,
                            end: AlignmentDirectional.centerEnd,
                            colors: [Color(0xFFFF638C), Color(0xFFFA7845)],
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            R.img(
                              MoneyConfig.moneyIcon,
                              width: 13,
                              height: 13,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '${item?.breakMoney}',
                              style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  /// 申请解除
                  deleteDefend(context);
                },
                child: Container(
                  width: (width - 40 - 12) / 2,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(24),
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: R.color.mainBrandGradientColors,
                    ),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    K.personal_delete_defend_apply,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool delete = false;

  /// 申请解除
  void deleteDefend(BuildContext context) async {
    if (delete == true) {
      return;
    }
    try {
      String url = 'defend/breakApply';
      XhrResponse response = await Xhr.postJson(
        "${System.domain}$url",
        {'id': item?.id ?? ''},
        throwOnError: true,
      );
      BaseResponse baseResponse = BaseResponse.parse(response);
      if (baseResponse.success == true) {
        Navigator.of(context).pop();
        return;
      } else if (Util.validStr(baseResponse.msg)) {
        Fluttertoast.showToast(msg: baseResponse.msg);
      } else {
        Fluttertoast.showToast(msg: BaseK.K.base_net_error);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }
    delete = false;
  }
}
