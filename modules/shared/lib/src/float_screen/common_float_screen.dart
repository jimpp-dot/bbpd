import 'dart:io';
import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';

class CommonFloatScreen extends StatefulWidget {
  static bool supportType(String? type) {
    if ('global.common.notify' == type ||
        'global.common.notify.v2' == type ||
        'global.common.notify.v3' == type) {
      return true;
    }
    return false;
  }

  final File bg;
  final String scheme;
  final CommonScreenContent info;

  const CommonFloatScreen(
      {super.key, required this.bg, required this.scheme, required this.info});

  @override
  State<CommonFloatScreen> createState() => _CommonFloatScreenState();
}

class _CommonFloatScreenState extends State<CommonFloatScreen> {
  @override
  Widget build(BuildContext context) {
    CommonScreenContent info = widget.info;
    bool showHead = info.imageZone.isNotEmpty;
    bool hasAvatar = info.avatarZone.imageSize > 0;
    bool showTail = info.imageZone.length > 1;
    int leftMargin = info.leftMargin > 0 ? info.leftMargin : 31;
    int rightMargin = info.rightMargin > 0 ? info.rightMargin : 31;
    int midMargin = info.midMargin > 0 ? info.midMargin : 6;
    int midLine = info.midLine > 0 ? info.midLine : 2;
    return GestureDetector(
      onTap: () async {
        if (Util.validStr(widget.scheme)) {
          Uri uri = Uri.parse(widget.scheme);
          Map<String, String> qps = uri.queryParameters;
          int rid = Util.parseInt(qps['rid']);
          bool confirm = Util.parseBool(qps['confirm']);
          String page = Util.parseStr(qps['page']) ?? '';
          if (rid > 0 && page == 'room' && confirm) {
            IRoomManager roomManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            if (roomManager.getRid() != rid && roomManager.isMic()) {
              bool? result = await _showOnMicDialog();
              if (result != true) {
                return;
              }
            }
          }

          SchemeUrlHelper.instance()
              .checkSchemeUrlAndGo(context, widget.scheme);
        }
      },
      child: SizedBox(
        width: Util.width,
        height: 80.dp,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            _buildBackground(),
            Container(
              width: Util.width,
              height: 60.dp,
              padding: EdgeInsetsDirectional.only(
                  start: leftMargin.dp, end: rightMargin.dp),
              child: Row(
                children: [
                  if (hasAvatar) _buildAvatarZone(info.avatarZone),
                  if (showHead && !hasAvatar)
                    _buildIcon(info.imageZone[0], false),
                  if (showHead || hasAvatar) SizedBox(width: midMargin.dp),
                  Expanded(
                    child: _buildContent(midLine),
                  ),
                  if (showTail) SizedBox(width: 70.dp),
                ],
              ),
            ),
            if (showTail)
              PositionedDirectional(
                  end: rightMargin.dp,
                  child: _buildIcon(info.imageZone[1], true)),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarZone(AvatarZone zone) {
    return SizedBox(
      width: (zone.imageSize * 2 + zone.interval).dp,
      height: zone.imageSize.dp,
      child: Stack(
        children: [
          CommonAvatar(
              path: zone.leftImage,
              size: zone.imageSize.dp,
              shape: BoxShape.circle),
          PositionedDirectional(
              end: 0,
              child: CommonAvatar(
                  path: zone.rightImage,
                  size: zone.imageSize.dp,
                  shape: BoxShape.circle)),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return RepaintBoundary(
      child: MultiframeImage.file(
        widget.bg,
        loop: true,
        width: Util.width,
        height: 80.dp,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildIcon(CommonScreenIcon imageZone, bool tail) {
    Color borderColor = imageZone.color;
    bool hasBorder = borderColor != Colors.transparent;
    double radius = imageZone.cornerAngle.dp;

    double size = tail ? 64.dp : 38.dp;
    double imgSize = hasBorder ? size - 1.5.dp : size;

    Widget img = CommonAvatar(
      path: imageZone.image,
      size: imgSize,
      suffix: tail ? null : '!head150',
      borderRadius: BorderRadiusDirectional.circular(
          hasBorder ? radius - 1.5.dp : radius),
    );

    return hasBorder
        ? Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(radius),
              border: Border.all(width: 1.5.dp, color: borderColor),
            ),
            child: img,
          )
        : img;
  }

  Widget _buildContent(int midLine) {
    List<CommonScreenTag> firstLine = widget.info.upContentZone;
    List<CommonScreenTag> secondLine = widget.info.downContentZone;
    if (firstLine.isNotEmpty && secondLine.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLine(firstLine),
          _buildLine(secondLine),
        ],
      );
    } else if (firstLine.isEmpty && secondLine.isEmpty) {
      return const SizedBox.shrink();
    } else {
      List<CommonScreenTag> list =
          firstLine.isNotEmpty ? firstLine : secondLine;
      return _buildLine(list, maxLines: midLine);
    }
  }

  Widget _buildLine(List<CommonScreenTag> list, {int maxLines = 1}) {
    List<InlineSpan> spans = list.map((e) => _parseSpan(e)).toList();
    if (maxLines == 1) {
      return Container(
        height: 18.dp,
        alignment: AlignmentDirectional.centerStart,
        child: MarqueeWidget(
            delayMillis: 1000,
            child: Text.rich(TextSpan(children: spans), maxLines: maxLines)),
      );
    } else {
      return Text.rich(TextSpan(children: spans),
          maxLines: maxLines, overflow: TextOverflow.ellipsis);
    }
  }

  InlineSpan _parseSpan(CommonScreenTag item) {
    if (item.isImage) {
      int height = item.height > 0 && item.height < 18 ? item.height : 18;
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Padding(
          padding: EdgeInsetsDirectional.only(end: 4.dp),
          child: CachedNetworkImage(
            imageUrl: item.content,
            width: item.width > 0 ? item.width.dp : null,
            height: height.dp,
            fit: item.width > 0 ? null : BoxFit.fitHeight,
          ),
        ),
      );
    } else {
      TextStyle style = TextStyle(
          color: item.color,
          fontSize: 13.dp,
          fontWeight: item.isBold ? FontWeight.w600 : null);
      String text = item.content;
      if (item.wordsLimit > 0 && item.content.length > item.wordsLimit) {
        text = '${text.safeSubstring(0, item.wordsLimit)}... ';
      }
      return TextSpan(text: text.toCharacterBreakStr(), style: style);
    }
  }

  Future<bool?> _showOnMicDialog() async {
    bool? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
              title: K.room_exit_to_new_room,
              negativeButton: NegativeButton(text: K.app_review_feedback_not));
        });
    return result;
  }
}

class CommonScreenContent {
  List<CommonScreenIcon> imageZone;
  List<CommonScreenTag> upContentZone; // 文本区上层
  List<CommonScreenTag> downContentZone; // 文本区下层
  int leftMargin;
  int rightMargin;
  int midMargin;
  int midLine;
  AvatarZone avatarZone;

