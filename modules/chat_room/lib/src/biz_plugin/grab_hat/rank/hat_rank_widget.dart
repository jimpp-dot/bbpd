import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/protobuf/generated/grab_hat_rank.pb.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_rank_list_widget.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HatRankWidget extends StatefulWidget {
  const HatRankWidget({Key? key}) : super(key: key);

  @override
  State<HatRankWidget> createState() => HatRankWidgetState();
}

class HatRankWidgetState extends State<HatRankWidget> {
  late ApiHatActivityRankIndexResponse rankResponse;
  bool _isLoading = false;
  final _chooseRankIndex = 0.obs;

  final _myRankData = HatActivityRankItem().obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: Loading());
    } else {
      if (!rankResponse.success) {
        return _errorWidget();
      }
    }
    return Stack(alignment: Alignment.center, children: [
      SingleChildScrollView(child: _renderBody()),
      PositionedDirectional(bottom: -1, child: _myRankWidget()),
    ]);
  }

  Widget _renderBody() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              RoomAssets.chat_room$grab_hat_hat_middle_bg_webp,
              width: Util.width - 16.dp,
              centerSlice: const Rect.fromLTWH(158, 243, 40, 40),
              scale: 2,
            ),
          ),
          Container(
            constraints: BoxConstraints(
              //根据图片大小确定最小高度
              minHeight: Util.height,
              minWidth: Util.width - 16.dp,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 55.dp,
                ),
                _buttonsWidget(),
                SizedBox(
                  height: 11.dp,
                ),
                Obx(() {
                  HatActivityRankTabItem tabItem =
                      rankResponse.data.tabs[_chooseRankIndex.value];
                  return HatRankListWidget(
                    token: tabItem.token,
                    getMyRankData: (HatActivityRankItem item, int token) {
                      HatActivityRankTabItem chooseTabItem =
                          rankResponse.data.tabs[_chooseRankIndex.value];
                      if (token == chooseTabItem.token) {
                        _myRankData.value = item;
                      }
                    },
                  );
                }),
                SizedBox(
                  height: max(Util.bottomMargin, 34) + 60,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: 0,
            child: R.img(
              RoomAssets.chat_room$grab_hat_hat_middle_bg_up_webp,
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

  Widget _buttonsWidget() {
    return Obx(() {
      List<Widget> buttons = [];
      for (int i = 0; i < rankResponse.data.tabs.length; i++) {
        HatActivityRankTabItem tabItem = rankResponse.data.tabs[i];
        Widget button = GestureDetector(
          onTap: () {
            if (i != _chooseRankIndex.value) {
              _chooseRankIndex.value = i;
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 102.dp,
                height: 36.dp,
                decoration: BoxDecoration(
                    color: const Color(0xff5B2EA3),
                    borderRadius: BorderRadius.circular(18.dp)),
              ),
              if (i == _chooseRankIndex.value)
                R.img(RoomAssets.chat_room$grab_hat_hat_rank_choose_bg_webp,
                    width: 103.dp, height: 40.dp, fit: BoxFit.fill),
              Text(tabItem.tab,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        );
        buttons.add(button);
        if (rankResponse.data.tabs.length > 3) {
          buttons.add(const SizedBox(
            width: 6,
          ));
        }
      }

      if (rankResponse.data.tabs.length <= 3) {
        return SizedBox(
          width: Util.width - 56.dp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: buttons,
          ),
        );
      }

      return SizedBox(
        width: Util.width - 56.dp,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: buttons,
          ),
        ),
      );
    });
  }

  Widget _errorWidget() {
    return Center(
      child: ErrorData(
        error: rankResponse.message,
        onTap: () {
          _requestData();
          if (mounted) {
            setState(() {});
          }
        },
      ),
    );
  }

  Widget _myRankWidget() {
    return Obx(() {
      HatActivityRankItem myRank = _myRankData.value;
      if (myRank.name.isEmpty) return const SizedBox.shrink();
      return Container(
        padding: EdgeInsetsDirectional.only(
            bottom: max(Util.bottomMargin, 34), start: 28.dp, end: 28.dp),
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(11), topEnd: Radius.circular(11)),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff201050), Color(0xff32025B)],
          ),
          border: GradientBoxBorder(
            gradient: LinearGradient(colors: [
              const Color(0xFFFDE6D7),
              const Color(0xffFBE2DC).withOpacity(0)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        height: max(Util.bottomMargin, 34) + 60,
        width: Util.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(
                minWidth: 36,
              ),
              alignment: Alignment.center,
              child: Text(
                  myRank.rank >= 100 || myRank.rank < 0
                      ? '100+'
                      : (myRank.rank + 1).toString(),
                  style: TextStyle(
                    color: const Color(0xffFCD2AE),
                    fontSize: 16,
                    fontFamily: Util.numFontFamily,
                    package: ComponentManager.MANAGER_BASE_CORE,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsetsDirectional.only(start: 5, end: 5),
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                ),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(myRank.icon),
                    width: 42,
                    height: 42,
                  ),
                )),
            Expanded(
              child: Text(myRank.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Text(
                myRank.score > 10000
                    ? Util.numberToShortString(myRank.score)
                    : myRank.score.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: Util.numFontFamily,
                  package: ComponentManager.MANAGER_BASE_CORE,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              width: 9,
            ),
          ],
        ),
      );
    });
  }

  void _requestData() async {
    _isLoading = true;
    rankResponse = await HatRequest.getRankTabsData();
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }
}
