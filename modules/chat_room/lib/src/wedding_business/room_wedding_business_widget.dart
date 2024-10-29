import 'package:shared/shared.dart';
import 'package:chat_room/src/wedding_business/wedding_business_step_widget.dart';
import 'package:flutter/material.dart';
import '../chatRoomData.dart';
import '../chatRoomUtil.dart';
import '../protobuf/generated/business_wedding.pb.dart';
import 'model/wedding_business_model.dart';
import 'wedding_business_user_list.dart';
import 'package:provider/provider.dart' hide Selector;

/// 商业婚礼房
class RoomWeddingBusinessWidget extends StatefulWidget {
  final ChatRoomData room;
  const RoomWeddingBusinessWidget({required this.room, Key? key})
      : super(key: key);

  @override
  RoomWeddingBusinessState createState() {
    return RoomWeddingBusinessState();
  }
}

class RoomWeddingBusinessState extends State<RoomWeddingBusinessWidget> {
  late WeddingBusinessModel model;

  @override
  void initState() {
    super.initState();
    model = WeddingBusinessModel(BusinessWeddingConfig())..init(widget.room);
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 9.dp,
        ),
        ChangeNotifierProvider<WeddingBusinessModel>.value(
          value: model,
          child: Consumer<WeddingBusinessModel>(builder: (context, data, _) {
            return WeddingBusinessStepWidget(
              state: data.value.wedding.state,
              showOperation: showOperation,
              leftName: leftName,
              rightName: rightName,
              rid: widget.room.realRid,
            );
          }),
        ),
        SizedBox(
          height: 10.dp,
        ),
        WeddingBusinessUserList(
          room: widget.room,
          model: model,
        ),
        const SizedBox(
          height: 9,
        ),
      ],
    );
  }

  bool get showOperation => ChatRoomUtil.isCreateOrReception();

  String get leftName {
    if (Util.validList(widget.room.positions) &&
        widget.room.positions.length > 9) {
      ///名字截断，最长4个字
      String name = widget.room.positions[9].name;
      if (name.length > 4) {
        name = name.safeSubstring(0, 4);
      }
      return name;
    }
    return '';
  }

  String get rightName {
    if (Util.validList(widget.room.positions) &&
        widget.room.positions.length > 10) {
      ///名字截断，最长4个字
      String name = widget.room.positions[10].name;
      if (name.length > 4) {
        name = name.safeSubstring(0, 4);
      }
      return name;
    }
    return '';
  }
}
