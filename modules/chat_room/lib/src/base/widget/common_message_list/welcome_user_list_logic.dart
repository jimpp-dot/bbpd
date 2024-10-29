import 'package:shared/model/welcome_data.dart';
import 'package:get/get.dart';

/// 欢迎消息
class WelcomeUserListLogic extends GetxController {
  List<Welcome> welcomes =
      []; // 欢迎/礼物连击消息，从common_message_list_normal拿到外面，这样在任何Tab都能展示

  addWelcome(Welcome data) {
    welcomes.add(data);
    update();
  }

  removeWelcome(Welcome data) {
    if (welcomes.contains(data)) {
      welcomes.remove(data);
    }

    update();
  }
}
