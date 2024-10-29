import 'package:shared/shared.dart';
import 'src/util.dart' show isGameOnlineDev;

class WebGameCoreManager extends IBASEGameCoreManager {
  @override
  void switchOnlineDev(bool enable) {
    isGameOnlineDev = enable;
  }

  @override
  bool isOnlineDev() => isGameOnlineDev;
}
