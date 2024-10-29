import 'package:flutter/material.dart';
import 'package:photo/src/delegate/badge_delegate.dart';
import 'package:photo/src/delegate/checkbox_builder_delegate.dart';
import 'package:photo/src/delegate/loading_delegate.dart';
import 'package:photo/src/delegate/sort_delegate.dart';

class Options {
  final int rowCount;

  final int maxSelected;

  final double padding;

  final double itemRadio;

  final Color themeColor;

  final Color dividerColor;

  final Color textColor;

  final Color disableColor;

  final int thumbSize;

  final SortDelegate sortDelegate;

  final CheckBoxBuilderDelegate checkBoxBuilderDelegate;

  final LoadingDelegate loadingDelegate;

  final BadgeDelegate badgeDelegate;

  final PickType pickType;

  final SelectIntercept? selectInterceptor;

  const Options(
      {required this.rowCount,
      required this.maxSelected,
      required this.padding,
      required this.itemRadio,
      required this.themeColor,
      required this.dividerColor,
      required this.textColor,
      required this.disableColor,
      required this.thumbSize,
      required this.sortDelegate,
      required this.checkBoxBuilderDelegate,
      required this.loadingDelegate,
      required this.badgeDelegate,
      required this.pickType,
      this.selectInterceptor});
}

enum PickType {
  all,
  onlyImage,
  onlyVideo,
}

///这里根据文件名和后缀名 过滤相关的文件
typedef SelectIntercept = bool Function(String fileName);
