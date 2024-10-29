import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message/k.dart';
import 'package:message/src/model/visitor_bean.dart';
import 'package:message/src/visitor/visitor_sub_page.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;

/// 访客记录
class VisitorPage extends StatefulWidget {
  final int time;

  const VisitorPage({super.key, required this.time});

  static Future show(BuildContext context,
      {Key? key, required int time}) async {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => VisitorPage(key: key, time: time),
      settings: const RouteSettings(name: 'visitor'),
    ));
  }

  @override
  _VisitorPageState createState() {
    return _VisitorPageState();
  }
}

class _VisitorPageState extends State<VisitorPage>
    with SingleTickerProviderStateMixin {
  late ExtendedTabController _tabController;
  int _index = 0;
  final GlobalKey<VisitorSubPageState> _tab1Key = GlobalKey();
  final GlobalKey<VisitorSubPageState> _tab2Key = GlobalKey();
  final GlobalKey<RoomFootprintPageState> _tab3Key = GlobalKey();

  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Navigator.Page.Pop', _onPagePop);
    _tabController = ExtendedTabController(length: 3, vsync: this);

    _tabController.addListener(() {
      _index = _tabController.index;
      _updateClearBtn();
    });
  }

  @override
  void dispose() {
    eventCenter.removeListener('Navigator.Page.Pop', _onPagePop);
    _tabController.dispose();
    super.dispose();
  }

  /// value为previousRoute
  _onPagePop(String type, dynamic value) {
    String curName = appNavigatorObserver.getLast();
    if ('visitor' == curName && _index == 0) {
      if (_tab1Key.currentState != null &&
          _tab1Key.currentState is VisitorSubPageState) {
        _tab1Key.currentState!.reload();
      }
    }
  }

  void _updateClearBtn() {
    if (_index == 0) {
      _showClear = _tab1Key.currentState?.showClear ?? false;
    } else if (_index == 1) {
      _showClear = _tab2Key.currentState?.showClear ?? false;
    } else if (_index == 2) {
      _showClear = _tab3Key.currentState?.showClear ?? false;
    }
    setState(() {});
  }

  /// 清空用户访客记录
  _clearRecord() async {
    String url = '${System.domain}guest/clear?type=${_index + 1}';

    if (_index == 2) {
      //清空房间足迹
      url = '${System.domain}guest/clearRoomFootmark';
    }

    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (!mounted) return;
      Map res = response.value();
      if (res['success'] == true) {
        if (_index == 0) {
          _tab1Key.currentState?.clear();
        } else if (_index == 1) {
          _tab2Key.currentState?.clear();
        } else if (_index == 2) {
          _tab3Key.currentState?.clear();
        }
        _updateClearBtn();
      } else {
        Toast.show(context, res['msg'].toString());
      }
    } catch (e) {
      Log.d(e);
    }
  }

  _clickClear() async {
    List<String> dialogStrs = [
      K.msg_clear_who_visit_me,
      K.msg_clear_i_visit_who,
      K.msg_clear_room_footprint
    ];

    bool? result = await DialogQueue.root.enqueue(
        context: context,
        builder: (context) {
          return ConfirmDialog(content: dialogStrs[_index]);
        });
    if (result == true) {
      await _clearRecord();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.msg_visitor_record,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        titleColor: R.colors.mainTextColor,
        actionColor: R.colors.mainTextColor,
        actionTitle: _showClear == true ? K.msg_clear : '',
        onPressed: () => _clickClear(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Container(
          height: 44,
          alignment: AlignmentDirectional.centerStart,
          child: Util.isUseAnimTabBar()
              ? AnimTabBar(
                  controller: _tabController,
                  titles: [
                    K.msg_who_visit_me,
                    K.msg_i_visit_who,
                    K.msg_room_footprint
                  ],
                  marginStart: 10,
                  selectedFontSize: 18,
                  selectedFontColor: R.colors.mainTextColor,
                  selectedFontWeight: FontWeight.w700,
                  unselectedFontSize: 16,
                  unselectedFontColor: R.colors.mainTextColor.withOpacity(0.6),
                  unselectedFontWeight: FontWeight.w500,
                )
              : CommonTabBar(
                  tabs: [
                    Tab(
                      child: Text(K.msg_who_visit_me),
                    ),
                    Tab(
                      child: Text(K.msg_i_visit_who),
                    ),
                    Tab(
                      child: Text(K.msg_room_footprint),
                    )
                  ],
                  controller: _tabController,
                  marginStart: 10,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                ),
        ),
        Expanded(
          child: NotificationListener(
            onNotification: (notification) {
              if (notification is ListUpdatedNotification) {
                _updateClearBtn();
              }

              if (notification is ScrollUpdateNotification) {
                double offset = notification.metrics.pixels;
                double screenWidth = MediaQuery.of(context).size.width;
                _tabController.scrollPosition = offset / screenWidth;
              }

              return true;
            },
            child: ExtendedTabBarView(
              controller: _tabController,
              children: <Widget>[
                VisitorSubPage(
                    key: _tab1Key,
                    self: false,
                    time: widget.time,
                    refer: const PageRefer('VisitorPageTab1')),
                VisitorSubPage(
                    key: _tab2Key,
                    self: true,
                    time: widget.time,
                    refer: const PageRefer('VisitorPageTab2')),
                RoomFootprintPage(
                    key: _tab3Key, updateClearBtnCallBack: _updateClearBtn),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RoomFootprintPage extends StatefulWidget {
  final VoidCallback? updateClearBtnCallBack;
  final String pageRefer;

  const RoomFootprintPage(
      {super.key,
      this.updateClearBtnCallBack,
      this.pageRefer = 'visitor_page'});

  @override
  RoomFootprintPageState createState() => RoomFootprintPageState();
}

class RoomFootprintPageState extends State<RoomFootprintPage>
    with AutomaticKeepAliveClientMixin {
  late RoomFootprintSource _source;

  @override
  bool get wantKeepAlive => true;

  bool get showClear => _source.isNotEmpty;

  @override
  void initState() {
    super.initState();

    _source = RoomFootprintSource(widget.updateClearBtnCallBack);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void clear() {
    if (mounted) {
      setState(() {
        _source.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      child: RefreshIndicatorFactory.of(
        onRefresh: () async {
          await _source.refresh();
        },
        child: LoadingMoreList(
          ListConfig(
            itemBuilder:
                (BuildContext context, RoomFootprintItem item, int index) {
              return _buildItem(item);
            },
            sourceList: _source,
            indicatorBuilder: _indicatorBuilder,
          ),
        ),
      ),
    );
  }

  Widget _buildItem(RoomFootprintItem item) {
    return Column(
      children: [
        if (item.dateStr != null && item.dateStr!.isNotEmpty)
          Container(
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsetsDirectional.only(
                start: 20, end: 20, top: 20, bottom: 2),
            child: Text(
              item.dateStr!,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: R.colors.thirdTextColor),
            ),
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (item.roomState == 0) {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, item.uid,
                  refer: PageRefer(widget.pageRefer));
            } else {
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openChatRoomScreenShow(context, item.rid,
                  refer: widget.pageRefer);
            }
          },
          child: Rext.themeCardContainer(
            height: 92,
            padding: const EdgeInsetsDirectional.only(
                start: 14, top: 16, bottom: 16),
            margin:
                const EdgeInsetsDirectional.only(start: 20, end: 20, top: 12),
            cornerRadius: 16,
            child: Row(
              children: [
                CommonAvatar(
                    path: System.imageDomain + (item.icon ?? ''),
                    shape: BoxShape.circle,
                    size: 60,
                    onlyFirstFrame: true),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: Util.width - 170),
                          child: _buildTitle(item.name ?? '', item.titleNew),
                        ),
                        const SizedBox(width: 4),
                        UserSexWidget(sex: item.sex, size: 14),
                      ],
                    ),
                    const SizedBox(height: 2),
                    item.roomState == 1
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${K.msg_room_footprint_party} [',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: R.colors.secondTextColor),
                              ),
                              Container(
                                constraints:
                                    BoxConstraints(maxWidth: Util.width - 190),
                                child: Text(
                                  item.roomName ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: R.colors.secondTextColor),
                                ),
                              ),
                              Text(
                                ']',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: R.colors.secondTextColor),
                              ),
                            ],
                          )
                        : Text(K.msg_room_footprint_party_end,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: R.colors.secondTextColor)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String name, int titleNew) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: R.colors.mainTextColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: Util.fontFamily),
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
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        fontColor: R.colors.secondTextColor,
        onTap: () {
          _source.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}
