import 'package:shared/shared.dart';
import 'punish_model.dart';

class PunishControl {
  int selectId = -1;
  List<PunishModel> punishList = [];
  String? currentPunish;

  PunishControl({required this.selectId, required this.punishList});

  bool isSelected() {
    return selectId > 0;
  }

  PunishModel? currentPunishData() {
    if (selectId > 0) {
      return punishList.firstWhereOrNull((e) => e.id == selectId);
    }
    if (currentPunish != null && currentPunish!.isNotEmpty) {
      return PunishModel(id: -1, type: -1, name: currentPunish!);
    }
    return null;
  }
}
