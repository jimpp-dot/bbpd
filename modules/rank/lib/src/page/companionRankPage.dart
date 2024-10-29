import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:shared/model/companion_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/page/companion_rank_pop_menu.dart';
import 'package:rank/src/page/companion_rank_restore_page.dart';
import 'package:rank/src/widget/slp_defend_relation_widget.dart';
import 'package:rank/src/widget/companionValueWidget.dart';
import 'package:shared/k.dart' as BaseK;

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final bool showDefend;
  final GlobalKey _menuKey = GlobalKey();
  final bool me;
  final VoidCallback onRefresh;

  _SliverPersistentHeaderDelegate(this.showDefend, this.me, this.onRefresh);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: R.color.secondBgColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20), topEnd: Radius.circular(20)),
          color: R.color.mainBgColor,
        ),
        padding: const EdgeInsetsDirectional.only(start: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              K.rank_companion_list,
              style: R.textStyle.medium16,
            ),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 64,
                height: 47,
                alignment: AlignmentDirectional.center,
                child: me
                    ? R.img(
                        key: _menuKey,
                        Assets.rank$rank_ic_companion_rank_menu_png,
                        width: 16,
                        height: 16,
                      )
                    : R.img(
                        BaseAssets.ic_help_svg,
                        color: R.color.secondTextColor,
                        width: 16,
                        height: 16,
                        fit: BoxFit.contain,
                        package: ComponentManager.MANAGER_BASE_CORE,
                      ),
              ),
              onTap: () {
                if (me) {
                  final renderObj = _menuKey.currentContext?.findRenderObject();
                  if (renderObj is RenderBox) {
                    final renderBox = renderObj;
                    final offset = renderBox.localToGlobal(Offset.zero);
                    final rect = Rect.fromLTWH(offset.dx, offset.dy,
                        renderBox.size.width, renderBox.size.height);
                    CompanionRankPopMenu.show(context, rect, Offset.zero)
                        .then((value) {
                      if (value == 0) {
                        BaseWebviewScreen.show(context,
                            url: Util.getHelpUrlWithQStr('k36'));
                      } else if (value == 1) {
                        CompanionRankRestorePage.show(context, onRefresh);
                      }
                    });
                  }
                } else {
                  BaseWebviewScreen.show(context,
                      url: Util.getHelpUrlWithQStr('k36'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 如果内容需要更新，设置为true
}

/// 亲密关系
class CompanionRankPage extends StatefulWidget {
  final int uid;

  const CompanionRankPage({Key? key, required this.uid}) : super(key: key);

  @override
  _CompanionRankPageState createState() => _CompanionRankPageState();

  static Future<bool?> show(BuildContext context, int uid, String refer) {
    Tracker.instance.track(TrackEvent.view_user_companionlist, properties: {
      'refer': refer,
      'to_uid': '$uid',
    });

    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CompanionRankPage(uid: uid),
        settings: const RouteSettings(name: '/CompanionRankPage'),
      ),
    );
  }
}

class _CompanionRankPageState extends State<CompanionRankPage> {
  GlobalKey pageKey = GlobalKey();
  final Map<String, ValueKey<CompanionRankModel>> _keys = {};
  bool _loading = true;
  final ScrollController _controller = ScrollController();
  bool _more = false;
  bool _lock = false;
  int _page = 1;
  int _recoverMoney = 52000; //恢复榜单价格
  final List<CompanionRankModel> _data = [];
  CompanionRankModel? ownModel;
  final List<DefendRelationModel> _defendData = [];
  int marryDataReceiveTime = 0;
  bool isPull = false;
  final bool _defendChange = false;
  bool showSecretGarden = false;
  bool showDefendManager = false;
  bool showIntimateCard = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    _onRefresh();
    eventCenter.addListener(
        EventConstant.EventLoveLetterSendSuccess, refreshByEvent);
    eventCenter.addListener(
        EventConstant.EventMarryDataChanged, refreshByEvent);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    eventCenter.removeListener(
        EventConstant.EventLoveLetterSendSuccess, refreshByEvent);
    eventCenter.removeListener(
        EventConstant.EventMarryDataChanged, refreshByEvent);
    super.dispose();
  }

  void refreshByEvent(String type, dynamic data) async {
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: BaseAppBar.custom(
        title: Text(K.rank_intimacy_relation),
        backgroundColor: R.color.secondBgColor,
        onBackPressedCallback: () {
          Navigator.of(context).pop(_defendChange);
        },
      ),
      body: _buildContent(context),
    );
  }

  bool _needShowDefendWidget() {
    IRankManager rankManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
    return rankManager.showDefendBuyEnter;
  }

  _onScroll() {
    if (_controller.position.userScrollDirection == ScrollDirection.forward &&
        isPull == false) {
      isPull = true;
      if (mounted) {
        setState(() {});
      }
    }

    if (_controller.position.userScrollDirection != ScrollDirection.forward &&
        isPull == true) {
      isPull = false;
      if (mounted) {
        setState(() {});
      }
    }

    if (_more == true &&
        _lock == false &&
        _controller.position.maxScrollExtent == _controller.offset) {
      _load(_page);
    }
  }

  _load(int page) async {
    if (_lock) {
      return;
    }
    _lock = true;
    try {
      Map<String, String> body = {};
      body['page'] = page.toString();
      body['uid'] = widget.uid.toString();
      XhrResponse response = await Xhr.getJson(
          '${System.domain}rank/degree?version=5',
          params: body,
          throwOnError: true);
      Map json = response.value();
      bool success = json['success'];
      if (success) {
        List data = json['data'];
        _more = json['more'];
        _recoverMoney = Util.parseInt(json['recover_money'], _recoverMoney);
        if (json['accompany'] != null) {
          ownModel = CompanionRankModel.fromJson(json['accompany']);
          Log.d('accompany:${json['accompany']}');
        }
        showSecretGarden = Util.parseBool(json['show_secret_garden']);
        showDefendManager = Util.parseBool(json['show_relation_manage']);
        showIntimateCard = Util.parseBool(json['show_intimate_card']);
        if (page == 1) {
          _data.clear();
          _defendData.clear();

          if (json['defend_list'] != null) {
            List defendData = json['defend_list'];
            for (var element in defendData) {
              _defendData.add(DefendRelationModel.fromJson(element));
            }
          }
        }
        _page = page + 1;

        Log.d('accompanydata:$data');
        for (var element in data) {
          CompanionRankModel ranking = CompanionRankModel.fromJson(element);
          _data.add(ranking);
        }
      }
    } catch (e) {
      Log.d('rank/degree request error:$e');
    }

    _lock = false;
    _loading = false;

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _onRefresh() async {
    _page = 1;
    await _load(1);
  }

  Widget _renderExtend() {
    return Container(
      height: 50.0,
      color: R.color.mainBgColor,
      child: Center(
        child: Text(
          (_more && _data.length >= 20) ? K.rank_loading : K.rank_havent_more,
          textScaleFactor: 1.0,
          style:
              TextStyle(fontSize: 12.0, color: Theme.of(context).dividerColor),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_loading) {
      return const Loading();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: RefreshIndicatorFactory.of(
            key: pageKey,
            backgroundColor: R.color.secondBgColor,
            onRefresh: _onRefresh,
            child: CustomScrollView(
              controller: _controller,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: <Widget>[
                if (_needShowDefendWidget())
                  SliverToBoxAdapter(
                    child: Container(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 12),
                      color: R.color.secondBgColor,
                      child: SlpDefendRelationWidget(
                        items: _defendData,
                        uid: widget.uid,
                        refresh: _onRefresh,
                        showSecretGarden: showSecretGarden,
                        showDefendManager: showDefendManager,
                        showIntimateCard: showIntimateCard,
                      ),
                    ),
                  ),
                SliverPersistentHeader(
                  delegate: _SliverPersistentHeaderDelegate(
                      _needShowDefendWidget(),
                      Session.uid == widget.uid,
                      _onRefresh),
                  pinned: true,
                ),
                if (_data.isEmpty || !showRankListByKey(accompanyKey))
                  SliverFillRemaining(
                    child: Container(
                      color: R.color.mainBgColor,
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: EmptyWidget(
                          desc: BaseK.K.base_nothing_in_here,
                          onTap: _onRefresh,
                        ),
                      ),
                    ),
                  ),
                if (showRankListByKey(accompanyKey)) ...[
                  if (_data.isNotEmpty)
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          CompanionRankModel model = _data.elementAt(index);
                          return _buildItem(model, index, false);
                        },
                        childCount: _data.length,
                      ),
                    ),
                  if (_data.isNotEmpty)
                    SliverList(
                        delegate: SliverChildListDelegate([_renderExtend()])),
                ]
              ],
            ),
          ),
        ),
        if (ownModel != null && _data.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(12), topEnd: Radius.circular(12)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x21000000),
                  offset: Offset(0, 2),
                  blurRadius: 16,
                )
              ],
            ),
            child: SafeArea(
              top: false,
              child: Container(
                child: _buildItem(ownModel!, (ownModel!.rank ?? 0) - 1, true),
              ),
            ),
          )
      ],
    );
  }

  Widget _buildItem(CompanionRankModel item, int index, bool ownRank) {
    if (!_keys.containsKey(item.uid)) {
      _keys[(item.uid ?? '')] = ValueKey(item);
    }

    if (ownRank) {
      if (!_keys.containsKey((item.uid ?? '') + item.rank.toString())) {
        _keys[(item.uid ?? '') + item.rank.toString()] = ValueKey(item);
      }
    }

    ValueKey<CompanionRankModel>? key = _keys[item.uid];
    if (ownRank) {
      key = _keys[(item.uid ?? '') + item.rank.toString()];
    }

    String iconUrl = Util.getUserIconUrl(item.icon) ?? '';

    return Slidable(
      key: key,
      direction: Axis.horizontal,
      closeOnScroll: true,
      enabled: Session.uid == widget.uid,
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            label: K.rank_delete,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            autoClose: false,
            onPressed: (context) async {
              bool? result = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ConfirmDialog(
                      title: K.rank_delete,
                      content:
                          K.rank_remove_price_tip([_recoverMoney.toString()]));
                },
              );
              if (result == true) {
                _deleteItemWithIndex(index, item);
              } else {
                Slidable.of(context)?.close();
              }
            },
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, Util.parseInt(item.uid),
              refer: const PageRefer('CompanionRankPage'));
        },
        child: Container(
          height: 72,
          color: R.color.mainBgColor,
          padding: const EdgeInsetsDirectional.only(
              start: 0, end: 10, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              showRankByKey(accompanyKey)
                  ? Container(
                      width: 50,
                      alignment: AlignmentDirectional.center,
                      child: _renderIndex(index),
                    )
                  : const Padding(
                      padding: EdgeInsetsDirectional.only(start: 16)),
              CommonAvatar(path: iconUrl, size: 52, shape: BoxShape.circle),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  item.name ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: R.textStyle.regular16,
                                ),
                              ),
                              const SizedBox(width: 6),
                              UserSexAndAgeWidget(
                                sex: item.sex,
                                age: item.age,
                              ),
                              const SizedBox(width: 2),
                              if (widget.uid == Session.uid)
                                RelationWidget(relation: item.relation ?? 0),
                            ],
                          ),
                        ),
                        if (!ownRank)
                          SizedBox(
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                _rightStatusWidget(item),
                              ],
                            ),
                          )
                      ],
                    ),
                    const SizedBox(height: 6),
                    CompanionValueWidget(item.degree ?? 0, item.stay_secs ?? 0),
                  ],
                ),
              ),
              if (ownRank) _rightPromoteWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _rightPromoteWidget() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ConfirmDialog(
            title: K.rank_intimacy_promote,
            content: K.rank_promote_tips,
            positiveButton: PositiveButton(text: K.rank_know),
            negativeButton: null,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsetsDirectional.fromSTEB(5, 0, 20, 0),
        padding: const EdgeInsetsDirectional.fromSTEB(12, 7, 12, 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
        ),
        child: Text(
          K.rank_promote,
          style:
              R.textStyle.medium12.copyWith(fontSize: 13, color: Colors.white),
        ),
      ),
    );
  }

  Widget _renderIndex(int index) {
    if (index == -2) {
      return NumText(
        K.rank_not_on_list,
        textScaleFactor: 1.0,
        style: R.textStyle.subCaption.copyWith(fontSize: 12),
      );
    } else if (index <= 2) {
      return R.img(
        Assets.rank_rank_x_png(index + 1),
        width: 20.0,
        height: 22,
        package: ComponentManager.MANAGER_RANK,
      );
    } else {
      return NumText(
        "${index + 1}",
        textScaleFactor: 1.0,
        style: R.textStyle.subCaption.copyWith(fontSize: 12),
      );
    }
  }

  Widget _rightStatusWidget(CompanionRankModel item) {
    if ((item.rid ?? 0) > 0 && item.tagInfo != null) {
      return GestureDetector(
        onTap: () {
          IRoomManager roomManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(context, item.rid!,
              from: RoomFrom.companion_list, refer: 'companionlist');
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
          child: InRoomTag(
              label: item.tagInfo?.label ?? '',
              gradientBgColors: item.tagInfo?.bgColors ?? []),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  _deleteItemWithIndex(int index, CompanionRankModel model) async {
    Map<String, String> body = {
      'me': Session.uid.toString(),
      'uid': model.uid ?? ''
    };
    XhrResponse response = await Xhr.postJson(
        '${System.domain}rank/delete', body,
        throwOnError: false);
    if (response.error == null) {
      _data.removeAt(index);
      if (mounted) {
        setState(() {});
      }
    } else {
      Fluttertoast.showCenter(msg: response.error.toString());
    }
  }
}
