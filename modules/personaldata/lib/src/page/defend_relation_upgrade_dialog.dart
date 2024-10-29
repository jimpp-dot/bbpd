import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/widget/defend_mic_line_widget.dart';
import '../../k.dart';
import '../model/defend_relation_detail_bean.dart';

import '../widget/defend_relation_item.dart';

class DefendRelationUpgradeDialog extends StatelessWidget {
  final String? defendId;
  final DefendRelationDetailBean? data;

  DefendRelationUpgradeDialog({super.key, this.defendId, this.data});

  static Future<bool?> show({
    required BuildContext context,
    required String defendId,
    DefendRelationDetailBean? data,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      builder: (context) {
        return DefendRelationUpgradeDialog(defendId: defendId, data: data);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// do nothing
      },
      child: Container(
        width: Util.width,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const Spacer(),
                R.img(
                  'defend/ic_defend_pay_upgrade_title_left.webp',
                  width: 89,
                  height: 6,
                  package: ComponentManager.MANAGER_PERSONALDATA,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  K.personal_defend_upgrade_dialog_title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF222222),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                R.img(
                  'defend/ic_defend_pay_upgrade_title_right.webp',
                  width: 89,
                  height: 6,
                  package: ComponentManager.MANAGER_PERSONALDATA,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              K.personal_defend_upgrade_subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0x99222222),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: 272,
              height: 294,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(12),
                border: Border.all(color: const Color(0x19313131), width: 0.5),
              ),
              child: Stack(
                children: [
                  if (data?.upgradePrivilege != null &&
                      (data?.upgradePrivilege.length ?? 0) > 1)
                    PositionedDirectional(
                      top: 22,
                      start: 14,
                      child: buildItem(
                        desc: data?.upgradePrivilege[1].desc ?? '',
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonAvatar(
                              path: data?.icon,
                              size: 24,
                              shape: BoxShape.circle,
                            ),
                            DefendMicLineWidget(
                              position: data?.position ?? 0,
                              width: 23,
                              level: 2,
                              category: data?.category ?? 0,
                            ),
                            CommonAvatar(
                              path: Session.icon,
                              size: 24,
                              shape: BoxShape.circle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (data?.upgradePrivilege != null &&
                      (data?.upgradePrivilege.length ?? 0) > 3)
                    PositionedDirectional(
                      top: 22,
                      end: 14,
                      child: buildItem(
                        desc: data?.upgradePrivilege[3].desc ?? '',
                        child: Container(
                          width: 57,
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(12),
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.bottomCenter,
                              end: AlignmentDirectional.topCenter,
                              colors: DefendRelationItem.getBodyBgColors(
                                  data?.category ?? 0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(Util.getRemoteImgUrl(
                                  data?.upgradePrivilege[3].background ?? '')),
                              fit: BoxFit.fill,
                            ),
                          ),
                          margin: const EdgeInsetsDirectional.only(
                              top: 10, bottom: 2),
                          padding: const EdgeInsetsDirectional.only(top: 6),
                          alignment: AlignmentDirectional.topCenter,
                          child: DefendRelationHeader(
                            defendRelationModel: data,
                            iconSize: 30,
                            showBorderIcon: true,
                          ),
                        ),
                      ),
                    ),
                  if (data?.upgradePrivilege != null &&
                      (data?.upgradePrivilege.length ?? 0) > 4)
                    PositionedDirectional(
                      top: 159,
                      start: 14,
                      child: buildItem(
                        desc: data?.upgradePrivilege[4].desc ?? '',
                        child: CachedNetworkImage(
                          imageUrl: Util.getRemoteImgUrl(
                              data?.upgradePrivilege[4].background ?? ''),
                          width: 62,
                          height: 21,
                        ),
                      ),
                    ),
                  if (data?.upgradePrivilege != null &&
                      (data?.upgradePrivilege.length ?? 0) > 5)
                    PositionedDirectional(
                      top: 159,
                      end: 14,
                      child: buildItem(
                        desc: data?.upgradePrivilege[5].desc ?? '',
                        child: CachedNetworkImage(
                          imageUrl: Util.getRemoteImgUrl(
                              data?.upgradePrivilege[5].background ?? ''),
                          width: 62,
                          height: 21,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () async {
                upgradeDefend(context);
              },
              child: Container(
                width: Util.width - 40,
                height: 66,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(R.imagePath(
                        'defend/defend_upgrade_btn_bg.webp',
                        package: ComponentManager.MANAGER_PERSONALDATA)),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: AlignmentDirectional.topCenter,
                padding: const EdgeInsetsDirectional.only(top: 17),
                child: Text(
                  '${K.personal_upgrade_defend_btn_text}(${data?.upgradeMoney}${MoneyConfig.moneyName})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF984D02),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15 + Util.iphoneXBottom,
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem({Widget? child, String desc = ''}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 90,
          height: 90,
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(12),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xFFDADCF2), Color(0xFFF1F1FF), Color(0xFFD7D5F4)],
            ),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFF8B7BFF),
                  offset: Offset(0, 0.5),
                  blurRadius: 1,
                  spreadRadius: 0),
            ],
          ),
          alignment: AlignmentDirectional.center,
          child: Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              color: Colors.white,
            ),
            alignment: AlignmentDirectional.center,
            child: child,
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          desc,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0x99313131),
          ),
        ),
      ],
    );
  }

  bool _isPaying = false;
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  void upgradeDefend(BuildContext context) async {
    if (_isPaying) {
      return;
    }

    _displayPay();
  }

  _displayPay() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        System.context, data?.upgradeMoney ?? 0);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    _pay(result.value?.key);
  }

  void _pay(String? type) {
    _isPaying = true;
    Map<String, dynamic> params = {
      'id': defendId,
    };
    _payManager.pay(System.context,
        key: 'defend_relation_upgrade',
        type: type ?? '',
        args: {
          'money': data?.upgradeMoney ?? 0,
          'type': 'defend-upgrade',
          'params': params,
        },
        showLoading: true,
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayed() {
    _isPaying = false;
    Fluttertoast.showToast(msg: K.personal_defend_upgrade_succ);
    Navigator.of(System.context).pop(true);
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
  }
}
