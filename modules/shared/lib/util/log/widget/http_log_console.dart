import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as date;

import '../http_log.dart';
import 'json_view_popup.dart';
import 'tapable_text_span.dart';

bool _monitoringLog = true;

class HttpLogConsole extends StatefulWidget {
  final bool showCloseButton;

  const HttpLogConsole({super.key, this.showCloseButton = true});

  @override
  _HttpLogConsoleState createState() => _HttpLogConsoleState();
}

class _HttpLogConsoleState extends State<HttpLogConsole> {
  final ListQueue<HttpLog> _renderedBuffer = ListQueue();
  List<HttpLog> _filteredBuffer = [];
  HttpLog? _lastItem;

  final _scrollController = ScrollController();
  final _filterController = TextEditingController();

  bool _scrollListenerEnabled = true;
  final ValueNotifier<bool> _scrollToBottom = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _monitoring = ValueNotifier<bool>(_monitoringLog);

  int _statuscode = 0;

  @override
  void initState() {
    super.initState();

    HttpLog.outputCallback = _onNewLog;
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
    for (var event in HttpLog.logs.value) {
      _renderedBuffer.add(_renderEvent(event));
    }
    _refreshFilter();
  }

  void _onNewLog(HttpLog log) {
    if (!_monitoringLog) return;
    _renderedBuffer.add(_renderEvent(log));

    _refreshFilter();
  }

