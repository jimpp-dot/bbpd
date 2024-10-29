import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

typedef OnItemLayout = Function(double radio);

class SuperPackGiftItem extends StatefulWidget {
  final double size;
  final double? nameFontSize;
  final double? typeFontSize;
  final double? topTagWidth;
  final double? topTagHeight;
  final double? topTagFontSize;
  final ShopMailCommodity data;
  final OnItemLayout onItemLayout;

  const SuperPackGiftItem(
      {Key? key,
      required this.size,
      required this.data,
      this.nameFontSize,
      this.typeFontSize,
      this.topTagWidth,
      this.topTagHeight,
      this.topTagFontSize,
      required this.onItemLayout})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SuperPackGiftItemState();
  }
}

class _SuperPackGiftItemState extends State<SuperPackGiftItem> {
  final GlobalKey _textColumnKey = GlobalKey();

  double _imgHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      RenderBox? textBox =
          _textColumnKey.currentContext?.findRenderObject() as RenderBox?;
      double textHeight = textBox?.size.height ?? 0;
      if (textHeight > 0) {
        double totalHeight = textHeight + _imgHeight + 4;
        widget.onItemLayout(_imgHeight / totalHeight);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth == 0) {
        return _buildGiftItem(widget.size);
      }
      return _buildGiftItem(constraints.maxWidth);
    });
  }

  Widget _buildGiftItem(double width) {
    if (_imgHeight == 0.0) {
      _imgHeight = width;
    }
    bool showBottomTag = this.widget.data.type == 'diamond_box';

    String topTag = '';
    if (!Util.isStringEmpty(this.widget.data.cornerDesc)) {
      topTag = this.widget.data.cornerDesc!;
    } else if ((this.widget.data.num ?? 0) > 0) {
      topTag = 'x${this.widget.data.num}';
    }

    double radio = width / this.widget.size;

    if (this.widget.data.type == 'diamond') {
      radio = 0.75;
    } else if (showBottomTag) {
      radio = 0.85;
    } else {
      radio = radio * 0.9;
    }

    String subTitle = showBottomTag
        ? K.gitf_max_diamond_count(
            [(Util.numberToKString(this.widget.data.returnNum ?? 0, fix: 1))])
        : (this.widget.data.subType ?? '');
    Color textColor = const Color(0xFF313131).withOpacity(0.6);
    if (Util.isStringEmpty(subTitle)) {
      subTitle = this.widget.data.name ?? '';
      textColor = Colors.transparent;
    }

    IVipManager vipManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    //首冲礼物
    Widget widget = vipManager.getCommodityListItemTop(
        ratio: radio, commodity: this.widget.data);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          height: width,
          decoration: const BoxDecoration(
            color: Color(0xFFF6F7F9),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              widget,
              if (!Util.isStringEmpty(topTag))
                PositionedDirectional(
                    top: 0, end: 0, child: _buildTopTag(topTag)),
              if (showBottomTag)
                PositionedDirectional(bottom: 0, child: _buildBottomTag())
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          key: _textColumnKey,
          children: [
            Text(
              this.widget.data.name ?? '',
              style: TextStyle(
                  color: const Color(0xFF313131),
                  fontSize: (this.widget.nameFontSize ?? 16),
                  fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subTitle,
              style: TextStyle(
                  color: textColor, fontSize: (this.widget.typeFontSize ?? 13)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ],
    );
  }

  Container _buildTopTag(String tag) {
    return Container(
      width: widget.topTagWidth ?? 45,
      height: widget.topTagHeight ?? 20,
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xFFFA65FF), Color(0xFFFF7072)]),
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          tag,
          style: TextStyle(
              color: Colors.white,
              fontSize: widget.topTagFontSize ?? 13,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildBottomTag() {
    return Container(
      height: 20,
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xFFFA65FF), Color(0xFFFF7072)]),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(8),
          topEnd: Radius.circular(8),
        ),
      ),
      child: Center(
        child: Text(
          K.gift_random_num,
          style: const TextStyle(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
