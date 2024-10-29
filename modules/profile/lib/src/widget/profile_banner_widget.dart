import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pulse_log/pulse_log.dart';

/// 个人tab  banner
class ProfileBannerWidget extends StatefulWidget {
  const ProfileBannerWidget({super.key});

  @override
  ProfileBannerWidgetState createState() => ProfileBannerWidgetState();
}

class ProfileBannerWidgetState extends State<ProfileBannerWidget> {
  List<BannerItem> _bannerList = [];

  @override
  void initState() {
    super.initState();

    _loadBanner();
  }

  reload() {
    _loadBanner();
  }

  void _loadBanner() async {
    DataRsp<List<BannerItem>> rsp = await HomeBannerRepo.getHomeBanner();

    if (rsp.success == true) {
      _bannerList = rsp.data ?? [];
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerList.isEmpty) return const SizedBox.shrink();
    return _renderActivitySwiper();
  }

  Widget _renderActivitySwiper() {
    double width = Util.width - 24;
    double height = width * 88 / 343;

    return Container(
      width: width,
      height: height,
      margin: const EdgeInsetsDirectional.only(top: 12, start: 16, end: 16),
      child: Swiper(
        key: ValueKey(_bannerList.length),
        itemCount: _bannerList.length,
        pagination: _bannerList.length > 1
            ? SwiperPagination(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 6),
                builder: DotSwiperPaginationBuilder(
                  space: 4,
                  activeColor: Colors.white,
                  color: Colors.white.withOpacity(0.6),
                  size: 6,
                  activeSize: 6,
                ),
              )
            : null,
        autoplay: _bannerList.length > 1,
        loop: _bannerList.length > 1,
        autoplayDelay: 3000,
        autoplayDisableOnInteraction: true,
        onTap: _onBannerClick,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: Util.parseIcon(_bannerList[index].icon),
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  void _onBannerClick(int index) {
    // 首页发现页未点击第一条banner需要显示小红点
    String hasTapIDs = Config.get(BannerScreen.keyBannerTap, '');
    if (!hasTapIDs.contains('${_bannerList[index].id}')) {
      // 未点击过，存起来
      Config.set(
          BannerScreen.keyBannerTap, '$hasTapIDs${_bannerList[index].id},');
    }
    if (_bannerList[index].type == 'app') {
      String url = SchemeUrlHelper.instance().concatSchemeUrl(
          _bannerList[index].url, SchemeUrlHelper.scheme_path_common_redirect);
      SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, url);
    } else if (_bannerList[index].type == 'web') {
      String url = _bannerList[index].url;
      String title = _bannerList[index].title;
      BaseWebviewScreen.show(context, url: url, title: title);
    }

    Tracker.instance.track(TrackEvent.click, properties: {
      'click_page': 'my_activity_1',
      'title': _bannerList[index].title
    });

    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'home_profile_banner_${_bannerList[index].title}',
    });
  }
}
