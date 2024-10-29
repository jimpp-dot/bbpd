import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'digit_bomb_info_model.g.dart';

enum DigitBombStatus {
  over, //结束 0
  wait, //准备中 1
  playing, //进行中 2
  bomb, //爆炸 3
}

DigitBombStatus parseDigitBombStatus(var status) {
  int gameStatus = Util.parseInt(status);
  if (gameStatus == 0) {
    return DigitBombStatus.over;
  } else if (gameStatus == 1) {
    return DigitBombStatus.wait;
  } else if (gameStatus == 2) {
    return DigitBombStatus.playing;
  } else if (gameStatus == 3) {
    return DigitBombStatus.bomb;
  }
  return DigitBombStatus.wait;
}

@JsonSerializable()
class DigitBombInfoResp extends BaseResponse {
  @JsonKey(name: 'data')
  DigitBombInfoData? data;

  DigitBombInfoResp({super.success, super.msg, this.data});

  factory DigitBombInfoResp.fromJson(Map<String, dynamic> srcJson) =>
      _$DigitBombInfoRespFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$DigitBombInfoRespToJson(this);
}

@JsonSerializable()
class DigitBombInfoData {
  @JsonKey(name: 'id') //游戏对局ID
  int id;

  @JsonKey(name: 'uid') //创建游戏的玩家
  int uid;

  @JsonKey(name: 'rid') //房间ID
  int rid;

  @JsonKey(name: 'min') //设置时最小值
  int min;
  @JsonKey(name: 'max') //设置时最大值
  int max;
  @JsonKey(name: 'bomb') //炸弹数字
  int bomb;
  @JsonKey(name: 'cmin') //当前最小值
  int cmin;
  @JsonKey(name: 'cmax') //当前最大值
  int cmax;
  @JsonKey(name: 'lastdigit') //上一轮玩家输入数字
  int lastDigit;
  @JsonKey(name: 'level') //游戏进行的轮次数
  int level;

  @JsonKey(name: 'position') //当前麦位
  int position;
  @JsonKey(name: 'player') //当前玩家ID
  int player;
  @JsonKey(name: 'player_icon') //当前玩家icon
  String playerIcon;
  @JsonKey(name: 'player_name') //当前玩家name
  String playerName;
  @JsonKey(name: 'status', fromJson: parseDigitBombStatus)
  DigitBombStatus status;

  DigitBombInfoData(
      this.id,
      this.uid,
      this.rid,
      this.min,
      this.max,
      this.bomb,
      this.cmin,
      this.cmax,
      this.lastDigit,
      this.level,
      this.position,
      this.player,
      this.playerIcon,
      this.status,
      this.playerName);

  factory DigitBombInfoData.fromJson(Map<String, dynamic> srcJson) =>
      _$DigitBombInfoDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DigitBombInfoDataToJson(this);

  @override
  String toString() {
    return 'DigitBombInfoData{id: $id, uid: $uid, rid: $rid, min: $min, max: $max, bomb: $bomb, cmin: $cmin, cmax: $cmax, lastDigit: $lastDigit, level: $level, position: $position, player: $player, playerIcon: $playerIcon, playerName: $playerName, status: $status}';
  }
}
