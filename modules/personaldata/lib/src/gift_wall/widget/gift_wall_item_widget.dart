/*
 *
 *  Created by yao.qi on 2022/9/7 下午2:32
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/9/7 下午2:32
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

class GiftWallItemWidget extends StatefulWidget {
  final GiftWallGraphic? data;

  const GiftWallItemWidget({Key? key, this.data}) : super(key: key);

  @override
  State<GiftWallItemWidget> createState() => _GiftWallItemWidgetState(data);
}

class _GiftWallItemWidgetState extends State<GiftWallItemWidget> {
  GiftWallGraphic? data;

  _GiftWallItemWidgetState(this.data);

  @override
  void didUpdateWidget(covariant GiftWallItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    bool lighten = (data?.lighten ?? 0) > 0;
    String bg = data?.bg ?? '';
    return Container(
      width: Util.width - 40,
      height: 258,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          PositionedDirectional(
            top: 32,
            child: Container(
              width: Util.width - 40,
              height: 226,
              decoration: (lighten && data?.bgColor != null)
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: Util.parseColors(data!.bgColor),
                      ),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF000000).withOpacity(0.04),
                    ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 44,
                  ),
                  Text(
                    data?.name ?? '',
                    style: TextStyle(
                        fontSize: 16,
                        color: lighten ? Colors.white : const Color(0xFF313131),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        lighten
                            ? K.personal_has_lighten
                            : K.personal_now_not_lighten,
                        style: TextStyle(
                          fontSize: 11,
                          color: lighten
                              ? Colors.white.withOpacity(0.7)
                              : const Color(0xFF313131).withOpacity(0.4),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 2,
                        margin: const EdgeInsetsDirectional.only(
                          start: 5,
                          end: 4,
                        ),
                        decoration: ShapeDecoration(
                          shape: const StadiumBorder(),
                          color: lighten
                              ? Colors.white.withOpacity(0.7)
                              : const Color(0xFF313131).withOpacity(0.4),
                        ),
                      ),
                      Text(
                        K.personal_expire_day_count_desc(
                            ['${data?.expire ?? ''}']),
                        style: TextStyle(
                          fontSize: 11,
                          color: lighten
                              ? Colors.white.withOpacity(0.7)
                              : const Color(0xFF313131).withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _buildGiftRow(),
                ],
              ),
            ),
          ),
          ColorFiltered(
            colorFilter: !lighten
                ? greyscale
                : const ColorFilter.mode(Colors.transparent, BlendMode.color),
            child: CachedNetworkImage(
              imageUrl: Util.parseIcon(bg),
              width: 168,
              height: 72,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftRow() {
    List<GraphicGift> gifts = data?.gifts ?? [];
    if (!Util.validList(gifts)) {
      return const SizedBox.shrink();
    }
    double width = (Util.width - 20 * 2 - 12 * 2 - 4 * 3) / 4;
    if (gifts.length < 4) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: gifts
            .map((e) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
                  child: _buildGiftItem(width, e),
                ))
            .toList(),
      );
    }
    return SizedBox(
      height: 116,
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          return _buildGiftItem(width, gifts[index]);
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            width: 4,
          );
        },
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsetsDirectional.only(
          start: 12,
          end: 12,
        ),
        itemCount: gifts.length,
      ),
    );
  }

  Widget _buildGiftItem(double width, GraphicGift gift) {
    int gid = gift.gid;
    int num = gift.giftLighten;
    bool lighten = num > 0;
    Color nameColor = lighten
        ? const Color(0xFF313131)
        : const Color(0xFF313131).withOpacity(0.6);

    var content = Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        ColorFiltered(
          colorFilter: !lighten
              ? greyscale
              : const ColorFilter.mode(Colors.transparent, BlendMode.color),
          child: CachedNetworkImage(
            placeholder: const CupertinoActivityIndicator(),
            imageUrl: '${System.imageDomain}static/$giftSubDir/$gid.png',
            width: 60,
            height: 60,
            fit: BoxFit.contain,
            fadeInDuration: const Duration(microseconds: 0),
            fadeOutDuration: const Duration(microseconds: 0),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          width: 60,
          alignment: AlignmentDirectional.center,
          child: Text(
            gift.giftName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 11,
                color: data != null && data!.lighten == true
                    ? Colors.white
                    : nameColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 7),
        lighten
            ? Text(
                'x$num',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: Util.numFontFamily,
                  package: ComponentManager.MANAGER_BASE_CORE,
                  color: data != null && data!.lighten == true
                      ? Colors.white
                      : const Color(0xFF202020).withOpacity(0.6),
                ),
              )
            : Text(
                K.personal_not_lighten,
                style: TextStyle(
                  fontSize: 10,
                  color: const Color(0xFF202020).withOpacity(0.6),
                ),
              )
      ],
    );

    return Container(
      width: width,
      height: 116,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(lighten ? 0.2 : 0.1),
        backgroundBlendMode: BlendMode.overlay,
      ),
      child: lighten
          ? GradientBorderBox(
              begin: AlignmentDirectional.topEnd,
              end: AlignmentDirectional.bottomEnd,
              gradientColors: [
                Colors.white.withOpacity(0),
                Colors.white.withOpacity(0.52),
                Colors.white.withOpacity(0),
              ],
              borderWidth: 0.5,
              borderRadius: 12,
              child: content,
            )
          : content,
    );
  }
}

/// 灰阶函数
const ColorFilter greyscale = ColorFilter.matrix(<double>[
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);
