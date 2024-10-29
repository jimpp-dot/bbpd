import 'package:shared/shared.dart';
import 'package:shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeRoomBannerData {
  int uid = 0;
  int rid = 0;
  String label = '';
  String name = '';
  String partyIcon = '';
  List<Color> bgColors = [];
  List<String> micIcons = []; // 麦上用户Icon
  bool isBiz = false;
  String roomProperty = '';
  bool exposured = false;
  String typeName = ''; //标签
  String roomFactoryType = ''; //模板
  String settlementChannel = ''; //结算频道
  String bannerImg = ''; // 普通banner图片
  String bannerUrl = ''; // 普通banner跳转链接
  String bannerType = ''; // 普通banner type
  String roomBannerBg = ''; // 房间banner背景

  HomeRoomBannerData.fromPb(RoomListItem item) {
    bannerImg = item.banner.image;
    bannerUrl = item.banner.url;
    bannerType = item.banner.type;
    roomBannerBg = item.roomBannerBg;
    uid = item.uid;
    rid = item.rid;
    name = item.name;
    label = item.typeName.show;
    partyIcon = item.typeName.typeIcon;
    bgColors = Util.parseColors(item.typeName.typeBg);

    if (Util.validStr(item.banner.title)) {
      label = item.banner.title;
    }

    isBiz = item.isBiz;
    roomProperty = item.property;
    typeName = item.labelType;
    roomFactoryType = item.roomFactoryType;
    settlementChannel = item.settlementChannel;
    micIcons = [];
    if (item.micIcons.isNotEmpty) {
      for (var element in item.micIcons) {
        if (micIcons.length < 4) {
          // 房间banner最多展示4个头像
          micIcons.add(element);
        }
      }
    }
  }
}

/// 首页-房间banner
class HomeRoomBannerWidget extends StatefulWidget {
  final List<HomeRoomBannerData>? datas;
  final RoomFrom roomFrom;
  final String refer;

  const HomeRoomBannerWidget(this.datas, this.roomFrom, this.refer,
      {super.key});

  @override
  HomeRoomBannerState createState() => HomeRoomBannerState();
}

class HomeRoomBannerState extends State<HomeRoomBannerWidget> {
  /// banner容器 尺寸 375:112， 以这个为基准，左右边距16，上下边距18。 by 2023.9.14
  double ratio = 112 / 375;
  double verticalMargin = 18.dp;
  double horizontalMargin = 16.dp;
  double dHorizontalOffset = 7.dp; // 深色下 宽缩小
  double dVerticalOffset = 1.5.dp; // 深色下 高缩小
  double paginationBottomMargin = 5.dp; // 指示条

