import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:message/src/model/accost_config.dart';
import 'package:message/src/model/accost_strategy_item.dart';
import 'accost_strategy_page.dart';
import 'package:provider/provider.dart' hide Selector;

/// 自动搭讪主设置页
class AccostConfigPage extends StatefulWidget {
  const AccostConfigPage({super.key});

  static Future openAccostConfigPage(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const AccostConfigPage();
        },
        settings: const RouteSettings(name: 'AccostConfigPage'),
      ),
    );
  }

  @override
  _AccostConfigPageState createState() => _AccostConfigPageState();
}

class _AccostConfigPageState extends State<AccostConfigPage> {
  bool _loading = true;
  String? _errorMessage;
  List<AccostStrategyItem> _strategyList = [];
  final int maxCount = 5; //最多可添加5个策略
  AccostConfig? _config;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    DataRsp<AccostConfig> rsp = await MessageRepo.accostConfigList();
    if (rsp.success == true) {
      context.read<ProfilePayload>().setAutoAccostRedPoint(false);
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
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        title: Text(
          K.msg_auto_accost,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: R.colors.mainTextColor),
        ),
        actions: _config?.help != null && _config?.help?.isNotEmpty == true
            ? _buildActions()
            : null,
      ),
      body: _buildBody(),
    );
  }

  List<Widget> _buildActions() {
    return [
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          BaseWebviewScreen.show(context, url: _config!.help!);
        },
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 8, end: 16, top: 5, bottom: 5),
            child: R.img(
              'ic_intro.svg',
              package: ComponentManager.MANAGER_MESSAGE,
              width: 24,
              height: 24,
              color: R.colors.mainTextColor,
            ),
          ),
        ),
      ),
    ];
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
                    height: 12,
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
    String? msg = _config?.warningMsg;
    return Container(
      height: 48,
      margin: const EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        bottom: 12,
      ),
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        color: R.colors.moduleBgColor,
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
          if (Util.isStringEmpty(msg)) ...[
            Text(
              K.msg_accost_config_top_tip_prefix,
              style: TextStyle(
                  fontSize: 13,
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              ' ${_config!.chatNumToday} ',
              style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFFCA252),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              K.msg_accost_config_top_tip_postfix,
              style: TextStyle(
                  fontSize: 13,
                  color: R.colors.mainTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ],
          if (!Util.isStringEmpty(msg))
            Expanded(
              child: Text(
                msg!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13,
                    color: R.colors.mainTextColor,
                    fontWeight: FontWeight.w500),
              ),
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
            style: TextStyle(fontSize: 16, color: R.colors.secondTextColor),
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
          bool ok = await AccostStrategyPage.openAccostStrategyPage(
            context,
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
    AccostStrategyItem item = _strategyList[index];
    List<int> msgTypeList = [0, 0, 0];
    for (int i = 0; i < item.msgTypeList.length; i++) {
      msgTypeList[i] = item.msgTypeList[i];
    }
    return Container(
      height: 179,
      margin: const EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
      ),
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
                      Text(
                        item.name ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            color: R.colors.mainTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      _buildStatusText(item.state),
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
                            fontSize: 11, color: R.colors.secondTextColor),
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
                            fontSize: 11, color: R.colors.secondTextColor),
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
                            fontSize: 11, color: R.colors.secondTextColor),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      _buildRateText(item.replyRate),
                    ],
                  ),
                ],
              )),
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
      style: TextStyle(fontSize: 11, color: R.colors.secondTextColor),
    );
  }

  Widget _buildRateText(String? rate) {
    if (rate != null && rate.isNotEmpty) {
      return Text(
        rate,
        style: TextStyle(
            fontSize: 13,
            color: R.colors.mainTextColor,
            fontWeight: FontWeight.w600),
      );
    } else {
      return Text(
        K.msg_not_yet,
        style: TextStyle(fontSize: 11, color: R.colors.secondTextColor),
      );
    }
  }

  Widget _buildRatio(AccostStrategyItem item) {
    bool select = item.strategyId == _config?.selectedStrategyId;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        NormalNull rsp = await MessageRepo.selectAccostStrategy(
            select ? 0 : item.strategyId);
        if (!rsp.success) {
          Fluttertoast.showToast(msg: rsp.msg ?? '');
        } else {
          setState(() {
            _config?.selectedStrategyId = select ? 0 : item.strategyId;
          });
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

  Widget _buildEditBtn(AccostStrategyItem item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        bool ok = await AccostStrategyPage.openAccostStrategyPage(context,
            strategyId: item.strategyId, strategyName: item.name ?? '');
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
          color: R.colors.mainTextColor,
        ),
      ),
    );
  }

  Widget _buildDeleteBtn(AccostStrategyItem item) {
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
          NormalNull rsp =
              await MessageRepo.deleteAccostStrategy(item.strategyId);
          if (rsp.success) {
            setState(() {
              _strategyList.remove(item);
            });
          } else {
            Fluttertoast.showToast(msg: rsp.msg ?? '');
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
          color: R.colors.secondTextColor,
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
      colors = [R.colors.secondBgColor, R.colors.secondBgColor];
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
          style: TextStyle(fontSize: 12, color: R.colors.secondTextColor),
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
