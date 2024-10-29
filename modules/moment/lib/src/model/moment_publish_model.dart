import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/page/group_select_screen.dart';
import 'package:moment/src/widget/drag_sort_view.dart';

/// 页面状态
enum PageStatus {
  None,
  TextOnly,
  Image,
  Video,
  Audio,
}

/// 发布动态页面数据模型
class PublishMomentModel {
  PageStatus? status; // 页面状态

  List<DragImageBean> selectImageFiles = [];
  String? audioLocalFile;
  int audioDuration = 0;
  File? videoFile;
  String? videoImagePath;

  String? selectLocation; // 选中位置
  String? latitude;
  String? longitude;
  String? tagType;
  List<String>? selectTags;
  List<String>? unDeleteTags;
  bool canAddTags = false;
  CaseTag? caseTag;
  AppraiserTag? appraiserTag;
  int? musicId;
  Map<String, String>? musicVideoParams;

  ValueNotifier<SelectGame?> selectPlayTags = ValueNotifier(null);

  int get selectImageNum {
    return selectImageFiles.length;
  }

  GroupItem selectGroup = groupItems.firstWhere((element) {
    return element.id == Config.get('moment.group.selected.id');
  }, orElse: () => groupItems[0]); // 分组

  ValueNotifier<bool> isRecording = ValueNotifier(false); // 录音状态

  PublishMomentModel({this.status = PageStatus.None});

  bool isLocationSelect() {
    return selectLocation != null && selectLocation!.isNotEmpty;
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final PublishMomentModel data;

  const _InheritedStateContainer({required this.data, required super.child});

  @override
  bool updateShouldNotify(_InheritedStateContainer oldWidget) =>
      data != oldWidget.data;
}

class MomentPublishStateContainer extends StatefulWidget {
  final PublishMomentModel state;

  final Widget child;

  const MomentPublishStateContainer(
      {super.key, required this.state, required this.child});

  static PublishMomentModel? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>())
        ?.data;
  }

  @override
  _MomentPublishStateContainerState createState() =>
      _MomentPublishStateContainerState();
}

class _MomentPublishStateContainerState
    extends State<MomentPublishStateContainer> {
  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: widget.state,
      child: widget.child,
    );
  }
}

class DragImageBean extends DragBean {
  DragImageBean({
    this.originPath,
    this.middlePath,
    this.thumbPath,
    this.originalWidth,
    this.originalHeight,
    this.file,
  });

  /// origin picture file path.
  String? originPath;

  /// middle picture file path.
  String? middlePath;

  /// thumb picture file path.
  /// It is recommended to use a thumbnail picture，because the original picture is too large,
  /// it may cause repeated loading and cause flashing.
  String? thumbPath;

  /// original image width.
  int? originalWidth;

  /// original image height.
  int? originalHeight;

  File? file;
}
