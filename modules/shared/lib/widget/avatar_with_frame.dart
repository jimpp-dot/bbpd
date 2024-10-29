import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 用户头像控件
class CommonAvatarWithFrame extends StatelessWidget {
  final double overflow;
  final Widget childWidget;
  final int? uid; //根据uid取头像框 根据showLocalFrame字段来决定是否获取显示本地frame地址
  final String? framePath; //头像框地址//传递了改值一定显示
  final int? liveOnly;
  final String? liveLabel; //粉丝牌名
  final double? headerFrameSize; //头像框size

  const CommonAvatarWithFrame({
    super.key,
    this.overflow = -5.0,
    required this.childWidget,
    this.uid = 0,
    this.framePath,
    this.liveOnly,
    this.liveLabel,
    this.headerFrameSize,
  });

  @override
  Widget build(BuildContext context) {
    String? showFramePath = framePath;
    if (showFramePath == null || showFramePath.isEmpty) {
      if (uid != null && uid! > 0) {
        if (UserImageCacheHelper.instance().showLocalFrame) {
          showFramePath = UserImageCacheHelper.instance().getItemFrame(uid!);
        }
      }
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        childWidget,
        if (showFramePath != null && showFramePath.isNotEmpty)
          PositionedDirectional(
            start: overflow,
            end: overflow,
            top: overflow,
            bottom: overflow,
            child: LayoutBuilder(builder: (context, constraints) {
              return IgnorePointer(
                child: UserIconFrame(
                  size: constraints.maxWidth,
                  frameUrl: showFramePath!,
                ),
              );
            }),
          ),
        if (headerFrameSize != null &&
            headerFrameSize! > 0 &&
            liveOnly != null &&
            liveOnly == 1 &&
            liveLabel != null &&
            liveLabel!.isNotEmpty)
          UserLiveLabelWidget(liveLabel, UserLiveLabelType.frame,
              bgHeight: headerFrameSize!, frameBottomOverflow: overflow),
      ],
    );
  }
}
