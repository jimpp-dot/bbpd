import 'package:shared/shared.dart';
import '../../../chat_room.dart';
import '../../protobuf/generated/business_wedding.pb.dart';
import 'wedding_business_msg_handler.dart';
import 'wedding_business_repo.dart';

class WeddingBusinessModel extends AbsRoomModel<BusinessWeddingConfig> {
  WeddingBusinessModel(BusinessWeddingConfig value) : super(value);

  @override
  AbsRoomMsgHandler createMsgHandler(
      AbsRoomModel<dynamic> model, ChatRoomData room) {
    return WeddingBusinessMsgHandler(model, room);
  }

  @override
  void loadData() async {
    BusinessWeddingConfigResponseApi config =
        await WeddingBusinessRepo.getWeddingConfig(room?.rid ?? 0);
    if (!mounted) return;
    if (config.success == true) {
      value = config.data;
      notify();
    } else {
      Fluttertoast.showToast(msg: config.message, gravity: ToastGravity.CENTER);
    }
  }

  void notify() {
    notifyListeners();
  }
}
