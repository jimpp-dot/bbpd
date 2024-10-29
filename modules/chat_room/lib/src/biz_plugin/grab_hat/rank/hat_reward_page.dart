import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/protobuf/generated/grab_hat_rank.pb.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HatRewardPage extends StatefulWidget {
  const HatRewardPage({Key? key}) : super(key: key);

  @override
  State<HatRewardPage> createState() => _HatRewardPageState();

  static Future<bool?> launch(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HatRewardPage(),
      // settings: RouteSettings(name: '/unionAdminPage'),
    ));
  }
}

class _HatRewardPageState extends State<HatRewardPage> {
  final _headOpacity = 0.0.obs;
  late ApiHatActivityHelpResponse _helpResponse;
  bool _isLoading = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      double part = max(_scrollController.offset / 300, 0);
      if (part <= 1 && _headOpacity.value < 1) {
        _headOpacity.value = part > 1 ? 1 : part;
      }
    });

    _requestData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _requestData() async {
    _isLoading = true;
    ApiHatActivityHelpResponse response = await HatRequest.getHelperData();
    _isLoading = false;
    _helpResponse = response;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: Loading());
    } else {
      if (!_helpResponse.success) {
        return _errorWidget();
      }
    }
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: Util.width, height: Util.height, child: _renderBody()),
          PositionedDirectional(top: 0, start: 0, end: 0, child: _headWidget())
        ],
      ),
      backgroundColor: const Color(0xff32025B),
    );
  }

  Widget _renderBody() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Stack(children: [
            R.img(
              RoomAssets.chat_room$grab_hat_hat_head_bg_webp,
              width: Util.width,
              fit: BoxFit.fitWidth,
            ),
            PositionedDirectional(
              top: Util.statusHeight,
              start: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 44,
                    width: 44,
                    alignment: Alignment.center,
                    child: R.img(RoomAssets.chat_room$back_svg,
                        color: Colors.white, width: 24, height: 24)),
              ),
            ),
          ]),
          if (_helpResponse.data.rewards.dailyReward.isNotEmpty &&
              _helpResponse
                  .data.rewards.dailyReward.first.commodities.isNotEmpty)
            Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff201050), Color(0xff32025B)],
                )),
                child: _rewardsWidget(
                    _helpResponse.data.rewards.dailyReward.first, '日榜奖励')),
          SizedBox(
            height: 20.dp,
          ),
          if (_helpResponse.data.rewards.weeklyReward.isNotEmpty &&
              _helpResponse
                  .data.rewards.weeklyReward.first.commodities.isNotEmpty)
            _rewardsWidget(
                _helpResponse.data.rewards.weeklyReward.first, '周榜奖励'),
          SizedBox(
            height: 20.dp,
          ),
          if (_helpResponse.data.rewards.totalReward.isNotEmpty &&
              _helpResponse
                  .data.rewards.totalReward.first.commodities.isNotEmpty)
            _rewardsWidget(
                _helpResponse.data.rewards.totalReward.first, '总榜奖励'),
          SizedBox(
            height: 20.dp,
          ),
          R.img(
            RoomAssets.chat_room$grab_hat_hat_app_logo_webp,
            width: 60.dp,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 20.dp,
          ),
        ],
      ),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: ErrorData(
        error: _helpResponse.message,
        onTap: () {
          _requestData();
          if (mounted) {
            setState(() {});
          }
        },
      ),
    );
  }

  Widget _headWidget() {
    return Obx(() => Opacity(
          opacity: _headOpacity.value,
          child: Column(children: [
            Container(
              color: Colors.white,
              width: Util.width,
              height: Util.statusHeight + 44,
              padding: EdgeInsetsDirectional.only(top: Util.statusHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 44,
                        width: 44,
                        alignment: Alignment.center,
                        child: R.img(RoomAssets.chat_room$back_svg,
                            color: Colors.black, width: 24, height: 24)),
                  ),
                  const Text(
                    '帽王争霸赛',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 44,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }

  Widget _rewardsWidget(HatActivityRankRewardItem rewardItem, String title) {
    List<HatActivityRewardCommodity> rewardCommodityItems =
        rewardItem.commodities;
    List<Widget> contentList = [];
    List<Widget> rowList = [];

    for (int i = 0; i < rewardCommodityItems.length; i++) {
      HatActivityRewardCommodity rewardCommodity = rewardCommodityItems[i];
      Widget hatItemWidget = _itemWidget(rewardCommodity);
      rowList.add(hatItemWidget);
      rowList.add(SizedBox(
        width: 26.dp,
      ));

      if ((i + 1) % 2 == 0 || i + 1 == rewardCommodityItems.length) {
        rowList.removeLast();
        contentList.add(Row(
          mainAxisSize: MainAxisSize.min,
          children: [...rowList],
        ));
        contentList.add(SizedBox(
          height: 28.dp,
        ));
        rowList.removeRange(0, rowList.length);
      }
    }

    return Padding(
      padding: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              RoomAssets.chat_room$grab_hat_hat_bottom_bg_webp,
              width: Util.width - 16.dp,
              centerSlice: const Rect.fromLTWH(158, 111, 40, 40),
              scale: 2,
            ),
          ),
          Container(
            constraints: BoxConstraints(
              //根据图片大小确定最小高度
              minHeight: 263 / 359 * (Util.width - 16.dp),
              minWidth: Util.width - 16.dp,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 80.dp,
                ),
                ...contentList,
              ],
            ),
          ),
          Positioned(
            top: 25.dp,
            child: GradientText(title,
                textAlign: TextAlign.center,
                gradient: const LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    Color(0xFFFEEDD4),
                    Color(0xFFFBB989),
                  ],
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Positioned(
            top: 50.dp,
            child: GradientText('1-${rewardItem.rank}名',
                textAlign: TextAlign.center,
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    const Color(0xFFFEEDD4).withOpacity(0.7),
                    const Color(0xFFFBB989).withOpacity(0.7),
                  ],
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
          ),
          PositionedDirectional(
            top: -5,
            child: R.img(
              RoomAssets.chat_room$grab_hat_hat_bottom_bg_up_webp,
              width: 132.dp,
              fit: BoxFit.fitWidth,
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            child: R.img(
              RoomAssets.chat_room$grab_hat_hat_bg_down_webp,
              width: 69.dp,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemWidget(HatActivityRewardCommodity rewardCommodity) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40.dp),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(rewardCommodity.url),
                width: 80.dp,
                height: 80.dp,
              ),
            ),
            R.img(RoomAssets.chat_room$grab_hat_hat_icon_mask_webp,
                width: 80.dp, height: 80.dp),
          ],
        ),
        SizedBox(height: 9.dp),
        Text(rewardCommodity.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}
