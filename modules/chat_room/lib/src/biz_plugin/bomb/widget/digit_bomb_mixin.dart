import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/bomb/model/digit_bomb_info_model.dart';
import 'package:chat_room/src/biz_plugin/bomb/repo/digit_bomb_game_repository.dart';
import 'package:chat_room/src/biz_plugin/bomb/widget/digit_bomb_edit_widget.dart';
import 'package:chat_room/src/biz_plugin/bomb/widget/digit_bomb_game_controller.dart';

mixin DigitBombMixin<T extends BaseDigitBombController> on State<T> {
  DigitBombInfoData? bombData;
  bool isOpen = true; //是否展开状态
  int _lastPlayer = 0; //上次轮到操作的用户
  DateTime? lastBottomRightTapTime; //上次点击时间

  @override
  void initState() {
    super.initState();
    _loadData();
    widget.room
        .addListener(RoomConstant.Event_Digit_Bomb_Sync, _onRefreshEvent);
  }

  @override
  void dispose() {
    widget.room
        .removeListener(RoomConstant.Event_Digit_Bomb_Sync, _onRefreshEvent);
    super.dispose();
  }

  _loadData() async {
    DigitBombGameRepository.loadDigitBombInfo(widget.room.rid).then((value) {
      if (value.success == true && mounted) {
        setState(() {
          bombData = value.data;
        });
      }
    });
  }

  bool get hasAuthority =>
      widget.room.isCreator ||
      widget.room.isReception ||
      ChatRoomUtil.getPositionByServer()?.position == 0;

  _onRefreshEvent(String type, Object? data) {
    if (data is DigitBombInfoData) {
      try {
        bombData = data;
        if (bombData?.status == DigitBombStatus.bomb) {
          Future.delayed(const Duration(milliseconds: 300), () {
            AudioPlayHelper.instance().closeSound();
            AudioPlayHelper.instance().playAudio('digit_bomb_bomb.mp3',
                path: 'packages/chat_room/assets/sound/');
          });

          if (bombData?.uid == Session.uid) {
            Future.delayed(const Duration(milliseconds: 2000), () {
              int? lastGid = bombData?.id;
              DigitBombGameRepository.createDigitBombGame(widget.room.rid,
                  lastgid: lastGid);
            });
          }
        } else if (bombData?.status == DigitBombStatus.playing) {
          if (_lastPlayer != bombData?.player) {
            AudioPlayHelper.instance().closeSound();
            AudioPlayHelper.instance().playAudio('digit_bomb_next.mp3',
                path: 'packages/chat_room/assets/sound/');
          }
          if (bombData?.player == Session.uid &&
              bombData?.status == DigitBombStatus.playing) {
            isOpen = true;
          }
        }
        _lastPlayer = bombData?.player ?? _lastPlayer;
        if (mounted) setState(() {});
      } catch (e) {
        Log.d('DigitBombInfoResp error $e');
      }
    }
  }

  /// 关闭
  void closeDigitBombGame() async {
    var resp = await DigitBombGameRepository.digitBombClose(
        widget.room.rid, bombData?.id ?? 0);
    if (resp.success == true) {
      Fluttertoast.showCenter(msg: K.digit_bomb_game_disable);
      if (mounted) setState(() {});
    } else if (resp.success == false && resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  /// 按钮点击事件
  onTapButton(BuildContext context) async {
    if (hasAuthority) {
      switch (bombData?.status) {
        case DigitBombStatus.wait:

          /// 开始游戏
          BaseResponse resp = await DigitBombGameRepository.digitBombStart(
              bombData!.rid, bombData!.id);
          if (resp.success == true) {
            Fluttertoast.showCenter(msg: K.room_game_was_starting);
          } else if (resp.success == false && resp.msg != null) {
            Fluttertoast.showCenter(msg: resp.msg);
          }
          break;
        case DigitBombStatus.playing:
          if (bombData?.player == Session.uid) {
            /// 输入数字
            DigitBombEditWidget.show(context, bombData!, EditWidgetType.setNum);
          } else {
            /// 下一步
            bool? r = await _NextPromptDialog.show(context);
            if (r != true) {
              break;
            }
            DigitBombGameRepository.digitBombNext(bombData!.rid, bombData!.id);
          }
          break;
        default:
          break;
      }
    } else {
      DigitBombEditWidget.show(context, bombData!, EditWidgetType.setNum);
    }
  }
}

class _NextPromptDialog extends StatefulWidget {
  static const String spKey = 'room_bomb_game_next_prompt';

  const _NextPromptDialog();

  static Future<bool?> show(BuildContext context) {
    bool prompt = Config.getBool(spKey, true);
    if (prompt == true) {
      return showDialog(
        context: context,
        builder: (context) {
          return const _NextPromptDialog();
        },
      );
    }
    return Future.value(true);
  }

  @override
  __NextPromptDialogState createState() {
    return __NextPromptDialogState();
  }
}

class __NextPromptDialogState extends State<_NextPromptDialog> {
  bool _checked = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Config.setBool(_NextPromptDialog.spKey, !_checked);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: R.color.mainBgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              K.room_bomb_next_prompt,
              style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 18,
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NegativeButton(),
              PositiveButton(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _checked,
                  onChanged: (value) {
                    setState(() {
                      _checked = value ?? false;
                    });
                  },
                ),
                Text(
                  K.room_not_prompt_anymore,
                  style: TextStyle(
                    color: R.color.secondTextColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
