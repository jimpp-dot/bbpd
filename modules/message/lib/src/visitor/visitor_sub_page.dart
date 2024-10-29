import 'package:shared/shared.dart' hide UserBean;
import 'package:shared/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:message/k.dart' as mk;
import 'package:message/src/model/visitor_bean.dart';
import 'package:message/src/visitor/visitor_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListUpdatedNotification extends Notification {}

/// 下面的TabView
class VisitorSubPage extends StatefulWidget {
  final int time;
  final bool self; //是不是"我看过谁"
  final PageRefer? refer;

  const VisitorSubPage(
      {super.key, required this.self, required this.time, this.refer});

  @override
  VisitorSubPageState createState() {
    return VisitorSubPageState();
  }
}

class VisitorSubPageState extends State<VisitorSubPage>
    with AutomaticKeepAliveClientMixin {
  VisitorData? _bean;
  final List<UserBean> _users = [];
  bool _hasMore = false;
  int _curPage = 0;
  final RefreshController _refreshController = RefreshController();
  bool _loading = true;
  int _totalVisitors = 0, _newVisitors = 0;
  bool _showDeleteUserTips = false;
  bool _showProfileTips = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _queryStats();
    _load(1);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  Future<void> reload() async {
    if ((_bean?.success ?? false) && _bean?.data == null) {
      _load(1);
    }
  }

  _load(int page) async {
    String url =
        '${System.domain}guest/${widget.self ? 'visit' : 'list'}?time=${widget.time}&page=$page&version=1';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.value();
      _bean = VisitorData.fromJson(res as Map<String, dynamic>);
      if (_bean?.success ?? false) {
        if (page == 1) {
          _users.clear();
          _showDeleteUserTips = _bean!.data!.haveForbidden;
          _showProfileTips = _bean!.data!.showProfileTips;
        }
        _users.addAll(_bean!.data!.users);
        _hasMore = _bean!.data!.next == 1;
        _curPage = _bean!.data!.page;
        ListUpdatedNotification().dispatch(context);
      }
    } catch (e) {
      Log.d(e);
    } finally {
      _loading = false;
      if (_refreshController.isRefresh) {
        _refreshController.refreshCompleted();
      }
      if (_refreshController.isLoading) {
        _refreshController.loadComplete();
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  /// 获取访客统计信息
  _queryStats() async {
    if (widget.self) {
      return;
    }
    String url = '${System.domain}guest/stats?time=${widget.time}';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        Map data = res['data'];
        _totalVisitors = Util.parseInt(data['total']);
        _newVisitors = Util.parseInt(data['new']);
      }
    } catch (e) {
      Log.d(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  bool get showClear => _users.isNotEmpty;

  void clear() {
    if (mounted) {
      setState(() {
        _users.clear();
      });
    }
  }

  _onDelete(int uid) {
    setState(() {
      _users.removeWhere((e) => e.uid == uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildBody();
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if ((_bean?.success ?? false) && _bean?.data == null) {
      return _buildNoPermissionTips();
    }

    if (_users.isEmpty) {
      return EmptyWidget(
        onTap: () {
          _load(1);
        },
        textColor: R.colors.secondTextColor,
      );
    }
    return Column(
      children: <Widget>[
        if (!widget.self) _buildHeader(),
        Expanded(
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: _hasMore,
            header: const MaterialClassicHeader(),
            footer: CustomFooter(
              loadStyle: LoadStyle.ShowWhenLoading,
              builder: (BuildContext context, LoadStatus? mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text(
                    K.base_load_more_idle,
                    style: TextStyle(color: R.colors.secondTextColor),
                  );
                } else if (mode == LoadStatus.loading) {
                  body = const CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text(
                    K.base_load_more_failed,
                    style: TextStyle(color: R.colors.secondTextColor),
                  );
                } else if (mode == LoadStatus.canLoading) {
                  body = Text(
                    K.base_load_more_canloading,
                    style: TextStyle(color: R.colors.secondTextColor),
                  );
                } else {
                  body = Text(
                    K.base_load_more_nomore,
                    style: TextStyle(color: R.colors.secondTextColor),
                  );
                }
                return SizedBox(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            onRefresh: () {
              _load(1);
            },
            onLoading: () {
              _load(_curPage + 1);
            },
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                if (_showDeleteUserTips)
                  DeletedUserTips(
                    marginTop: !widget.self ? 12 : 0,
                  ),
                SliverFixedExtentList(
                  itemExtent: VisitorItem.ITEM_EXTENT,
                  delegate: FixedExtentSliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    UserBean user = _users[index];
                    return VisitorItem(
                      self: widget.self,
                      data: user,
                      onDelete: _onDelete,
                      refer: widget.refer,
                    );
                  }, childCount: _users.length),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (_showProfileTips) _buildProfileTips(),
        SizedBox(
          height: 80,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  NumText(
                    _totalVisitors.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: R.colors.mainBrandColor,
                        fontStyle: FontStyle.italic,
                        fontSize: 18),
                  ),
                  Text(
                    mk.K.msg_total_visitors,
                    style: TextStyle(
                        fontSize: 12, color: R.colors.secondTextColor),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  NumText(
                    "+$_newVisitors",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: R.colors.mainBrandColor,
                        fontStyle: FontStyle.italic,
                        fontSize: 18),
                  ),
                  Text(
                    mk.K.msg_new_visitors,
                    style: TextStyle(
                        fontSize: 12, color: R.colors.secondTextColor),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildProfileTips() {
    return GestureDetector(
      onTap: () async {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        await manager.openImageModifyScreen(context);
        if (mounted) {
          _load(1);
        }
      },
      child: Container(
        height: 50,
        margin: const EdgeInsetsDirectional.only(top: 12, start: 20, end: 20),
        padding: const EdgeInsetsDirectional.only(
            start: 4, end: 4, top: 2, bottom: 2),
        decoration: BoxDecoration(
          color: R.colors.mainBgColor,
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(12)),
          boxShadow: [getCardBoxShadow()],
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              bottom: 0,
              end: 28,
              child: R.img(
                'message_fix_profile.png',
                width: 78,
                height: 44,
                package: ComponentManager.MANAGER_MESSAGE,
              ),
            ),
            Row(
              children: [
                R.img('msg_profile_write.webp',
                    width: 44,
                    height: 44,
                    package: ComponentManager.MANAGER_MESSAGE),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    mk.K.msg_profile_write_tips,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(color: R.colors.mainTextColor, fontSize: 13),
                  ),
                ),
                R.img('icon_next_fq.svg',
                    width: 16,
                    height: 16,
                    color: R.colors.secondTextColor,
                    package: ComponentManager.MANAGER_BASE_CORE)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoPermissionTips() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 120 * Util.ratio),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            R.img(
              'void_match_default_header.webp',
              width: 188,
              height: 56,
              package: ComponentManager.MANAGER_MESSAGE,
            ),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mk.K.msg_sub_list_total,
              style: TextStyle(fontSize: 14, color: R.colors.mainTextColor),
            ),
            const SizedBox(width: 4.0),
            Text(
              '${_bean?.sum ?? 0}',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFE6C25B)),
            ),
            const SizedBox(width: 4.0),
            Text(
              mk.K.msg_sub_list_see_you,
              style: TextStyle(fontSize: 14, color: R.colors.mainTextColor),
            ),
            const SizedBox(width: 4.0),
            Text(
              '${_bean?.num ?? 0}',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFE6C25B)),
            ),
            const SizedBox(width: 4.0),
            Text(
              mk.K.msg_sub_list_a +
                  (_bean!.sex == 'male'
                      ? mk.K.msg_sub_list_female
                      : mk.K.msg_sub_list_male) +
                  mk.K.msg_sub_list_good,
              style: TextStyle(fontSize: 14, color: R.colors.mainTextColor),
            ),
          ],
        ),
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () {
            IVipManager vipManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_VIP);
            vipManager.showMyLevelScreen(context, initialTab: MyLevelTab.Title);
          },
          child: Container(
            width: 255,
            height: 44,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFFDBAF63), Color(0xFFF4D49C)]),
              borderRadius: BorderRadius.circular(23),
            ),
            child: Text(
              mk.K.msg_sub_list_open_nobility,
              style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF533400),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            IVipManager vipManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_VIP);
            vipManager.showSecondPage(context, 'prop');
          },
          child: Container(
            width: 255,
            height: 44,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFF4C4C4D), Color(0xFF4C4C4D)]),
              borderRadius: BorderRadius.circular(23),
            ),
            child: Text(
              mk.K.msg_sub_list_buy_visitor,
              style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
