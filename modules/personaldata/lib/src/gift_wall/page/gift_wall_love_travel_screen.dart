import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/gift_wall_api.dart';
import '../model/pb/generated/slp_travel.pb.dart';
import '../widget/gift_wall_item_widget.dart';
import '../../../k.dart';

/// 礼物墙-爱的旅行地图页面

class GiftWallLoveTravelScreen extends StatefulWidget {
  final int targetUid;

  const GiftWallLoveTravelScreen(this.targetUid, {Key? key}) : super(key: key);

  @override
  State<GiftWallLoveTravelScreen> createState() =>
      _GiftWallLoveTravelScreenState();
}

class _GiftWallLoveTravelScreenState extends State<GiftWallLoveTravelScreen>
    with AutomaticKeepAliveClientMixin {
  bool _isLoading = true;
  String? _errorMsg;
  TravelWall? _data;
  int lines = 0; // 根据每排展示3个数据计算出有几排
  double itemWidth = (Util.width - 32 * 2 - 5 * 2) / 3;
  double itemHeight = 116;
  bool lighten = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _load() async {
    ResTravelWall rsp =
        await GiftWallApi.getBBGiftWallListTravelResp(widget.targetUid);
    if (rsp.success == true && rsp.hasData()) {
      _errorMsg = null;
      _data = rsp.data;
      lines = ((_data?.lightList.length ?? 0) / 3).ceil();
      lighten = (_data != null &&
          (_data?.total ?? 0) > 0 &&
          _data?.lightNum == _data?.total);
    } else {
      _errorMsg = rsp.msg;
    }
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicatorFactory.of(
      child: _buildBody(),
      onRefresh: () async {
        _load();
      },
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Loading(),
      );
    }

    if (Util.validStr(_errorMsg)) {
      return ErrorData(
        fontColor: Colors.black,
        onTap: () {
          _errorMsg = null;
          _isLoading = true;
          setState(() {});
          _load();
        },
      );
    }

    if (!Util.validList(_data?.lightList)) {
      return const Center(
        child: EmptyWidget(
          textColor: Colors.black,
        ),
      );
    }

    double progressWidth = 60;
    double percent = (_data?.lightNum ?? 0.0) / (_data?.total ?? 0.0);
    if (percent < 0 || percent > 1) {
      percent = 1;
    }

    return SingleChildScrollView(
      child: Container(
        width: Util.width - 40,
        height: 32 + 112 + 124 * lines + 12,
        margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            PositionedDirectional(
              top: 32,
              child: Container(
                width: Util.width - 40,
                // height: 112 + 124 * lines + 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: lighten
                      ? const Color(0xFF63E3FF)
                      : const Color(0xFF000000).withOpacity(0.04),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 44),
                    SizedBox(
                      height: 20,
                      child: Text(
                        K.personaldata_love_travel_desc,
                        style: TextStyle(
                            fontSize: 16,
                            color:
                                lighten ? Colors.white : R.color.mainTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 11),
                    SizedBox(
                      height: 20,
                      child: (_data?.lightNum ?? 0) > 0
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: progressWidth,
                                  height: 4,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: progressWidth,
                                        height: 4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: lighten
                                                ? Colors.white.withOpacity(0.3)
                                                : R.color.dividerColor),
                                      ),
                                      Container(
                                        width: progressWidth * percent,
                                        height: 4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: const Color(0xFF00C4FF)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '${_data?.lightNum ?? 0}/${_data?.total ?? 0}',
                                  style: TextStyle(
                                      color: lighten
                                          ? Colors.white.withOpacity(0.7)
                                          : R.color.mainTextColor
                                              .withOpacity(0.4),
                                      fontSize: 11),
                                )
                              ],
                            )
                          : Text(
                              K.personaldata_love_travel_city_unopened,
                              style: TextStyle(
                                fontSize: 11,
                                color: R.color.mainTextColor.withOpacity(0.4),
                              ),
                            ),
                    ),
                    const SizedBox(height: 17),
                    SizedBox(
                      width: Util.width - 64,
                      height: 124.0 * lines,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: _data?.lightList.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 5,
                          crossAxisCount: 3, //横轴三个子widget
                          mainAxisExtent: 116,
                        ),
                        itemBuilder: _buildItemWidget,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            ColorFiltered(
              colorFilter: !lighten
                  ? greyscale
                  : const ColorFilter.mode(Colors.transparent, BlendMode.color),
              child: R.img(
                'travel_wall/travel_wall_bg.webp',
                width: 168,
                height: 72,
                package: ComponentManager.MANAGER_PERSONALDATA,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemWidget(BuildContext context, int index) {
    TravelLightItem? item = _data?.lightList[index];
    int num = item?.lightTimes ?? 0;
    bool itemLighten = num > 0;

    var content = Column(
      children: [
        const SizedBox(height: 8),
        ColorFiltered(
          colorFilter: !itemLighten
              ? greyscale
              : const ColorFilter.mode(Colors.transparent, BlendMode.color),
          child: CachedNetworkImage(
            placeholder: const CupertinoActivityIndicator(),
            imageUrl: Util.getRemoteImgUrl(item?.cityIcon ?? ''),
            width: 60,
            height: 60,
            fit: BoxFit.contain,
            fadeInDuration: const Duration(microseconds: 0),
            fadeOutDuration: const Duration(microseconds: 0),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 60,
          alignment: AlignmentDirectional.center,
          child: Text(
            item?.cityName ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 11,
                color: lighten
                    ? Colors.white
                    : R.color.mainTextColor.withOpacity(itemLighten ? 1 : 0.6),
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 7),
        itemLighten
            ? Text(
                'x$num',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: Util.numFontFamily,
                  package: ComponentManager.MANAGER_BASE_CORE,
                  color: lighten
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
      width: itemWidth,
      height: itemHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(lighten ? 0.2 : 0.04),
        backgroundBlendMode: lighten ? BlendMode.overlay : null,
      ),
      child: itemLighten
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
