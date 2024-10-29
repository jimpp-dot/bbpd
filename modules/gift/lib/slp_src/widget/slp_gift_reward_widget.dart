import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import '../gift/slp_gift_panel.dart';

/// 礼物冠名奖励 OR 即将冠名+倒计时，默认是礼物冠名奖励
class SlpGiftRewardWidget extends StatelessWidget {
  final BbGiftPanelWeekStarNaming? weekStar;

  const SlpGiftRewardWidget({Key? key, this.weekStar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (weekStar == null ||
            weekStar?.jumpUrl == null ||
            weekStar?.jumpUrl.isEmpty == true) return;
        String jumpUrl = weekStar?.jumpUrl ?? '';
        SchemeUrlHelper.instance().jump(jumpUrl);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
        child: wrapBlurBg(
          Stack(
            children: [
              Container(
                height: 60,
                width: Util.width - 16,
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: roomBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CommonAvatar(
                      size: 40,
                      path: weekStar?.userIcon ?? '',
                      shape: BoxShape.circle,
                      onTap: () {
                        IPersonalDataManager personalDataManager =
                            ComponentManager.instance.getManager(
                                ComponentManager.MANAGER_PERSONALDATA);
                        personalDataManager.openImageScreen(
                            context, weekStar?.uid ?? 0);
                      },
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          (weekStar?.userName ?? '').safeSubstring(0, 6),
                          style: TextStyle(
                              color: const Color(0xFFFFFFFF).withOpacity(0.8),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 4),

                        /// 冠名礼物
                        if (weekStar != null && weekStar?.hasNaming == true)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              gradient: const LinearGradient(colors: [
                                Color(0xFF6980FE),
                                Color(0xFFCE41E6)
                              ]),
                            ),
                            child: Text(
                              weekStar?.tips ?? '',
                              style: TextStyle(
                                  color:
                                      const Color(0xFFFFFFFF).withOpacity(0.5),
                                  fontSize: 10),
                            ),
                          ),

                        /// 即将冠名
                        if (weekStar != null && weekStar?.hasNaming == false)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              color: Colors.white.withOpacity(0.1),
                            ),
                            child: Text(
                              weekStar?.tips ?? '',
                              style: TextStyle(
                                  color:
                                      const Color(0xFFFFFFFF).withOpacity(0.5),
                                  fontSize: 10),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 1,
                      height: 36,
                      color: const Color(0xFF979797).withOpacity(0.5),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        weekStar?.description ?? '',
                        style: TextStyle(
                            color: const Color(0xFFFFFFFF).withOpacity(0.5),
                            fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    R.img(
                      'ic_next.svg',
                      width: 8,
                      height: 20,
                      color: Colors.white.withOpacity(0.3),
                      package: ComponentManager.MANAGER_PROFILE,
                    ),
                  ],
                ),
              ),
              if (weekStar != null &&
                  weekStar?.hasNaming == false &&
                  weekStar?.countDown != null &&
                  weekStar?.countDown.isNotEmpty == true)
                PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      // width: 85,
                      height: 16,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(8)),
                          gradient: LinearGradient(
                              colors: [Color(0xFF6980FE), Color(0xFFCE41E6)])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 3),
                          R.img(
                            Assets.gift_stopwatch_webp,
                            width: 12,
                            height: 12,
                            package: ComponentManager.MANAGER_GIFT,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            weekStar?.countDown ?? '',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 9),
                          ),
                          const SizedBox(width: 4),
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
          radius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
