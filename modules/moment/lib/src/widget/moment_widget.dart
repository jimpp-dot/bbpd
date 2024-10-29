import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/widget/like_widget.dart';

import '../../assets.dart';

/// 点赞评论打招呼
class SayHiWidget extends StatelessWidget {
  final Moment moment;
  final LikeCallback? onLikeTaped;
  final VoidCallback? onCommentTaped;
  final VoidCallback? onSayHiTaped;
  final VoidCallback? onGiftTaped;
  final bool isGlobalMoment; //全局广播
  final Color? mainTextColor;
  final Color? secondTextColor;
  final Color? hiBgColor;
  final MomentFlowPage? page;
  final bool supportDark;

  const SayHiWidget(
      {super.key,
      required this.moment,
      this.onLikeTaped,
      this.onCommentTaped,
      this.onSayHiTaped,
      this.onGiftTaped,
      this.isGlobalMoment = false,
      this.mainTextColor,
      this.secondTextColor,
      this.hiBgColor,
      this.supportDark = false,
      this.page});

  void _onSayHiTaped() {
    if (onSayHiTaped != null) {
      onSayHiTaped!();
    }
  }

  @override
  Widget build(BuildContext context) {
    MomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    if (manager.themeConfig.showSayHiV2) {
      return Row(
        children: <Widget>[
          _buildComment(),
          const SizedBox(
            width: 10,
          ),
          LikeWidget(
              secondTextColor: R.color.thirdTextColor,
              mainTextColor: mainTextColor,
              moment: moment,
              onLikeTaped: onLikeTaped,
              supportDark: false),
          const Spacer(),
          if (Session.uid != moment.uid) _buildHi(),
        ],
      );
    }

    if (isGlobalMoment) {
      return Row(
        children: <Widget>[
          _locAndTime(),
          const Spacer(),
          LikeWidget(
            moment: moment,
            onLikeTaped: onLikeTaped,
            secondTextColor: secondTextColor,
            mainTextColor: mainTextColor,
          ),
          const SizedBox(
            width: 10,
          ),
          _buildComment(),
        ],
      );
    }

    return Row(
      children: <Widget>[
        _buildComment(),
        const Spacer(),
        LikeWidget(
          moment: moment,
          onLikeTaped: onLikeTaped,
          supportDark: supportDark,
        ),
        if (Session.uid != moment.uid) _buildHi(),
      ],
    );
  }

  String giftIcon() {
    return darkMode
        ? 'singerfriend/singer_friend_club_info_gift_dark.webp'
        : 'singerfriend/singer_friend_club_info_gift.svg';
  }

  String commentIcon() {
    return darkMode ? 'ic_comment_dark.webp' : 'ic_comment.webp';
  }

  String sayHiIcon() {
    return darkMode ? 'moment/ic_say_hi_dark.webp' : 'moment/ic_say_hi.webp';
  }

