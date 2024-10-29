import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/src/circle/model/circle_page_resp.dart';

/// 圈子用户头像
class CircleFriendAvatarWidget extends StatelessWidget {
  final CircleFriendsActivity activity;
  final double size;
  final double roomIndicatorBottomMargin;
  final double roomIndicatorEndMargin;
  final double onlineIndicatorSize;
  final double onlineIndicatorBottomMargin;
  final double onlineIndicatorEndMargin;
  final double onlineIndicatorBorderWidth;

  const CircleFriendAvatarWidget(
    this.activity,
    this.size, {
    super.key,
    this.roomIndicatorBottomMargin = 0,
    this.roomIndicatorEndMargin = 0,
    this.onlineIndicatorSize = 12,
    this.onlineIndicatorBottomMargin = 0,
    this.onlineIndicatorEndMargin = 0,
    this.onlineIndicatorBorderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      clipBehavior: Clip.none,
      children: <Widget>[
        ClipOval(
          child: (activity.icon != null && activity.icon!.isNotEmpty)
              ? CachedNetworkImage(
                  imageUrl: activity.icon,
                  fit: BoxFit.cover,
                  width: size,
                  height: size,
                  placeholder: _buildPlaceHolderImage(),
                  errorWidget: _buildPlaceHolderImage())
              : _buildPlaceHolderImage(),
        ),
        if (activity.isInRoom == 1)
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              border: Border.all(color: R.color.mainBrandColor, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(size / 2)),
            ),
          ),
        if (activity.isInRoom == 1)
          PositionedDirectional(
            bottom: roomIndicatorBottomMargin,
            end: roomIndicatorEndMargin,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: R.color.mainBrandColor,
              ),
              alignment: Alignment.center,
              child: R.img(
                "living_small.webp",
                package: ComponentManager.MANAGER_BASE_CORE,
                width: 14,
                height: 14,
              ),
            ),
          ),
        if (activity.isInRoom == 0 && activity.isOnline == 1)
          PositionedDirectional(
            bottom: onlineIndicatorBottomMargin,
            end: onlineIndicatorEndMargin,
            child: Container(
              width: onlineIndicatorSize,
              height: onlineIndicatorSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: onlineIndicatorBorderWidth,
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                width: onlineIndicatorSize - onlineIndicatorBorderWidth * 2,
                height: onlineIndicatorSize - onlineIndicatorBorderWidth * 2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: R.color.fiveBrightColor),
              ),
            ),
          )
      ],
    );
  }

  Widget _buildPlaceHolderImage() {
    return R.img(
      activity.sex == 1
          ? 'circle/ic_male_rush.png'
          : "circle/ic_female_rush.png",
      width: size,
      height: size,
      package: ComponentManager.MANAGER_MOMENT,
    );
  }
}
