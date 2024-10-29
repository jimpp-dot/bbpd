import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';

/// 装扮小屋邀请
class DisplayAccompanyHouseBuildInvite extends StatelessWidget {
  final MessageContent message;

  const DisplayAccompanyHouseBuildInvite({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE1D0FF), width: 1.0),
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(16)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 130,
            width: 256,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFDC70FF),
                  Color(0xFF9D9EFF),
                ],
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
              ),
            ),
          ),
          PositionedDirectional(
            start: 0,
            bottom: 0,
            child: R.img(
                Assets.chat$accompany_house_im_accompany_house_heart1_webp,
                width: 49,
                height: 43,
                package: ComponentManager.MANAGER_CHAT),
          ),
          PositionedDirectional(
            start: 52,
            top: 3,
            child: R.img(
                Assets.chat$accompany_house_im_accompany_house_heart2_webp,
                width: 42,
                height: 37,
                package: ComponentManager.MANAGER_CHAT),
          ),
          PositionedDirectional(
            end: 0,
            top: 8,
            child: R.img(
                Assets.chat$accompany_house_im_accompany_house_heart2_webp,
                width: 99,
                height: 103,
                package: ComponentManager.MANAGER_CHAT),
          ),
          Positioned.fill(
            child: _buildBody(context),
          ),
          PositionedDirectional(
            end: 4,
            bottom: 52,
            width: 90,
            height: 90,
            child: CachedNetworkImage(
              imageUrl: Util.parseIcon(message.imageUrl),
              cachedWidth: 90.px,
              cachedHeight: 90.px,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  message.content,
                  maxLines: 2,
                  style: R.textStyle.regular16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 80,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    bool isSelfSender = (int.parse(message.senderId ?? '') == Session.uid);

    return GestureDetector(
      onTap: () {
        if (!isSelfSender) {
          /// 跳转个人主页，tab切换到陪伴小屋
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(
              System.context, int.parse(message.senderId ?? ''),
              initialScrollToTabBar: true,
              initialTab: ImageScreenTabType.accompany_house);
        }
      },
      child: Container(
        height: 40,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
        ),
        child: Text(
          isSelfSender ? "已发送邀请" : "接受邀请",
          style: R.textStyle.medium14
              .copyWith(fontSize: 13, color: const Color(0xFFD774FF)),
        ),
      ),
    );
  }
}
