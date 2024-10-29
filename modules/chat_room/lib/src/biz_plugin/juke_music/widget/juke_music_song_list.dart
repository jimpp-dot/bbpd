import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_repos.dart';
import 'package:chat_room/src/biz_plugin/juke_music/page/juke_music_list_page.dart';
import 'package:chat_room/src/protobuf/generated/juke_music.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

class JukeMusicSongListWidget extends StatefulWidget {
  final int rid;
  final String type;
  final State? parentState;

  const JukeMusicSongListWidget(
      {Key? key, required this.rid, required this.type, this.parentState})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => JukeMusicSongListState();
}

class JukeMusicSongListState extends State<JukeMusicSongListWidget>
    with AutomaticKeepAliveClientMixin {
  late _JukeSongListLoadingSource _source;

  JukeMusicOrderPageState? get parentState =>
      widget.parentState as JukeMusicOrderPageState;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _source = _JukeSongListLoadingSource(widget.rid, widget.type, parentState);
  }

  void loadData() {
    _source.refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget child = Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: LoadingMoreList<Song>(ListConfig<Song>(
        itemBuilder: (context, item, index) {
          return _buildSongItem(item);
        },
        lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
        sourceList: _source,
        indicatorBuilder: _indicatorBuilder,
      )),
    );
    return RefreshIndicatorFactory.of(
      child: child,
      onRefresh: () => _source.refresh(),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(
          hasMore: true, textColor: Colors.white.withOpacity(0.5));
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(
        hasMore: false,
        textColor: Colors.white.withOpacity(0.5),
        loadMore: () => {},
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _source.errorMsg,
        fontColor: Colors.white.withOpacity(0.5),
        onTap: () {
          _source.refresh();
        },
      );
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: K.juke_music_empty_text,
        fontColor: Colors.white.withOpacity(0.5),
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg,
          textColor: Colors.white.withOpacity(0.5),
          loadMore: _source.loadMore);
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore,
          textColor: Colors.white.withOpacity(0.5),
          loadMore: _source.loadMore);
    }
  }

  Widget _buildSongItem(Song item) {
    String orderCountStr = '';
    if (item.orderCount > 99) {
      orderCountStr = '99+';
    } else if (item.orderCount >= 50) {
      orderCountStr = '${item.orderCount}';
    }
    return InkWell(
      onTap: () {
        parentState?.addSongToShopping(item);
      },
      child: Container(
        width: double.infinity,
        height: 52,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 52,
              alignment: AlignmentDirectional.center,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  R.img(RoomAssets.chat_room$jukemusic_bg_num_png,
                      width: 15, height: 24),
                  Text(
                    '${item.index}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 200,
                        ),
                        child: Text(
                          item.songName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      if (orderCountStr.isNotEmpty) ...[
                        const SizedBox(width: 4),
                        Container(
                          height: 14,
                          padding: const EdgeInsets.all(1),
                          decoration: const ShapeDecoration(
                            shape: StadiumBorder(),
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF6EC3), Color(0xFFFFC3EC)],
                            ),
                          ),
                          child: Container(
                            height: 12,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            alignment: AlignmentDirectional.center,
                            decoration: const ShapeDecoration(
                              shape: StadiumBorder(),
                              gradient: LinearGradient(
                                colors: [Color(0xFFFB319B), Color(0xFFFF94D6)],
                              ),
                            ),
                            child: Text(
                              K.room_juke_order_count_tag([orderCountStr]),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 9),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  (item.flag == 1)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            R.img('ic_room_juke_random.webp',
                                width: 18,
                                height: 14,
                                package: ComponentManager.MANAGER_BASE_ROOM),
                            const SizedBox(width: 4),
                            Text(
                              K.room_juke_random_order_text,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.4),
                                  fontSize: 12),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              K.room_juke_singer,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.4),
                                  fontSize: 12),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item.singerName,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            _renderOrderBtn(item),
          ],
        ),
      ),
    );
  }

  Widget _renderOrderBtn(Song item) {
    bool selected = parentState?.inShopping(item) ?? false;
    return Container(
      width: 52,
      height: 52,
      alignment: AlignmentDirectional.center,
      child: selected
          ? _buildSelectedIcon()
          : R.img(RoomAssets.chat_room$jukemusic_ic_order_music_png,
              width: 24, height: 24),
    );
  }

  Widget _buildSelectedIcon() {
    return Container(
      width: 16,
      height: 16,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: Color(0xFFFF5FCF),
      ),
      alignment: AlignmentDirectional.center,
      child: R.img('nearby/ic_done.svg',
          width: 12,
          height: 12,
          color: Colors.white,
          package: ComponentManager.MANAGER_PERSONALDATA),
    );
  }
}

class _JukeSongListLoadingSource extends LoadingMoreBase<Song> {
  final int rid;
  final String type;
  final JukeMusicOrderPageState? state;

  int _pageIndex = 1;
  bool _hasMore = true;
  String errorMsg = '';

  _JukeSongListLoadingSource(this.rid, this.type, this.state);

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _pageIndex = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (isloadMoreAction) {
      _pageIndex++;
    }
    bool loadSuccess = false;

    int singerId = state?.curSingerUid ?? 0;
    String searchText = state?.searchText ?? '';
    if (type == 'search' && searchText.isEmpty) {
      return loadSuccess;
    } else if (type == 'search' && searchText.isNotEmpty) {
      Tracker.instance.track(TrackEvent.search_result_exposure, properties: {
        'search_terms': searchText,
        'singer_id': singerId,
      });
    }
    RespQuerySongs resp = await JukeMusicRepos.querySongList(
        rid: rid,
        type: type,
        singerId: singerId,
        searchText: searchText,
        page: _pageIndex);
    if (resp.success) {
      if (state != null) {
        (state as JukeMusicOrderPageState).updateSingerPrice(resp.data.config);
      }
      if (_pageIndex == 1) {
        clear();
      }
      if (Util.isCollectionEmpty(resp.data.songs)) {
        _hasMore = false;
      }
      addAll(resp.data.songs);
      loadSuccess = true;
    } else {
      errorMsg = resp.msg;
      loadSuccess = false;
    }
    return loadSuccess;
  }
}
