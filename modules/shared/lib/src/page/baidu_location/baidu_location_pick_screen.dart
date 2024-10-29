import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../K.dart';
import '../../pbModel/generated/banban_map.pb.dart';
import 'baidu_location_logic.dart';

/// 百度地理位置选取页面：返回选取POI的经纬度和名称
class BaiduLocationPickScreen extends StatefulWidget {
  final double lat;
  final double lng;

  const BaiduLocationPickScreen(
      {super.key, required this.lat, required this.lng});

  static Future openLocationPickScreen(
      {required BuildContext context,
      required double lat,
      required double lng}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BaiduLocationPickScreen(
          lat: lat,
          lng: lng,
        ),
        settings: const RouteSettings(name: '/BaiduLocationPickScreen'),
      ),
    );
  }

  @override
  BaiduLocationPickState createState() {
    return BaiduLocationPickState();
  }
}

class BaiduLocationPickState extends State<BaiduLocationPickScreen> {
  late BaiduLocationLogic logic;

  @override
  void initState() {
    super.initState();

    logic = Get.put(BaiduLocationLogic(
      lat: widget.lat,
      lng: widget.lng,
    ));
  }

  @override
  void dispose() {
    Get.delete<BaiduLocationLogic>();

    super.dispose();
  }

  double get mapHeight {
    return min(Util.width, Util.height / 2) + 30;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.location_coordinate),
      body: GetBuilder<BaiduLocationLogic>(builder: (_) {
        return Column(
          children: [
            SizedBox(
              width: Util.width,
              height: mapHeight,
              child: buildMap(),
            ),
            Expanded(
              child: buildPoiList(),
            ),
            SizedBox(height: Util.isIphoneX ? Util.iphoneXBottom : 20),
          ],
        );
      }),
    );
  }

  Widget buildMap() {
    String url = '';
    if (logic.isLoading) {
      return const SizedBox.shrink();
    }
    if (!Util.validList(logic.poiList)) {
      url =
          'http://api.map.baidu.com/geocoder?location=${widget.lat},${widget.lng}&coord_type=wgs84&output=html&src=com.ly.bbpd.android';
    } else {
      PositionData data = logic.poiList[0];
      double lat = Util.parseDouble(data.location.lat);
      double lng = Util.parseDouble(data.location.lng);
      String title = data.name;
      url =
          'http://api.map.baidu.com/marker?location=$lat,$lng&title=${Uri.encodeComponent(title)}&content=${Uri.encodeComponent(title)}&output=html&src=com.ly.bbpd.android';
    }

    return BaseWebviewScreen(
      url: url,
      embeddedWidget: true,
    );
  }

  Widget buildPoiList() {
    if (logic.isLoading) {
      return const Loading();
    }

    if (!Util.validList(logic.poiList)) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      itemCount: logic.poiList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildPoiItem(logic.poiList[index]);
      },
    );
  }

  Widget buildPoiItem(PositionData data) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        /// 点击poi，就返回该poi基本信息
        Map<String, String> result = {};

        result['name'] = data.name;
        result['location'] = '${data.location.lng},${data.location.lat}';

        Navigator.of(context).pop(result);
      },
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 24,
            color: R.color.thirdTextColor,
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsetsDirectional.only(top: 5, bottom: 5, end: 16),
              decoration: BoxDecoration(
                border: BorderDirectional(
                  top: BorderSide(color: R.color.thirdTextColor, width: 1),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    data.address,
                    style: TextStyle(
                      fontSize: 14,
                      color: R.color.secondTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
