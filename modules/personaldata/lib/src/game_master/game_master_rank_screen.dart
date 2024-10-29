// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:personaldata/src/game_master/model/game_master_api.dart';
import 'package:personaldata/src/game_master/model/pb/generated/slp_godcard.pb.dart';

import '../../K.dart';

class GameMasterRankScreen extends StatefulWidget {
  const GameMasterRankScreen({Key? key}) : super(key: key);

  static Future<bool?> show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const GameMasterRankScreen(),
      settings: const RouteSettings(name: '/game_master_rank'),
    ));
  }

  @override
  State<GameMasterRankScreen> createState() => _GameMasterRankScreenState();
}

class _GameMasterRankScreenState extends State<GameMasterRankScreen> {
  late RecommendMasterRepository _repository;

  @override
  void initState() {
    super.initState();

    _repository = RecommendMasterRepository();
  }

  @override
  void dispose() {
    _repository.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(K.personaldata_gm_recommend),
        body: Container(
            // padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
            child: LoadingMoreList(ListConfig<RecommendGodList>(
          padding:
              const EdgeInsetsDirectional.only(start: 20, end: 20, top: 12),
          itemBuilder: _buildItem,
          indicatorBuilder: _indicatorBuilder,
          sourceList: _repository,
        ))));
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(
        hasMore: true,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Loading();
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(
        hasMore: false,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
            error: Util.isNullOrEmpty(_repository.errorMsg)
                ? R.string('data_error')
                : _repository.errorMsg,
            onTap: () => _repository.refresh()),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: Util.isNullOrEmpty(_repository.errorMsg)
            ? R.string('data_error')
            : _repository.errorMsg,
        loadMore: _repository.loadMore,
      );
    } else if (status == IndicatorStatus.empty) {
      //空数据不展示
      return const EmptyWidget();
    }

    return const LoadingFooter(hasMore: true);
  }

//BuildContext*, RecommendGodList*, int*
  Widget _buildItem(BuildContext context, RecommendGodList item, int index) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: InkWell(
        onTap: () {
          if (item.rid > 0) {
            //主播在房间就跳转去房间
            IRoomManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            manager.openChatRoomScreenShow(context, item.rid,
                refer: 'god_card_recommend');
          } else {
            IPersonalDataManager personalDataManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.openImageScreen(context, item.uid,
                refer: const PageRefer('god_card_recommend'));
          }
        },
        child: Container(
          height: 80,
          alignment: AlignmentDirectional.centerStart,
          child: Stack(
            children: [
              Container(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: R.img(
                  'game_master/game_master_recommend_bg.webp',
                  package: ComponentManager.MANAGER_PERSONALDATA,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  RoundNetIcon(
                    url: item.icon,
                    size: 48.0,
                    inRoom: item.rid > 0,
                    isOnline: item.onlineStatus == 1,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Row(children: [
                          UserSexAndAgeWidget(sex: item.sex, age: item.age),
                          SizedBox(
                            height: 22,
                            child: CachedNetworkImage(
                              imageUrl: "${System.imageDomain}${item.tagIcon}",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(end: 15),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Row(
                      children: [
                        Text(K.personaldata_gm_master_level,
                            style: const TextStyle(
                                color: Color(0xFFBC6C26), fontSize: 13)),
                        const SizedBox(width: 3),
                        R.img(
                          item.level == 'S+'
                              ? 'game_master/game_master_level_s_plus.webp'
                              : 'game_master/game_master_level_s.webp',
                          package: ComponentManager.MANAGER_PERSONALDATA,
                          width: 36,
                          height: 36,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendMasterRepository extends LoadingMoreBase<RecommendGodList> {
  bool _hasMore = true;
  int _page = 1;
  String? errorMsg;

  RecommendMasterRepository();

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    _page = 1;
    errorMsg = null;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isLoadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      ResRecommendGodList recommendRes =
          await GameMasterAPI.getRecommendMastertRes(_page);

      if (recommendRes.success) {
        addAll(recommendRes.list);
        _page++;
        isSuccess = true;
        _hasMore = recommendRes.list.isNotEmpty;
      } else {
        isSuccess = false;
        errorMsg = recommendRes.msg;
      }
    } catch (e) {
      isSuccess = false;
      errorMsg = e.toString();
    }

    return isSuccess;
  }
}
