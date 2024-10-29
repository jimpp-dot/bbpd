import 'package:flutter/material.dart';

typedef ItemBuilder = Widget Function(BuildContext context);

/// 局部刷新控件
class PartialRefreshWidget extends StatefulWidget {
  final String id;
  final ItemBuilder itemBuilder;

  const PartialRefreshWidget(
      {super.key, required this.id, required this.itemBuilder});

  @override
  State<PartialRefreshWidget> createState() => _PartialRefreshWidgetState();
}

class _PartialRefreshWidgetState extends State<PartialRefreshWidget> {
  @override
  void initState() {
    super.initState();
    PartialRefreshManager._addListener(widget.id, _onRefresh);
  }

  void _onRefresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    PartialRefreshManager._removeList(widget.id, _onRefresh);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.itemBuilder.call(context);
  }
}

class PartialRefreshManager {
  static final Map<String, List<VoidCallback>> cache = {};

  static void _addListener(String id, VoidCallback callback) {
    List<VoidCallback> list = cache[id] ?? [];
    list.add(callback);
    cache[id] = list;
  }

  static void _removeList(String id, VoidCallback callback) {
    List<VoidCallback>? list = cache[id];
    if (list == null) return;
    list.remove(callback);
    if (list.isEmpty) cache.remove(id);
  }

  static void update(String id) {
    List<VoidCallback>? list = cache[id];
    if (list == null) return;
    for (VoidCallback item in list) {
      item.call();
    }
  }

  static void updates(List<String> ids) {
    for (String id in ids) {
      update(id);
    }
  }
}
