import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rank/rank.dart';
import 'room_search_bar.dart';

/// 搜索页
class RoomSearchPage extends StatefulWidget {
  static const routeName = '/RoomSearch';

  const RoomSearchPage({super.key});

  static Future showRoomSearchPage(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const RoomSearchPage(),
      settings: const RouteSettings(name: RoomSearchPage.routeName),
    ));
  }

  @override
  _RoomSearchPageState createState() {
    return _RoomSearchPageState();
  }
}

class _RoomSearchPageState extends State<RoomSearchPage> {
  List listData = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: R.color.statusBarTheme == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Material(
        color: R.color.mainBgColor,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              RoomSearchBar(_onQueryChanged),
              if (isLoading) const SizedBox(height: 26),
              isLoading ? const Loading() : buildSearchResult(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchResult(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          RoomItemModel room = listData[index];
          RoomFrom from = const RoomFrom('room_search');
          return LiveItemWidget(
            item: room,
            roomFrom: from,
            refer: 'room_search',
            onItemClick: () {
              Tracker.instance.track(TrackEvent.recall_click, properties: {
                'index': index,
              });
            },
          );
        },
      ),
    );
  }

  Timer? _cancelTimer;

  void _onQueryChanged(String text) {
    setState(() {
      isLoading = true;
    });
    _cancelTimer?.cancel();
    _cancelTimer = Timer(
        Duration(milliseconds: text.isEmpty ? 0 : 800), () => _search(text));
  }

  void _search(String query) async {
    if (query.isEmpty) {
      setState(() {
        isLoading = false;
        listData = [];
      });
      return;
    }

    String url = '${System.domain}search/room';
    List results = [];
    XhrResponse response = await Xhr.postJson(url, {'k': query});
    if (response.error == null) {
      Map res = response.response as Map;

      if (res['success'] == true && res['data'] is List) {
        try {
          List list = res['data'];
          for (int i = 0; i < list.length; i++) {
            Map item = list[i];
            results.add(RoomItemModel.fromJson(item));
          }
        } catch (e) {
          Log.d(e);
        }
      }
    }
    setState(() {
      isLoading = false;
      listData = results;
    });
  }
}
