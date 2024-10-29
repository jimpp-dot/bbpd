import 'package:shared/shared.dart';
import 'package:get/get.dart';

class SearchCategoryController extends GetxController {
  bool _isClosed = false;

  List games = [];
  List funs = [];

  bool get hasCategory => (games.length + funs.length) > 0;

  @override
  void onInit() {
    super.onInit();
    _isClosed = false;
  }

  @override
  void onReady() {
    super.onReady();
    if (BaseConfig.instance.showCategoryList) {
      Future.delayed(const Duration(milliseconds: 300))
          .then((value) => _load());
    }
  }

  @override
  void onClose() {
    _isClosed = true;
    super.onClose();
  }

  _refresh() {
    if (_isClosed) return;
    update();
  }

  void _load() async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}search/indexcategorylist?version=2",
          throwOnError: true);
      Map res = response.response as Map;
      if (res['success'] == true) {
        if (res['data'] != null && res['data']['games'] != null) {
          games = res['data']['games'];
        }

        if (res['data'] != null && res['data']['funs'] != null) {
          funs = res['data']['funs'];
        }
        _refresh();
      }
    } catch (e) {
      Log.d('SearchCategoryController error: ${e.toString()}');
    }
  }
}
