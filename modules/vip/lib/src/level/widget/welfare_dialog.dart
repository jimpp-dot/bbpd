import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import 'welfare_pondItem_widget.dart';

class WelfareDialogContent extends StatelessWidget {
  final String title;
  final String content;
  final String? confirm;
  final List<ShopMailCommodity>? items;
  final VoidCallback? confirmPress;

  const WelfareDialogContent(
      {super.key,
      required this.title,
      required this.content,
      this.confirm,
      this.items,
      this.confirmPress});

  @override
  Widget build(BuildContext context) {
    bool showItems = (items != null && items!.isNotEmpty);

    return Container(
      decoration: BoxDecoration(
          color: R.color.mainBgColor, borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsetsDirectional.only(start: 32, end: 32),
      padding: const EdgeInsetsDirectional.only(
          top: 12, bottom: 20, start: 20, end: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              Expanded(
                  child: Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  title,
                  maxLines: 1,
                  style: R.textStyle.medium18,
                ),
              )),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: R.img('icon_btn_close.svg',
                    width: 24,
                    height: 24,
                    package: ComponentManager.MANAGER_VIP,
                    color: R.color.thirdTextColor),
              )
            ],
          ),
          SizedBox(
            height: showItems ? 12 : 24,
          ),
          Container(
            constraints: BoxConstraints(minHeight: showItems ? 0 : 66),
            child: Text(
              content,
              style: showItems ? R.textStyle.medium12 : R.textStyle.medium16,
              maxLines: 4,
              textAlign: showItems ? TextAlign.start : TextAlign.center,
            ),
          ),
          SizedBox(
            height: showItems ? 12 : 25,
          ),
          if (showItems) _buildItems(),
          SizedBox(height: showItems ? 12 : 0),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(true);
              if (confirmPress != null) {
                confirmPress!();
              }
            },
            child: Container(
              width: 190,
              height: 48,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                      colors: [Color(0xFFFFDE77), Color(0xFFFF973A)]),
                  borderRadius: BorderRadius.circular(24)),
              child: Text(
                confirm ?? K.vip_confirm_know,
                style: R.textStyle.medium16.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItems() {
    if (items!.length == 1) {
      return Container(
        width: 120,
        margin: const EdgeInsetsDirectional.only(top: 7, bottom: 15),
        child: WelfarePondItemWidget(
          data: items![0],
        ),
      );
    } else {
      int itemLineCount = 3;
      double itemPadding = 12.0;
      double itemSize = (Util.width - 104 - itemPadding * (itemLineCount - 1)) /
          itemLineCount;
      return Container(
        height: itemSize * 2.5,
        alignment: AlignmentDirectional.center,
        child: GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: itemPadding,
              mainAxisSpacing: itemPadding),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            return SizedBox(
              width: itemSize,
              child: WelfarePondItemWidget(
                data: items![index],
                showName: false,
              ),
            );
          }, childCount: items!.length),
        ),
      );
    }
  }
}

class WelfareDialog {
  static Future<bool?> showWelfareDialog(
      {required String title,
      required String content,
      String? confirm,
      List<ShopMailCommodity>? items,
      bool barrierDismissible = true,
      VoidCallback? confirmPress}) async {
    return showDialog(
        context: System.context,
        barrierDismissible: barrierDismissible,
        builder: (context) => Center(
              // color: Colors.transparent,
              // alignment: AlignmentDirectional.center,
              child: WelfareDialogContent(
                title: title,
                content: content,
                confirm: confirm,
                items: items,
                confirmPress: confirmPress,
              ),
            ));
  }
}
