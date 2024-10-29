import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../pb/generated/rpc_shop.pb.dart';

class MallBannerWidget extends StatefulWidget {
  final List<ShopBanner> datas;

  const MallBannerWidget({super.key, required this.datas});

  @override
  MallBannerState createState() {
    return MallBannerState();
  }
}

class MallBannerState extends State<MallBannerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// banner容器 尺寸 375:112， 以这个为基准，左右边距16，上下边距18
  double ratio = 112 / 375;
  double verticalMargin = 18.dp;
  double horizontalMargin = 16.dp;
  double dHorizontalOffset = 7.dp; // 深色下 宽缩小
  double dVerticalOffset = 1.5.dp; // 深色下 高缩小
  double paginationBottomMargin = 5.dp; // 指示条

  @override
  Widget build(BuildContext context) {
    if (widget.datas.isEmpty) {
      return const SizedBox();
    }
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxWidth * ratio,
        child: Stack(
          children: [
            if (darkMode)
              CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl('static/core/banner_bg.webp'),
                fit: BoxFit.fill,
              ),
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
                    return _buildBanner(context, index);
                  },
                  itemCount: widget.datas.length,
                  pagination: widget.datas.length > 1
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
                  autoplay: widget.datas.length > 1,
                  loop: widget.datas.length > 1,
                  duration: 500,
                  autoplayDelay: 5000,
                  autoplayDisableOnInteraction: false,
                  onIndexChanged: (index) {},
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildBanner(BuildContext context, int index) {
    String bannerImg = widget.datas[index].image;
    double hMargin = darkMode ? 0 : horizontalMargin;
    double vMargin = darkMode ? 0 : verticalMargin;

    if (Util.validStr(bannerImg)) {
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  key: ValueKey(bannerImg),
                  imageUrl: Util.getRemoteImgUrl(bannerImg),
                  width: double.infinity,
                  height: double.infinity,
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
    return const SizedBox();
  }

  void _onTapItem(BuildContext context, int index) {
    String url = widget.datas[index].url;
    if (Util.validStr(url)) {
      SchemeUrlHelper.instance().jump(url,
          type: widget.datas[index].type, title: widget.datas[index].title);
      return;
    }
  }
}
