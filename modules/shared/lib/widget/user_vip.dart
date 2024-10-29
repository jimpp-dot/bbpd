import 'dart:math';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// vip标签
class UserVipWidget extends StatelessWidget {
  final int? vip;
  final double? width;
  final double height;
  final bool isGrey; // 是否置灰

  final EdgeInsetsGeometry? padding;

  const UserVipWidget({
    super.key,
    this.vip,
    this.width,
    this.height = 26, // 默认高度26，宽度自适应
    this.isGrey = false,
    this.padding = EdgeInsets.zero,
  });

  String get _iconUrl =>
      '${System.imageDomain}static/core/${isGrey ? 'vip_gray' : 'vip'}/vip_$vip.webp';

  @override
  Widget build(BuildContext context) {
    if (vip == null || vip! <= 0) {
      return const SizedBox.shrink();
    }
    // Log.d('iconUrl: $_iconUrl');

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: R.img(
        _iconUrl,
        package: ComponentManager.MANAGER_BASE_CORE,
        height: height,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

/// 萌新铭牌， 默认高度26
class NewerWidget extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry? padding;

  const NewerWidget(
      {super.key, this.height = 26, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: R.img(
        'ic_newer.webp',
        package: ComponentManager.MANAGER_BASE_CORE,
        height: height,
        width: height * 165 / 78,
        fit: BoxFit.contain,
      ),
    );
  }
}

///  新贵铭牌 / 桌游rich
class NewNobleWidget extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry? padding;

  const NewNobleWidget(
      {super.key, this.height = 26, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: R.img(
        'ic_new_noble.webp',
        package: ComponentManager.MANAGER_BASE_CORE,
        height: height,
        width: height * 165 / 78,
        fit: BoxFit.contain,
      ),
    );
  }
}

/// 引流用户标识
class GrowUserWidget extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry? padding;

  const GrowUserWidget(
      {super.key, this.height = 22, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: R.img(
        'ic_grow_user.png',
        package: ComponentManager.MANAGER_BASE_CORE,
        height: height,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

/// 动态铭牌
/// 私人管家等 标签
/// iphone 标签
/// ktv等级标签
class NameplateWidget extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry? padding;
  final String? icon;

  const NameplateWidget(
      {super.key,
      required this.icon,
      this.height = 22,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    if (Util.isStringEmpty(icon)) return const SizedBox.shrink();

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: CachedNetworkImage(
        imageUrl: icon,
        height: height,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

const TextStyle textStyle = TextStyle(
    color: Colors.white, fontSize: 8, fontWeight: FontWeight.w500, height: 1.1);

/// 打赏冠名
class RewardTitleWidget extends StatelessWidget {
  final String? name;
  final int level;

  const RewardTitleWidget({super.key, this.name, this.level = 0});

  @override
  Widget build(BuildContext context) {
    if (Util.isStringEmpty(name)) return const SizedBox.shrink();
    Widget content = level > 0
        ? Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  R.img('bg_reward_left.png',
                      width: 10,
                      height: 20,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                  Container(
                    height: 20,
                    constraints: const BoxConstraints(maxWidth: 53),
                    padding: const EdgeInsetsDirectional.only(
                        top: 7, start: 1, end: 1),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(R.imagePath('bg_reward_center.png',
                            package: ComponentManager.MANAGER_BASE_ROOM)),
                        fit: BoxFit.fill,
                        centerSlice: const Rect.fromLTWH(2, 4, 1, 12),
                        scale: 3,
                      ),
                    ),
                    child: Text(Util.getEllipsisStr(name),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle,
                        textAlign: TextAlign.center),
                  ),
                  R.img('bg_reward_right.png',
                      width: 27,
                      height: 20,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                ],
              ),
              R.img('bg_reward_top.png',
                  width: 43.67,
                  height: 20,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ],
          )
        : Container(
            height: 20,
            padding:
                const EdgeInsetsDirectional.only(start: 5, end: 25, top: 6.5),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.imagePath('bg_reward_title.png',
                    package: ComponentManager.MANAGER_BASE_ROOM)),
                centerSlice: const Rect.fromLTWH(8, 2, 1, 1),
                scale: 3,
              ),
            ),
            constraints: const BoxConstraints(maxWidth: 81),
            child: Text(Util.getEllipsisStr(name),
                maxLines: 1, overflow: TextOverflow.ellipsis, style: textStyle),
          );
    return _buildShimmer(Container(
        height: 22,
        padding: const EdgeInsetsDirectional.only(end: 2, bottom: 2),
        child: content));
  }

  Widget _buildShimmer(Widget child) {
    return RepaintBoundary(
      child: Shimmer(
        period: const Duration(milliseconds: 1500),
        repeatPeriod: const Duration(milliseconds: 3000),
        gradient: LinearGradient(
          begin: const Alignment(-1.0, 0.0),
          end: const Alignment(1.0, 0.0),
          colors: [
            Colors.transparent,
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.7),
            Colors.white.withOpacity(0.3),
            Colors.transparent,
          ],
          stops: const [0.0, 0.45, 0.5, 0.5, 1.0],
        ),
        child: child,
      ),
    );
  }
}

///ka标签
class KaTagWidget extends StatelessWidget {
  const KaTagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const LocalIconWidget(icon: 'ic_ka_tag.png');
  }
}

