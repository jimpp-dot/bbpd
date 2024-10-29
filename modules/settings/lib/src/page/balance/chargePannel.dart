import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:settings/k.dart';

class ChargePanel {
  static Future<String?> show(BuildContext context, {String? aliKa, List<String>? platforms}) async {
    List<SheetItem> types = [];

    if (Util.validList(platforms)) {
      if ((platforms?.contains(IPayManager.pTA) ?? false) && (!Platform.isAndroid || DeviceInfo.androidSdkInt >= 26)) {
        // Android 8.0以下系统使用支付宝h5支付报错
        types.add(SheetItem(R.string('string_zhi') + R.string('string_fu') + R.string('string_bao'), IPayManager.pTA));
      }
      List<String>? ptWdList = platforms?.where((item) => item == IPayManager.ptWd).toList();
      if (ptWdList != null && ptWdList.isNotEmpty) {
        types.add(SheetItem(R.string('string_wechat'), IPayManager.ptWd));
      }
      List<String>? ptWList = platforms?.where((item) => item == IPayManager.pTW).toList();
      if (ptWList != null && ptWList.isNotEmpty) {
        types.add(SheetItem(R.string('string_wechat'), IPayManager.pTW));
      }
      List<String>? pTWH5List = platforms?.where((item) => item == IPayManager.pTWH5).toList();
      if (pTWH5List != null && pTWH5List.isNotEmpty) {
        types.add(SheetItem(R.string('string_wechat'), IPayManager.pTWH5));
      }
    }

    if (!Util.validList(types)) {
      /// 服务端没有下发配置，用默认的
      if (!Platform.isAndroid || DeviceInfo.androidSdkInt >= 26) {
        // Android 8.0以下系统使用支付宝h5支付报错
        types.add(SheetItem(R.string('string_zhi') + R.string('string_fu') + R.string('string_bao'), IPayManager.pTA));
      }
      types.add(SheetItem(R.string('string_wechat'), IPayManager.pTW));
    }

    SheetCallback? result = await displayModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return RadioBottomSheet(
          title: K.setting_choose_p_type,
          data: types,
          render: (BuildContext context, SheetItem? item, int index, {VoidCallback? callback}) {
            if ((item?.key == IPayManager.pTA) && Util.validStr(aliKa)) {
              return Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: R.color.dividerColor, width: 0.0)),
                    ),
                    child: Text(
                      item?.label ?? '',
                      maxLines: 1,
                      style: TextStyle(color: R.color.mainTextColor, fontSize: 17.0),
                    ),
                  ),
                  PositionedDirectional(
                    top: 15,
                    start: (Util.width - 16) / 2 + 30,
                    child: Container(
                      height: 24,
                      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                      alignment: AlignmentDirectional.centerStart,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFF71C6F), Color(0xFFFA9E61)],
                          begin: AlignmentDirectional.centerStart,
                          end: AlignmentDirectional.centerEnd,
                        ),
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(12),
                          bottomStart: Radius.circular(4),
                          topEnd: Radius.circular(12),
                          bottomEnd: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        aliKa ?? '',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          height: 1.2,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: R.color.dividerColor, width: 0.0)),
                ),
                child: Text(
                  item?.label ?? '',
                  maxLines: 1,
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 17.0),
                ),
              );
            }
          },
        );
      },
    );
    if (result == null || result.reason == SheetCloseReason.Active) {
      return null;
    }

    return result.value?.key ?? '';
  }
}
