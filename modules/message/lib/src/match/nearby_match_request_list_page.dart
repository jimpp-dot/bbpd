import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:message/k.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:loading_more_list/loading_more_list.dart';
import 'package:message/src/model/nearby_match_request_list_bean.dart';
import 'package:message/src/api/api.dart';
import 'package:message/src/model/nearby_match_request_list_data.dart';
import 'package:message/src/match/sayhi_match_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';

class NearbyMatchRequestListPage extends StatefulWidget {
  final int remainMatchNum;

  const NearbyMatchRequestListPage({super.key, required this.remainMatchNum});

  static Future show(BuildContext context, int remainMatchNum) async {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          NearbyMatchRequestListPage(remainMatchNum: remainMatchNum),
      settings: const RouteSettings(name: '/nearby_match_request_list'),
    ));
  }

  @override
  _NearbyMatchRequestListPageState createState() =>
      _NearbyMatchRequestListPageState();
}

class _NearbyMatchRequestListPageState
    extends State<NearbyMatchRequestListPage> {
  late NearbyMatchRequestRepository _repository;
  final List<SayHiNearbyPeople> _nearbyPeoples = [];
  int _remainMatchNum = 0;

  @override
  void initState() {
    super.initState();

    _remainMatchNum = widget.remainMatchNum;
    _repository = NearbyMatchRequestRepository();

    eventCenter.addListener('sayhi.match.remain.refresh', _onRefreshRemainTime);

    Im.clearMessagesUnreadStatus(
        ConversationType.Private, ChatUtil.matchFriendsId.toString());

    _loadPeopleNearby();

    _getRemainNum();
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        'sayhi.match.remain.refresh', _onRefreshRemainTime);

    super.dispose();
  }

  _getRemainNum() async {
    try {
      SayhiMatchRemainNumRsp rsp = await Api.getMatchRemainNum();

      if (rsp.success == true) {
        if (mounted) {
          setState(() {
            _remainMatchNum = rsp.remainNum;
          });
        }
      }
    } catch (e) {
      Log.d(e.toString());
    }
  }

  //附近的人
  _loadPeopleNearby() async {
    try {
      SayHiNearbyPeopleRsq res = await Api.getPeopleNearyby();

      if (res.success = true) {
        if (res.data != null && res.data!.isNotEmpty) {
          _nearbyPeoples.clear();

          if (mounted) {
            setState(() {
              _nearbyPeoples.addAll(res.data!);
            });
          }
        }
      }
    } catch (e) {
      Log.d(e.toString());
    }
  }

  //匹配
  _showSayhiMatchBottomSheet() async {
    if (!Util.hasLocation) {
      PermissionStatus permission =
          await PermissionUtil.checkAndRequestPermissions(
              context, Permission.locationWhenInUse);
      if (permission != PermissionStatus.granted) {
        return;
      }

      await Location.updateLocation();
      Location.shutdown();

      if (Util.hasLocation) {
        _loadPeopleNearby();
      }
    }

    if (Util.hasLocation) {
      if (_remainMatchNum > 0) {
        Tracker.instance.track(TrackEvent.match_nearby_show, properties: {
          'refer': 'match_request',
        });

        SayhiMatchBottomSheet.show(context, _remainMatchNum, 0);
      } else {
        Fluttertoast.showToast(
            msg: K.msg_match_time_limit, gravity: ToastGravity.CENTER);
      }
    }
  }

  //接受匹配
  void _acceptRequest(NearbyMatchRequestListData item) async {
    BaseResponse response = await Api.acceptMatchRequest(item.uid);

    if (response.success == true) {
      int itemIndex = _repository.indexOf(item);
      NearbyMatchRequestListData newItem = item;
      newItem.status = 1;
      _repository.remove(item);
      _repository.insert(itemIndex, newItem);

      Tracker.instance.track(TrackEvent.match_accept, properties: {
        'to_uid': item.uid,
        'position': itemIndex,
      });

      if (mounted) setState(() {});
    } else {
      Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
    }
  }

  //清除所有请求
  void _clearAll() async {
    bool? result = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: K.msg_confirm_clear_all_match_request,
          );
        });

    if (result != true) return;

    try {
      BaseResponse response = await Api.clearAllMathRequest();
      if (response.success == true) {
        // Log.d('_repository all');
        setState(() {
          // _repository.clear();

          _repository.refresh();
        });
      } else {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }
  }

  Widget _buildAvatar(String icon) {
    return Container(
      width: 32 * Util.ratio,
      height: 32 * Util.ratio,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      alignment: AlignmentDirectional.center,
      child: ClipOval(
        child: SizedBox(
          width: 31 * Util.ratio,
          height: 31 * Util.ratio,
          child: CachedNetworkImage(
            imageUrl: '${System.imageDomain}$icon!head100',
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return GestureDetector(
      onTap: () => _showSayhiMatchBottomSheet(),
      child: Container(
        height: 72 * Util.ratio,
        margin: EdgeInsetsDirectional.only(
            start: 20 * Util.ratio, top: 2, end: 20 * Util.ratio, bottom: 0),
        padding: EdgeInsetsDirectional.only(
            start: 16 * Util.ratio, end: 20 * Util.ratio, bottom: 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.imagePath("match_request_list_banner_bg.webp",
                package: ComponentManager.MANAGER_MESSAGE)),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            R.img('sayhi_small_icon.webp',
                width: 36 * Util.ratio,
                height: 36 * Util.ratio,
                package: ComponentManager.MANAGER_MESSAGE),
            SizedBox(
              width: 8 * Util.ratio,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  K.msg_match_request_list_banner_text,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: Util.fontFamily),
                ),
                Text(
                    K.msg_match_request_list_banner_subtext(
                        [' $_remainMatchNum ']),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: Util.fontFamily)),
              ],
            ),
            const Spacer(),
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                _buildAvatar(_nearbyPeoples.length > 3
                    ? (_nearbyPeoples[2].icon ?? '')
                    : ''),
                PositionedDirectional(
                  end: 28 * Util.ratio,
                  child: _buildAvatar(_nearbyPeoples.length > 3
                      ? (_nearbyPeoples[1].icon ?? '')
                      : ''),
                ),
                PositionedDirectional(
                  end: 54 * Util.ratio,
                  child: _buildAvatar(_nearbyPeoples.length > 3
                      ? (_nearbyPeoples[0].icon ?? '')
                      : ''),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(NearbyMatchRequestListData item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(context, item.uid,
            fromSayHiMatch: item.status == 1 ? false : true,
            refer: const PageRefer('/nearby_match_request_list'));
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(
            start: 20 * Util.ratio,
            end: 16 * Util.ratio,
            top: 20 * Util.ratio,
            bottom: 0),
        height: 52,
        child: Row(
          children: [
            CommonAvatar(
              path: item.icon,
              shape: BoxShape.circle,
              size: 52,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            item.name ?? '',
                            style: TextStyle(
                                fontSize: 16, color: R.color.mainTextColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        UserSexAndAgeWidget(
                            sex: item.sex,
                            age: item.age,
                            width: 29,
                            height: 12),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    item.sign ?? '',
                    style:
                        TextStyle(fontSize: 13, color: R.color.secondTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (item.status == 0) {
                  _acceptRequest(item);
                }
              },
              child: Container(
                height: 32,
                padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: item.status == 1
                      ? LinearGradient(
                          colors: R.color.darkGradientColors,
                          begin: AlignmentDirectional.centerStart,
                          end: AlignmentDirectional.centerEnd)
                      : LinearGradient(
                          colors: R.color.mainBrandGradientColors,
                          begin: AlignmentDirectional.centerStart,
                          end: AlignmentDirectional.centerEnd),
                ),
                child: Text(
                  item.status == 0 ? K.msg_match_accept : K.msg_has_accepted,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestList() {
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _repository.refresh();
        _loadPeopleNearby();
      },
      child: LoadingMoreList(
        ListConfig(
          itemBuilder: (BuildContext context, NearbyMatchRequestListData item,
              int index) {
            return _buildItem(item);
          },
          sourceList: _repository,
          indicatorBuilder: _indicatorBuilder,
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
        fontColor: R.colors.secondTextColor,
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
        fontColor: R.colors.secondTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        title: Text(
          K.msg_match_request_list_title,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontFamily: Util.fontFamily),
        ),
        actions: <Widget>[
          IconButton(
              icon: R.img(
                'ic_clear_all.svg',
                package: ComponentManager.MANAGER_MESSAGE,
                width: 24,
                height: 24,
                color: R.color.mainTextColor,
              ),
              onPressed: _clearAll),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// 皮队友屏蔽顶部入口
            _buildBanner(),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: _buildRequestList(),
            ),
          ],
        ),
      ),
    );
  }

  _onRefreshRemainTime(String type, Object? data) {
    int remainTime = Util.parseInt(data);
    setState(() {
      _remainMatchNum = remainTime;
    });
  }
}
