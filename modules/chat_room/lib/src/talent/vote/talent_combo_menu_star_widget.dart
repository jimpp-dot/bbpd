import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/widget/gradient_circular_progress_indicator.dart';
import 'package:chat_room/src/talent/data/talent_repo.dart';
import 'package:chat_room/src/talent/list/talent_rank_tasting_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/talent/data/talent_main_view_model.dart';
import 'package:chat_room/src/talent/data/talent_models.dart';
import 'package:chat_room/src/talent/talent_constants.dart';

import '../talent_helper.dart';
import 'talent_vote_bottom_dialog.dart';
import 'dart:math';

/// 才艺厅
class ComboMenuTalentStar extends StatefulWidget {
  final ChatRoomData room;

  const ComboMenuTalentStar({
    super.key,
    required this.room,
  });

  @override
  _ComboMenuTalentStarState createState() => _ComboMenuTalentStarState();
}

class _ComboMenuTalentStarState extends State<ComboMenuTalentStar> {
  // 0.0 ~ 1.0 当前的进度
  double _currentProgress = 0;

  Timer? _progressTimer;

  int _updateTime = 0;

  @override
  void dispose() {
    _cancelProgressTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Consumer<TalentMainViewModel>(
        builder: (context, model, child) {
          if (model.data == null) return const SizedBox.shrink();
          BroadcasterInfoResp data = model.data!;
          bool showProgress = data.rewardStarStayFinish != true;

          if (_updateTime != data.updateTime) {
            Log.d(
                tag: TAG,
                'time is diff _updateTime=$_updateTime,next=${data.updateTime}');
            _cancelProgressTimer();
            _updateTime = data.updateTime;
          }

          if (_progressTimer == null && showProgress) {
            Log.d(tag: TAG, '---initTimer----');
            _initTimer(data.rewardStarStayTime, data.rewardStarTotalTime);
          }

          return InkWell(
            borderRadius: BorderRadius.circular(34),
            onTap: () async {
              bool can = TalentHelper.verifyVote(
                  widget.room, data.broadcasterInfo,
                  noToast: true);
              int starNum = await _getStarNum();
              if (!can || starNum == 0) {
                TalentRankTastingList.show(context);
              } else {
                onTap(data.broadcasterInfo);
              }
            },
            child: Stack(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2)),
                  child: Center(
                    child: R.img(
                      RoomAssets.chat_room$talent_talent_star_webp,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                if (showProgress && _currentProgress > 0)
                  GradientCircularProgressIndicator(
                    stokeWidth: 1,
                    radius: 17,
                    backgroundColor: Colors.transparent,
                    colors: const [
                      Color(0xFFFF8C6D),
                      Color(0xFFFFDCA9),
                    ],
                    rotate: 1.5 * pi,
                    value: _currentProgress,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onTap(BroadcasterInfo? info) async {
    bool can = TalentHelper.verifyVote(widget.room, info);
    if (!can) {
      return;
    }

    TalentVoteBottomDialog.showBottomDialog(
      System.context,
      widget.room,
      info!.programId,
      info.currentAnchor!,
      true,
    );
  }

  _initTimer(int currentTime, int totalTime) {
    _cancelProgressTimer();
    if (totalTime == 0) return;
    var period = Duration(milliseconds: totalTime * 1000 ~/ 100);
    _currentProgress = currentTime / totalTime;
    if (_currentProgress >= 1) {
      _currentProgress = 1;
    }
    _progressTimer = Timer.periodic(period, (timer) {
      _currentProgress = _currentProgress + 0.01;
      if (_currentProgress > 1) {
        _currentProgress = 0;
        timer.cancel();
      }
      refresh();
    });
  }

  void _cancelProgressTimer() {
    if (_progressTimer != null && _progressTimer!.isActive) {
      _progressTimer!.cancel();
    }
    _progressTimer = null;
  }

  Future<int> _getStarNum() async {
    int starNum = 1;
    await Future.any([
      Future(() async {
        DataRsp<int> resp = await TalentRepo.getStarBg();
        if (resp.success == true && resp.data != null) {
          starNum = resp.data!;
        }
      }),
      Future(() async {
        await Future.delayed(const Duration(milliseconds: 1500));
      })
    ]);
    return starNum;
  }
}
