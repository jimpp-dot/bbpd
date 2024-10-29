import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../protobuf/generated/common_room_heartrace.pb.dart';
import '../model/heart_race_repo.dart';

/// 心跳竞速：排行榜
class HeartRaceRankPage extends StatefulWidget {
  const HeartRaceRankPage({super.key});

  @override
  HeartRaceRankState createState() {
    return HeartRaceRankState();
  }

  static void show({BuildContext? context}) {
    BuildContext ctx = context ?? System.context;
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (context) => const HeartRaceRankPage(),
      settings: const RouteSettings(name: '/HeartRaceRankPage'),
    ));
  }
}

class HeartRaceRankState extends State<HeartRaceRankPage> {
  late HeartRaceRankRepository _repository;
  bool showScore = true;

  @override
  void initState() {
    super.initState();
    showScore = showRankScoreByKey(heartRaceRankKey);
    _repository = HeartRaceRankRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PositionedDirectional(
            start: 0,
            end: 0,
            top: 0,
            bottom: 0,
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(
                  'static/room/heart_race/heart_race_rank_bg.webp'),
              width: Util.width,
              height: Util.height,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: Util.width,
            height: Util.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: CachedNetworkImage(
                        imageUrl: Util.getRemoteImgUrl(
                            'static/room/heart_race/heart_race_rank_back.webp'),
                        width: 44,
                        height: 24,
                      ),
                    ),
                    const Spacer(),
                    CachedNetworkImage(
                      imageUrl: Util.getRemoteImgUrl(
                          'static/room/heart_race/heart_race_rank_title.webp'),
                      width: 171,
                      height: 21,
                    ),
                    SizedBox(
                      width: (Util.width - 171) / 2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 23,
                ),
                Text(
                  K.room_heart_race_rank_tips,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFD3A6FF),
                    height: 1.2,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Expanded(
                  child: RefreshIndicatorFactory.of(
                    onRefresh: () async {
                      _repository.refresh();
                    },
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(),
                        LoadingMoreSliverList(
                          SliverListConfig<HeartRaceRank>(
                            padding: EdgeInsetsDirectional.only(
                                bottom:
                                    Util.isIphoneX ? Util.iphoneXBottom : 20),
                            itemBuilder: _itemBuilder,
                            sourceList: _repository,
                            indicatorBuilder: _indicatorBuilder,
                            //isLastOne: false
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, HeartRaceRank item, int index) {
    String bg;
    if (item.level < 1 || item.level > 3) {
      bg = 'static/room/heart_race/heart_race_rank_new_3.webp';
    } else {
      bg = 'static/room/heart_race/heart_race_rank_new_${item.level}.webp';
    }
    return Container(
      width: Util.width - (8 * Util.ratio),
      height: 180 * Util.ratio,
      margin: EdgeInsetsDirectional.only(
          start: 4 * Util.ratio, end: 4 * Util.ratio),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(Util.getRemoteImgUrl(bg)),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 60 * Util.ratio,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildIconName(
                uid: item.leftUid,
                name: item.leftName,
                icon: item.leftIcon,
                sex: item.leftSex,
              ),
              SizedBox(
                width: 7 * Util.ratio,
              ),
              buildScore(item.totalPackage),
              SizedBox(
                width: 7 * Util.ratio,
              ),
              buildIconName(
                uid: item.rightUid,
                name: item.rightName,
                icon: item.rightIcon,
                sex: item.rightSex,
              ),
            ],
          ),
          SizedBox(
            height: 5 * Util.ratio,
          ),
          Text(
            item.time,
            style: TextStyle(
              fontSize: 10 * Util.ratio,
              color: const Color(0xFFD3A6FF),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildScore(int score) {
    String package;
    if (score < 10000) {
      package = '$score';
    } else {
      package = '${(score ~/ 10000).toStringAsFixed(1)}w';
    }
    if (showScore) {
      return Container(
        width: 72 * Util.ratio,
        height: 21 * Util.ratio,
        margin: EdgeInsetsDirectional.only(
            top: 20 * Util.ratio, bottom: 37 * Util.ratio),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(Util.getRemoteImgUrl(
                'static/room/heart_race/heart_race_rank_score_bg.webp')),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 4 * Util.ratio,
            ),
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(
                  'static/room/heart_race/heart_race_rank_love.webp'),
              width: 19 * Util.ratio,
              height: 18 * Util.ratio,
            ),
            Expanded(
              child: Text(
                package,
                style: TextStyle(
                  fontSize: 9 * Util.ratio,
                  color: Colors.white,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 10 * Util.ratio,
            ),
          ],
        ),
      );
    }

    return SizedBox(
      width: 72 * Util.ratio,
    );
  }

  Widget buildIconName(
      {required int uid,
      required String name,
      required String icon,
      required int sex}) {
    String frame = sex == 2
        ? 'static/room/heart_race/heart_rate_frame_female.webp'
        : 'static/room/heart_race/heart_rate_frame_male.webp';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            IPersonalDataManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            manager.openImageScreen(context, uid);
          },
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CommonAvatar(
                path: icon,
                size: 50 * Util.ratio,
                shape: BoxShape.circle,
              ),
              CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(frame),
                width: 60 * Util.ratio,
                height: 60 * Util.ratio,
              ),
            ],
          ),
        ),
        Container(
          width: 60 * Util.ratio,
          alignment: AlignmentDirectional.center,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 12 * Util.ratio,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(
        hasMore: true,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(
        hasMore: false,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
          error: R.string('data_error'),
          onTap: () {
            _repository.refresh();
          },
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: R.string('data_error'), loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        child: ErrorData(
          error: R.string('no_data'),
          onTap: () {
            _repository.refresh();
          },
        ),
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class HeartRaceRankRepository extends LoadingMoreBase<HeartRaceRank> {
  int _page = 1;
  bool _hasMore = true;

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
    try {
      ResHeartRaceRank res = await HeartRaceRepo.getRank(_page);
      if (!showRankListByKey(heartRaceRankKey)) {
        res.rank.clear();
      }
      if (Util.validList(res.rank) && _page == 1) {
        clear();
      }

      bool hasData = Util.validList(res.rank);
      _hasMore = hasData;

      if (hasData) {
        addAll(res.rank);
        _page++;
      }
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}
