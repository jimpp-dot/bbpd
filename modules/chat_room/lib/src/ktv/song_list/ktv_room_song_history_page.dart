import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../../k.dart';
import '../model/song_sheet_beans.dart';
import '../repo/ktv_repo.dart';
import '../utils/ktv_theme.dart';
import '../widget/ktv_song_item.dart';

/// KTV 历史已点
///
class KtvRoomSongHistoryPage extends StatefulWidget {
  final ChatRoomData room;
  final bool autoMic;

  const KtvRoomSongHistoryPage(
      {super.key, required this.room, this.autoMic = true});

  @override
  State<KtvRoomSongHistoryPage> createState() => _KtvRoomSongHistoryState();

  static Future show(BuildContext context, ChatRoomData room,
      {bool autoMic = true}) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      disableTapDismissible: true,
      builder: (context) {
        return KtvRoomSongHistoryPage(room: room, autoMic: autoMic);
      },
    );
  }
}

class _KtvRoomSongHistoryState extends State<KtvRoomSongHistoryPage> {
  late KtvSongHistoryRepository _repository;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _repository = KtvSongHistoryRepository(setErrorMsg, widget.room.rid);
  }

  setErrorMsg(String error) {
    _errorMessage = error;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Util.height * 0.84,
      decoration: BoxDecoration(
        color: KtvTheme.mainBgColor,
        borderRadius:
            const BorderRadiusDirectional.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: LoadingMoreList(
              ListConfig<Song>(
                itemBuilder: _itemBuilder,
                sourceList: _repository,
                indicatorBuilder: _indicatorBuilder,
                //isLastOne: false
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 64,
            height: 58,
            alignment: Alignment.center,
            child: R.img("room_ic_back.svg",
                package: ComponentManager.MANAGER_BASE_ROOM,
                color: KtvTheme.mainTextColor),
          ),
        ),
        Expanded(
          child: Text(
            K.room_ktv_room_history,
            style: TextStyle(
                fontSize: 18,
                color: KtvTheme.mainTextColor,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 64),
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, Song item, int index) {
    return SongItemWidget(
      key: ValueKey('ktv-song-history-${item.platform}-${item.id}'),
      room: widget.room,
      song: item,
      autoMic: widget.autoMic,
      type: RcmdTab.TYPE_ROOM_ORDERED,
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.color.thirdTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        fontColor: R.color.thirdTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

typedef ErrorCallback = Function(String error);

class KtvSongHistoryRepository extends LoadingMoreBase<Song> {
  ErrorCallback onError;
  int rid;
  int _page = 1;
  bool _hasMore = true;

  KtvSongHistoryRepository(this.onError, this.rid);

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _page = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    onError('');

    try {
      RcmdSongListRsp res = await KtvRepo.getRcmdSongList(
          rid, '${RcmdTab.TYPE_ROOM_ORDERED}', _page);

      if (res.success == false && Util.validStr(res.msg)) {
        onError(res.msg!);
      }

      if (Util.validList(res.songs) && _page == 1) {
        clear();
      }

      bool hasData = Util.validList(res.songs);

      if (hasData) {
        addAll(res.songs);
        _page++;
      }

      _hasMore = hasData;
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}
