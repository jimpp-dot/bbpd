import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_beans.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_repo.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_view_mode.dart';
import 'package:chat_room/src/wedding/widget/wedding_step_widget.dart';

import '../../../k.dart';
import 'package:provider/provider.dart' hide Selector;

/// 婚礼房header，包括标题 婚礼流程进度
class WeddingHeader extends StatefulWidget {
  final ChatRoomData room;

  const WeddingHeader({super.key, required this.room});

  @override
  _WeddingHeaderState createState() => _WeddingHeaderState();
}

class _WeddingHeaderState extends State<WeddingHeader>
    with RoomSettingMixin<WeddingHeader> {
  late WeddingState _weddingState;

  _onTapNext() {
    RoomWeddingRepo.weddingNext(
            rid: widget.room.rid, op: _weddingState.index + 1)
        .then((value) {
      if (value?.msg != null) {
        Fluttertoast.showToast(msg: value!.msg!, gravity: ToastGravity.CENTER);
      }
    });
  }

  _onTapEnd() {
    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: K.room_wedding_end,
        content: K.room_wedding_end_confirm,
        positiveButton: PositiveButton(
          text: K.sure,
          onPressed: () {
            final rid = widget.room.rid;
            Navigator.of(context).pop();
            RoomWeddingRepo.weddingClose(rid: rid).then((value) {
              if (value?.msg != null) {
                Fluttertoast.showToast(
                    msg: value!.msg!, gravity: ToastGravity.CENTER);
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RoomWeddingViewModel viewModel = context.watch<RoomWeddingViewModel>();
    _weddingState = viewModel.weddingData!.stage;
    List<Widget> res = [];
    res.add(
      InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SizedBox(
          width: 36.0,
          height: kToolbarHeight,
          child: Center(
            child: R.img(
              "back.svg",
              width: 24.0,
              height: 24.0,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
        ),
      ),
    );
    res.add(Expanded(
      child: Container(
        width: 263,
        height: 97,
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(top: 15),
        child: WeddingStepWidget(
          weddingState: _weddingState,
          weddingTitle: viewModel.room.config?.name ?? '',
          operationBuilder: _stepOperationBuilder(viewModel),
        ),
      ),
    ));
    res.add(InkWell(
        onTap: () => onSettingClick(widget.room),
        child: Container(
          width: 40.0,
          height: 40.0,
          alignment: Alignment.center,
          child: R.img("setting.svg",
              width: 24.0,
              height: 24.0,
              package: ComponentManager.MANAGER_BASE_ROOM),
        )));

    var topPadding = MediaQuery.of(context).padding.top;
    return Container(
      // height: 50 + topPadding,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsetsDirectional.only(top: topPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: res,
      ),
    );
  }

  Widget Function()? _stepOperationBuilder(RoomWeddingViewModel viewModel) {
    bool isMaster = RoomWeddingViewModel.getSelfRole(viewModel.weddingData) ==
        WeddingRole.Master;
    bool isCreator = viewModel.room.createor?.uid == Session.uid;
    Widget Function()? operationBuilder;
    if (isMaster && _weddingState != WeddingState.Ending) {
      operationBuilder = () => WeddingStepWidget.buildNext(_onTapNext);
    } else if (isCreator && _weddingState == WeddingState.Ending) {
      operationBuilder = () => WeddingStepWidget.buildEnd(_onTapEnd);
    }
    return operationBuilder;
  }
}
