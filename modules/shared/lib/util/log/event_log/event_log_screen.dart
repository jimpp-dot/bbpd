import 'package:shared/util/log/event_log/event_log_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared/shared.dart';

import 'event_log_screen_store.dart';

class EventLogScreen extends StatefulWidget {
  const EventLogScreen({super.key});

  @override
  State<EventLogScreen> createState() => _EventLogScreenState();
}

class _EventLogScreenState extends State<EventLogScreen> {
  late EventLogScreenStore _store;

  final _scrollController = ScrollController();
  final _inputFilterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _store = EventLogScreenStore()..initList();

    _inputFilterController.addListener(() {
      _store.filterBy = _inputFilterController.text;
    });

    _scrollController.addListener(() {
      final hasScrolledToBottom = _scrollController.offset >=
          _scrollController.position.maxScrollExtent;
      _store.setHasReachedEndOfList(hasScrolledToBottom);
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _store.onDispose();
    _scrollController.dispose();
    _inputFilterController.dispose();
    super.dispose();
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
        floatingActionButton: Observer(builder: (context) {
          return AnimatedOpacity(
            opacity: _store.hasReachedEndOfList ? 0.0 : 1.0,
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
          );
        }));
  }

  Widget _buildTopBar() {
    return _LogBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Text(
            "Event Tracking",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Observer(builder: (context) {
            final isMonitoring = _store.isMonitoring;
            return IconButton(
              icon: Icon(
                isMonitoring ? Icons.mood : Icons.mood_bad,
                color: isMonitoring ? Theme.of(context).primaryColor : null,
              ),
              onPressed: () => _store.toggleMonitoring(),
            );
          }),
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

  Widget _buildLogContent() {
    return Observer(builder: (context) {
      return Container(
        color: const Color(0xFFF5F6F7),
        child: Scrollbar(
          controller: _scrollController,
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsetsDirectional.only(
                start: 4, end: 4, bottom: 0, top: 8),
            itemBuilder: (context, index) {
              final log = _store.filteredEvents[index];
              return EventLogListItem(
                eventLog: log,
                onCopyButtonTapped: () {
                  Clipboard.setData(
                    ClipboardData(
                        text:
                            "Event Name: ${log.eventName}, Parameters: ${log.properties}"),
                  );
                  Fluttertoast.showToast(msg: 'Copied successfully');
                },
              );
            },
            itemCount: _store.filteredEvents.length,
          ),
        ),
      );
    });
  }

  void _scrollToBottom() async {
    if (!_scrollController.hasClients) {
      return;
    }
    await _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  Widget _buildBottomBar() {
    return _LogBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: TextField(
              style: const TextStyle(fontSize: 20),
              controller: _inputFilterController,
              decoration: const InputDecoration(
                labelText: "Filter by event name or parameter",
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
            onPressed: () => _store.clearList(),
          )
        ],
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
            child: child ?? Container(),
          ),
        ),
      ),
    );
  }
}
