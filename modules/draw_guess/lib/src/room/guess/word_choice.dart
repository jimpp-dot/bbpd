import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

class Word {
  final int id;
  final String word;

  Word({required this.id, required this.word});

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        id: Util.parseInt(json['id']),
        word: Util.parseStr(json['word']) ?? '',
      );
}

/// 绘制者选词
class SelectingWord extends StatefulWidget {
  final List<Word>? words;

  final ValueChanged<Word>? onSelect;

  final VoidCallback? onRefresh;

  final int changeWordPrice;

  const SelectingWord(
      this.words, this.onSelect, this.changeWordPrice, this.onRefresh,
      {super.key});

  @override
  _SelectingWordState createState() => _SelectingWordState();
}

class _SelectingWordState extends State<SelectingWord> {
  bool _refreshable = true;

  /// 刷新选词
  void _refresh() {
    _refreshable = false;
    widget.onRefresh?.call();
    refresh();
  }

  Widget _buildRefreshButtonV1() {
    return Visibility(
      visible: _refreshable,
      maintainState: true,
      maintainSize: true,
      maintainAnimation: true,
      child: GestureDetector(
        onTap: _refresh,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.cached,
              size: 16,
              color: Color(0xFF05BCFF),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                K.room_turn_next_group,
                style: const TextStyle(color: Color(0xFF242528), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRefreshButton() => _buildRefreshButtonV1();

  @override
  Widget build(BuildContext context) {
    if (widget.words?.isEmpty ?? true) {
      Log.d('words is not enough to be choosen.');
      return const SizedBox.shrink();
    }
    return Container(
      width: 240,
      height: 180,
      decoration: BoxDecoration(
        color: const Color(0xFFEFFBFF),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            K.room_choose_word_to_draw,
            style: const TextStyle(
              color: Color(0xFF242528),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.only(left: 25, right: 25),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.words!.map((word) {
              return ButtonTheme(
                height: 32,
                child: GestureDetector(
                  onTap: () => widget.onSelect?.call(word),
                  child: Container(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    decoration: BoxDecoration(
                      color: R.color.mainBrandColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      word.word,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          _buildRefreshButton()
        ],
      ),
    );
  }
}

/// 观众等待选词
class WaitingWord extends StatelessWidget {
  final RoomPosition? roomPosition;

  const WaitingWord(this.roomPosition, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 52,
      decoration: BoxDecoration(
        color: R.color.mainBrandColor,
        borderRadius: BorderRadius.circular(25),
      ),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: <Widget>[
          Container(
            width: 44,
            height: 44,
            margin: const EdgeInsets.only(left: 4, right: 8),
            child: CommonAvatar(
              path: roomPosition?.icon,
              size: 44,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 2),
                  child: Text(
                    roomPosition?.name ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  K.room_choosing_word_with,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