///本地图片标签
class LocalIconWidget extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final String icon;

  const LocalIconWidget(
      {super.key,
      required this.icon,
      this.height = 22,
      this.width = 39,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: R.img(icon,
            width: width,
            height: height,
            package: ComponentManager.MANAGER_BASE_CORE));
  }
}

/// 文字标签， 默认高度26
class TextTagWidget extends StatelessWidget {
  final String? text;
  final List<Color> colors;
  final double height;
  final EdgeInsetsGeometry? padding;

  const TextTagWidget({
    super.key,
    required this.text,
    required this.colors,
    this.height = 12,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    if (Util.isStringEmpty(text)) return const SizedBox.shrink();

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var renderParagraph = RenderParagraph(
        TextSpan(text: text, style: textStyle),
        softWrap: false,
        maxLines: 1,
        textDirection: TextDirection.ltr,
        overflow: TextOverflow.ellipsis,
      );
      renderParagraph.layout(constraints);
      double textWidth = renderParagraph.textSize.width;

      return Container(
        height: height,
        margin: padding ?? EdgeInsets.zero,
        padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
        decoration: BoxDecoration(
          gradient: colors.length >= 2 ? LinearGradient(colors: colors) : null,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: AlignmentDirectional.center,
        constraints: BoxConstraints(maxWidth: min(textWidth + 10, 100)),
        child: Text('$text',
            maxLines: 1, overflow: TextOverflow.ellipsis, style: textStyle),
      );
    });
  }
}

/// KA用户限定关系 如 欢迎消息昵称前显示 xxx的羁绊
class KADefendWidget extends StatelessWidget {
  final String? name; // 被羁绊者姓名
  final String? relation; // 被羁绊者姓名
  final double height;
  final EdgeInsetsGeometry? padding;

  const KADefendWidget(
      {super.key,
      this.height = 26,
      this.padding = EdgeInsets.zero,
      this.name,
      this.relation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            relation ?? '',
            style: TextStyle(
              fontSize: 12,
              inherit: true,
              color: Colors.white.withOpacity(0.6),
              fontFamily: Util.fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}

/// 房间贵宾 标签
class RoomVisitantWidget extends StatelessWidget {
  final int? visitant;
  final double? width;
  final double height;
  final bool isGrey; // 是否置灰

  final EdgeInsetsGeometry? padding;

  const RoomVisitantWidget({
    super.key,
    this.visitant,
    this.width,
    this.height = 26, // 默认高度26，宽度自适应
    this.isGrey = false,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    if (visitant == null || visitant! <= 0) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: R.img(
        'visitant/room_visitant_$visitant.webp',
        package: ComponentManager.MANAGER_BASE_CORE,
        height: height,
        width: height,
        fit: BoxFit.contain,
      ),
    );
  }
}

/// 聊天彩蛋称号
class ChatEggTitleWidget extends StatelessWidget {
  final int level;
  final double height;
  final EdgeInsetsGeometry? padding;

  const ChatEggTitleWidget({
    super.key,
    this.level = 0,
    this.height = 16,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    if (level == 0 || level > 6) return const SizedBox.shrink();

    List<Color> colors = [
      const Color(0XFF43B2C3),
      const Color(0XFF515AFF),
      const Color(0XFFAC35FF),
      const Color(0XFFFF3494),
      const Color(0XFFFF2222),
      const Color(0XFFEC2DFF),
    ];

    List gradientColors = [
      [const Color(0XFF42B1C2), const Color(0XFF62C7D4)],
      [const Color(0XFF5059FF), const Color(0XFF7784FF)],
      [const Color(0XFFAB34FF), const Color(0XFFC34EFF)],
      [const Color(0XFFFF3494), const Color(0XFFFF4DB3)],
      [const Color(0XFFFF2278), const Color(0XFFFFA646)],
      [const Color(0XFFFF22C0), const Color(0XFF30C4FF)],
    ];

    List<String> strs = [
      K.chat_egg_friend,
      K.chat_egg_miss,
      K.chat_egg_my_love,
      K.chat_egg_only_love,
      K.chat_egg_only_sweet,
      K.chat_egg_soul_partner,
    ];

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
        height: height,
        alignment: AlignmentDirectional.center,
        child: GradientBorder(
          borderGradient: LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: gradientColors[level - 1],
          ),
          borderRadius: 36,
          borderWidth: 0.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  strs[level - 1],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 9,
                    color: colors[level - 1],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 嗨歌聊天彩蛋称号
class HisongChatEggTitleWidget extends StatelessWidget {
  final String? text;
  final String? textColor;
  final List<String>? borderGradientColors;
  final double height;
  final EdgeInsetsGeometry? padding;

  const HisongChatEggTitleWidget({
    super.key,
    this.text,
    this.textColor,
    this.borderGradientColors,
    this.height = 16,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    if (Util.isStringEmpty(text)) return const SizedBox.shrink();

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
        height: height,
        alignment: AlignmentDirectional.center,
        child: GradientBorder(
          borderGradient: LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: borderGradientColors != null
                ? Util.parseColors(borderGradientColors)
                : R.color.mainBrandGradientColors,
          ),
          borderRadius: 36,
          borderWidth: 0.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 9,
                    color: Util.parseColor(textColor, R.color.mainTextColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
