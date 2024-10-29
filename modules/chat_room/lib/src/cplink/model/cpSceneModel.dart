import 'package:shared/shared.dart';

class CpSceneModel {
  final int heartValue; //序号
  final String sceneImage; //大图
  final String background; //小图
  final String titleImage;

  CpSceneModel(
      {required this.heartValue,
      required this.sceneImage,
      required this.background,
      required this.titleImage});

  factory CpSceneModel.fromJson(Map<String, dynamic> json) {
    return CpSceneModel(
        heartValue: Util.parseInt(json['heart_num']),
        sceneImage: json['scene_background'] ?? '',
        background: json['background'] ?? '',
        titleImage: json['title_image'] ?? '');
  }
}
