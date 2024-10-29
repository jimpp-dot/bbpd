import 'package:shared/shared.dart';

class BottomBarActivity {
  static ActBarData? parseData() {
    try {
      const String key = 'home_bottom_bar_activity';
      String cache = Config.get(key, '');
      if (cache.isNotEmpty) {
        ActBarData data = ActBarData.fromJson(cache);
        return data;
      }
    } catch (e) {
      Log.d(e);
    }
    return null;
  }
}
