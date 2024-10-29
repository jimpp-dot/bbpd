import 'dart:collection';

import 'package:shared/shared.dart';
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:shared/util/log/widget/json_view_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

bool _monitoringLog = true;
//Info: -FeiLong- 增加 IM.chat
SocketType typeFromLogLevel(Level level) {
  // return level == Level.verbose ? SocketType.room : SocketType.im;
  switch (level) {
    case Level.verbose:
      return SocketType.room;
    case Level.info:
      return SocketType.im;
    case Level.debug:
      return SocketType.chat;
    default:
      return SocketType.im;
  }
}

//Info: -FeiLong- 增加 IM.chat
Level logLevelFromType(SocketType type) {
  switch (type) {
    case SocketType.room:
      return Level.verbose;
    case SocketType.im:
      return Level.info;
    case SocketType.chat:
      return Level.debug;
  }
  return Level.info;
}

class SocketLogConsole extends StatefulWidget {
  final bool showCloseButton;

  const SocketLogConsole({Key? key, this.showCloseButton = true})
      : super(key: key);

  @override
  _SocketLogConsoleState createState() => _SocketLogConsoleState();
}

class _SocketLogConsoleState extends State<SocketLogConsole> {
  final ListQueue<OutputEvent> _renderedBuffer = ListQueue();
  List<OutputEvent> _filteredBuffer = [];

  final _scrollController = ScrollController();
  final _filterController = TextEditingController();

  bool _scrollListenerEnabled = true;
  final ValueNotifier<bool> _scrollToBottom = ValueNotifier<bool>(true);
  final RoomLogType _logType = RoomLogType.receive;
  SocketType _socketType = SocketType.room;

  @override
  void initState() {
    super.initState();

    SocketLog.instance?.outputCallback = _onNewLog;
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
    for (var event in SocketLog.instance!.outputEventBuffer) {
      _renderedBuffer.add(_renderEvent(event));
    }
    _refreshFilter();
  }

  void _onNewLog(OutputEvent log) {
    if (!_monitoringLog) return;
    _renderedBuffer.add(_renderEvent(log));

    _refreshFilter();
  }

  void _refreshFilter() {
    final newFilteredBuffer = _renderedBuffer.where((it) {
      if (typeFromLogLevel(it.level) != _socketType) return false;

      if (_filterController.text.isNotEmpty) {
        final filterText = _filterController.text.toLowerCase();
        return it.lines.join().toLowerCase().contains(filterText);
      } else {
        return true;
      }
    }).toList();
    setState(() {
      _filteredBuffer = newFilteredBuffer;
    });

    if (_scrollToBottom.value) {
      Future.delayed(Duration.zero, _scrollToListBottom);
    }
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
              child: _buildLogContent(),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
          valueListenable: _scrollToBottom,
          builder: (context, bool value, child) {
            return AnimatedOpacity(
              opacity: value ? 0 : 1,
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

  Widget _buildLogContent() {
    return Container(
      color: const Color(0xfff5f6f7),
      child: ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        // reverse: true,
        padding: const EdgeInsetsDirectional.only(
            start: 4, end: 4, bottom: 0, top: 8),
        itemBuilder: (context, index) {
          final item = _filteredBuffer[index];

          return _LogItemWidget(
            text: item.lines.join(),
          );
        },
        itemCount: _filteredBuffer.length,
      ),
    );
  }

  Widget _buildTopBar() {
    return _LogBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Text(
            "Socket Log",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              _monitoringLog ? Icons.mood : Icons.mood_bad,
              color: _monitoringLog ? R.color.mainBrandColor : null,
            ),
            onPressed: () {
              _monitoringLog = !_monitoringLog;
              setState(() {});
            },
          ),
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

  Widget _buildBottomBar() {
    return _LogBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropdownButton<SocketType>(
            dropdownColor: R.color.mainBgColor,
            value: _socketType,
            items: const [
              DropdownMenuItem(
                value: SocketType.im,
                child: Text("im"),
              ),
              DropdownMenuItem(
                value: SocketType.room,
                child: Text("room"),
              ),
              DropdownMenuItem(
                value: SocketType.chat,
                child: Text("chat"),
              ),
            ],
            onChanged: (value) {
              _socketType = value!;
              _refreshFilter();
            },
          ),
          Expanded(
            child: TextField(
              style: const TextStyle(fontSize: 20),
              controller: _filterController,
              onChanged: (s) => _refreshFilter(),
              decoration: const InputDecoration(
                labelText: "Filter log output",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: Icon(
              Icons.cleaning_services,
              color: R.color.mainBrandColor,
            ),
            onPressed: () {
              _renderedBuffer.clear();
              _filteredBuffer.clear();
              SocketLog.instance?.clearAll();

              setState(() {});
            },
          )
        ],
      ),
    );
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

  OutputEvent _renderEvent(OutputEvent event) {
    return event;
  }

  @override
  void dispose() {
    SocketLog.instance?.outputCallback = null;
    _scrollController.dispose();
    super.dispose();
  }
}

class _LogItemWidget extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  const _LogItemWidget({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  State<_LogItemWidget> createState() => _LogItemWidgetState();
}

class _LogItemWidgetState extends State<_LogItemWidget> {
  bool _expaned = false;

  void _onCopySocketMsg() {
    if (widget.text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: widget.text));
      Fluttertoast.showToast(msg: 'copied room socket msg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        _monitoringLog = false;
        await showJsonView(
          json: widget.text,
        );
        _monitoringLog = true;
      },
      onTap: () => setState(() {
        _expaned = !_expaned;
      }),
      child: Card(
        color: Colors.white,
        child: Container(
            width: MediaQuery.of(context).size.width - 80,
            margin: const EdgeInsetsDirectional.only(
                start: 16, end: 16, top: 12, bottom: 12),
            child: Column(children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: _onCopySocketMsg,
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(start: 15),
                      decoration: const BoxDecoration(
                        color: Color(0xff666666),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: const Text('copy msg',
                          style: TextStyle(fontSize: 12)),
                    )),
              ),
              const SizedBox(
                height: 3.0,
              ),
              RichText(
                  maxLines: _expaned ? 999 : 5,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(children: <InlineSpan>[
                    TextSpan(
                        text: widget.text,
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xff333333),
                            height: 1.2)),
                  ]))
            ])),
      ),
    );
  }
}

class _LogBar extends StatelessWidget {
  final Widget child;

  const _LogBar({required this.child});

  @override
  Widget build(BuildContext context) {
    final dark = (Theme.of(context).brightness == Brightness.dark);
    return SizedBox(
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
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
            child: child,
          ),
        ),
      ),
    );
  }
}
