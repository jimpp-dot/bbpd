import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/under/model/underData.dart';
import '../../../k.dart';
import 'custom_nonscroll_gridview.dart';
import 'under_user_icon.dart';

class UnderVoteResultWidget extends StatefulWidget {
  final Map<int, List<int>> voteResult;

  const UnderVoteResultWidget({super.key, required this.voteResult});

  @override
  _UnderVoteResultWidgetState createState() => _UnderVoteResultWidgetState();
}

class _UnderVoteResultWidgetState extends State<UnderVoteResultWidget> {
  Widget _buildItem(MapEntry<int, List<int>> mapEntry) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 19),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UnderIconPositionWidget(
            text: mapEntry.key == -1 ? K.vote_abstain : '${mapEntry.key + 1}',
            bg: mapEntry.key == -1
                ? 'under/abstain_bg.svg'
                : 'under/bg_usericon_position.svg',
          ),
          const SizedBox(width: 16),
          R.img('under/ic_under_vote_result_arrow.svg',
              width: 22,
              height: 12,
              package: ComponentManager.MANAGER_BASE_ROOM),
          const SizedBox(width: 16),
          CustomNonScrollGridView(
            columnCount: 3,
            itemWidth: 24,
            itemHeight: 24,
            children: mapEntry.value
                .map((voter) => UnderIconPositionWidget(text: '${voter + 1}'))
                .toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.voteResult.entries
          .map((mapEntry) => _buildItem(mapEntry))
          .toList(),
    );
  }
}

class UnderDeadPositionWidget extends StatelessWidget {
  final RoomPosition? roomPosition;

  const UnderDeadPositionWidget({super.key, this.roomPosition});

  Widget _buildDeadInfo(RoomPosition roomPosition) {
    String? roleTxt;
    if (roomPosition.underData?.gameUnderRole == GameUnderRole.Under_Loser) {
      roleTxt = K.room_under;
    } else if (roomPosition.underData?.gameUnderRole ==
        GameUnderRole.Populace_Loser) {
      roleTxt = K.room_civilian;
    }
    if (roleTxt == null) return const SizedBox.shrink();

    return Center(
      child: SizedBox(
        width: 72,
        height: 93,
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              top: 8,
              start: 12,
              child: HeadIcon(
                width: 48,
                height: 48,
                icon: '${System.imageDomain}${roomPosition.icon}!head150',
              ),
            ),
            PositionedDirectional(
              top: 0,
              start: 9,
              child: UnderIconPositionWidget(
                text: '${roomPosition.position + 1}',
              ),
            ),
            PositionedDirectional(
              top: 65,
              start: 0,
              child: SizedBox(
                width: 72,
                height: 28,
                child: RawMaterialButton(
                  onPressed: null,
                  constraints:
                      const BoxConstraints.tightFor(width: 72, height: 28),
                  fillColor: const Color(0xFF00A0FF),
                  shape: const StadiumBorder(),
                  child: Text(
                    roleTxt,
                    style: R.textStyle.body1.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (roomPosition != null) return _buildDeadInfo(roomPosition!);
    return const SizedBox.shrink();
  }
}
