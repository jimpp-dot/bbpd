// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../../../shared.dart';
import '../../developer/guagua/pluggable.dart';

class AssetDataPlugin implements Pluggable {
  @override
  String get displayName => 'Asset Data';

  @override
  IconData get iconData => Icons.image_sharp;

  @override
  ImageProvider<Object>? get iconImageProvider => null;

  @override
  String get name => 'asset data';

  bool _active = false;

  AssetDataPlugin() {
    AssetDataLog.instance?.init();
  }

  @override
  void onTrigger() {
    DialogTransition.scaleShow(
            context: Constant.context!,
            barrierDismissible: true,
            duration: const Duration(milliseconds: 400),
            builder: (context) => const AssetDataConsole())
        .then((value) => _active = false);
  }
}

bool _monitoringLog = true;

class AssetDataConsole extends StatefulWidget {
  final bool showCloseButton;

  const AssetDataConsole({Key? key, this.showCloseButton = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AssetDataConsoleState();
}

class _AssetDataConsoleState extends State<AssetDataConsole> {
  final ListQueue<AssetDataInfo> _renderedBuffer = ListQueue();

  final _scrollController = ScrollController();
  final ValueNotifier<bool> _scrollToBottom = ValueNotifier<bool>(true);
  bool _scrollListenerEnabled = true;

  final ValueNotifier<bool> _monitoring = ValueNotifier<bool>(_monitoringLog);

  int totalImageSize = 0;

  @override
  void initState() {
    super.initState();
    AssetDataLog.instance?.outputCallback = _onNewLog;
    _scrollController.addListener(() {
      if (!_scrollListenerEnabled) return;
      final scrolledToBottom = _scrollController.offset >=
          _scrollController.position.maxScrollExtent;
      _scrollToBottom.value = scrolledToBottom;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _renderedBuffer.clear();
    for (var event in AssetDataLog.instance!.outputEventBuffer) {
      final data = AssetDataInfo.fromJson(jsonDecode(event.lines.first));
      _renderedBuffer.add(data);
    }
    _refresh();
  }

  void _onNewLog(OutputEvent log) {
    if (!_monitoringLog) return;
    final data = AssetDataInfo.fromJson(jsonDecode(log.lines.first));
    _renderedBuffer.add(data);

    _refresh();
  }

  _refresh() {
    setState(() {});
    if (_scrollToBottom.value) {
      Future.delayed(Duration.zero, _scrollToListBottom);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    AssetDataLog.instance?.outputCallback = null;
    super.dispose();
  }

  void _scrollToListBottom() async {
    _scrollListenerEnabled = false;

    _scrollToBottom.value = true;

    final scrollPosition = _scrollController.position;
    await _scrollController.animateTo(
      scrollPosition.maxScrollExtent,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );

    _scrollListenerEnabled = true;
  }

  _buildTopBar() {
    return _LogBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Text(
            "Asset Data Log",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          ValueListenableBuilder(
              valueListenable: _monitoring,
              builder: (context, value, child) {
                return IconButton(
                  icon: Icon(
                    value == true ? Icons.mood : Icons.mood_bad,
                    color: value == true ? R.color.mainBrandColor : null,
                  ),
                  onPressed: () {
                    _monitoringLog = !_monitoringLog;
                    _monitoring.value = _monitoringLog;
                  },
                );
              }),
          if (widget.showCloseButton)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }

  _buildContent() {
    return Container(
      color: const Color(0xfff5f6f7),
      child: ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        // reverse: true,
        padding: const EdgeInsetsDirectional.only(
            start: 4, end: 4, bottom: 0, top: 8),
        itemBuilder: (context, index) {
          final item = _renderedBuffer.elementAt(index);
          return GestureDetector(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: item.url ?? ''));
              Fluttertoast.showCenter(msg: 'copied');
            },
            child: Card(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  item.type == AssetDataType.animation
                      ? const SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.animation,
                            color: Colors.black,
                          ))
                      : CachedNetworkImage(
                          imageUrl: item.url, width: 40, height: 40),
                  const SizedBox(width: 10),
                  SizedBox(
                      height: 40,
                      child: Text(
                        Uri.parse(item.url ?? '').path,
                        maxLines: 10,
                        style:
                            const TextStyle(fontSize: 10, color: Colors.black),
                      ))
                ],
              ),
            ),
          );
        },
        itemCount: _renderedBuffer.length,
      ),
    );
  }

  _buildBottomBar() {
    return _LogBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Spacer(),
          IconButton(
            icon: Icon(
              Icons.cleaning_services,
              color: R.color.mainBrandColor,
            ),
            onPressed: () {
              _renderedBuffer.clear();
              totalImageSize = 0;
              AssetDataLog.instance?.clearAll();
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.mainBgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTopBar(),
            Expanded(
              child: _buildContent(),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
          valueListenable: _scrollToBottom,
          builder: (context, value, child) {
            return AnimatedOpacity(
              opacity: value == true ? 0 : 1,
              duration: const Duration(milliseconds: 150),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 60),
                child: FloatingActionButton(
                  mini: true,
                  clipBehavior: Clip.antiAlias,
                  onPressed: _scrollToListBottom,
                  child: const Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class _LogBar extends StatelessWidget {
  final Widget? child;

  const _LogBar({this.child});

  @override
  Widget build(BuildContext context) {
    final dark = (Theme.of(context).brightness == Brightness.dark);
    return SizedBox(
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          color: R.colors.mainBgColor,
          boxShadow: [
            if (!dark)
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 3,
              ),
          ],
        ),
        child: Material(
          color: R.colors.mainBgColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: child ?? Container(),
          ),
        ),
      ),
    );
  }
}
