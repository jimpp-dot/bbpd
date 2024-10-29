/*
 *
 *  Created by yao.qi on 2022/7/23 上午9:05
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/7/23 上午9:05
 *
 */

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';

import 'accompany_remember_oneself_list_screen.dart';
import 'model/pb/accompany_remember_api.dart';
import 'model/pb/generated/slp_imprint.pb.dart';

/// 陪伴记好友列表页面

class AccompanyRememberFriendsListScreen extends StatefulWidget {
  final int uid;

  const AccompanyRememberFriendsListScreen(this.uid, {Key? key})
      : super(key: key);

  static Future show(BuildContext context, int uid) {
    Tracker.instance.track(TrackEvent.accompany_click_list,
        properties: {'uid': uid, 'to_uid': Session.uid});

    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AccompanyRememberFriendsListScreen(uid),
        settings:
            const RouteSettings(name: '/AccompanyRememberFriendsListScreen'),
      ),
    );
  }

  @override
  State<AccompanyRememberFriendsListScreen> createState() =>
      _AccompanyRememberFriendsListScreenState();
}

class _AccompanyRememberFriendsListScreenState
    extends State<AccompanyRememberFriendsListScreen> {
  late AccompanyRememberListSource _source;

  @override
  void initState() {
    super.initState();

    Tracker.instance.track(TrackEvent.accompany_view_list,
        properties: {'uid': widget.uid, 'to_uid': Session.uid});

    _source = AccompanyRememberListSource(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        K.personaldata_accompany_list,
        onBackPressedCallback: () {
          Navigator.of(context).pop();
        },
      ),
      body: RefreshIndicatorFactory.of(
        onRefresh: () async {
          _source.refresh();
        },
        child: LoadingMoreList(
          ListConfig(
            itemBuilder:
                (BuildContext context, ImprintUserListItem item, int index) {
              return _buildItem(item, index);
            },
            sourceList: _source,
            indicatorBuilder: _indicatorBuilder,
            lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
          ),
        ),
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
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _source.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(ImprintUserListItem item, int index) {
    return SizedBox(
      height: 118,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0, 2),
                      blurRadius: 20,
                      spreadRadius: 6)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        CommonAvatar(
                          path: item.icon,
                          size: 48,
                          shape: BoxShape.circle,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                    color: R.color.unionRankText1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              UserVipWidget(vip: item.vipLevel)
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            AccompanyRememberOneselfListScreen.show(
                                context, item.uid);
                          },
                          child: Container(
                            width: 68,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: R.color.mainBrandGradientColors),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              K.personaldata_accompany_list_btn_text,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              K.personal_has_lighten,
                              style: TextStyle(
                                  color:
                                      R.color.unionRankText1.withOpacity(0.5),
                                  fontSize: 13),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '${item.lightenNum}/${item.totalNum}',
                              style: TextStyle(
                                  color: R.color.unionRankText2,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              K.personaldata_intimacy,
                              style: TextStyle(
                                  color: R.color.mainTextColor.withOpacity(0.6),
                                  fontSize: 13),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              item.degree.toString(),
                              style: TextStyle(
                                  color: R.color.unionRankText2,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              K.personaldata_accompany_time,
                              style: TextStyle(
                                  color: R.color.mainTextColor.withOpacity(0.6),
                                  fontSize: 13),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              (item.staySecs / 60).ceil().toString(),
                              style: TextStyle(
                                  color: R.color.unionRankText2,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              BaseK.K.app_common_minute,
                              style: TextStyle(
                                  color: R.color.mainTextColor.withOpacity(0.6),
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccompanyRememberListSource extends LoadingMoreBase<ImprintUserListItem> {
  final int uid;
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  AccompanyRememberListSource(this.uid);

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      ResImprintUserList result =
          await AccompanyRememberApi.getAccompanyRememberUserListRes(uid, page);
      isSuccess = result.success;

      if (page == 1) {
        clear();
      }

      if (result.hasData() &&
          !Util.isCollectionEmpty(result.data.list) &&
          result.data.list.isNotEmpty) {
        page++;
        _hasMore = true;
        for (var element in result.data.list) {
          add(element);
        }
      } else {
        _hasMore = false;
      }
    } catch (exception) {
      isSuccess = false;
    }

    return isSuccess;
  }
}
