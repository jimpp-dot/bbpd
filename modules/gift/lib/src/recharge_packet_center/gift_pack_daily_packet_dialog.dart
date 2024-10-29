import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/model/generated/slp_gift_pack.pb.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

class GiftPackDailyPacketDialog extends StatefulWidget {
  final List<GiftPackOpen>? dataList;
  final GiftPackOpen? data;
  const GiftPackDailyPacketDialog({Key? key, this.data, this.dataList})
      : super(key: key);

  @override
  State<GiftPackDailyPacketDialog> createState() =>
      _GiftPackDailyPacketDialogState();

  static Future<void> show(BuildContext context,
      {GiftPackOpen? data, List<GiftPackOpen>? dataList}) async {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: GiftPackDailyPacketDialog(
            data: data,
            dataList: dataList,
          ),
        );
      },
    );
  }
}

class _GiftPackDailyPacketDialogState extends State<GiftPackDailyPacketDialog> {
  final double _widgetWidth = Util.width - 56 * 2;
  void _closeDialog() {
    Navigator.of(context, rootNavigator: true).pop(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.dataList?.isNotEmpty == true
        ? _buildDataList()
        : _buildData();
  }

  Widget _buildData() {
    String dateStr = (widget.data?.periodDay ?? 0) > 0
        ? ("${(widget.data?.periodDay ?? 0)}${K.gift_day}")
        : ("${(widget.data?.periodHour ?? 0)}${K.gift_hour}");
    return Stack(
      children: [
        SizedBox(
          width: _widgetWidth,
          height: 340,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 20),
                child: Text(
                  K.git_pack_congratulation_get,
                  style: const TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              CachedNetworkImage(
                width: 140,
                height: 140,
                imageUrl:
                    System.imageDomain + (widget.data?.commodityIcon ?? ''),
              ),
              Container(
                height: 22,
                margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.data?.commodityName ?? '',
                      style: const TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 18,
                      padding:
                          const EdgeInsetsDirectional.only(start: 5, end: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                            // 渐变的位置(从左上角到右下角)
                            begin: AlignmentDirectional.centerEnd,
                            end: AlignmentDirectional.centerStart,
                            colors: [
                              Color(0xFFFF6767),
                              Color(0xFFFFA536),
                            ]),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        dateStr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 16, start: 20, end: 20, bottom: 20),
                child: Text(
                  widget.data?.tips ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
              _buildSureButton(context),
            ],
          ),
        ),
        PositionedDirectional(
          end: 4,
          child: IconButton(
            onPressed: _closeDialog,
            icon: R.img(
              Assets.gift_pack_gift_pack_daily_coupon_close_webp,
              width: 24,
              height: 24,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataList() {
    return Container(
      height: 458,
      width: 295,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            K.git_pack_congratulation_get,
            style: const TextStyle(
                color: Color(0xFF202020),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 263,
                height: 260,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  childAspectRatio: 0.7,
                  primary: false,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 16.0,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: _buildGrid(),
                ),
              ),
              PositionedDirectional(
                bottom: -5,
                child: Container(
                  width: 263,
                  height: 32,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0),
                      Colors.white.withOpacity(1),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 20, start: 20, end: 20, bottom: 20),
            child: Text(
              widget.dataList![0].tips,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xE6000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          _buildSureButton(context),
        ],
      ),
    );
  }

  List<Widget> _buildGrid() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.dataList!.length; i++) {
      widgets.add(_buildItem(i));
    }
    return widgets;
  }

  Widget _buildItem(int index) {
    String dateStr = widget.dataList![index].periodDay > 0
        ? ("${(widget.dataList![index].periodDay)}${K.gift_day}")
        : ("${(widget.dataList![index].periodHour)}${K.gift_hour}");
    return Stack(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF6F7F9),
              ),
              child: CachedNetworkImage(
                width: 77,
                height: 77,
                imageUrl: widget.dataList![index].commodityIcon,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 72,
              ),
              child: Text(
                widget.dataList![index].commodityName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        PositionedDirectional(
          start: 0,
          top: 0,
          child: Container(
            height: 18,
            padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(8),
                bottomEnd: Radius.circular(8),
              ),
              gradient: LinearGradient(
                  // 渐变的位置(从左上角到右下角)
                  begin: AlignmentDirectional.centerEnd,
                  end: AlignmentDirectional.centerStart,
                  colors: [
                    Color(0xFFFF6767),
                    Color(0xFFFFA536),
                  ]),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              dateStr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSureButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop(context);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
        height: 48,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          color: Color(0xFF7D2EE6),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(27)),
        ),
        child: Text(
          K.gift_confirm,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
