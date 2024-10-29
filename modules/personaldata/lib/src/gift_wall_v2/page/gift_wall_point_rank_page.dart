import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/api/gift_wall_api.dart';
import 'package:personaldata/k.dart';

/// 图鉴积分排行榜
class GiftWallPointRankPage extends StatefulWidget {
  const GiftWallPointRankPage({Key? key}) : super(key: key);

  @override
  State<GiftWallPointRankPage> createState() => _GiftWallPointRankPageState();

  static Future show(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: '/GiftWallPointRankPage'),
            builder: (_) => const GiftWallPointRankPage()));
  }
}

class _GiftWallPointRankPageState extends State<GiftWallPointRankPage> {
  bool _isLoading = false;
  LightScoreRankRsp? _rankRsp;
  late ScrollController _scrollController;
  double _appBarOpacity = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      ScrollPosition scrollPosition = _scrollController.position;
      double offset = scrollPosition.pixels;
      if (offset <= 80) {
        offset = offset < 0 ? 0 : offset;
        _appBarOpacity = min(offset / 80.toDouble(), 1);
        if (mounted) setState(() {});
      }
    });
    _requestData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? _loadingWidget()
          : (_rankRsp != null && _rankRsp!.success)
              ? _buildBody()
              : _errorWidget(),
      backgroundColor: const Color(0xff0F1328),
      appBar: BaseAppBar(
        K.point_rank,
        backgroundColor: const Color(0xff0F1328).withOpacity(_appBarOpacity),
        titleColor: Colors.white,
        backColor: Colors.white,
        statusBrightness: Brightness.dark,
      ),
      extendBodyBehindAppBar: true,
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: Loading(),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: ErrorData(
        error: _rankRsp?.msg,
        fontColor: Colors.white,
        onTap: () {
          _requestData();
        },
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff212270), Color(0xff0D021D), Color(0xff0D021D)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _buildTopWidget(),
          ),
          SliverFixedExtentList(
            itemExtent: 70.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildRankItem(index);
              },
              childCount: (_rankRsp?.data.rankList.length ?? 0) > 3
                  ? _rankRsp!.data.rankList.length - 3
                  : 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopWidget() {
    return SizedBox(
      height: 300.dp,
      width: Util.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: R.img(
              Assets.personaldata$gift_wall_rank_point_rank_bg_webp,
              width: Util.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          if (_rankRsp?.data.rankList.isNotEmpty ?? false)
            PositionedDirectional(
              bottom: 0,
              child: _buildTopRankItem(0),
            ),
          if ((_rankRsp?.data.rankList.length ?? 0) > 1)
            PositionedDirectional(
              bottom: 0,
              start: 24.dp,
              child: _buildTopRankItem(1),
            ),
          if ((_rankRsp?.data.rankList.length ?? 0) > 2)
            PositionedDirectional(
              bottom: 0,
              end: 24.dp,
              child: _buildTopRankItem(2),
            ),
        ],
      ),
    );
  }

  Widget _buildTopRankItem(int index) {
    double headSize = index == 0 ? 76.dp : 60.dp;
    double width = index == 0 ? 108.dp : 92.dp;
    double headIconHeight = 22;
    double bgHeight = index == 0 ? 145.dp : 127.dp;

    LightScoreRankRsp_Data_Item item = _rankRsp!.data.rankList[index];
    return SizedBox(
        width: width,
        height:
            headIconHeight + headSize / 2 + bgHeight + (index == 0 ? 0 : 3.dp),
        child: Stack(
          alignment: Alignment.center,
          children: [
            PositionedDirectional(
              start: 0,
              end: 0,
              bottom: index == 0 ? 0 : 3.dp,
              child: R.img(
                index == 0
                    ? Assets
                        .personaldata$gift_wall_rank_point_rank_first_bg_webp
                    : index == 1
                        ? Assets
                            .personaldata$gift_wall_rank_point_rank_second_bg_webp
                        : Assets
                            .personaldata$gift_wall_rank_point_rank_third_bg_webp,
                width: width,
                height: bgHeight,
              ),
            ),
            PositionedDirectional(
                top: headIconHeight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        IPersonalDataManager personalDataManager =
                            ComponentManager.instance.getManager(
                                ComponentManager.MANAGER_PERSONALDATA);
                        personalDataManager.openImageScreen(context, item.uid);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: headSize,
                            height: headSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(headSize / 2),
                              color: const Color(0xffFEFDD3),
                            ),
                          ),
                          CommonAvatar(
                            path: item.icon,
                            size: headSize - 2,
                            shape: BoxShape.circle,
                          ),
                        ],
                      ),
                    ),
                    R.img(
                      index == 0
                          ? Assets
                              .personaldata$gift_wall_rank_point_rank_first_icon_webp
                          : index == 1
                              ? Assets
                                  .personaldata$gift_wall_rank_point_rank_second_icon_webp
                              : Assets
                                  .personaldata$gift_wall_rank_point_rank_third_icon_webp,
                      width: index == 0 ? 56.dp : 46.dp,
                      height: index == 0 ? 40.dp : 36.dp,
                    ),
                    SizedBox(
                      width: width,
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: NumText(
                        item.score > 100000
                            ? Util.numberToWString(item.score) + K.gift_point
                            : item.score.toString() + K.gift_point,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )),
            PositionedDirectional(
              top: 0,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 32),
                child: R.img(
                  index == 0
                      ? Assets
                          .personaldata$gift_wall_rank_point_rank_first_head_webp
                      : index == 1
                          ? Assets
                              .personaldata$gift_wall_rank_point_rank_second_head_webp
                          : Assets
                              .personaldata$gift_wall_rank_point_rank_third_head_webp,
                  width: 32,
                  height: headIconHeight,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildRankItem(int index) {
    LightScoreRankRsp_Data_Item item = _rankRsp!.data.rankList[index + 3];
    return Column(
      children: [
        const Spacer(),
        Row(
          children: [
            SizedBox(
              width: 52.dp,
              child: NumText(
                '${index + 4}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, item.uid);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 46.dp,
                    height: 46.dp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23.dp),
                      color: const Color(0xffFEFDD3),
                    ),
                  ),
                  CommonAvatar(
                    path: item.icon,
                    size: 44.dp,
                    shape: BoxShape.circle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            NumText(
              item.score.toString() + K.gift_point,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        const Spacer(),
        Container(
          margin: EdgeInsetsDirectional.only(start: 52.dp, end: 16.dp),
          height: 0.5,
          color: Colors.white.withOpacity(0.1),
        )
      ],
    );
  }

  Future<void> _requestData() async {
    if (_isLoading) return;
    _isLoading = true;
    _rankRsp = await GiftWallApi.getLightPointsRank();
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }
}
