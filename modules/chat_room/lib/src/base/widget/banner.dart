import 'package:shared/shared.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:chat_room/src/protobuf/common_banner_extension.dart';
import 'package:chat_room/src/protobuf/generated/common_banner.pb.dart'
    as bannerPb;
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pulse_log/pulse_log.dart';

/// 房间活动banner
class RoomBanner extends StatefulWidget {
  final ChatRoomData room;
  final double widthPanding;
  final double heightPanding;

  const RoomBanner(
      {Key? key,
      required this.room,
      this.widthPanding = 0,
      this.heightPanding = 0})
      : super(key: key);

  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<RoomBanner>
    with SingleTickerProviderStateMixin {
  final List<BannerItemEntity> _data = [];
  final SwiperController _controller = SwiperController();
  bool _closed = false;
  bool _showClose = false;

  static const double _width = 64.0;
  static const double _height = 70.0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _load() async {
    bannerPb.ResBanner rsp = await RoomApi.getRoomBanner(
        widget.room.rid, Session.sex, Session.getInt('role', 0));
    if (rsp.success && mounted) {
      // Log.d('room banner: $rsp');
      _data.clear();

      if (Util.isVerify) {
        /// 该状态，特殊banner下发
        for (var item in rsp.data.verifyItems) {
          BannerItemEntity? entity =
              BannerItemEntity.formatBanner(item, rid: widget.room.rid);
          if (entity != null) {
            _data.add(entity);
          }
        }
      } else {
        for (var item in rsp.data.items) {
          BannerItemEntity? entity =
              BannerItemEntity.formatBanner(item, rid: widget.room.rid);
          if (entity != null) {
            _data.add(entity);
          }
        }
      }

      _showClose = rsp.data.opt.showClose;

      if (_data.isNotEmpty) {
        _reportBannerExpose(_data[0]);
      }

      setState(() {});
    }
  }

  _onTap(int index) {
    if (_data.isEmpty || index < 0 || index >= _data.length) {
      return;
    }

    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'room_banner_${_data[index].jumpUrl}',
    });

    BannerItemEntity indexData = _data[index];

    bannerPb.BannerItem config = indexData.item;
    _reportBannerClick(config);
    SchemeUrlHelper.instance()
        .checkSchemeUrlAndGo(context, _data[index].jumpUrl);
  }

  Widget _buildWebDialog(bannerPb.BannerItem config) {
    if (config.width > 0 && config.height > 0) {
      String url = config.url;

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: SizedBox(
          width: config.width.toDouble(),
          height: config.height.toDouble(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              BaseWebviewScreen(
                url: url,
                transparent: true,
                embeddedWidget: true,
              ),
              if (_showClose)
                PositionedDirectional(
                    end: -8, top: -8, child: _buildCloseIcon())
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  String _valueKey(int max) {
    StringBuffer sb = StringBuffer();
    sb.write('room_activity_banner');

    for (int i = 0, size = _data.length; i < size; i++) {
      bannerPb.BannerItem bm = _data[i].item;
      sb.write('_');
      sb.write(bm.id);
      if (i >= max - 1) break;
    }

    /// Log.d('BannerWidget, valueKey: ${sb.toString()}');
    return sb.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (_data.isEmpty || _closed) return const SizedBox.shrink();

    if (_data.length == 1 && _data[0].item.type == "web_dialog")
      return _buildWebDialog(_data[0].item);

    int bannerCount = _data.length;
    return SizedBox(
      width: _width + widget.widthPanding,
      height: _height + widget.heightPanding,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomStart,
        children: [
          SizedBox(
            width: _width,
            height: _height,
            child: Swiper(
              key: ValueKey(_valueKey(bannerCount)),
              controller: _controller,
              autoplay: bannerCount > 1,
              loop: bannerCount > 1,
              autoplayDelay: 5000,
              duration: 500,
              autoplayDisableOnInteraction: true,
              itemCount: bannerCount,
              pagination: bannerCount > 1
                  ? SwiperPagination(
                      alignment: const Alignment(0.0, 1.5),
                      margin: const EdgeInsets.only(bottom: 4),
                      builder: RectSwiperPaginationBuilder(
                          space: 2,
                          size: const Size(4, 4),
                          activeSize: const Size(10, 4),
                          activeColor: Colors.white,
                          color: Colors.white.withOpacity(0.4),
                          radius: 2),
                    )
                  : null,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: _buildItem(_data[index], index),
                );
              },
              onTap: _onTap,
              onIndexChanged: (int index) {
                if (index < _data.length) {
                  _reportBannerExpose(_data[index]);
                }
              },
            ),
          ),
          if (_showClose)
            PositionedDirectional(end: 0, top: 2, child: _buildCloseIcon())
        ],
      ),
    );
  }

  Widget _buildItem(BannerItemEntity item, int index) {
    if (item.item.type == 'web_dialog_v2') {
      /// H5展示
      return Stack(
        children: [
          SizedBox(
            width: _width,
            height: _height,
            child: BaseWebviewScreen(
              url: item.item.image,
              transparent: true,
              embeddedWidget: true,
              needSafeArea: false,
            ),
          ),

          /// webview不能透传出点击事件
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _onTap(index);
            },
            child: const SizedBox(
              width: _width,
              height: _height,
            ),
          )
        ],
      );
    }

    return CachedNetworkImage(
      imageUrl: Util.getRemoteImgUrl(item.item.image),
      width: _width,
      height: _height,
      fit: BoxFit.contain,
    );
  }

  Widget _buildCloseIcon() {
    return InkWell(
      onTap: _close,
      child: R.img(
        'cp_close.svg',
        width: 20,
        height: 20,
        package: ComponentManager.MANAGER_BASE_ROOM,
      ),
    );
  }

  void _close() {
    _closed = true;
    setState(() {});
  }

  void _reportBannerExpose(BannerItemEntity banner) {
    if (!banner.hasReport) {
      banner.hasReport = true;
      Tracker.instance.track(TrackEvent.banner_expose, properties: {
        'adid': '${banner.item.id}',
        'banner_position': banner.item.position
      });
    }
  }

  void _reportBannerClick(bannerPb.BannerItem banner) async {
    Tracker.instance.track(TrackEvent.banner_click, properties: {
      'adid': '${banner.id}',
      'banner_position': banner.position
    });
  }
}
