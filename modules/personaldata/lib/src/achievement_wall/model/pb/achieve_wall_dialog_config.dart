/*
 *
 *  Created by yao.qi on 2022/7/4 下午6:02
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/7/4 下午6:02
 *
 */

import 'package:json_annotation/json_annotation.dart';

part 'achieve_wall_dialog_config.g.dart';

@JsonSerializable(explicitToJson: true)
class AchieveWallDialogConfig {
  String mainTitle;
  String subTitle;
  String levelPrefix;
  List<String> levelSuffix;

  AchieveWallDialogConfig({
    this.mainTitle = '',
    this.subTitle = '',
    required this.levelPrefix,
    required this.levelSuffix,
  });

  factory AchieveWallDialogConfig.fromJson(Map<String, dynamic> json) =>
      _$AchieveWallDialogConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AchieveWallDialogConfigToJson(this);
}