  CommonScreenContent(
      this.imageZone,
      this.upContentZone,
      this.downContentZone,
      this.leftMargin,
      this.rightMargin,
      this.midMargin,
      this.midLine,
      this.avatarZone);

  factory CommonScreenContent.parseMap(Map map) {
    return CommonScreenContent(
      Util.parseList(map['image_zone'], (e) => CommonScreenIcon.parseMap(e)),
      Util.parseList(
          map['up_content_zone'], (e) => CommonScreenTag.parseMap(e)),
      Util.parseList(
          map['down_content_zone'], (e) => CommonScreenTag.parseMap(e)),
      Util.parseInt(map['left_margin']),
      Util.parseInt(map['right_margin']),
      Util.parseInt(map['mid_margin']),
      Util.parseInt(map['mid_line']),
      AvatarZone.parseMap(Util.parseMap(map['avatar_zone'])),
    );
  }
}

// 首尾图片区
class CommonScreenIcon {
  String image; // 地址
  Color color; // 色值
  int cornerAngle; // 圆角角度

  CommonScreenIcon(this.image, this.color, this.cornerAngle);

  factory CommonScreenIcon.parseMap(Map map) {
    return CommonScreenIcon(
      Util.parseStr(map['image']) ?? '',
      Util.parseColor(map['color'], Colors.transparent) ?? Colors.transparent,
      Util.parseInt(map['corner_angle']),
    );
  }
}

// 文本区
class CommonScreenTag {
  int type; // 0:text 1:图片
  String content; // 图片地址/文本内容
  Color color; // 色值
  int width; // 图片宽度
  int height; // 图片高度
  bool isBold; // 是否加粗
  int wordsLimit; // 字数限制

  bool get isImage => type == 1;

  CommonScreenTag(this.type, this.content, this.color, this.width, this.height,
      this.isBold, this.wordsLimit);

  factory CommonScreenTag.parseMap(Map map) {
    return CommonScreenTag(
      Util.parseInt(map['type']),
      Util.parseStr(map['content']) ?? '',
      Util.parseColor(map['color'], Colors.white)!,
      Util.parseInt(map['width']),
      Util.parseInt(map['height']),
      Util.parseBool(map['is_bold']),
      Util.parseInt(map['words_limit']),
    );
  }
}

// 双头像区域
class AvatarZone {
  String leftImage; //左边头像
  String rightImage; //右边头像
  int imageSize;
  int interval;

  AvatarZone(this.leftImage, this.rightImage, this.imageSize, this.interval);

  factory AvatarZone.parseMap(Map map) {
    return AvatarZone(
      Util.notNullStr(map['left_image']),
      Util.notNullStr(map['right_image']),
      Util.parseInt(map['image_size']),
      Util.parseInt(map['interval']),
    );
  }
}
