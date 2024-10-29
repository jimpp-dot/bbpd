import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

import '../../../assets.dart';
import '../../../chat_room.dart';
import '../../protobuf/generated/ranking_reception.pb.dart';

class ReceptionRankSubPage extends StatefulWidget {
  final int rankType;

  const ReceptionRankSubPage({super.key, required this.rankType});

  @override
  State<ReceptionRankSubPage> createState() => ReceptionRankSubPageState();
}

class ReceptionRankSubPageState extends State<ReceptionRankSubPage>
    with AutomaticKeepAliveClientMixin {
  late final ReceptionRankSource _repo;

  @override
  void initState() {
    super.initState();
    _repo = ReceptionRankSource(widget.rankType);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16),
      child: RefreshIndicatorFactory.of(
        onRefresh: _repo.refresh,
        child: LoadingMoreList(
          ListConfig<RankBestReceptionWeeklyData_Reception>(
            itemBuilder: (_, item, index) => _buildItem(item),
            sourceList: _repo,
            indicatorBuilder: _indicatorBuilder,
            itemExtent: 98,
          ),
        ),
      ),
    );
  }

  Widget _buildItem(RankBestReceptionWeeklyData_Reception item) {
    List<Widget> tags = item.tags
        .map((e) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 2),
            child: R.img(Util.getRemoteImgUrl(e), height: 22)))
        .toList();
    return Stack(children: [
      Column(
        children: [
          Container(
              height: 90,
              margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
              padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      colors: [Color(0xFFFFF9EB), Color(0xFFF4E3C5)])),
              child: Row(
                children: [
                  CommonAvatar(
                      path: item.icon,
                      shape: BoxShape.circle,
                      size: 74,
                      onTap: () {
                        IPersonalDataManager manager = ComponentManager.instance
                            .getManager(ComponentManager.MANAGER_PERSONALDATA);
                        manager.openImageScreen(context, item.uid);
                      }),
                  const SizedBox(width: 6),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  constraints: BoxConstraints(
                                      maxWidth: tags.isNotEmpty ? 80 : 120),
                                  child: Text(item.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: R.color.mainTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                              const SizedBox(width: 2),
                              R.img(Util.getRemoteLevelIcon(item.lvImg),
                                  height: 22),
                              const SizedBox(width: 2),
                              if (tags.isNotEmpty) ...tags,
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(item.sign,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: R.color.mainTextColor.withOpacity(0.5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal)),
                        ],
                      )),
                  const SizedBox(width: 2),
                  Text(Util.numberToWString(item.score),
                      style: const TextStyle(
                          color: Color(0xFFFF5F7D),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              )),
          const SizedBox(height: 8)
        ],
      ),
      PositionedDirectional(start: 16, child: _buildRank(item.rank)),
    ]);
  }

  Widget _buildRank(int rank) {
    String asset = "";
    switch (rank) {
      case 1:
        asset = RoomAssets.chat_room$reception_rank_1_webp;
        break;
      case 2:
        asset = RoomAssets.chat_room$reception_rank_2_webp;
        break;
      case 3:
        asset = RoomAssets.chat_room$reception_rank_3_webp;
        break;
      default:
        asset = RoomAssets.chat_room$reception_rank_other_webp;
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            R.img(asset, width: 28),
            Text("$rank",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: Util.numFontFamily,
                    package: ComponentManager.MANAGER_BASE_CORE))
          ],
        );
    }
    return R.img(asset, width: 28);
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    switch (status) {
      case IndicatorStatus.none:
        return LoadingFooter(
          hasMore: _repo.hasMore,
          loadMore: _repo.loadMore,
          textColor: Colors.white70,
        );
      case IndicatorStatus.loadingMoreBusying:
        return const LoadingFooter(
          hasMore: true,
          textColor: Colors.white70,
        );
      case IndicatorStatus.fullScreenBusying:
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      case IndicatorStatus.error:
        return LoadingFooter(
          errorMessage: _repo.errorMsg,
          loadMore: _repo.loadMore,
          textColor: Colors.white70,
        );
      case IndicatorStatus.fullScreenError:
        return Center(
          child: ErrorData(
            error: _repo.errorMsg,
            onTap: _repo.refresh,
            fontColor: Colors.white70,
          ),
        );
      case IndicatorStatus.noMoreLoad:
        return const LoadingFooter(
          hasMore: false,
          textColor: Colors.white70,
        );
      case IndicatorStatus.empty:
        return Center(
          child: EmptyWidget(
            onTap: _repo.refresh,
            textColor: Colors.white70,
            paddingBottom: 60,
          ),
        );
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class ReceptionRankSource
    extends LoadingMoreBase<RankBestReceptionWeeklyData_Reception> {
  final int rankType;
  bool _hasMore = true;
  String errorMsg = '';
  int page = 1;

  @override
  bool get hasMore => _hasMore;

  ReceptionRankSource(this.rankType);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    if (isLoading) return Future.value(false);
    _hasMore = true;
    page = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _hasMore = true;
    }
    RespRankBestReceptionWeekly res =
        await RoomApi.getReceptionRankData(page, rankType);
    if (res.success) {
      if (page == 1) {
        clear();
      }
      _hasMore = res.data.hasMore;
      page++;
      addAll(res.data.list);
    }
    return true;
  }
}
