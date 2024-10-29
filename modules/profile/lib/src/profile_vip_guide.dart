import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/k.dart';

const _PROFILE_VIP_GUIDE_KEY = 'profile_vip_guide_key';

String getProfileVipGuideKey() {
  return '${Session.uid}_$_PROFILE_VIP_GUIDE_KEY';
}

/// 爵位/VIP/人气入口引导
class ProfileVipGuide extends StatelessWidget {
  final double top;
  final VoidCallback refreshCallback;

  const ProfileVipGuide(
      {super.key, this.top = 0, required this.refreshCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: Util.width,
        height: Util.height,
        alignment: AlignmentDirectional.topEnd,
        padding: EdgeInsetsDirectional.only(top: top, end: 36),
        color: Colors.black.withOpacity(0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 60,
              height: 67,
              padding: const EdgeInsetsDirectional.only(bottom: 7),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    R.imagePath('profile_ic_bubble.png',
                        package: ComponentManager.MANAGER_PROFILE),
                  ),
                ),
              ),
              child: R.img('ic_my_level.svg',
                  package: ComponentManager.MANAGER_PROFILE,
                  width: 32,
                  height: 32),
            ),
            const SizedBox(height: 4),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.only(
                      top: 13, end: 8, start: 8, bottom: 13),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.62),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Text(
                    K.profile_vip_guide_tip,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Config.setBool(getProfileVipGuideKey(), true);
                    refreshCallback();
                  },
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        top: 8, end: 22, start: 22, bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: Text(
                      K.profile_know,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
