import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/accompany/model/accompany_invite_model.dart';
import 'package:chat_room/src/accompany/model/accompany_repository.dart';

enum AccompanyInviteType {
  Friend, // 邀请朋友
  Nearby, // 邀请附近的人
}

/// 1+1陪伴房邀请
class AccompanyInviteWidget extends StatefulWidget {
  final AccompanyInviteType inviteType;
  final int rid;

  const AccompanyInviteWidget(
      {super.key, required this.rid, required this.inviteType});

  static Future launch(
      BuildContext context, int rid, AccompanyInviteType inviteType) {
    return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            AccompanyInviteWidget(rid: rid, inviteType: inviteType)));
  }

  @override
  _AccompanyInviteWidgetState createState() => _AccompanyInviteWidgetState();
}

class _AccompanyInviteWidgetState extends State<AccompanyInviteWidget> {
  late AccompanyInviteRepository _repository;

  final List<AccompanyInviteModel> _selectedList = [];

  bool get isNearby {
    return widget.inviteType == AccompanyInviteType.Nearby;
  }

  @override
  void initState() {
    super.initState();
    _repository = AccompanyInviteRepository(widget.inviteType);
  }

  @override
  Widget build(BuildContext context) {
    bool hasSelected = _selectedList.isNotEmpty;
    return Scaffold(
      appBar: BaseAppBar.custom(
        backgroundColor: R.color.mainBgColor,
        showBack: true,
        title: Text(
          isNearby ? K.room_nearby_online : K.room_friend,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              if (hasSelected) {
                String uids = '';
                for (var element in _selectedList) {
                  uids += '${element.uid},';
                }
                bool success =
                    await AccompanyRepository.sendInvite(widget.rid, uids);
                if (success) {
                  Navigator.pop(context);
                }
              }
            },
            child: Container(
              height: double.infinity,
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Text(
                hasSelected
                    ? '${K.room_invite_empty}${_selectedList.length}'
                    : K.room_invite_empty,
                style: TextStyle(
                    color: hasSelected
                        ? R.color.thirdTextColor
                        : R.color.mainBrandColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          _renderSelectedList(),
          Expanded(
            child: LoadingMoreList(
              ListConfig<AccompanyInviteModel>(
                itemBuilder: (BuildContext context, AccompanyInviteModel item,
                    int index) {
                  return _renderItem(item);
                },
                sourceList: _repository,
                indicatorBuilder: _indicatorBuilder,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 选中用户列表
  _renderSelectedList() {
    if (_selectedList.isEmpty) return const SizedBox.shrink();
    return Container(
      width: Util.width,
      height: 48,
      margin: const EdgeInsetsDirectional.only(top: 8, bottom: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsetsDirectional.only(start: 16),
        children: _selectedList
            .map((e) => Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: CommonAvatar(
                    size: 48,
                    path: e.icon,
                    shape: BoxShape.circle,
                  ),
                ))
            .toList(),
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
      // return LoadingFooter(hasMore: false);
      return const SizedBox.shrink();
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.net_error,
        onTap: () {
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.base_load_more_failed,
          loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.empty_result,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  _renderItem(AccompanyInviteModel inviteModel) {
    return Container(
      width: Util.width,
      height: 68,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          CommonAvatar(
              path: inviteModel.icon, size: 48, shape: BoxShape.circle),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(inviteModel.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text(
                    (isNearby
                            ? Util.getDistanceStr(inviteModel.distance)
                            : inviteModel.onlineDatelineDiff) ??
                        '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: R.color.secondTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          _renderSelectedStatus(inviteModel),
        ],
      ),
    );
  }

  _renderSelectedStatus(AccompanyInviteModel inviteModel) {
    bool isSelected = inviteModel.isSelected;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isSelected) {
          _selectedList
              .removeWhere((element) => element.uid == inviteModel.uid);
        } else {
          if (_selectedList.length >= 10) {
            Fluttertoast.showToast(msg: K.room_accompany_invite_count_limit);
            return;
          }
          _selectedList.add(inviteModel);
        }
        inviteModel.isSelected = !isSelected;
        setState(() {});
      },
      child: Container(
        height: 68,
        width: 52,
        alignment: AlignmentDirectional.center,
        child: isSelected
            ? Container(
                width: 22,
                height: 22,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                child: R.img('accompany/ic_selected.webp',
                    width: 17,
                    height: 17,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    fit: BoxFit.fill),
              )
            : Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                      color: R.color.mainTextColor.withOpacity(0.2), width: 2),
                ),
              ),
      ),
    );
  }
}

class AccompanyInviteRepository extends LoadingMoreBase<AccompanyInviteModel> {
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  final AccompanyInviteType type;

  AccompanyInviteRepository(this.type);

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
      XhrResponse response = await request();
      AccompanyInviteResponse result = AccompanyInviteResponse.fromJson(
          response.value() as Map<String, dynamic>);
      if (page == 1) {
        clear();
      }
      result.list?.forEach((element) {
        add(element);
      });
      _hasMore = result.more == 1;
      page++;
      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      Log.d(exception);
      Log.d(stack);
    }
    return isSuccess;
  }

  Future<XhrResponse> request() async {
    XhrResponse response;
    Map<String, String> params;
    if (type == AccompanyInviteType.Nearby) {
      BBLocationData? loc = await Location.updateLocation();
      Location.shutdown();
      params = {
        'type': 'near',
        'page': '$page',
        'longitude': '${loc?.longitude ?? 0}',
        'latitude': "${loc?.latitude ?? 0}",
      };
    } else {
      params = {
        'type': 'friend',
        'page': '$page',
      };
    }
    response = await Xhr.postJson(
        '${System.domain}accompany/inviteUserList', params,
        throwOnError: true);
    return response;
  }
}