  @override
  Widget build(BuildContext context) {
    if (widget.datas == null || widget.datas!.isEmpty) {
      return const SizedBox();
    }

    double bannerWidth = Util.width - 2 * horizontalMargin;
    if (darkMode) {
      bannerWidth -= 2 * dHorizontalOffset;
    }
    double bannerHeight = bannerWidth * ratio;

    return SizedBox(
      width: Util.width,
      height: Util.width * ratio,
      child: Stack(
        children: [
          // if (darkMode)
          //   RepaintBoundary(
          //     child: CachedNetworkImage(
          //       imageUrl: Util.getRemoteImgUrl('static/core/banner_bg.webp'),
          //       fit: BoxFit.fill,
          //       width: Util.width,
          //       height: Util.width * ratio,
          //     ),
          //   ),
          Padding(
            padding: darkMode
                ? EdgeInsetsDirectional.only(
                    start: horizontalMargin + dHorizontalOffset,
                    end: horizontalMargin + dHorizontalOffset,
                    top: verticalMargin + dVerticalOffset,
                    bottom: verticalMargin + dVerticalOffset,
                  )
                : EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return _buildBanner(
                      context, index, bannerWidth, bannerHeight);
                },
                itemCount: widget.datas!.length,
                pagination: widget.datas!.length > 1
                    ? SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsetsDirectional.only(
                          bottom: darkMode
                              ? paginationBottomMargin
                              : verticalMargin + paginationBottomMargin,
                        ),
                        builder: RectSwiperPaginationBuilder(
                          activeColor: Colors.white,
                          color: Colors.white.withOpacity(0.5),
                          size: const Size(9, 3),
                          activeSize: const Size(9, 3),
                          radius: 2,
                        ),
                      )
                    : null,
                autoplay: widget.datas!.length > 1,
                loop: widget.datas!.length > 1,
                duration: 500,
                autoplayDelay: 5000,
                autoplayDisableOnInteraction: false,
                onIndexChanged: (index) {
                  _handleItemExposureReport(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner(BuildContext context, int index, double bannerWidth,
      double bannerHeight) {
    HomeRoomBannerData data = widget.datas![index];

    double hMargin = darkMode ? 0 : horizontalMargin;
    double vMargin = darkMode ? 0 : verticalMargin;

    if (Util.validStr(data.bannerUrl) && Util.validStr(data.bannerImg)) {
      return GestureDetector(
        onTap: () async => _onTapItem(context, index),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              margin:
                  EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
              alignment: AlignmentDirectional.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  key: ValueKey(data.bannerImg),
                  imageUrl: Util.getRemoteImgUrl(data.bannerImg),
                  width: bannerWidth,
                  height: bannerHeight,
                  fit: BoxFit.cover,
                  placeholder: Container(
                    color: darkMode
                        ? Colors.white.withOpacity(0.06)
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    if (data.rid > 0 && Util.validStr(data.roomBannerBg)) {
      return GestureDetector(
        onTap: () async {
          _onTapItem(context, index);
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              margin:
                  EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
              alignment: AlignmentDirectional.center,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      key: ValueKey(data.roomBannerBg),
                      imageUrl: Util.getRemoteImgUrl(data.roomBannerBg),
                      width: bannerWidth,
                      height: bannerHeight,
                      fit: BoxFit.cover,
                      placeholder: Container(
                        color: darkMode
                            ? Colors.white.withOpacity(0.06)
                            : Colors.white,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    start: 24.dp,
                    top: 39.dp,
                    end: 24.dp,
                    child: Text(
                      data.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  void _onTapItem(BuildContext context, int index) {
    Tracker.instance
        .track(TrackEvent.click, properties: {'click_hot_banner': Session.uid});
    HomeRoomBannerData room = widget.datas![index];
    Log.d('index: $index, room: $room');
    Log.d('bannerUrl: ${room.bannerUrl}');

    if (Util.validStr(room.bannerUrl)) {
      Log.d('bannerUrl: ${room.bannerUrl}');
      Log.d('bannerType: ${room.bannerType}');
      Log.d('bannerType: ${room.label}');
      SchemeUrlHelper.instance()
          .jump(room.bannerUrl, type: room.bannerType, title: room.label);
      return;
    }
    if (room.rid > 0) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, room.rid,
          from: widget.roomFrom, refer: widget.refer);
      _handleClickItemReport(room, index);
      return;
    }
  }

  void _handleClickItemReport(HomeRoomBannerData room, int index) {
    Tracker.instance.track(TrackEvent.flow_click, properties: {
      'tab': 'banner',
      'rid': room.rid,
      'to_uid': room.uid,
      'position': index,
      'is_biz': room.isBiz,
      if (!Util.isNullOrEmpty(room.typeName)) 'type_label': room.typeName,
      if (!Util.isNullOrEmpty(room.roomFactoryType))
        'room_factory_type': room.roomFactoryType,
      if (!Util.isNullOrEmpty(room.settlementChannel))
        'settlement_channel': room.settlementChannel,
    });
  }

  void _handleItemExposureReport(int position) {
    HomeRoomBannerData room = widget.datas![position];
    if (!room.exposured) {
      room.exposured = true;
      if (Util.validStr(room.bannerUrl)) {
        /// 普通banner不做上报
        return;
      }
      Tracker.instance.track(TrackEvent.flow_exposure, properties: {
        'tab': 'banner',
        'rid': room.rid,
        'to_uid': room.uid,
        'position': position,
        'room_property': room.roomProperty,
        'is_biz': room.isBiz,
        if (!Util.isNullOrEmpty(room.typeName)) 'type_label': room.typeName,
        if (!Util.isNullOrEmpty(room.roomFactoryType))
          'room_factory_type': room.roomFactoryType,
        if (!Util.isNullOrEmpty(room.settlementChannel))
          'settlement_channel': room.settlementChannel,
      });
    }
  }
}
