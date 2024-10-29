import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:rank/k.dart';
import 'package:rank/src/model/rankRequestManager.dart';

class RoomGloryHeadlineCenterPage extends StatefulWidget {
  const RoomGloryHeadlineCenterPage({super.key});

  @override
  State<RoomGloryHeadlineCenterPage> createState() =>
      _RoomGloryHeadlineCenterPageState();

  static Future show(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: '/RoomGloryHeadlineCenterPage'),
            builder: (_) => const RoomGloryHeadlineCenterPage()));
  }
}

class _RoomGloryHeadlineCenterPageState
    extends State<RoomGloryHeadlineCenterPage> {
  GloryHeadlineLoadMoreListSource source = GloryHeadlineLoadMoreListSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          K.headline_center,
          backgroundColor: Colors.transparent,
          titleColor: darkMode ? Colors.white.withOpacity(0.9) : Colors.black,
          backColor: darkMode ? Colors.white : Colors.black,
        ),
        backgroundColor: R.colors.homeBgColor,
        body: RefreshIndicatorFactory.of(
            child: LoadingMoreList<AwakeFrontPageRsp_Data_Item>(
                ListConfig<AwakeFrontPageRsp_Data_Item>(
              itemBuilder: (c, item, index) {
                return Container(
                  width: Util.width - 32.dp,
                  height: 72.dp,
                  margin: EdgeInsetsDirectional.only(
                      start: 16.dp, top: 6, bottom: 6, end: 16.dp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.dp),
                  ),
                  alignment: Alignment.center,
                  child: Rext.themeCardContainer(
                    width: double.infinity,
                    height: double.infinity,
                    cornerRadius: 12.dp,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _itemOnTap(item.rid, item.uid, context);
                          },
                          child: CommonAvatar(
                            path: item.icon,
                            suffix: Util.squareResizeSuffix(150),
                            size: 52.dp,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: darkMode
                                    ? Colors.white.withOpacity(0.9)
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: DateTime.fromMillisecondsSinceEpoch(
                                          item.time * 1000)
                                      .toyyyyMMddHHmm(dateSplit: '.'),
                                  style: TextStyle(
                                    color: darkMode
                                        ? Colors.white.withOpacity(0.9)
                                        : Colors.black,
                                    fontSize: 11,
                                  ),
                                ),
                                TextSpan(
                                  text: K.rank_awake,
                                  style: TextStyle(
                                    color: darkMode
                                        ? Colors.white.withOpacity(0.9)
                                        : Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: '【${item.giftName}】',
                                  style: const TextStyle(
                                    color: Color(0xffFF5F7D),
                                    fontSize: 12,
                                  ),
                                ),
                              ]),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 6,
                        ),
                        CachedNetworkImage(
                            imageUrl: Util.giftImgUrl(item.gid),
                            width: 48.dp,
                            height: 48.dp,
                            suffix: Util.squareResizeSuffix(150)),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
              sourceList: source,
              indicatorBuilder: _indicatorBuilder,
              lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
            )),
            onRefresh: () async {
              source.refresh();
            }));
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(
        hasMore: true,
        textColor: R.colors.secondTextColor,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(hasMore: false, textColor: R.colors.secondTextColor);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: K.rank_error_data,
        fontColor: R.colors.secondTextColor,
        onTap: () {
          source.refresh();
        },
      );
    } else if (status == IndicatorStatus.empty) {
      return EmptyWidget(
        onTap: () {
          source.refresh();
        },
        textColor: R.colors.secondTextColor,
      );
    }
    return LoadingFooter(hasMore: true, textColor: R.colors.secondTextColor);
  }

  bool _isLoading = false;
  Future<void> _itemOnTap(int rid, int uid, BuildContext context) async {
    if (rid <= 0) {
      IPersonalDataManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      manager.openImageScreen(context, uid);
      return;
    }

    if (_isLoading) return;
    _isLoading = true;
    ResTopRoomJump roomJumpData =
        await BaseRequestManager.checkRoomCanActivity(rid);
    _isLoading = false;
    if (roomJumpData.success) {
      if (roomJumpData.data.inRoom) {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(context, rid);
      } else {
        if (roomJumpData.data.jumpId > 0) {
          IPersonalDataManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          manager.openImageScreen(context, roomJumpData.data.jumpId);
        }
      }
    }
  }
}

class GloryHeadlineLoadMoreListSource
    extends LoadingMoreBase<AwakeFrontPageRsp_Data_Item> {
  bool _hasMore = true;

  GloryHeadlineLoadMoreListSource();

  @override
  bool get hasMore => _hasMore;

  int _lastId = 0;
  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _lastId = 0;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool success = false;

    AwakeFrontPageRsp rsp =
        await RankRequestManager.getGloryHeadlineData(_lastId);
    success = rsp.success;
    if (_lastId == 0) {
      clear();
    }
    if (success) {
      List<AwakeFrontPageRsp_Data_Item> list = rsp.data.list;
      addAll(list);
      _lastId = list.last.id;
    }
    _hasMore = rsp.data.hasMore;
    return success;
  }
}
