import 'package:shared/widget/search_bar.dart';
import 'package:draw_guess/assets.dart';
import 'package:draw_guess/k.dart';
import 'package:draw_guess/src/room/queue/repo/guess_queue_repo.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base;
import 'package:chat_room/chat_room.dart';

/// 画猜接龙猜词弹框
class GuessQueueGuessWordDialog extends StatefulWidget {
  final ChatRoomData room;

  const GuessQueueGuessWordDialog({super.key, required this.room});

  @override
  _GuessQueueGuessWordDialogState createState() =>
      _GuessQueueGuessWordDialogState();

  static void show(BuildContext context, ChatRoomData room) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => GuessQueueGuessWordDialog(room: room),
    );
  }
}

class _GuessQueueGuessWordDialogState extends State<GuessQueueGuessWordDialog> {
  final GlobalKey<SearchBarState> _searchKey = GlobalKey<SearchBarState>();
  String? _searchContent;
  bool _alreadyPop = false;

  @override
  void initState() {
    super.initState();

    eventCenter.addListener(
        EventConstant.EventGuessQueueWordDialogClose, _close);
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventConstant.EventGuessQueueWordDialogClose, _close);

    super.dispose();
  }

  void _pop() {
    if (mounted && Navigator.of(context).canPop() && _alreadyPop == false) {
      _alreadyPop = true;
      Navigator.of(context).pop();
    }
  }

  void _close(String type, dynamic value) => _pop();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 312 * Util.ratio,
            height: 208,
            padding: const EdgeInsetsDirectional.only(start: 23, end: 23),
            decoration: BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 4, color: const Color(0xFF343434)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  K.guess_queue_answere_word_num_default,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: R.color.unionRankText1),
                ),
                const SizedBox(height: 19),
                _buildInput(),
                const SizedBox(height: 20),
                _buildConfirmBtn(),
              ],
            ),
          ),
          PositionedDirectional(
            top: -15,
            end: -10,
            child: R.img(
                Assets.draw_guess$guess_queue_submit_answer_title_icon_webp,
                width: 76,
                height: 76),
          ),
        ],
      ),
    );
  }

  Widget _buildInput() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 2, end: 2),
      child: SearchBar(
        _onQueryChanged,
        key: _searchKey,
        hintText: K.guess_queue_answere_word_placeholder,
        height: 48,
        textStyle: TextStyle(color: R.color.mainTextColor, fontSize: 13),
        hintStyle: TextStyle(color: R.color.thirdTextColor, fontSize: 13),
        showSearchIcon: false,
        showLeftTextNum: false,
        maxLength: 30,
        autoFocus: true,
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      ),
    );
  }

  void _onQueryChanged(String text) {
    if (text.runes.length > 30) return;

    _searchContent = text.trim();
  }

  Widget _buildConfirmBtn() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (_searchContent?.isEmpty ?? true) {
          return;
        }

        widget.room.playShortAudio('guess_send_text.mp3',
            path: 'packages/draw_guess/assets/sound/');
        BaseResponse rsp = await GuessQueueRepo.submitGuessQueueAnswer(
            widget.room.rid, _searchContent);
        if (rsp.success == true) {
          _searchKey.currentState?.clearText();
        } else {
          Fluttertoast.showCenter(msg: rsp.msg ?? base.K.data_error);
        }

        _pop();
      },
      child: Container(
        height: 55,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: const Color(0xFF737BFF),
          borderRadius: const BorderRadius.all(Radius.circular(27.5)),
          border: Border.all(width: 3, color: const Color(0xFF343434)),
        ),
        child: Text(
          K.guess_queue_answere_word_confirm,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