  Widget _buildComment() => GestureDetector(
        onTap: onCommentTaped,
        child: SizedBox(
          width: 55,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 2.0, bottom: 2.0, end: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                R.img(
                  commentIcon(),
                  width: 28,
                  height: 28,
                  package: ComponentManager.MANAGER_MOMENT,
                ),
                const SizedBox(width: 4),
                NumText(
                  '${moment.cmtNum}', //
                  style: TextStyle(
                      color: R.color.secondTextColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildHi() => Padding(
        padding: const EdgeInsetsDirectional.only(start: 26.0),
        child: InkWell(
          onTap: () => _onSayHiTaped(),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 6.0, top: 2.0, bottom: 2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                R.img(
                  Assets.moment_ic_say_hi_webp,
                  width: 28,
                  height: 28,
                  package: Assets.package,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5),
                  child: Text(
                    K.moment_say_hi_v2,
                    style: TextStyle(
                        color: R.color.thirdTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // Widget _buildHiV2() => Padding(
  //       padding: const EdgeInsetsDirectional.only(start: 26.0),
  //       child: GestureDetector(
  //         behavior: HitTestBehavior.opaque,
  //         onTap: () => _onSayHiTaped(),
  //         child: Container(
  //           height: 24,
  //           padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
  //           decoration:
  //               const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(13)), color: Color(0xFFB6E4FC)),
  //           child: Row(
  //             children: <Widget>[
  //               Text(
  //                 K.moment_say_hi_v2,
  //                 style: TextStyle(
  //                   color: mainTextColor,
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );

  _locAndTime() {
    if (((moment.location != null && moment.location!.isNotEmpty) ||
        moment.rushPublishTime != null)) {
      return _buildLocationAndTime(moment.location!, moment.rushPublishTime!);
    } else {
      return Container();
    }
  }

  Widget _buildLocationAndTime(String location, String? time) {
    String timeText =
        '${(moment.location != null && moment.location!.isNotEmpty) ? ' | ' : ''}$time';
    return Row(
      children: <Widget>[
        if (moment.location != null && moment.location!.isNotEmpty)
          Container(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Text(
              moment.location!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: secondTextColor ?? R.color.secondTextColor,
                fontSize: 11,
              ),
            ),
          ),
        if (time != null && time.isNotEmpty)
          Text(
            timeText,
            style: TextStyle(
              color: secondTextColor ?? R.color.secondTextColor,
              fontSize: 11,
            ),
          ),
      ],
    );
  }
}

/// 标签item
/// 添加标签页，动态发布页
// ignore: must_be_immutable
class TagItem extends StatelessWidget {
  final String? tag;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDeleteTap;
  final Color? background;
  final Color? iconColor;
  TextStyle? textStyle;
  final double height;
  final double? maxWidth;
  final String icon;
  bool setIconColor;
  bool iconUseTextColor;
  final Moment? moment;
  final double leading;
  final bool supportDark;
  final List<Color>? bgColors;

  TagItem({
    super.key,
    this.tag,
    this.onTap,
    this.icon = 'ic_tag.svg',
    this.iconColor,
    this.onDeleteTap,
    this.background,
    this.height = 24,
    this.textStyle,
    this.maxWidth,
    this.moment,
    this.leading = 10,
    this.iconUseTextColor = false,
    this.supportDark = false,
    this.bgColors,
    this.setIconColor = true,
  });

  @override
  Widget build(BuildContext context) {
    if (tag == null || tag!.isEmpty) {
      return Container();
    }
    IMomentManager momentManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    double end = 12;
    if (onDeleteTap != null) {
      end = 0;
    }

    textStyle = textStyle ??
        TextStyle(
          color: momentManager.themeConfig.tagTextColor ??
              (supportDark ? R.colors.mainTextColor : R.color.mainTextColor),
          fontSize: 13,
          fontFamily: Util.fontFamily,
        );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: EdgeInsetsDirectional.only(start: leading, end: end),
        decoration: BoxDecoration(
          color: bgColors == null
              ? (supportDark ? R.colors.dividerColor : Colors.transparent)
              : null,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          gradient: bgColors != null
              ? LinearGradient(
                  colors: bgColors!,
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                )
              : null,
        ),
        constraints:
            maxWidth != null ? BoxConstraints(maxWidth: maxWidth!) : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 2.0),
              child: R.img(
                icon,
                package: ComponentManager.MANAGER_MOMENT,
                width: 13,
                height: 13,
                color: iconColor ??
                    ((setIconColor || iconUseTextColor)
                        ? textStyle?.color
                        : null),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Text(
                  '$tag',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle,
                ),
              ),
            ),
            if (onDeleteTap != null)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onDeleteTap,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 4, bottom: 4, start: 4, end: 8),
                  child: R.img(
                    'ic_tag_delete.svg',
                    package: ComponentManager.MANAGER_MOMENT,
                    width: 13,
                    height: 13,
                    color: R.colors.mainTextColor.withOpacity(0.2),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

/// 约玩游戏 text
class GameText extends StatelessWidget {
  final PlayTag? playTag;
  final Color? textColor;

  const GameText({super.key, this.playTag, this.textColor});

  @override
  Widget build(BuildContext context) {
    if (playTag == null) {
      return Container();
    }

    return Text(
      playTag?.displayGameText ?? '',
      style: TextStyle(
        color: textColor ?? R.color.secondaryBrandColor,
        fontSize: 16,
      ),
    );
  }
}

typedef OnPlayTagTaped = void Function(int index, Item item);

/// 游戏 模式 区服 标签grid
class TagGridWidget extends StatefulWidget {
  final String? title;
  final Item? selectItem;
  final List<Item>? items;
  final OnPlayTagTaped? onTaped;
  final TextStyle? titleStyle;

  const TagGridWidget(
      {super.key,
      this.title,
      this.items,
      this.selectItem,
      this.onTaped,
      this.titleStyle});

  @override
  _TagGridWidgetState createState() => _TagGridWidgetState();
}

class _TagGridWidgetState extends State<TagGridWidget> {
  int _selectIndex = 0;
  String? initPosition;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    if (widget.selectItem != null && widget.items != null) {
      _selectIndex = widget.items!
          .indexWhere((item) => item.name == widget.selectItem?.name);
    }
    if (_selectIndex == -1) {
      _selectIndex = 0;
    }
  }

  @override
  void didUpdateWidget(TagGridWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      _init();
    }
  }

  _onItemTaped(int index, Item item) {
    if (_selectIndex == index) {
      return;
    }
    if (widget.onTaped != null) {
      widget.onTaped!(index, item);
    }
    _selectIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items == null || widget.items!.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            widget.title ?? '',
            style: widget.titleStyle ??
                TextStyle(fontSize: 14.0, color: R.color.thirdTextColor),
          ),
        ),
        GridView.count(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 5 / 3,
          padding: const EdgeInsets.all(0.0),
          mainAxisSpacing: 8,
          crossAxisSpacing: 5,
          crossAxisCount: 4,
          shrinkWrap: true,
          children: widget.items!
              .asMap()
              .map(
                (index, item) => MapEntry(index, _buildChildItem(index, item)),
              )
              .values
              .toList(),
        )
      ],
    );
  }

