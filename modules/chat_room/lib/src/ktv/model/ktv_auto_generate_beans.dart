import 'package:shared/shared.dart';

class KtvAudioGenerateModel {
  bool generate;
  String privacyUrl;

  KtvAudioGenerateModel({
    required this.generate,
    required this.privacyUrl,
  });

  factory KtvAudioGenerateModel.fromJson(Map<String, dynamic> json) {
    return KtvAudioGenerateModel(
      generate: Util.parseBool(json["generate"]),
      privacyUrl: Util.notNullStr(json["privacy_url"]),
    );
  }
}
