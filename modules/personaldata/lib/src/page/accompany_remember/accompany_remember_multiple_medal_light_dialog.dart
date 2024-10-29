import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';

import 'model/pb/generated/slp_imprint.pb.dart';

/// 陪伴记详情弹框-多个勋章点亮
class AccompanyRememberMultipleMedalLightDialog extends StatefulWidget {
  final UserImprintLight item;

  const AccompanyRememberMultipleMedalLightDialog(this.item, {Key? key})
      : super(key: key);

  static Future show(BuildContext context, UserImprintLight item) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      builder: (context) {
        return AccompanyRememberMultipleMedalLightDialog(item);
      },
    );
  }

  @override
  State<AccompanyRememberMultipleMedalLightDialog> createState() =>
      _AccompanyRememberMultipleMedalLightDialogState();
}

class _AccompanyRememberMultipleMedalLightDialogState
    extends State<AccompanyRememberMultipleMedalLightDialog> {
  late double height;

  @override
  void initState() {
    super.initState();
    if (widget.item.images.length > 3) {
      height = 492.dp + max(Util.bottomMargin, 10.dp);
    } else {
      height = 465.dp + max(Util.bottomMargin, 10.dp);
    }
  }

  void _goto() {
    if (widget.item.redirect.isNotEmpty) {
      SchemeUrlHelper.instance().checkSchemeUrlAndGo(
        System.context,
        SchemeUrlHelper.instance().concatSchemeUrl(
            widget.item.redirect, SchemeUrlHelper.scheme_path_common_redirect),
      );
    } else {
      RoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      // 房间内回到房间、房间外回到首页
      if (roomManager.isInRoomPage()) {
        Navigator.of(context).popUntil(
          (route) {
            return route.settings.name?.startsWith('/room/') ?? false;
          },
        );
      } else {
        SchemeUrlHelper.instance().checkSchemeUrlAndGo(
          System.context,
          SchemeUrlHelper.instance().concatSchemeUrl('page=home&tab=home',
              SchemeUrlHelper.scheme_path_common_redirect),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: Util.width,
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            R.img(Assets.personaldata$accompany_remember_dialog_header_bg_webp,
                width: Util.width, height: 120.dp),
            Container(
              width: Util.width,
              padding: EdgeInsetsDirectional.only(top: 10.dp),
              alignment: AlignmentDirectional.topCenter,
              child: Text(
                widget.item.name,
                style: Util.youSheBiaoTiYuan.copyWith(
                    color: Colors.white,
                    fontSize: 24.dp,
                    fontWeight: FontWeight.w400,
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(0.16),
                          blurRadius: 16.dp),
                    ]),
              ),
            ),
            Positioned.fill(
              child: Container(
                width: Util.width,
                height: height,
                margin: EdgeInsetsDirectional.only(top: 48.dp),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFFEEF6),
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFE6)
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24.dp)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 12.dp),
                    Expanded(
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Colors.black,
                              Colors.transparent,
                              Colors.transparent
                            ],
                            stops: [0.0, 0.05, 1.0],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstOut,
                        child: ListView.builder(
                          padding: EdgeInsetsDirectional.only(bottom: 10.dp),
                          itemCount: widget.item.images.length,
                          itemBuilder: (context, index) {
                            return _buildItemWidget(index);
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: Util.width, height: 12.dp),
                    InkWell(
                      onTap: _goto,
                      child: GradientBorder(
                        borderRadius: 24.dp,
                        borderWidth: 1.dp,
                        borderGradient: const LinearGradient(
                          colors: [Color(0xFFFFE666), Color(0x00FFFFAD)],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(1.dp),
                          child: Container(
                            alignment: Alignment.center,
                            width: Util.width - 16.dp * 2,
                            height: 48.dp,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF227A),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF7D2EE6),
                                  Color(0xFFFF56A8),
                                  Color(0xFFFF66B0),
                                  Color(0xFFFF6BB3),
                                  Color(0xFFCEFF08)
                                ],
                              ),
                              borderRadius: BorderRadius.circular(24.dp),
                            ),
                            child: Text(
                              widget.item.lighten == 1
                                  ? K.personaldata_ok
                                  : K.personaldata_light_up_right_away,
                              style: Util.youSheBiaoTiYuan.copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black.withOpacity(0.16),
                                        blurRadius: 16.dp),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: max(Util.bottomMargin, 10.dp)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatIntimacyDegree(int degree) {
    if (degree >= 10000) {
      return '${(degree / 10000).toStringAsFixed(1)}${R.string('ten_thousand')}';
    } else {
      return degree.toString();
    }
  }

  Widget _buildItemWidget(int index) {
    String image = widget.item.images[index];
    int levelScore = widget.item.levelScores[index];
    String levelScoreStr = formatIntimacyDegree(levelScore);
    return Container(
      height: 88.dp,
      width: Util.width,
      padding: EdgeInsets.symmetric(horizontal: 16.dp),
      margin: EdgeInsetsDirectional.only(top: 20.dp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GradientBorder(
            borderGradient: const LinearGradient(
                colors: [Color(0xFFFFFFED), Color(0xFFFFF1D6)],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
            borderWidth: 1.dp,
            borderRadius: 16.dp,
            child: Padding(
              padding: EdgeInsets.all(1.dp),
              child: Container(
                width: 86.dp,
                height: 86.dp,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xFFEAEAFF),
                    Color(0xFFFFF1F4),
                    Color(0xFFFFFFE9)
                  ]),
                  borderRadius: BorderRadius.circular(16.dp),
                ),
                child: CachedNetworkImage(
                  imageUrl: Util.getRemoteImgUrl(image),
                  width: 70.dp,
                  height: 70.dp,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.dp),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      widget.item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 6.dp),
                    Container(
                      padding: EdgeInsetsDirectional.only(
                          start: 6.dp, end: 6.dp, top: 4.dp, bottom: 4.dp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.dp),
                        gradient: const LinearGradient(colors: [
                          Color(0x1E7D2EE6),
                          Color(0x1EFF56A8),
                          Color(0x1EFF6BB3),
                          Color(0x1ECEFF08)
                        ]),
                      ),
                      child: Text(
                        '+${widget.item.accompanyScores[index]}${K.accomanpy_remember_value}',
                        style: TextStyle(
                            height: 1.1,
                            color: const Color(0xFFFF2CA6),
                            fontSize: 10.dp,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6.dp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          PositionedDirectional(
                            start: 0,
                            end: 0,
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Container(
                                  height: 6.dp,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(3.dp),
                                  ),
                                );
                              },
                            ),
                          ),
                          PositionedDirectional(
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Container(
                                  width: constraints.maxWidth /
                                      levelScore *
                                      widget.item.score,
                                  height: 6.dp,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Color(0xFFFF86C1),
                                      Color(0xFFFF2CA6)
                                    ]),
                                    borderRadius: BorderRadius.circular(3.dp),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.dp),
                    NumText(
                      '${formatIntimacyDegree(widget.item.score >= levelScore ? levelScore : widget.item.score)}/$levelScoreStr',
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 6.dp),
                Text(
                  widget.item.description
                      .replaceAll(RegExp(r'%d'), levelScoreStr),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.9), fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
