// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achieve_wall_dialog_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AchieveWallDialogConfig _$AchieveWallDialogConfigFromJson(
        Map<String, dynamic> json) =>
    AchieveWallDialogConfig(
      mainTitle: json['mainTitle'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      levelPrefix: json['levelPrefix'] as String,
      levelSuffix: (json['levelSuffix'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AchieveWallDialogConfigToJson(
        AchieveWallDialogConfig instance) =>
    <String, dynamic>{
      'mainTitle': instance.mainTitle,
      'subTitle': instance.subTitle,
      'levelPrefix': instance.levelPrefix,
      'levelSuffix': instance.levelSuffix,
    };
