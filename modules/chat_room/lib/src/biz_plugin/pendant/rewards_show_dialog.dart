import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'pendant_util.dart';

class RewardsShowDialog extends StatefulWidget {
  final ResRoomPositionActPluginClickData rewardsInfo;

  const RewardsShowDialog({super.key, required this.rewardsInfo});

  static void show(
      BuildContext context, ResRoomPositionActPluginClickData rewardsInfo) {
    if (rewardsInfo.rewards.isEmpty) return;
    if (!Constant.inProduction) {
      Log.d(
          tag: TAG,
          'RewardsShowDialog => rewardsInfo=${rewardsInfo.toProto3Json()}');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => RewardsShowDialog(rewardsInfo: rewardsInfo),
    );
  }

  @override
  State<RewardsShowDialog> createState() => _RewardsShowDialogState();
}

class _RewardsShowDialogState extends State<RewardsShowDialog> {
  final SwiperController _controller = SwiperController();

  List<RoomPositionActRewardData> get rewards => widget.rewardsInfo.rewards;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildContent(),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: R.img(RoomAssets.chat_room$confess_v2_ic_dialog_close_webp,
                width: 48, height: 48),
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SizedBox(
      width: 280,
      height: 428,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          R.img(Util.getRemoteImgUrl(widget.rewardsInfo.backIcon),
              width: 280, height: 428),
          PositionedDirectional(
            top: 164,
            child: Container(
              width: 240,
              height: 124,
              alignment: AlignmentDirectional.center,
              child: _buildRewardList(),
            ),
          ),
          PositionedDirectional(
            top: 360,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                if (!Util.isStringEmpty(widget.rewardsInfo.jumpUrl)) {
                  SchemeUrlHelper.instance().jump(widget.rewardsInfo.jumpUrl);
                }
              },
              child: R.img(
                Util.getRemoteImgUrl(widget.rewardsInfo.buttonIcon),
                width: 165,
                height: 45,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRewardList() {
    int count = rewards.length;
    return SizedBox(
      width: 240,
      height: 132,
      child: Swiper(
        controller: _controller,
        autoplay: count > 1,
        loop: count > 1,
        autoplayDelay: 5000,
        duration: 500,
        autoplayDisableOnInteraction: true,
        itemCount: count,
        pagination: count > 1
            ? const SwiperPagination(
                alignment: Alignment(0.0, 1.5),
                margin: EdgeInsets.only(bottom: 4),
                builder: RectSwiperPaginationBuilder(
                  space: 2,
                  size: Size(4, 4),
                  activeSize: Size(10, 4),
                  activeColor: Colors.black,
                  color: Colors.black38,
                  radius: 2,
                ),
              )
            : null,
        itemBuilder: (BuildContext context, int index) =>
            _buildRewardItem(rewards[index]),
      ),
    );
  }

  Widget _buildRewardItem(RoomPositionActRewardData item) {
    return Container(
      width: 240,
      height: 124,
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Util.parseColor(item.iconBgColor, Colors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                  color: Util.parseColor(
                      item.iconBgBoardColor, Colors.transparent)!,
                  width: 0.5),
            ),
            child:
                R.img(Util.getRemoteImgUrl(item.icon), width: 90, height: 90),
          ),
          const Spacer(),
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Util.parseColor(item.nameColor, R.color.mainTextColor),
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
