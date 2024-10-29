import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../models/generated/slp_newbie.pb.dart';
import '../providers/quality_user_rank_datasource.dart';
import '../providers/quality_user_rank_repository.dart';

/// 优质用户榜单

class QualityUserRankPage extends StatefulWidget {
  const QualityUserRankPage({super.key});

  @override
  State<QualityUserRankPage> createState() => _QualityUserRankPageState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const QualityUserRankPage(),
        settings: const RouteSettings(name: '/QualityUserRankPage'),
      ),
    );
  }
}

class _QualityUserRankPageState extends State<QualityUserRankPage> {
  late QualityUserRankDataSource _dataSource;
  final IPersonalDataManager _personalDataManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);
  final IChatManager _chatManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
  String navTitle = '';

  @override
  void initState() {
    super.initState();
    _dataSource = QualityUserRankDataSource();
    _dataSource.onRefresh = onRefresh;
    Tracker.instance.track(TrackEvent.quality_user_list_exposure,
        properties: {'uid': Session.uid});
  }

  void onRefresh(String title) {
    refresh(() {
      navTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          navTitle,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 8, start: 16, end: 16),
              child: Text(
                K.rank_quality_user_rank_desc,
                style: TextStyle(
                    color: R.color.mainTextColor.withOpacity(0.4),
                    fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: RefreshIndicatorFactory.of(
                onRefresh: () async {
                  _dataSource.refresh();
                },
                child: LoadingMoreList(
                  ListConfig(
                    itemBuilder:
                        (BuildContext context, NewbieUserData item, int index) {
                      return _buildItem(item, index);
                    },
                    sourceList: _dataSource,
                    indicatorBuilder: _indicatorBuilder,
                    lastChildLayoutType:
                        LastChildLayoutType.fullCrossAxisExtent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(child: CupertinoActivityIndicator());
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        onTap: () {
          _dataSource.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: BaseK.K.data_error,
        loadMore: _dataSource.loadMore,
      );
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _dataSource.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(NewbieUserData item, int index) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 16.0,
        end: 16.0,
        top: 12.0,
        bottom: _dataSource.lastDataIndex == index ? 12.0 : 0,
      ),
      child: Container(
        height: 88,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 6,
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            CommonAvatar(
              onTap: () {
                _personalDataManager.openImageScreen(context, item.uid);
              },
              path: item.icon,
              size: 48,
              shape: BoxShape.circle,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                        color: R.color.unionRankText1,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(fontSize: 12),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: 'IP：',
                                  style: TextStyle(
                                      color: R.color.mainTextColor
                                          .withOpacity(0.5))),
                              TextSpan(
                                  text: item.ipLocation,
                                  style: TextStyle(
                                      color: R.color.mainTextColor,
                                      fontWeight: FontWeight.w500)),
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(fontSize: 12),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: K.rank_tag,
                                  style: TextStyle(
                                      color: R.color.mainTextColor
                                          .withOpacity(0.5))),
                              TextSpan(
                                  text: item.channelTag,
                                  style: TextStyle(
                                      color: R.color.mainTextColor,
                                      fontWeight: FontWeight.w500)),
                            ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 30.0),
            GestureDetector(
              onTap: () async {
                if (item.saidHi == 0) {
                  Tracker.instance.track(
                      TrackEvent.quality_user_item_sayhi_click,
                      properties: {'uid': item.uid});
                  // 打招呼
                  NormalNull resp =
                      await QualityUserRankRepository.sayHi(item.uid);
                  if (resp.success) {
                    Fluttertoast.showCenter(msg: K.rank_say_hi_succeed);
                    _dataSource.refresh();
                  } else if (Util.validStr(resp.msg)) {
                    Fluttertoast.showCenter(msg: resp.msg);
                  }
                } else {
                  // 私信
                  Tracker.instance.track(
                      TrackEvent.quality_user_item_private_msg_click,
                      properties: {'uid': item.uid});
                  _chatManager.openUserChatScreen(context,
                      type: 'private',
                      targetId: item.uid,
                      title: item.name,
                      refer: 'quality_user_rank_item_private_chat');
                }
              },
              child: Container(
                width: 63,
                height: 30,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: R.color.mainBrandGradientColors
                          .map((e) => e.withOpacity(item.saidHi == 0 ? 1 : 0.2))
                          .toList(),
                    )),
                child: item.saidHi == 0
                    ? Text(
                        BaseK.K.say_hi,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 13.0),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          R.img(Assets.ic_private_msg_webp,
                              width: 16,
                              height: 16,
                              package: ComponentManager.MANAGER_RANK),
                          const SizedBox(width: 2),
                          Text(
                            K.rank_private_msg,
                            style: const TextStyle(
                                color: Color(0xFF2ECEFE),
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
              ),
            ),
            const SizedBox(width: 12.0),
          ],
        ),
      ),
    );
  }
}
