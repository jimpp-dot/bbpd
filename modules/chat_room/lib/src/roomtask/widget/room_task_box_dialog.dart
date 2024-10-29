import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/roomtask/model/room_task_box.dart';

class RoomTaskBoxDialog extends StatefulWidget {
  const RoomTaskBoxDialog(
      {super.key,
      required this.giftList,
      required this.title,
      required this.subTitle,
      required this.openText,
      this.openBox});

  final List<BoxGiftList> giftList;
  final String title;
  final String subTitle;
  final String openText;
  final Function? openBox;

  static Future show(
    BuildContext context, {
    required List<BoxGiftList> giftList,
    required String title,
    required String subTitle,
    required String openText,
    Function? openBox,
  }) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: false,
        builder: (context) {
          final dialog = RoomTaskBoxDialog(
            giftList: giftList,
            title: title,
            subTitle: subTitle,
            openText: openText,
            openBox: openBox,
          );
          return dialog;
        });
  }

  @override
  _RoomTaskBoxDialogState createState() => _RoomTaskBoxDialogState();
}

class _RoomTaskBoxDialogState extends State<RoomTaskBoxDialog> {
  List<BoxGiftList> get _boxList => widget.giftList;

  _onDismiss() {
    Navigator.of(context).pop();
  }

  _onOpenBox() {
    Navigator.of(context).pop();
    if (widget.openBox != null) {
      widget.openBox!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onDismiss,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            padding: const EdgeInsetsDirectional.only(bottom: 24, top: 24),
            width: 312,
            decoration: BoxDecoration(
              color: R.color.mainBgColor, //Colors.white,
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: R.color.mainTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  widget.subTitle,
                  style:
                      TextStyle(color: R.color.secondTextColor, fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildBox(),
                const SizedBox(
                  height: 24,
                ),
                _buildOpenBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBox() {
    final int boxCount = _boxList.length;
    if (boxCount == 1)
      return _buildBigBox(_boxList.first.imageURL, _boxList.first.giftName,
          _boxList.first.giftNum);

    const double rowHeight = 104;
    const double crossAxisSpacing = 12;
    const int crossAxisCount = 3;
    double rowNum = 1.0 + (boxCount ~/ crossAxisCount);
    if (rowNum > 2) rowNum = 2.5;
    final double height = rowHeight * rowNum + crossAxisSpacing * (rowNum - 1);
    double iconSize = 80;

    return Container(
      height: height,
      padding: const EdgeInsetsDirectional.only(
        start: 24,
        end: 24,
      ),
      child: GridView(
        // physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsetsDirectional.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, //横轴三个子widget
            mainAxisSpacing: crossAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: iconSize / rowHeight //宽高比为1时，子widget
            ),
        children: _boxList
            .map(
              (_) => _buildBoxItem(_.imageURL, _.giftName, _.giftNum, iconSize),
            )
            .toList(),
      ),
    );
  }

  Widget _buildBigBox(String imageURL, String name, int num,
      [double iconSize = 108]) {
    bool hasNum = num != 0;
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: imageURL,
                width: iconSize,
                height: iconSize,
                // color: Colors.transparent,
              ),
            ),
            // Positioned.fill(
            //   child: GradientBorder(
            //   borderGradient: LinearGradient(colors: [Color(0xFFFFFA89), Color(0xFFFFB43F), Color(0xFFFEE758)]),
            //   borderWidth: 2,
            //   borderRadius: 12,
            //   child: Container(width: iconSize, height: iconSize,),),
            // ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: name,
                  style:
                      TextStyle(fontSize: 13, color: R.color.thirdTextColor)),
              if (hasNum)
                const TextSpan(text: ' ', style: TextStyle(fontSize: 8)),
              if (hasNum)
                TextSpan(
                    text: 'x$num',
                    style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFFFDA252),
                        fontWeight: FontWeight.bold)),
            ],
          ),
          maxLines: 1,
        ),
      ],
    );
  }

  Widget _buildBoxItem(String imageURL, String name, int num,
      [double iconSize = 80]) {
    bool hasNum = num != 0;
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: CachedNetworkImage(
                imageUrl: imageURL,
                width: iconSize,
                height: iconSize,
                // color: Colors.transparent,
              ),
            ),
            // Positioned.fill(
            //   child: GradientBorder(
            //   borderGradient: LinearGradient(colors: [Color(0xFFFFFA89), Color(0xFFFFB43F), Color(0xFFFEE758)]),
            //   borderWidth: 2,
            //   borderRadius: 12,
            //   child: Container(width: iconSize, height: iconSize,),),
            // ),
          ],
        ),
        Expanded(child: Container()),
        Container(
          constraints: BoxConstraints(maxWidth: iconSize),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: name,
                      style: TextStyle(
                          fontSize: 13, color: R.color.thirdTextColor)),
                  if (hasNum)
                    const TextSpan(text: ' ', style: TextStyle(fontSize: 8)),
                  if (hasNum)
                    TextSpan(
                        text: 'x$num',
                        style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFFFDA252),
                            fontWeight: FontWeight.bold)),
                ],
              ),
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOpenBtn() {
    return GradientButton(
      widget.openText,
      onTap: _onOpenBox,
      textStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
      colors: const [Color(0xFFFF8000), Color(0xFFFFC659)],
      height: 48,
      width: 200,
    );
  }
}
