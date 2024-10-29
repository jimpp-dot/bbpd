import 'dart:convert';
import 'dart:io';

import 'package:chat_room/k.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// KA用户APP评价弹框
class KaAppEvaluateDialog extends StatefulWidget {
  final String giftIcon;
  final String giftName;

  const KaAppEvaluateDialog(
      {Key? key, required this.giftIcon, required this.giftName})
      : super(key: key);

  static Future<void> checkAndShow(BuildContext context) async {
    if (!Platform.isAndroid) return;
    Map data = await _parseData();
    String? giftIcon = data['gift_icon'];
    String? giftName = data['gift_name'];
    if (Util.isStringEmpty(giftIcon) || Util.isStringEmpty(giftName)) return;

    DialogQueue.root.enqueue(
      context: context,
      barrierColor: Colors.black26,
      builder: (context) => KaAppEvaluateDialog(
        giftIcon: giftIcon!,
        giftName: giftName!,
      ),
    );
  }

  static Future<Map> _parseData() async {
    String? data =
        await HiveUtil.get<String>('${Session.uid}_${AppConfig.ka_evaluate}');
    if (Util.isStringEmpty(data)) return {};
    try {
      var result = jsonDecode(data!);
      return result is Map ? result : {};
    } catch (e) {
      return {};
    }
  }

  @override
  State<StatefulWidget> createState() => _KaAppEvaluateDialogState();
}

class _KaAppEvaluateDialogState extends State<KaAppEvaluateDialog> {
  @override
  void initState() {
    super.initState();
    // 显示时将标记删除掉
    HiveUtil.delete<String>('${Session.uid}_${AppConfig.ka_evaluate}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height,
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 280,
            height: 340,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                PositionedDirectional(
                  bottom: 0,
                  child: _buildContent(context),
                ),
                PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: R.img(RoomAssets.chat_room$ic_ka_evaluate_like_webp,
                      width: 100, height: 130),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: R.img(RoomAssets.chat_room$ic_close_svg,
                width: 42, height: 42, color: const Color(0xFFD8D8D8)),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFCE8FE), Colors.white],
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsetsDirectional.only(
          start: 24, top: 16, end: 24, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          R.img(RoomAssets.chat_room$ic_ka_evaluate_title_webp,
              width: 140, height: 20),
          const SizedBox(height: 15),
          _buildReward(),
          const Spacer(),
          _buildActionBtn(context),
          const SizedBox(height: 16),
          _buildActionText(context),
        ],
      ),
    );
  }

  Widget _buildReward() {
    return Container(
      width: 232,
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0x0F7D2EE6),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsetsDirectional.only(top: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.room_ka_evaluate_tip,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(Util.getRemoteImgUrl(widget.giftIcon),
                  width: 44, height: 44),
              const SizedBox(width: 10),
              Text(
                widget.giftName,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        AppReviewDialog.doAppReview();
      },
      child: Container(
        width: 232,
        height: 50,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF99FFBC),
            Color(0xFF26C4FF),
            Color(0xFF926AFF)
          ]),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Text(
          K.room_ka_evaluate_good,
          style: const TextStyle(
              color: Color(0xE6080A31),
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildActionText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        BaseWebviewScreen.show(System.context, url: Constant.feedbackUrl);
      },
      child: Container(
        width: 232,
        alignment: AlignmentDirectional.center,
        child: Text(
          K.room_ka_evaluate_terrible,
          style: const TextStyle(
              color: Colors.black26, fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
