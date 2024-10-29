import 'package:get/get.dart';
import '../../../shared.dart';
import '../../pbModel/generated/banban_map.pb.dart';

/// 百度地点检索：返回选取POI的经纬度和名称
class BaiduLocationLogic extends GetxController {
  final double lat;
  final double lng;

  BaiduLocationLogic({required this.lat, required this.lng});

  bool isLoading = true;

  List<PositionData> poiList = [];

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() async {
    try {
      XhrResponse response = await Xhr.post(
          'go/yy/map/position',
          {
            'lat': '$lat',
            'lng': '$lng',
          },
          pb: true);
      RespPosition res = RespPosition.fromBuffer(response.bodyBytes);

      if (res.success) {
        poiList = res.data;
      }
    } on Exception catch (e) {
      Log.d('BaiduLocationLogic load, error: $e');
    }

    isLoading = false;

    update();
  }
}
