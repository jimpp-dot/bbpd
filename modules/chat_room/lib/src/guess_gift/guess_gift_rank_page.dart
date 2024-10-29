import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/guess_gift/model/guess_gift_repo.dart';
import 'package:chat_room/src/protobuf/generated/guess_gift.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

class GuessGiftRankPage extends StatefulWidget {
  const GuessGiftRankPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GuessGiftRankState();

  static Future show(BuildContext context) {
    return displayModalBottomSheet(
        context: context,
        disableTapDismissible: true,
        maxHeightRatio: 1.0,
        builder: (context) {
          return const GuessGiftRankPage();
        });
  }
}

class _GuessGiftRankState extends State<GuessGiftRankPage> {
  late _GuessGiftRankLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _GuessGiftRankLoadingSource(this);
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Util.height * 0.75,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        gradient: LinearGradient(
          begin: AlignmentDirectional.bottomCenter,
          end: AlignmentDirectional.topCenter,
          colors: [
            Color(0xFFEDC5FF),
            Color(0xFFBECFFF),
            Color(0xFF958FFE),
            Color(0xFFA194FF),
            Color(0xFFA771FA)
          ],
        ),
      ),
      alignment: AlignmentDirectional.topCenter,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    double selfBottom = 0;
    if ((_source.self?.rank ?? 0) != 0) {
      selfBottom = 68 - 6;
    }
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitle(),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF7855FF).withOpacity(0.4),
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  border: Border.all(color: const Color(0x33FFFFFF), width: 1),
                ),
                margin: EdgeInsetsDirectional.only(
                    start: 12, end: 12, top: 6, bottom: 6 + Util.iphoneXBottom),
                alignment: AlignmentDirectional.center,
                padding: EdgeInsetsDirectional.only(bottom: selfBottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildRowTipLine(),
                    Divider(
                        height: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 16,
                        endIndent: 16),
                    Expanded(
                      child: LoadingMoreList<GuessGiftRankItem>(
                        ListConfig<GuessGiftRankItem>(
                          itemBuilder: (context, item, index) {
                            return _buildRankItem(item);
                          },
                          lastChildLayoutType:
                              LastChildLayoutType.fullCrossAxisExtent,
                          sourceList: _source,
                          indicatorBuilder: _indicatorBuilder,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if ((_source.self?.rank ?? 0) != 0)
          PositionedDirectional(
              start: 0, end: 0, bottom: 0, child: _buildRankMy()),
      ],
    );
  }

  Widget _buildRankMy() {
    return Container(
      width: double.infinity,
      height: 68 + Util.iphoneXBottom,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: Color(0xFF9687F2),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -4), blurRadius: 4, color: Color(0x08202020))
        ],
      ),
      padding: EdgeInsetsDirectional.only(
          start: 12, end: 12, bottom: Util.iphoneXBottom),
      child: _buildRankItem(_source.self!),
    );
  }

  Widget _buildRankItem(GuessGiftRankItem item) {
    return Container(
      width: double.infinity,
      height: 68,
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRank(item.rank),
          _buildAvatars(item.user1.icon, item.user2.icon),
          const SizedBox(width: 8),
          _buildNames(item.user1.name, item.user2.name),
          const Spacer(),
          Text(Util.numberToWString(item.score.toInt()),
              style: const TextStyle(
                  color: Color(0xFFFFE5A3),
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 18),
        ],
      ),
    );
  }

  Widget _buildNames(String name1, String name2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 60),
          child: Text(
            name1,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Text('&',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 60),
          child: Text(
            name2,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatars(String icon1, String icon2) {
    return SizedBox(
      width: 74,
      height: 40,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          CommonAvatar(path: icon1, size: 40, shape: BoxShape.circle),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: CommonAvatar(path: icon2, size: 40, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }

  Widget _buildRank(int rank) {
    String rankStr = '';
    if (rank <= 0) {
      rankStr = '-';
    } else {
      rankStr = '$rank';
    }
    return Container(
      width: 50,
      alignment: AlignmentDirectional.center,
      child: (rank >= 1 && rank <= 3)
          ? R.img(
              "rank/rank_big_$rank.png",
              width: 30,
              height: 27,
              package: ComponentManager.MANAGER_RANK,
            )
          : Text(
              rankStr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
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
      return LoadingFooter(
        hasMore: false,
        loadMore: () => {},
        textColor: Colors.white.withOpacity(0.5),
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
        error: R.string("no_data"),
        fontColor: Colors.white.withOpacity(0.5),
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg,
          loadMore: _source.loadMore,
          textColor: Colors.white.withOpacity(0.5));
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore, loadMore: _source.loadMore);
    }
  }

  Widget _buildRowTipLine() {
    return Container(
      width: double.infinity,
      height: 44,
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 18),
          Text(
            K.room_pet_rank_index_1,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Text(
            K.room_guess_gift_rank_nickname,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Text(
            K.room_guess_gift_rank_tacit,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Text(
            K.room_rank_week,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          PositionedDirectional(
            top: 0,
            bottom: 0,
            start: 16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: R.img(
                    'ic_back_fq.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GuessGiftRankLoadingSource extends LoadingMoreBase<GuessGiftRankItem> {
  final State state;

  _GuessGiftRankLoadingSource(this.state);

  int _pageIndex = 1;
  bool _hasMore = true;
  String errorMsg = '';

  GuessGiftRankItem? self;

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _pageIndex = 1;
    clear();
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool loadSuccess = false;

    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;
    ApiGuessGiftRankResponse resp = await GuessGiftRepo.getGuessGiftRank(page);
    if (resp.success) {
      self = resp.data.my;
      state.refresh();
      if (resp.data.list.isNotEmpty) {
        addAll(resp.data.list);
        _hasMore = resp.data.more > 0;
        _pageIndex = page;
      } else {
        _hasMore = false;
      }
      loadSuccess = true;
    } else {
      errorMsg = resp.message;
      loadSuccess = false;
    }
    return loadSuccess;
  }
}
