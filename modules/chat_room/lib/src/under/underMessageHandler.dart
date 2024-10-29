import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import 'model/underData.dart';
import 'model/underRepository.dart';
import 'widget/displayVoteResult.dart';
import 'widget/game_result.dart';

class UnderMessageHandler {
  static void handleMessage(ChatRoomData room) async {
    _dismissUnderResult(room);

    Map? data = room.config?.underData?.dataMap;
    switch (room.config?.underData?.gameUnderState) {
      case GameUnderState.Send:
        //派词阶段

        //获取自己的词语，并公屏提示：游戏开始，有几个卧底，几个贫民
        if (data != null && data.isNotEmpty) {
          int populace = Util.parseInt(data['populace']); //贫民个数
          int under = Util.parseInt(data['under']); //卧底个数
          String? contributorName =
              Util.parseStr(data['contributor_name']); // 贡献人

          String msg = contributorName == null || contributorName.trim().isEmpty
              ? K.room_under_start_intro(['$under', '$populace'])
              : K.room_under_start_intro_with_contributor(
                  ['$under', '$populace', contributorName]);
          _sendLocalMessageAndGetWord(room, msg);
        }

        break;

      case GameUnderState.Desc:
        //发言阶段

        //当前麦位发言，语音提示
        int? position = room.config?.underData?.gameUnderCurrent;
        if (room.isMic && room.positionForCurrentUser?.position == position) {
          AudioPlayHelper.instance().playAudio("under_desc.mp3");
        }
        break;

      case GameUnderState.VoteResult:
        //投票结果

        if (data != null && data.isNotEmpty) {
          String? type = Util.parseStr(data['type']); //empty, loser, pk, drop
          Map<int, List<int>>? votes =
              ChatRoomUtil.convertListMap(data['votes']); //投票信息
          List<int> loser =
              Util.parseList(data['data'], (e) => Util.parseInt(e)); //谁被淘汰
          if (type != null &&
              type.isNotEmpty &&
              votes != null &&
              votes.isNotEmpty) {
            _sendVoteResultMessage(room, type, votes, loser); //公屏消息
          }
        }
        break;

      case GameUnderState.End:
        //游戏结束
        if (data != null && data.isNotEmpty) {
          String success = Util.notNullStr(data['success']); //populace, under
          Map<int, List<int>> votes =
              ChatRoomUtil.convertListMap(data['votes']) ?? {}; //投票信息
          List<int> losers = []; //谁被淘汰
          List<int> winners = [];

          List<GameUnderRole> winnerRoles = success == 'populace'
              ? [GameUnderRole.Populace_Loser, GameUnderRole.Populace]
              : [GameUnderRole.Under, GameUnderRole.Under_Loser];

          for (var roomPosition in room.positions) {
            if (roomPosition.uid <= 0 &&
                roomPosition.underData!.gameUnderOrigin <= 0) {
            } else if (winnerRoles
                .contains(roomPosition.underData!.gameUnderRole)) {
              winners.add(roomPosition.position);
            } else {
              losers.add(roomPosition.position);
            }
          }

//        _sendVoteResultMessage(room, 'loser', votes, losers);

          List<RoomPosition> roomPositions = [];
          for (var rp in room.positions) {
            roomPositions.add(rp);
          }
          _displayUnderResult(
              state: 'end',
              votes: votes,
              losers: losers,
              winners: winners,
              populaceWord: Util.parseStr(data['populace']),
              underWord: Util.parseStr(data['under']),
              roomPositions: roomPositions,
              room: room,
              winType: success);

          room.gameUnderWord = null;
        }

        break;
      default:
        break;
    }
  }

  static void _sendLocalMessageAndGetWord(ChatRoomData room, String msg) {
    //游戏开始，麦上用户获取卧底词
    if (room.isMic) {
      RoomPosition? myPosition = room.positionForCurrentUser;

      UnderRepository.loadGameUnderWord(
          room, myPosition?.underData?.gameUnderId ?? 0);
    }

    //游戏开始，显示公屏消息
    room.sendLocalMessage(msg);
  }

  static void _dismissUnderResult(ChatRoomData room) {
    if (room.resultShowing) Navigator.of(System.context).pop();
  }

  static void _displayUnderResult(
      {String? state,
      String? type,
      Map<int, List<int>>? votes,
      required List<int> losers,
      required List<int> winners,
      String? underWord,
      String? populaceWord,
      required List<RoomPosition> roomPositions,
      required ChatRoomData room,
      String? winType}) async {
    _dismissUnderResult(room);
    room.resultShowing = true;
    if (state == 'continue') {
      await showDialog(
          context: System.context,
          builder: (BuildContext context) {
            return DisplayVoteResult(
              votes: votes ?? {},
              loser: losers,
              type: type,
              positions: roomPositions,
            );
          });
    } else if (state == 'end') {
      await showDialog(
          context: System.context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return UnderGameResult(
              losers: losers,
              winners: winners,
              underWord: underWord,
              populaceWord: populaceWord,
              rid: room.rid,
              roomPositions: List<RoomPosition>.from(room.positions),
              positionForCurrentUser: room.positionForCurrentUser,
              winType: winType,
            );
          });
    }
    room.resultShowing = false;
  }

  static void _sendVoteResultMessage(ChatRoomData room, String type,
      Map<int, List<int>>? votes, List<int>? loser) {
    if (votes == null || votes.isEmpty) {
      return;
    }

    String curVoteMsg = ''; //当前用户投票
    String voteMessage = '${K.room_vote_result_as}：\n'; //投票
    String giveUpMsg = ''; // 弃票
    String pkMsg = ''; //PK
    RoomPosition? myPosition = room.positionForCurrentUser;

    //-1为弃票，弃票人数为未出局玩家数量，公屏显示全体弃票
    if (type == 'empty') {
      room.sendLocalMessage(K.room_all_abstain_restart_desc);
      return;
    }

    votes.forEach((int key, List<int> value) {
      bool firstVoterForThisKey = true;
      for (var voter in value) {
        if (key == -1) {
          //弃票
          giveUpMsg += giveUpMsg.isEmpty ? '${voter + 1}' : '、${voter + 1}';
        } else if (voter >= 0 && myPosition?.position == voter) {
          curVoteMsg = K.room_u_vote_which_num(['${key + 1}']);
        } else if (firstVoterForThisKey) {
          voteMessage = '$voteMessage${voter + 1}';
          firstVoterForThisKey = false;
        } else {
          voteMessage = '$voteMessage、${voter + 1}';
        }
      }
      if (!firstVoterForThisKey)
        voteMessage =
            K.room_some_one_vote_some_one([voteMessage, '${key + 1}']);
    });

    if (giveUpMsg.isNotEmpty) giveUpMsg += K.room_some_one_abstain;

    if (type == 'pk' && loser != null && loser.length > 1) {
      for (var pk in loser) {
        pkMsg = pkMsg + (pkMsg.isEmpty ? '${pk + 1}' : '、${pk + 1}');
      }
      pkMsg = K.room_some_one_start_pk([pkMsg]);
    }

    String msg = curVoteMsg + voteMessage + giveUpMsg + pkMsg;
    if (msg.endsWith('\n')) msg = msg.substring(0, msg.length - 1);

    room.sendLocalMessage(msg);
  }
}
