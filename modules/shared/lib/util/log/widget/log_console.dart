import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

import 'package:logger/logger.dart';

import '../ansi_parser.dart';
import '../log_output.dart';

int _bufferSize = 50;
double _logFontSize = 12;
bool _monitoringLog = true;

class LogConsole extends StatefulWidget {
  final bool showCloseButton;

  const LogConsole({super.key, this.showCloseButton = true});

  @override
  _LogConsoleState createState() => _LogConsoleState();
}

class RenderedEvent {
  final int id;
  final Level level;
  final TextSpan span;
  final String lowerCaseText;

  RenderedEvent(this.id, this.level, this.span, this.lowerCaseText);
}

class _LogConsoleState extends State<LogConsole> {
  final ListQueue<RenderedEvent> _renderedBuffer = ListQueue();
  List<RenderedEvent> _filteredBuffer = [];

  final _scrollController = ScrollController();
  final _filterController = TextEditingController();

  Level? _filterLevel = Level.error;

  var _currentId = 0;
  bool _scrollListenerEnabled = true;
  bool _followBottom = true;

  @override
  void initState() {
    super.initState();

    callback(e) {
      if (_renderedBuffer.length == _bufferSize) {
        _renderedBuffer.removeFirst();
      }

      _renderedBuffer.add(_renderEvent(e));
      _refreshFilter();
    }

    LogOutputHelper.outputCallback = callback;

    _scrollController.addListener(() {
      if (!_scrollListenerEnabled) return;
      final scrolledToBottom = _scrollController.offset >=
          _scrollController.position.maxScrollExtent;
      setState(() {
        _followBottom = scrolledToBottom;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _renderedBuffer.clear();
    for (var event in LogOutputHelper.outputEventBuffer) {
      _renderedBuffer.add(_renderEvent(event));
    }
    _refreshFilter();
  }

  void _refreshFilter() {
    final newFilteredBuffer = _renderedBuffer.where((it) {
      final logLevelMatches = it.level.index >= _filterLevel!.index;
      if (!logLevelMatches) {
        return false;
      } else if (_filterController.text.isNotEmpty) {
        final filterText = _filterController.text.toLowerCase();
        return it.lowerCaseText.contains(filterText);
      } else {
        return true;
      }
    }).toList();
    setState(() {
      _filteredBuffer = newFilteredBuffer;
    });

    if (_followBottom) {
      Future.delayed(Duration.zero, _scrollToBottom);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: AnimatedOpacity(
        opacity: _followBottom ? 0 : 1,
        duration: const Duration(milliseconds: 150),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 60),
          child: FloatingActionButton(
            mini: true,
            clipBehavior: Clip.antiAlias,
            onPressed: _scrollToBottom,
            child: const Icon(
              Icons.arrow_downward,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogContent() {
    return Container(
      color: Colors.grey[150],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 1600,
          child: ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            itemBuilder: (context, index) {
              final logEntry = _filteredBuffer[index];
              return Text.rich(
                logEntry.span,
                key: Key(logEntry.id.toString()),
                style: TextStyle(fontSize: _logFontSize),
              );
            },
            itemCount: _filteredBuffer.length,
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return LogBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Text(
            "Log Console",
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
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                _logFontSize++;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                _logFontSize--;
              });
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
    return LogBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DropdownButton(
            value: _filterLevel,
            items: const [
              DropdownMenuItem(
                value: Level.verbose,
                child: Text("verbose"),
              ),
              DropdownMenuItem(
                value: Level.debug,
                child: Text("debug"),
              ),
              DropdownMenuItem(
                value: Level.info,
                child: Text("info"),
              ),
              DropdownMenuItem(
                value: Level.warning,
                child: Text("warning"),
              ),
              DropdownMenuItem(
                value: Level.error,
                child: Text("error"),
              ),
            ],
            onChanged: (dynamic value) {
              _filterLevel = value;
              LogOutputHelper.filterLevel = value;
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
          IconButton(
            icon: Icon(
              Icons.cleaning_services,
              color: R.color.mainBrandColor,
            ),
            onPressed: () {
              _renderedBuffer.clear();
              _filteredBuffer.clear();

              setState(() {});
            },
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.share,
          //     color: R.color.mainBrandColor,
          //   ),
          //   onPressed: () async {
          //     String filePath = await Log.getFileLogPath();
          //     if (Util.isStringEmpty(filePath)) {
          //       Fluttertoast.showCenter(msg: 'LogFile not exists');
          //       return;
          //     }
          //     // ignore: undefined_identifier
          //     FlutterShare.shareFile(
          //       title: 'pt log',
          //       text: 'share pt log',
          //       filePath: filePath,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  void _scrollToBottom() async {
    _scrollListenerEnabled = false;

    setState(() {
      _followBottom = true;
    });

    final scrollPosition = _scrollController.position;
    await _scrollController.animateTo(
      scrollPosition.maxScrollExtent,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );

    _scrollListenerEnabled = true;
  }

  RenderedEvent _renderEvent(OutputEvent event) {
    final parser = AnsiParser(false);
    final text = event.lines.join('\n');
    parser.parse(text);
    return RenderedEvent(
      _currentId++,
      event.level,
      TextSpan(children: parser.spans),
      text.toLowerCase(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();

    LogOutputHelper.outputCallback = null;
  }
}

class LogBar extends StatelessWidget {
  final Widget? child;

  const LogBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            if (!dark)
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 3,
              ),
          ],
        ),
        child: Material(
          color: dark ? Colors.blueGrey[900] : Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: child,
          ),
        ),
      ),
    );
  }
}