  Widget _buildChildItem(int index, Item item) {
    bool select = _selectIndex == index;

    return GestureDetector(
      onTap: () => _onItemTaped(index, item),
      child: TagSelectItem(text: item.name ?? '', select: select),
    );
  }
}

/// 游戏 模式 区服 标签 item
class TagSelectItem extends StatelessWidget {
  final bool select;
  final String text;

  final double? width;
  final double? height;

  const TagSelectItem(
      {super.key,
      required this.select,
      required this.text,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: select ? R.color.mainBrandColor : R.color.secondBgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding:
          const EdgeInsetsDirectional.only(start: 4, end: 4, top: 2, bottom: 2),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: select ? Colors.white : R.color.secondTextColor,
          fontSize: 13,
//          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// 带背景的约玩标签
class YueTagWidget extends StatelessWidget {
  final PlayTag? playTag;
  final bool canTap;

  const YueTagWidget({super.key, this.playTag, this.canTap = true});

  @override
  Widget build(BuildContext context) {
    if (playTag == null) {
      return const SizedBox(width: 0, height: 0);
    }

    return GestureDetector(
      onTap: () => _gotoPlayTagList(context, playTag!),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          height: 24,
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(16),
              bottomStart: Radius.circular(12),
              bottomEnd: Radius.circular(16),
            ),
            color: Color(0xFFE2E2E2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              R.img(
                'ic_play_game.svg',
                package: ComponentManager.MANAGER_MOMENT,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              Text(
                playTag!.tagName,
                maxLines: 1,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _gotoPlayTagList(BuildContext context, PlayTag tag) {
    if (canTap) {
      IMomentManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
      manager.openGameTagListScreenScreen(context,
          gameId: tag.id, title: tag.displayTitleName);
    }
  }
}

/// 普通话题集合
class NormalTagsWidget extends StatelessWidget {
  final List<NormalTag> tags;
  final bool canTap;
  final int? parentTagId;
  final PageType type;
  final Moment? moment;
  final MomentFlowPage? page; // 页面来源
  final String? topicName; // 页面标签
  final Color? tagBgColor;
  final List<Color>? tagBgColors;
  final Color? tagTextColor;
  final bool supportDark;

  const NormalTagsWidget(
      {super.key,
      required this.tags,
      this.canTap = true,
      this.parentTagId,
      this.type = PageType.Tag,
      this.moment,
      this.page,
      this.topicName,
      this.tagBgColor,
      this.tagBgColors,
      this.tagTextColor,
      this.supportDark = false});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags.map((item) {
        return TagItem(
          moment: moment,
          tag: item.tag,
          supportDark: supportDark,
          background: tagBgColor ?? R.colors.tagGradientColors[0],
          bgColors: tagBgColors,
          textStyle: TextStyle(
            color: tagTextColor ?? R.colors.tagTextColor,
            fontSize: 13,
          ),
          onTap: () => _gotoTagList(context, item),
        );
      }).toList(),
    );
  }

  _gotoTagList(BuildContext context, NormalTag tag) {
    if (canTap) {
      if (parentTagId != null && parentTagId == tag.id) {
        return;
      }
      trackerReport(
          moment: moment, page: page, clickType: 'tag', topicName: topicName);

      IMomentManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
      manager.openTagListScreenScreen(context,
          tagId: tag.id, title: tag.tag ?? '', pageType: type);
    }
  }
}

/// 发布动态底部按钮
class PublishBottomButton extends StatelessWidget {
  final String? icon;
  final VoidCallback? onTap;
  final bool selected;
  final double? iconSize;
  final Color? normalColor;

  const PublishBottomButton({
    super.key,
    this.icon,
    this.onTap,
    this.iconSize,
    this.selected = false,
    this.normalColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        alignment: Alignment.center,
        child: R.img(
          icon,
          package: ComponentManager.MANAGER_MOMENT,
          width: iconSize ?? 24.0,
          height: iconSize ?? 24.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
