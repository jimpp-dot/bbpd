import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_repos.dart';
import 'package:chat_room/src/biz_plugin/juke_music/page/juke_music_list_page.dart';
import 'package:chat_room/src/protobuf/generated/juke_music.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

class JukeMusicMyOrderSongListWidget extends StatefulWidget {
  final int rid;
  final State? parentState;

  const JukeMusicMyOrderSongListWidget(
      {Key? key, required this.rid, this.parentState})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => JukeMusicMyOrderSongListState();
}

class JukeMusicMyOrderSongListState
    extends State<JukeMusicMyOrderSongListWidget>
    with AutomaticKeepAliveClientMixin {
  late _JukeMyOrderSongListLoadingSource _source;

  JukeMusicOrderPageState? get parentState =>
      widget.parentState as JukeMusicOrderPageState;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _source = _JukeMyOrderSongListLoadingSource(widget.rid, parentState);
  }

  void loadData() {
    _source.refresh(true);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget child = Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: LoadingMoreList<OrderSong>(ListConfig<OrderSong>(
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

  Widget _buildSongItem(OrderSong item) {
    bool finish = item.state == 'finish'; // 已唱
    bool playing = item.state == 'playing'; // 正在唱
    return Container(
      width: double.infinity,
      height: 52,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
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
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
            ),
            child: Opacity(
              opacity: finish ? 0.5 : 1,
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
          ),
          if (playing) ...[
            const SizedBox(width: 10),
            R.img('juke_music_playing.webp',
                width: 21,
                height: 21,
                package: ComponentManager.MANAGER_BASE_ROOM),
          ],
          const Spacer(),
          const SizedBox(width: 10),
          _renderOrderPrice(item),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _renderOrderPrice(OrderSong item) {
    bool finish = item.state == 'finish'; // 已唱

    int price = item.giftPrice * item.giftCount;
    if (price == 0) {
      return Opacity(
        opacity: finish ? 0.5 : 1,
        child: GradientBorder(
          borderGradient: const LinearGradient(
            colors: [Color(0xFFFF6EC3), Color(0xFFFFC3EC)],
          ),
          borderRadius: 9,
          borderWidth: 1,
          child: Container(
            width: 36,
            height: 16,
            margin: const EdgeInsets.all(1),
            alignment: AlignmentDirectional.center,
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              gradient: LinearGradient(
                colors: [Color(0xFFFD3795), Color(0xFFFF95D9)],
              ),
            ),
            child: Text(
              K.free,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    }
    return Opacity(
      opacity: finish ? 0.5 : 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$price',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(width: 4),
          R.img(MoneyConfig.moneyIcon, width: 16, height: 16),
        ],
      ),
    );
  }
}

class _JukeMyOrderSongListLoadingSource extends LoadingMoreBase<OrderSong> {
  final int rid;
  final JukeMusicOrderPageState? state;

  int _pageIndex = 1;
  bool _hasMore = true;
  String errorMsg = '';

  _JukeMyOrderSongListLoadingSource(this.rid, this.state);

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
    RespMyOrderSongs resp = await JukeMusicRepos.queryMyOrderSongList(
        rid: rid, singerId: singerId, page: _pageIndex);
    if (resp.success) {
      if (_pageIndex == 1) {
        clear();
      }
      if (Util.isCollectionEmpty(resp.songs)) {
        _hasMore = false;
      }
      addAll(resp.songs);
      loadSuccess = true;
    } else {
      errorMsg = resp.msg;
      loadSuccess = false;
    }
    return loadSuccess;
  }
}