  void _refreshFilter() {
    final newFilteredBuffer = _renderedBuffer.where((it) {
      final statuscodeMatches = Util.parseInt(it.statusCode) >= _statuscode;
      if (!statuscodeMatches) {
        return false;
      }
      if (_filterController.text.isNotEmpty) {
        final filterText = _filterController.text.toLowerCase();
        return it.url?.toLowerCase().contains(filterText) ?? false;
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
      backgroundColor: Colors.white,
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
          builder: (context, dynamic value, child) {
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
            item: item,
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
            "Http Log",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          ValueListenableBuilder(
              valueListenable: _monitoring,
              builder: (context, dynamic value, child) {
                return IconButton(
                  icon: Icon(
                    value ? Icons.mood : Icons.mood_bad,
                    color: value ? R.color.mainBrandColor : null,
                  ),
                  onPressed: () {
                    _monitoringLog = !_monitoringLog;
                    _monitoring.value = _monitoringLog;
                  },
                );
              }),
          if (widget.showCloseButton)
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
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
          DropdownButton(
            value: _statuscode,
            items: const [
              DropdownMenuItem(
                value: 0,
                child: Text("all", style: TextStyle(color: Colors.black)),
              ),
              DropdownMenuItem(
                value: 200,
                child: Text(
                  "200",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              DropdownMenuItem(
                value: 201,
                child: Text(">200", style: TextStyle(color: Colors.black)),
              ),
              DropdownMenuItem(
                value: 400,
                child: Text("400", style: TextStyle(color: Colors.black)),
              ),
              DropdownMenuItem(
                value: 500,
                child: Text("500", style: TextStyle(color: Colors.black)),
              ),
            ],
            onChanged: (dynamic value) {
              _statuscode = value;
              _refreshFilter();
            },
          ),
          Expanded(
            child: TextField(
              style: const TextStyle(fontSize: 20, color: Colors.black),
              controller: _filterController,
              onChanged: (s) => _refreshFilter(),
              decoration: const InputDecoration(
                hintText: "Filter log output",
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
              HttpLog.clearAll();

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

  HttpLog _renderEvent(HttpLog event) {
    return event;
    // var parser = AnsiParser(false);
    // var text = event.lines.join('\n');
    // parser.parse(text);
    // return RenderedEvent(
    //   _currentId++,
    //   event.level,
    //   TextSpan(children: parser.spans),
    //   text.toLowerCase(),
    // );
  }

  @override
  void dispose() {
    HttpLog.outputCallback = null;
    _scrollController.dispose();
    super.dispose();
  }
}

class _LogItemWidget extends StatefulWidget {
  final HttpLog? item;
  final String highlightText;
  const _LogItemWidget({Key? key, this.item, this.highlightText = ''})
      : super(key: key);

  @override
  State<_LogItemWidget> createState() => _LogItemWidgetState();
}

class _LogItemWidgetState extends State<_LogItemWidget> {
  bool _fold = true;
  bool _metaFold = true;

  void _onCopyCurl() {
    if (widget.item!.curlString?.isNotEmpty ?? false) {
      Clipboard.setData(ClipboardData(text: widget.item!.curlString!));
      Fluttertoast.showToast(msg: 'copied curl');
    }
  }

  @override
  Widget build(BuildContext context) {
    int statusCode = Util.parseInt(widget.item!.statusCode);
    return GestureDetector(
      onDoubleTap: () {
        if (widget.item!.responseBody != null) {
          Clipboard.setData(ClipboardData(text: widget.item!.responseBody!));
          Fluttertoast.showToast(msg: 'copy successfully');
        }
      },
      onTap: () {
        setState(() {
          _fold = !_fold;
        });
      },
      child: Card(
        color: (statusCode == 200) ? Colors.white : Colors.amberAccent[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width - 80,
                margin: const EdgeInsetsDirectional.only(
                    start: 16, end: 16, top: 12, bottom: 12),
                child: RichText(
                  maxLines: _fold ? 7 : 9999,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                          text:
                              '[${date.DateFormat('MM-dd HH:mm:ss').format(widget.item!.time!)}]',
                          style: const TextStyle(
                              fontSize: 9,
                              color: Color(0xff333333),
                              height: 1.2)),
                      WidgetSpan(
                          child: Container(
                              height: 11,
                              margin:
                                  const EdgeInsetsDirectional.only(start: 4),
                              padding: const EdgeInsetsDirectional.only(
                                  start: 6, end: 6),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2)),
                                  color: (statusCode == 200)
                                      ? const Color(0xff337cc4)
                                      : const Color(0xffd0607e)),
                              child: Text(widget.item!.statusCode ?? '',
                                  style: const TextStyle(
                                      fontSize: 8,
                                      color: Color(0xffffffff),
                                      height: 1.2)))),
                      TextSpan(
                          text: '  ${widget.item!.reqMethod}'
                              '  Cost:${widget.item!.duration}ms ',
                          style: TextStyle(
                            fontSize: 9,
                            color: widget.item!.duration! >= 1000
                                ? Colors.red
                                : const Color(0xff666666),
                            height: 1.5,
                          )),
                      WidgetSpan(
                          child: GestureDetector(
                        onTap: _onCopyCurl,
                        child: Container(
                          // margin: const EdgeInsetsDirectional.only(start: 15),
                          decoration: BoxDecoration(
                            color: (Theme.of(context).brightness ==
                                    Brightness.dark)
                                ? Colors.black
                                : Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: const Text('copy curl',
                              style: TextStyle(fontSize: 12)),
                        ),
                      )),
                      const TextSpan(
                          text: '\nUri: ',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff333333),
                              height: 1.5,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: widget.item!.url ?? '',
                          style: const TextStyle(
                              fontSize: 10,
                              height: 1.5,
                              color: Color(0xff666666))),
                      const TextSpan(
                          text: '\nResponse: ',
                          style: TextStyle(
                              fontSize: 10,
                              height: 1.5,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.bold)),
                      TapableTextSpan(
                          text: widget.item!.responseBody!,
                          onLongPress: () async {
                            _monitoringLog = false;
                            await showJsonView(
                                json: widget.item!.responseBody!,
                                title: widget.item!.url);
                            _monitoringLog = true;
                          },
                          style: const TextStyle(
                              fontSize: 10,
                              height: 1.5,
                              color: Color(0xff666666))),
                      const TextSpan(
                          text: '\nParameters: ',
                          style: TextStyle(
                              fontSize: 10,
                              height: 1.5,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: widget.item!.requestBody,
                          style: const TextStyle(
                              fontSize: 10,
                              height: 1.5,
                              color: Color(0xff666666))),
                      const TextSpan(
                          text: '\nFlags: ',
                          style: TextStyle(
                              fontSize: 10,
                              height: 1.5,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: widget.item!.flagData.toString(),
                          style: const TextStyle(
                              fontSize: 10,
                              height: 1.5,
                              color: Color(0xff666666))),
                      if (!_fold)
                        WidgetSpan(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _metaFold = !_metaFold;
                            });
                          },
                          child: RichText(
                            maxLines: _metaFold ? 5 : 999,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: 'ResponseHeader: ',
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 10,
                                      color: Color(0xff333333),
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: widget.item!.responseHeader,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      height: 1.5,
                                      color: Color(0xff666666))),
                              const TextSpan(
                                  text: '\nRequestHeader: ',
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 10,
                                      color: Color(0xff333333),
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: widget.item!.requestHeader,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      height: 1.5,
                                      color: Color(0xff666666))),
                            ]),
                          ),
                        ))
                    ],
                  ),
                )),
            Icon(
                _fold ? Icons.expand_more_outlined : Icons.expand_less_outlined)
          ],
        ),
      ),
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
          color: const Color(0xfff5f6f7),
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
