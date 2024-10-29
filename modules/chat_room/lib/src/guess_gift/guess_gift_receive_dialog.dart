import 'dart:async';
import 'dart:math';

import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/guess_gift/guess_gift_receive_result_dialog.dart';
import 'package:chat_room/src/guess_gift/model/guess_gift_repo.dart';
import 'package:chat_room/src/protobuf/generated/guess_gift.pb.dart';
import 'package:flutter/material.dart';

/// 礼物猜猜乐 - 收礼
class GuessGiftReceiveDialog extends StatefulWidget {
  final GuessGiftPreferencesMessage data;

  const GuessGiftReceiveDialog({Key? key, required this.data})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => GuessGiftReceiveState();

  static Future show(BuildContext context, GuessGiftPreferencesMessage data) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GuessGiftReceiveDialog(data: data),
    );
  }
}

class GuessGiftReceiveState extends State<GuessGiftReceiveDialog> {
  int _second = 180;

  Timer? timer;

  int _selectedBoxIndex = -1;

  @override
  void initState() {
    super.initState();
    _second = widget.data.duration;
    _selectedBoxIndex = 1; // 默认选中中间的
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_second > 0) {
        initTimer();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void initTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _second--;
      refresh();
      if (_second <= 0) {
        timer.cancel();
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                width: 312,
                margin: const EdgeInsetsDirectional.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: AlignmentDirectional.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      K.room_guess_gift_title,
                      style: const TextStyle(
                        color: Color(0xFF42177A),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonAvatar(
                            path: widget.data.sender.icon,
                            size: 32,
                            shape: BoxShape.circle),
                        const SizedBox(width: 5),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 100),
                          child: Text(
                            widget.data.sender.name,
                            style: const TextStyle(
                                color: Color(0xFFFF5F7D),
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(K.room_guess_gift_receive_boxes,
                            style: const TextStyle(
                                color: Color(0xFF42177A), fontSize: 13)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDF77FF).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 170,
                            height: 32,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(R.imagePath(
                                    'guess_gift/ic_guess_gift_receive_title_bg.webp',
                                    package:
                                        ComponentManager.MANAGER_BASE_ROOM)),
                              ),
                            ),
                            alignment: AlignmentDirectional.center,
                            constraints: const BoxConstraints(maxWidth: 150),
                            child: Text(
                              K.room_guess_gift_btn_tacit_price(
                                  ['$_calcTacitPrice']),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(K.room_guess_gift_receive_desc,
                              style: const TextStyle(
                                  color: Color(0x99313131), fontSize: 13)),
                          const SizedBox(height: 20),
                          _buildBoxWidget(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    GestureDetector(
                      onTap: _onTapOpen,
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          gradient: LinearGradient(
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                            colors: [
                              Color(0xFFFFF5D8),
                              Color(0xFFE694FF),
                              Color(0xFFC554F9),
                              Color(0xFFB057FF),
                              Color(0xFFA589FF),
                              Color(0xFFB9B3FC),
                              Color(0xFFB2FFF9)
                            ],
                          ),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                            '${K.room_guess_gift_receive_btn}(${_second}s)',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15)),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              R.img('guess_gift/ic_guess_gift_icon.webp',
                  width: 47,
                  height: 40,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBoxWidget() {
    List<Widget> boxsWidget = widget.data.boxes
        .take(3)
        .mapIndexed((i, e) => _buildBoxItem(i, e))
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: boxsWidget
            .expand((_) =>
                (_ == boxsWidget.last) ? [_] : [_, const SizedBox(width: 10)])
            .toList(),
      ),
    );
  }

  Widget _buildBoxItem(
    int index,
    GuessGiftBox box,
  ) {
    String orientation = index == 0
        ? K.room_base_left
        : index == 2
            ? K.room_base_right
            : K.room_base_middle;
    bool selected = _selectedBoxIndex == index;

    double width = (312 - 20 * 2 - 10 * 2 - 6 * 2) / 3;
    double ratio = width / 80;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (_selectedBoxIndex != index) {
            _selectedBoxIndex = index;
            refresh();
          }
        },
        child: Container(
          width: double.infinity,
          height: 110 * ratio,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          foregroundDecoration: selected
              ? BoxDecoration(
                  border: Border.all(color: const Color(0xFFBA86FD), width: 1),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                )
              : null,
          alignment: AlignmentDirectional.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(
                selected
                    ? 'guess_gift/ic_guess_gift_box.webp'
                    : 'guess_gift/ic_guess_gift_box_empty.webp',
                width: 54 * ratio,
                height: 57 * ratio,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
              const SizedBox(height: 2),
              Container(
                width: 20 * ratio,
                height: 20 * ratio,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(R.imagePath(
                        'guess_gift/ic_guess_gift_box_orientation_bg.webp',
                        package: ComponentManager.MANAGER_BASE_ROOM)),
                  ),
                ),
                alignment: AlignmentDirectional.center,
                child: Text(orientation,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int get _calcTacitPrice {
    int tacitPrice = 0;
    for (GuessGiftBox box in widget.data.boxes) {
      if (box.maxBox == 1) {
        int sum = 0;
        for (GuessGiftBoxGiftItem gift in box.list) {
          sum += gift.giftNum * gift.price;
        }
        tacitPrice = max(tacitPrice, sum);
      }
    }
    return tacitPrice;
  }

  Future _onTapOpen() async {
    GuessGiftBox box = widget.data.boxes[_selectedBoxIndex];
    NormalNull resp = await GuessGiftRepo.receiveGuessGift(
        ChatRoomData.getInstance()?.realRid, widget.data.guessId, box.boxId);
    if (resp.success) {
      Navigator.of(context).pop();
      GuessGiftReceiveResultDialog.show(context, box);
    } else {
      Fluttertoast.showToast(msg: resp.msg);
    }
  }
}
