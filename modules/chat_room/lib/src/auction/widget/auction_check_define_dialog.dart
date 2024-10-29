import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/auction/model/auction_repo.dart';
import 'package:flutter/material.dart';

class AuctionCheckDefineDialog extends StatefulWidget {
  final int rid;
  final int vvc;
  final String define;

  const AuctionCheckDefineDialog(
      {super.key, required this.rid, required this.vvc, required this.define});

  @override
  State<StatefulWidget> createState() => AuctionCheckDefineState();

  static Future show(BuildContext context,
      {required int rid, required int vvc, required String define}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AuctionCheckDefineDialog(rid: rid, vvc: vvc, define: define);
      },
    );
  }
}

class AuctionCheckDefineState extends State<AuctionCheckDefineDialog> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.define);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 312,
        height: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  K.room_auction_define_setting,
                  style: const TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 30),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 46,
                      alignment: AlignmentDirectional.centerStart,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding:
                          const EdgeInsetsDirectional.only(start: 16, end: 8),
                      decoration: BoxDecoration(
                        color: R.color.secondBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: R.string('moment_input_content'),
                          counterText: '',
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintStyle: TextStyle(
                              color: R.color.thirdTextColor, fontSize: 16),
                          isDense: true,
                          contentPadding: EdgeInsetsDirectional.zero,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        maxLength: 8,
                        style: TextStyle(
                            fontSize: 16, color: R.color.mainTextColor),
                        controller: _textController,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        keyboardAppearance: Brightness.light,
                      ),
                    ),
                    PositionedDirectional(
                      top: 0,
                      bottom: 0,
                      end: 28,
                      child: IgnorePointer(
                        child: R.img(
                          RoomAssets.chat_room$auction_auction_define_edit_webp,
                          width: 20,
                          height: 20,
                          package: ComponentManager.MANAGER_BASE_ROOM,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    K.room_auction_define_setting_tip,
                    style: TextStyle(
                      color: R.color.mainTextColor.withOpacity(0.5),
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: _onSureTap,
                  child: Container(
                    width: 200,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: R.color.mainBrandColor,
                      shape: const StadiumBorder(),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      K.sure,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  size: 24,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSureTap() async {
    String cName = _textController.text.trim();
    if (cName.isEmpty) {
      Fluttertoast.showCenter(msg: K.room_auction_define_empty_toast);
      return;
    }
    NormalNull res = await AuctionRepo.saveDefineContent(
        rid: widget.rid, cName: cName, vvc: widget.vvc);
    if (res.success) {
      Navigator.of(context).pop(true);
    } else {
      Fluttertoast.showCenter(msg: res.msg);
    }
  }
}
