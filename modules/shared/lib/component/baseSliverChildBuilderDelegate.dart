import 'package:flutter/material.dart';

typedef OnPositionChanged = void Function(int firstIndex, int lastIndex);

class FixedExtentSliverChildBuilderDelegate extends SliverChildBuilderDelegate {
  OnPositionChanged? onPositionChanged;
  int cacheCount;
  int _lastFirstIndex = -1;
  int _lastLastIndex = -1;

  FixedExtentSliverChildBuilderDelegate(
    Widget Function(BuildContext, int) builder, {
    int? childCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    int semanticIndexOffset = 0,
    this.onPositionChanged,
    this.cacheCount = 0,
  }) : super(
          builder,
          childCount: childCount,
          semanticIndexOffset: semanticIndexOffset,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
        );

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    //避免没有新的item曝光时过多的重复回调
    if (_lastFirstIndex == firstIndex && _lastLastIndex == lastIndex) {
      return;
    }
    _lastFirstIndex = firstIndex;
    _lastLastIndex = lastIndex;

//    Log.d('firstIndex: $firstIndex, lastIndex: $lastIndex');
    if (onPositionChanged != null) {
      int realLastIndex =
          lastIndex - cacheCount > 0 ? lastIndex - cacheCount : 0;
      onPositionChanged!(firstIndex, realLastIndex);
    }
  }
}
