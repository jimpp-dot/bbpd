import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/wedding/mode/wedding_combo_data.dart';

part 'room_wedding_beans.g.dart';

/// 婚礼房model
/// 婚礼状态
enum WeddingState {
  /// 初始状态
  Init,

  /// 开幕
  Opening,

  /// 交换戒指
  Ring,

  /// 谢幕
  Ending,
}

enum WeddingRole {
  /// 司仪
  Master,

  /// 新郎
  Bridegroom,

  /// 新娘
  Bride,

  /// 伴郎
  Groomsman,

  /// 伴娘
  Bridesmaid,

  /// 普通嘉宾
  Guest,

  /// 游客
  Visitor,
}

/// 婚礼房扩展数据
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class WeddingData {
  @JsonKey(fromJson: Util.parseInt)
  final int wid;
  final String name;
  final WeddingScene? scene; // 婚礼房模板数据
  final List<WeddingEffect> effect; // 婚礼各阶段动效
  final WeddingComboConfig? comboConfig; // 婚礼各阶段动效

  @JsonKey(fromJson: parseWeddingState)
  WeddingState stage;
  @JsonKey(name: 'blessing_score', fromJson: Util.parseInt)
  int blessScore; // 祝福值
  List<WeddingMic> mics; // 麦位角色

  WeddingData(this.stage, this.blessScore, this.name, this.wid, this.scene,
      this.mics, this.effect, this.comboConfig);

  factory WeddingData.fromJson(Map<String, dynamic> json) {
    WeddingData data = _$WeddingDataFromJson(json);
    return data;
  }

  static String getComboImageUrl(
      WeddingComboConfig comboConfig, String type, int position) {
    if ('big' == type) {
      return comboConfig.bigImageUrls[position];
    } else if ('medium' == type) {
      return comboConfig.mediumImageUrls[position];
    } else if ('small' == type) {
      return comboConfig.smallImageUrls[position];
    }
    return '';
  }
}

/// 婚礼房样式数据
@JsonSerializable(createToJson: false)
class WeddingScene {
  @JsonKey(name: 'scene_id', fromJson: Util.parseInt)
  final int sceneId;
  @JsonKey(name: 'scene_name')
  final String sceneName;
  @JsonKey(fromJson: Util.parseInt)
  final int price;
  final String bg; // 房间背景
  @JsonKey(name: 'seat_bg') // 麦位背景
  final String seatBg;
  @JsonKey(name: 'mc_header')
  final String mcHeader; // 司仪头像框
  @JsonKey(name: 'bridegroom_header')
  final String bridegroomHeader; // 新郎头像框
  @JsonKey(name: 'bride_header')
  final String brideHeader; // 新娘头像框
  @JsonKey(name: 'groomsman_header')
  final String groomsmanHeader; // 伴郎头像框
  @JsonKey(name: 'bridesmaid_header')
  final String bridesmaidHeader; // 伴娘头像框
  @JsonKey(name: 'wedding_flower_cid', fromJson: Util.parseInt)
  final int weddingFlowerCid; // 手捧花礼物cid

  WeddingScene(
      this.sceneId,
      this.sceneName,
      this.price,
      this.bg,
      this.seatBg,
      this.mcHeader,
      this.bridegroomHeader,
      this.brideHeader,
      this.groomsmanHeader,
      this.bridesmaidHeader,
      this.weddingFlowerCid);

  factory WeddingScene.fromJson(Map<String, dynamic> json) =>
      _$WeddingSceneFromJson(json);
}

/// 婚礼房数据刷新
@JsonSerializable(createToJson: false)
class WeddingUpdate {
  @JsonKey(fromJson: parseWeddingState)
  WeddingState stage;
  @JsonKey(name: 'blessing_score', fromJson: Util.parseInt)
  final int blessScore; // 祝福值

  WeddingUpdate(this.stage, this.blessScore); // 婚礼流程特效

  factory WeddingUpdate.fromJson(Map<String, dynamic> json) =>
      _$WeddingUpdateFromJson(json);
}

/// 婚礼动效 文件是vap格式
@JsonSerializable(createToJson: false)
class WeddingEffect {
  @JsonKey(fromJson: parseWeddingState)
  WeddingState stage;
  @JsonKey(name: 'url')
  final String vapUrl;
  @JsonKey(name: 'size')
  final int vapSize;
  final String cover;

  WeddingEffect(this.stage, this.vapUrl, this.vapSize, this.cover);

  factory WeddingEffect.fromJson(Map<String, dynamic> json) =>
      _$WeddingEffectFromJson(json);

  String get downUrl {
    if (vapUrl.isEmpty || vapUrl.contains('http')) return vapUrl;
    return '${System.imageDomain}$vapUrl';
  }
}

/// 婚礼房麦位
@JsonSerializable(createToJson: false)
class WeddingMic {
  @JsonKey(fromJson: Util.parseInt)
  final int position;
  @JsonKey(fromJson: Util.parseInt)
  final int uid;
  @JsonKey(fromJson: parseWeddingRole)
  final WeddingRole role; // 婚礼角色

  WeddingMic(this.position, this.uid, this.role);

  factory WeddingMic.fromJson(Map<String, dynamic> json) =>
      _$WeddingMicFromJson(json);
}

/// 解析婚礼流程
WeddingState parseWeddingState(int state) {
  WeddingState weddingState;
  switch (state) {
    case 0:
      weddingState = WeddingState.Init;
      break;
    case 1:
      weddingState = WeddingState.Opening;
      break;
    case 2:
      weddingState = WeddingState.Ring;
      break;
    case 3:
      weddingState = WeddingState.Ending;
      break;
    default:
      weddingState = WeddingState.Init;
  }
  return weddingState;
}

/// 解析婚礼角色
/// 婚礼角色 婚礼房特有，1：新郎，2: 新娘，10：司仪，20：伴郎，21：伴娘，30：嘉宾
WeddingRole parseWeddingRole(int role) {
  WeddingRole weddingRole;
  switch (role) {
    case 1:
      weddingRole = WeddingRole.Bridegroom;
      break;
    case 2:
      weddingRole = WeddingRole.Bride;
      break;
    case 10:
      weddingRole = WeddingRole.Master;
      break;
    case 20:
      weddingRole = WeddingRole.Groomsman;
      break;
    case 21:
      weddingRole = WeddingRole.Bridesmaid;
      break;
    case 30:
      weddingRole = WeddingRole.Guest;
      break;
    default:
      weddingRole = WeddingRole.Visitor;
  }
  return weddingRole;
}

/// 婚礼角色名称
String getRoleName(WeddingRole weddingRole) {
  String roleName;
  switch (weddingRole) {
    case WeddingRole.Bridegroom:
      roleName = K.room_bridegroom;
      break;
    case WeddingRole.Bride:
      roleName = K.room_bride;
      break;
    case WeddingRole.Master:
      roleName = K.room_presenter;
      break;
    case WeddingRole.Groomsman:
      roleName = K.room_groomsman;
      break;
    case WeddingRole.Bridesmaid:
      roleName = K.room_bridesmaid;
      break;
    default:
      roleName = '';
  }
  return roleName;
}
