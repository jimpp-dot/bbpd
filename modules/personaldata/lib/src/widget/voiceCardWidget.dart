import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/model/voiceTextModel.dart';

/// 随机卡片
class VoiceCardWidget extends StatelessWidget {
  final VoiceTextModel? item;
  final bool isTop;
  final VoidCallback? onNext;

  const VoiceCardWidget(this.item, this.isTop, this.onNext, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: R.color.mainBgColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0XFFD9E1F4).withOpacity(0.4),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(0.0, 4.0),
          )
        ],
      ),
      alignment: AlignmentDirectional.center,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 32,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      (item?.id == -1)
                          ? K.personal_show_ability
                          : K.personal_invite_you_read,
                      style: R.textStyle.medium14
                          .copyWith(color: R.color.mainBrandColor),
                    ),
                  ),
                  R.img('icon_point.svg',
                      color: R.color.thirdBgColor,
                      width: 32,
                      height: 32,
                      package: ComponentManager.MANAGER_PERSONALDATA),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 13, bottom: 13),
                      child: Text(
                        item?.content ?? '',
                        style: TextStyle(
                          height: 1.8,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: R.color.mainTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            start: 0,
            height: (Util.width - 40) * 159 / 335,
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(12.0),
                bottomEnd: Radius.circular(12.0),
              ),
              child: CachedNetworkImage(
                  imageUrl: Util.getRemoteImgUrl(
                      'static/room/icon_voice_balloon.webp'),
                  fit: BoxFit.cover),
            ),
          ),
          if (isTop)
            PositionedDirectional(
              top: 16,
              end: 16,
              child: GestureDetector(
                  onTap: () {
                    if (onNext != null) {
                      onNext!();
                    }
                  },
                  child: Container(
                    height: 28,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsetsDirectional.only(start: 11, end: 11),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: R.color.secondBgColor),
                    child: Text(
                      K.personal_change_next,
                      style: R.textStyle.medium12
                          .copyWith(color: R.color.secondTextColor),
                    ),
                  )),
            )
        ],
      ),
    );
  }
}
