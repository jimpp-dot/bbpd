import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/src/circle/model/circle_page_resp.dart';
import 'package:moment/src/circle/repository/circle_activity_page_repository.dart';

import '../../../k.dart';

/// 圈子活动
class CircleActivityScreen extends StatefulWidget {
  static const String CIRCLE_ACTIVITY_ROUTE = '/circle_activity_route';

  const CircleActivityScreen({super.key});

  static Future openCircleActivityScreen(BuildContext context, {Key? key}) {
    return Navigator.of(context).push(MaterialPageRoute(
        settings: const RouteSettings(name: CIRCLE_ACTIVITY_ROUTE),
        builder: (context) {
          return CircleActivityScreen(key: key);
        }));
  }

  @override
  State<StatefulWidget> createState() {
    return CircleActivityState();
  }
}

class CircleActivityState extends State<CircleActivityScreen> {
  late CircleActivityPageRepository repository;
  final String _errorMsg = K.moment_something_went_wrong;

  @override
  void initState() {
    super.initState();
    Tracker.instance
        .track(TrackEvent.net_view, properties: {'page': 'net_event_list'});
    repository = CircleActivityPageRepository();
  }

  @override
  void dispose() {
    repository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.moment_circle_activity),
      body: RefreshIndicatorFactory.of(
        onRefresh: () async {
          repository.refresh();
        },
        child: LoadingMoreList(ListConfig<CircleActivity>(
            itemBuilder: _buildItem,
            sourceList: repository,
            indicatorBuilder: _indicatorBuilder)),
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
        error: _errorMsg,
        onTap: () {
          repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMsg, loadMore: repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: K.moment_no_more_info,
        onTap: () {
          repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(BuildContext context, CircleActivity item, int index) {
    return InkWell(
        onTap: () {
          Tracker.instance.track(TrackEvent.net_event_list,
              properties: {'click': item.name});
          IMomentManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_MOMENT);
          manager.openTagListScreenScreen(
            context,
            tagId: item.id,
            title: item.name ?? '',
          );
        },
        child: Column(
          children: <Widget>[
            if (index > 0)
              Container(
                height: 1,
                margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
                color: R.color.secondBgColor,
              ),
            Container(
              height: 88,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  item.circleName != null && item.circleName!.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                R.img('circle/ic_rush_circle_tag.svg',
                                    width: 16,
                                    height: 16,
                                    package: ComponentManager.MANAGER_MOMENT),
                                const SizedBox(
                                  width: 3,
                                ),
                                LimitedBox(
                                  maxWidth: 200,
                                  child: Text(
                                    item.name ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: R.color.mainTextColor,
                                        fontWeight: FontWeight.w800),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              K.moment_from_circle([item.circleName ?? '']),
                              style: TextStyle(
                                  fontSize: 13,
                                  color: R.color.thirdTextColor,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      : _buildTagLine(item),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: item.icon,
                      fit: BoxFit.cover,
                      width: 64,
                      height: 64,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildTagLine(CircleActivity item) {
    return Row(
      children: <Widget>[
        R.img('circle/ic_rush_circle_tag.svg',
            width: 16, height: 16, package: ComponentManager.MANAGER_MOMENT),
        const SizedBox(
          width: 3,
        ),
        Text(
          item.name ?? '',
          style: TextStyle(
              fontSize: 16,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
