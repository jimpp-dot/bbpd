import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

/// 贵族四项权益上新弹框

bool _isDisplayed = false;

String get _nobilityPrivilegeNewKey =>
    '${Session.uid}_clicked_two_nobility_privilege_new_dialog';

class NobilityPrivilegeNewDialog extends StatefulWidget {
  const NobilityPrivilegeNewDialog({super.key});

  @override
  State<NobilityPrivilegeNewDialog> createState() =>
      _NobilityPrivilegeNewDialogState();

  static Future<void> show(BuildContext? context) async {
    if (!Session.isLogined) return;
    if (_isDisplayed) return;
    bool tapped = Config.getBool(_nobilityPrivilegeNewKey, false);
    if (tapped) return;
    Future.delayed(const Duration(seconds: 1)).then((value) {
      showDialog(
        context: context ?? System.context,
        barrierColor: Colors.black.withOpacity(0.4),
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            insetPadding: EdgeInsets.zero,
            content: const NobilityPrivilegeNewDialog(),
          );
        },
      );
    });
  }
}

class _NobilityPrivilegeNewDialogState
    extends State<NobilityPrivilegeNewDialog> {
  final ILoginManager _loginManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
  final IVipManager _vipManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);

  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    _isDisplayed = true;
  }

  @override
  void dispose() {
    _isDisplayed = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topEnd,
          end: AlignmentDirectional.bottomStart,
          colors: [Color(0xFFFFF1DE), Color(0xFFE0B881)],
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            top: -30,
            end: -20,
            child: R.img(
              'pretty_id/top_right_corner_silk_ribbon.webp',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 104,
              height: 100,
            ),
          ),
          PositionedDirectional(
            top: 30,
            start: -5,
            child: R.img(
              'pretty_id/round_dot_1.webp',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 54,
              height: 49,
            ),
          ),
          PositionedDirectional(
            top: 32,
            end: 25,
            child: R.img(
              'pretty_id/round_dot_2.webp',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 15,
              height: 15,
            ),
          ),
          PositionedDirectional(
            bottom: 68,
            end: 0,
            child: R.img(
              'pretty_id/round_dot_3.webp',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 37,
              height: 49,
            ),
          ),
          PositionedDirectional(
            bottom: -20,
            start: -20,
            child: R.img(
              'pretty_id/bottom_left_corner_silk_ribbon.webp',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 104,
              height: 100,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 35,
                    height: 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.5),
                      gradient: const LinearGradient(
                        colors: [Color(0x001C1C1E), Color(0xFFF4D49C)],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    K.vip_nobility_privilege_new_alert_title,
                    style: const TextStyle(
                        color: Color(0xFF583500),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 35,
                    height: 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.5),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF4D49C), Color(0x001C1C1E)],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: CachedNetworkImage(
                  imageUrl: Util.getRemoteImgUrl(
                      '202303/15/641172d7ac2523.55908110.webp'),
                  width: 255,
                  height: 149,
                  cachedWidth: 255.px,
                  cachedHeight: 149.px,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                  onTap: () {
                    if (!Session.isLogined) {
                      _loginManager.show(context);
                      return;
                    }
                    Tracker.instance.track(TrackEvent.click, properties: {
                      'click_page': 'click_noblewindow_2.0',
                    });
                    Config.setBool(_nobilityPrivilegeNewKey, true);
                    Navigator.of(context).pop();
                    _vipManager.showMyLevelScreen(context,
                        initialTab: MyLevelTab.Title);
                  },
                  child: Container(
                    height: 44,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF583500), Color(0xFF87642E)],
                      ),
                    ),
                    child: Text(
                      K.vip_check_score_detail,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 27),
            ],
          )
        ],
      ),
    );
  }
}
