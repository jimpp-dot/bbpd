import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'wolfVoteMsgWidget.dart';

///狼人杀消息中转处理类
class WolfMsgWidget extends StatelessWidget {
  final MessageContent message;

  const WolfMsgWidget({super.key, required this.message});

  Widget _renderDefault() {
    return Container(
      padding: const EdgeInsets.only(
          left: 6.0 - 6.0,
          right: 10.0 - 6.0,
          top: 4.0 - 2.5,
          bottom: 3.0 - 2.5),
      child: Text(
        message.message ?? '',
        style: messageTextStyle,
      ),
    );
  }

  Widget _renderBody() {
    Map extra = message.extra ?? {};
    if (extra['subType'] == 'wolfStart') {
      return Container(
        padding: const EdgeInsets.only(
            left: 6.0 - 6.0,
            right: 14.0 - 6.0,
            top: 5.0 - 2.5,
            bottom: 4.0 - 2.5),
        child: Text(
          message.message ?? '',
          style: const TextStyle(
            color: Color(0xFF7068D3),
            fontSize: 14.0,
          ),
        ),
      );
    } else if (extra['subType'] == 'wolfVoteResult') {
      Map msgData = extra['msgData'];

      List? liveList = msgData['liveList'];

      Map<int, List<int>> votes = {};
      Map? voteResList = msgData['voteResList'];
      if (voteResList != null) {
        List keys = voteResList.keys.toList();
        if (keys.isNotEmpty) {
          for (var key in keys) {
            int kp = getPositionByLiveList(key.toString(), liveList);
            int kpr;
            if (kp == -1) {
              kpr = kp;
            } else {
              kpr = kp + 1;
            }
            votes[kpr] = [];

            List? value = voteResList[key];
            if (value != null && value.isNotEmpty) {
              for (var vl in value) {
                int vp = getPositionByLiveList(vl.toString(), liveList);
                if (vp != -1) {
                  votes[kpr]!.add(vp + 1);
                } else {
                  votes[kpr]!.add(vp);
                }
              }
            }
          }
        }
      }

      List<int> loser = [];
      List? deadList = msgData['deadList'];
      if (deadList != null && deadList.isNotEmpty) {
        for (var dl in deadList) {
          int position = Util.parseInt(dl['position'], 0);
          loser.add((position + 1));
        }
      }

      return WolfVoteMsgWidget(
        votes: votes,
        loser: loser,
      );
    } else if (extra['subType'] == 'wolfNormal') {
      return _renderDefault();
    }
    return _renderDefault();
  }

  ///
  /// 根据uid，在当前liveList中找position
  ///
  int getPositionByLiveList(String uid, List? liveList) {
    int position = -1;
    if (liveList != null && liveList.isNotEmpty) {
      for (var pos in liveList) {
        if (pos != null) {
          if (uid == pos['origin']) {
            position = Util.parseInt(pos['position'], -1);
          }
        }
      }
    }
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return _renderBody();
  }
}
