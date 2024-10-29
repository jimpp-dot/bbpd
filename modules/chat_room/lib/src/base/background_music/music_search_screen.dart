import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:flutter/material.dart';

import 'model/music_model.dart';
import 'search/base_music_search_repo.dart';
import 'search/kugou_music_search_repo.dart';
import 'search/zego_music_search_repo.dart';
import 'widget/hot_search_tips.dart';
import 'widget/music_search_item.dart';
import 'widget/search_app_bar.dart';

/// 音乐搜索
///
class MusicSearchScreen extends StatefulWidget {
  final ChatRoomData room;
  final bool showUpload;
  final int searchType;

  const MusicSearchScreen(
      {super.key,
      required this.room,
      this.showUpload = true,
      this.searchType = 0});

  @override
  State<MusicSearchScreen> createState() => _State();
}

class _State extends State<MusicSearchScreen> {
  static int hotContentPerPage = 10; // 热搜支持换一换功能，从酷狗返回的数据只有30个左右，每次展示10个，进行循环

  bool _isSearching = false;

  final List<Music> _search = []; // 搜索数据
  final List<Music> _hotSearch = []; // 热搜数据

  int _hotSearchPageIndex = 0;
  int _hotPages = 0;

  late BaseMusicSearchRepo _musicRepo;

  @override
  void initState() {
    super.initState();
    if (widget.searchType == 1) {
      _musicRepo = ZegoMusicSearchRepo(widget.room.rid);
    } else {
      _musicRepo = KugouMusicSearchRepo();
    }

    _loadHotSearch();
  }

  _loadHotSearch() async {
    List<Music> result = await _musicRepo.loadHotSearch();
    if (result.isEmpty) return;
    _hotSearch.addAll(result);

    if (_hotSearch.length < hotContentPerPage) {
      hotContentPerPage = _hotSearch.length;
    }

    _hotPages = _hotSearch.length ~/ hotContentPerPage;
    refresh();
  }

  _searchAction(String word) async {
    if (word.isEmpty) {
      setState(() {
        _isSearching = false;
      });
      return;
    }
    Log.d("MusicSearchScreen, search $word");
    List<Music> result = await _musicRepo.searchMusic(word);
    _isSearching = true;
    _search.clear();
    _search.addAll(result);
    refresh();
  }

  // 热搜换一换
  _changeHotContent() {
    if (_hotPages <= 0 || _hotSearch.isEmpty) {
      return;
    }

    _hotSearchPageIndex++;
    if (_hotSearchPageIndex >= _hotPages) {
      _hotSearchPageIndex = 0;
    }

    refresh();
  }

  Widget _renderBody(BuildContext context) {
    // 展示搜索结果
    Log.d(
        'MusicSearchScreen, search result, size: ${_search.length}, hot search size: ${_hotSearch.length}');

    if ((_isSearching && _search.isEmpty) ||
        (!_isSearching && _hotSearch.isEmpty)) {
      // 对应的数据为空
      return const SizedBox.shrink();
    }

    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: _isSearching
          ? ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: _search.length,
              shrinkWrap: true,
              itemExtent: 56.0,
              itemBuilder: (BuildContext context, int index) {
                Music data = _search.elementAt(index);
                return MusicSearchItem(
                  key: Key('search_${data.key}'),
                  data: data,
                  room: widget.room,
                );
              },
            )
          : ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: hotContentPerPage,
              itemExtent: 56.0,
              itemBuilder: (BuildContext context, int index) {
                Music data = _hotSearch
                    .elementAt(hotContentPerPage * _hotSearchPageIndex + index);
                return MusicSearchItem(
                  key: Key('hot_${data.key}'),
                  data: data,
                  room: widget.room,
                );
              },
            ),
    );
  }

  Widget _renderUpload() {
    return SizedBox(
      width: Util.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(K.haven_search_music,
              style: TextStyle(color: R.color.secondTextColor, fontSize: 13)),
          GestureDetector(
            onTap: _uploadClick,
            child: Text(
              K.click_to_upload,
              style: TextStyle(color: R.color.mainBrandColor, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }

  _uploadClick() async {
    RoomNavUtil.openWifiScreen(context, room: widget.room);
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardDisplay = MediaQuery.of(context).viewInsets.bottom > 0.0;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: keyboardDisplay ? 0.0 : Util.iphoneXBottom,
          top: MediaQuery.of(context).padding.top,
          left: 16,
          right: 13,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchAppBar(onChanged: _searchAction),
            if (!_isSearching) HotSearchTips(onTap: _changeHotContent),
            Expanded(child: _renderBody(context)),
            if (widget.showUpload) _renderUpload()
          ],
        ),
      ),
    );
  }
}
