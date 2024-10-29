import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/src/accost/slp/slp_accost_object.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:message/src/model/pb/generated/slp_gs.pb.dart';
import 'slp_accost_config_action.dart';
import 'slp_accost_rank.dart';
import 'slp_accost_stategy_page.dart';
import 'slp_accost_top_timer_tips.dart';

/// 快乐星球：搭讪配置页面
class SlpAccostConfigPage extends StatefulWidget {
  const SlpAccostConfigPage({super.key});

  static Future openSlpAccostConfigPage(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const SlpAccostConfigPage();
        },
        settings: const RouteSettings(name: 'AccostConfigPage'),
      ),
    );
  }

  @override
  _SlpAccostConfigPageState createState() => _SlpAccostConfigPageState();
}

class _SlpAccostConfigPageState extends State<SlpAccostConfigPage>
    with SingleTickerProviderStateMixin {
  bool _loading = true;
  String? _helpUrl;
  int _cdLeftSecond = 0;
  String? _errorMessage;
  List<StrategyCategory>? _tabList;
  final List<Tab> _tabs = [];
  List<Widget>? _tabViews;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  _load() async {
    ResAutoChatCategory chatCategory = await MessageRepo.bbAccostConfigTab();
    if (chatCategory.success) {
      _helpUrl = chatCategory.help;
      _tabList = chatCategory.list;
      _cdLeftSecond = chatCategory.cdLeftSecond;
      if (!Util.isCollectionEmpty(_tabList)) {
        safeRun(() {
          _tabController = TabController(length: _tabList!.length, vsync: this);
        });
        _tabs.clear();
        _tabList?.forEach((element) {
          _tabs.add(Tab(
            text: element.categoryName,
          ));
        });
      }
    } else {
      _errorMessage = chatCategory.msg;
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  _reload() {
    setState(() {
      _errorMessage = null;
      _loading = true;
    });
    _load();
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
          K.msg_auto_accost,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: _buildActions(),
      ),
      body: _buildBody(),
    );
  }

  List<Widget> _buildActions() {
    return [
      if (showRankListByKey(autoChatKey))
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const BbAccostRankWidget(),
              settings: const RouteSettings(name: '/accost_rank'),
            ));
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: 24,
            height: 24,
            margin: const EdgeInsetsDirectional.only(end: 16),
            alignment: AlignmentDirectional.center,
            child: R.img('ic_accost_rank_bar_icon.png',
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_MESSAGE),
          ),
        ),
      GestureDetector(
        onTap: _onTapAction,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: 24,
          height: 24,
          margin: const EdgeInsetsDirectional.only(end: 16),
          alignment: AlignmentDirectional.center,
          child: R.img('ic_accost_action.webp',
              width: 24, height: 24, package: ComponentManager.MANAGER_MESSAGE),
        ),
      ),
    ];
  }

  void _onTapAction() {
    List<BbAccostConfigActionItem> data = [];

    /// 功能说明
    data.add(BbAccostConfigActionItem(
        show: Util.validStr(_helpUrl),
        icon: 'ic_accost_help.webp',
        name: K.msg_accost_help,
        onTap: () {
          if (_helpUrl != null) {
            BaseWebviewScreen.show(context, url: _helpUrl!);
          }
        }));

    /// 数据中心
    data.add(BbAccostConfigActionItem(
        show: true,
        icon: 'ic_accost_data_center.webp',
        name: K.msg_accost_data_center,
        onTap: () {
          BaseWebviewScreen.show(context,
              url:
                  '${System.getWebDomain("page")}/tools/back-stage/gs/accost?uid=${Session.uid}');
        }));

    /// 交友对象
    data.add(BbAccostConfigActionItem(
        show: true,
        icon: 'ic_accost_object.webp',
        name: K.msg_accost_object,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const BbAccostObjectWidget(),
            settings: const RouteSettings(name: '/accost_object'),
          ));
        }));

    BbAccostConfigActionWidget.show(context, data);
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(
        error: _errorMessage,
        onTap: () {
          _reload();
        },
        fontColor: R.colors.secondTextColor,
      );
    }

    if (Util.isCollectionEmpty(_tabList)) {
      return EmptyWidget(
        textColor: R.colors.secondTextColor,
      );
    }

    return Column(
      children: [
        if (_cdLeftSecond > 0)
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 16, top: 8, bottom: 8),
            child: BBAccostTopTimerTips(duration: _cdLeftSecond),
          ),
        SizedBox(
          width: Util.width,
          height: 44,
          child: CommonTabBar(
            tabs: _tabs,
            controller: _tabController,
            isScrollable: true,
            labelColor: R.color.mainTextColor,
            unselectedLabelColor: R.color.secondTextColor,
            labelStyle: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(
                color: R.color.secondTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            indicator: CommonUnderlineTabIndicator(
                borderSide:
                    BorderSide(width: 3.0, color: R.color.mainBrandColor),
                insets: const EdgeInsetsDirectional.only(bottom: 0),
                wantWidth: 16,
                draggingWidth: 12.0),
            indicatorWeight: 0,
            marginStart: 10,
            marginEnd: 60,
            labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _buildTabviews(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTabviews() {
    if (_tabViews != null) {
      return _tabViews!;
    }

    _tabViews = [];
    _tabList?.forEach((element) {
      _tabViews!.add(BbAccostConfigTab(
        categoryId: element.categoryId,
      ));
    });
    return _tabViews!;
  }
}

class BbAccostConfigTab extends StatefulWidget {
  final int categoryId;

  const BbAccostConfigTab({super.key, required this.categoryId});

  @override
  _BbAccostConfigTabState createState() {
    return _BbAccostConfigTabState();
  }
}

class _BbAccostConfigTabState extends State<BbAccostConfigTab> {
  bool _loading = true;
  String? _errorMessage;
  List<GsAutoChatStrategy> _strategyList = [];
  final int maxCount = 5; //最多可添加5个策略
  GsAutoChatData? _config;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    ResGsAutoChat rsp = await MessageRepo.bbAccostConfigList(widget.categoryId);
    if (rsp.success) {
      _config = rsp.data;
      if (_config?.strategies != null) {
        _strategyList = _config!.strategies;
      }
    } else {
      _errorMessage = rsp.msg;
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  _reload() {
    setState(() {
      _errorMessage = null;
      _loading = true;
    });
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.colors.secondTextColor,
        onTap: () {
          _reload();
        },
      );
    }

    if (_config == null) {
      return EmptyWidget(
        textColor: R.colors.secondTextColor,
      );
    }

    bool empty = Util.isCollectionEmpty(_strategyList);

    return Column(
      children: [
        _buildTopNotify(),
        Expanded(
          child: empty
              ? _buildEmpty()
              : ListView.separated(
                  itemBuilder: (ctx, index) => _buildStrategyItem(index),
                  separatorBuilder: (ctx, index) => const SizedBox(
                    height: 6,
                  ),
                  itemCount: _strategyList.length,
                ),
        ),
        if (!empty)
          Column(
            children: [
              _buildAddBtn(),
              const SizedBox(
                height: 12,
              ),
              Text(
                K.msg_accost_config_max_tip,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFFCA252),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 20,
              )
            ],
          ),
      ],
    );
  }

  Widget _buildTopNotify() {
    return Container(
      height: 48,
      margin: const EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        top: 8,
        bottom: 12,
      ),
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          R.img(
            'ic_accost_notify.png',
            package: ComponentManager.MANAGER_MESSAGE,
            width: 32,
            height: 32,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            K.msg_accost_config_top_tip_prefix,
            style: TextStyle(
                fontSize: 13,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w500),
          ),
          Text(
            ' ${_config?.chatNumToday ?? 0} ',
            style: const TextStyle(
                fontSize: 13,
                color: Color(0xFFFCA252),
                fontWeight: FontWeight.w500),
          ),
          Text(
            K.msg_accost_config_top_tip_postfix,
            style: TextStyle(
                fontSize: 13,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        R.img(
          'bb_null.webp',
          package: ComponentManager.MANAGER_BASE_CORE,
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 258,
          child: Text(
            K.msg_accost_config_empty_tip,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: R.color.secondTextColor),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        _buildAddBtn(),
        SizedBox(
          height: Util.statusHeight + kToolbarHeight,
        ),
      ],
    );
  }

  Widget _buildAddBtn() {
    return GradientButton(
      K.msg_add_accost_strategy,
      width: 200,
      height: 52,
      onTap: () async {
        if (_strategyList.length >= maxCount) {
          Fluttertoast.showToast(msg: K.msg_accost_config_max_tip);
        } else {
          bool ok = await BbAccostStrategyPage.openBbAccostStrategyPage(
            context,
            categoryId: widget.categoryId,
            strategyName: '${K.msg_accost_strategy}${_strategyList.length + 1}',
          );
          if (ok == true) {
            _reload();
          }
        }
      },
    );
  }

  Widget _buildStrategyItem(int index) {
    GsAutoChatStrategy item = _strategyList[index];
    List<int> msgTypeList = [0, 0, 0];
    for (int i = 0; i < item.msgTypeList.length; i++) {
      msgTypeList[i] = item.msgTypeList[i];
    }

    double nameMaxWidth =
        Util.width - 149 - ((item.state == 0) || (item.state == 2) ? 70 : 0);

    return Container(
      height: 179,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 6),
      padding: const EdgeInsetsDirectional.only(
        start: 12,
        end: 12,
        top: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildRatio(item),
              const SizedBox(
                width: 3,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: nameMaxWidth),
                        child: Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 16,
                              color: R.color.mainTextColor,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildStatusText(item.state),
                      const Spacer(),
                      const SizedBox(
                        width: 3,
                      ),
                      _buildEditBtn(item),
                      const SizedBox(
                        width: 6,
                      ),
                      _buildDeleteBtn(item),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        '${K.msg_accost_grade}:',
                        style: TextStyle(
                            fontSize: 11, color: R.color.secondTextColor),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      _buildGradeText(item.grade),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${K.msg_open_rate}:',
                        style: TextStyle(
                            fontSize: 11, color: R.color.secondTextColor),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      _buildRateText(item.openRate),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${K.msg_reply_rate}:',
                        style: TextStyle(
                            fontSize: 11, color: R.color.secondTextColor),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      _buildRateText(item.replyRate),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${K.msg_answer_rate}:',
                        style: TextStyle(
                            fontSize: 11, color: R.color.secondTextColor),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      _buildRateText(item.answerRate),
                    ],
                  ),
                ],
              )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 0.5,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMsgTypeItem(msgTypeList[0], 0),
              _buildArrow(),
              _buildMsgTypeItem(msgTypeList[1], 1),
              _buildArrow(),
              _buildMsgTypeItem(msgTypeList[2], 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGradeText(int grade) {
    if (grade == 1) {
      return const Text(
        'S',
        style: TextStyle(
            fontSize: 13,
            color: Color(0xFFFD7B08),
            fontWeight: FontWeight.w600),
      );
    } else if (grade == 2) {
      return const Text(
        'A',
        style: TextStyle(
            fontSize: 13,
            color: Color(0xFFFF5F7D),
            fontWeight: FontWeight.w600),
      );
    } else if (grade == 3) {
      return const Text(
        'B',
        style: TextStyle(
            fontSize: 13,
            color: Color(0xFF5D43F7),
            fontWeight: FontWeight.w600),
      );
    } else if (grade == 4) {
      return const Text(
        'C',
        style: TextStyle(
            fontSize: 13,
            color: Color(0xFF1DDD8D),
            fontWeight: FontWeight.w600),
      );
    }
    return Text(
      K.msg_not_yet,
      style: TextStyle(fontSize: 11, color: R.color.secondTextColor),
    );
  }

  Widget _buildRateText(String? rate) {
    if (rate != null && rate.isNotEmpty) {
      return Text(
        rate,
        style: TextStyle(
            fontSize: 13,
            color: R.color.mainTextColor,
            fontWeight: FontWeight.w600),
      );
    } else {
      return Text(
        K.msg_not_yet,
        style: TextStyle(fontSize: 11, color: R.color.secondTextColor),
      );
    }
  }

  Widget _buildRatio(GsAutoChatStrategy item) {
    bool select = item.strategyId == _config?.selectedStrategyId;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        setState(() {
          _config?.selectedStrategyId = select ? 0 : item.strategyId;
        });
        ResGsNull rsp = await MessageRepo.selectBbAccostStrategy(
            select ? 0 : item.strategyId, widget.categoryId);
        if (!rsp.success) {
          Fluttertoast.showToast(msg: rsp.msg);
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 5, bottom: 5, end: 5),
        child: R.img(
          select ? 'ic_accost_ratio_sel.svg' : 'ic_accost_ratio_nor.svg',
          package: ComponentManager.MANAGER_MESSAGE,
          width: 20,
          height: 20,
        ),
      ),
    );
  }

  Widget _buildStatusText(int status) {
    if (status == 0) {
      return Text(
        K.msg_accost_auditing_tip,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFFFD7B08),
        ),
      );
    } else if (status == 2) {
      return Text(
        K.msg_accost_audit_fail_tip,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFFFF5F7D),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildEditBtn(GsAutoChatStrategy item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        bool ok = await BbAccostStrategyPage.openBbAccostStrategyPage(context,
            strategyId: item.strategyId,
            strategyName: item.name,
            categoryId: widget.categoryId);
        if (ok == true) {
          _reload();
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 5, bottom: 5, start: 5, end: 5),
        child: R.img(
          'ic_accost_edit.svg',
          package: ComponentManager.MANAGER_MESSAGE,
          width: 20,
          height: 20,
          color: R.color.mainTextColor,
        ),
      ),
    );
  }

  Widget _buildDeleteBtn(GsAutoChatStrategy item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        bool? result = await showDialog(
          context: context,
          builder: (context) => ConfirmDialog(
            title: K.msg_accost_confirm_delete_strategy,
          ),
        );
        if (result == true) {
          ResGsNull rsp = await MessageRepo.deleteBbAccostStrategy(
              item.strategyId, widget.categoryId);
          if (rsp.success) {
            setState(() {
              _strategyList.remove(item);
            });
          } else {
            Fluttertoast.showToast(msg: rsp.msg);
          }
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 5, bottom: 5, start: 5),
        child: R.img(
          'ic_accost_delete.svg',
          package: ComponentManager.MANAGER_MESSAGE,
          width: 20,
          height: 20,
          color: R.color.secondTextColor,
        ),
      ),
    );
  }

  Widget _buildMsgTypeItem(int type, int index) {
    List<Color> colors;
    String image;
    String text;
    if (type == 1) {
      colors = [
        const Color(0xFF65C3FF).withOpacity(0.1),
        const Color(0xFF61B0FF).withOpacity(0.1)
      ];
      image = 'ic_accost_text.png';
      text = '${index + 1}.${K.msg_text_accost}';
    } else if (type == 2) {
      colors = [
        const Color(0xFFFFCC6E).withOpacity(0.1),
        const Color(0xFFFF9435).withOpacity(0.1)
      ];
      image = 'ic_accost_voice.png';
      text = '${index + 1}.${K.msg_voice_accost}';
    } else if (type == 3) {
      colors = [
        const Color(0xFFDC6CFF).withOpacity(0.1),
        const Color(0xFFFF99C8).withOpacity(0.1)
      ];
      image = 'ic_accost_image.png';
      text = '${index + 1}.${K.msg_image_accost}';
    } else {
      colors = [R.color.secondBgColor, R.color.secondBgColor];
      image = 'ic_accost_empty.png';
      text = '${index + 1}.${K.msg_not_yet}';
    }
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          margin: const EdgeInsetsDirectional.only(start: 6, end: 6),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: colors,
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
          child: R.img(
            image,
            package: ComponentManager.MANAGER_MESSAGE,
            width: 32,
            height: 32,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 12, color: R.color.secondTextColor),
        ),
      ],
    );
  }

  Widget _buildArrow() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 18, end: 22, bottom: 26),
      child: R.img(
        'ic_accost_arrow.svg',
        package: ComponentManager.MANAGER_MESSAGE,
        width: 12,
        height: 12,
      ),
    );
  }
}
