import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';

import '../../k.dart';
import 'package:shared/k.dart' as BaseK;

/// 开通守护 底部弹窗
class UserDefendBuy extends StatefulWidget {
  final int uid;

  /// 打开面板
  static Future<bool?> showUserDefendBuy(BuildContext context, {int uid = 0}) {
    return displayModalBottomSheet(
      maxHeightRatio: 1,
      context: context,
      builder: (BuildContext context) {
        return UserDefendBuy(
          uid: uid,
        );
      },
    );
  }

  const UserDefendBuy({
    Key? key,
    this.uid = 0,
  }) : super(key: key);

  @override
  _UserDefendBuyState createState() => _UserDefendBuyState();
}

class _UserDefendBuyState extends State<UserDefendBuy> {
  static const String DEFEND_BUY_KEY = 'userdefend';

  bool _loading = true;
  String? _errorMessage;
  int _positionIndex = 1;
  List? _data; // 已购买的守护信息
  bool _tryUseAvailable = false;

  bool _disposed = false;

  DefendRelationModel? _selectConfig;

  List<DefendRelationModel>? _configs;

  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  @override
  void initState() {
    super.initState();
    _loadDefendConfig();
  }

  @override
  void dispose() {
    _disposed = true;
    _payManager.dispose(DEFEND_BUY_KEY);
    super.dispose();
  }

  void _refresh() {
    if (!mounted) return;
    setState(() {});
  }

  _loadDefendConfig() async {
    ProfileDefendResponse response =
        await BaseRequestManager.getDefendProfile(widget.uid);

    if (response.success == true) {
      Map value = response.data;
      int positionIndex = 1;
      List<int> ids = [];
      List data = value['data']; // 已经开通的守护
      for (var v in data) {
        Map vv = v;
        ids.add(Util.parseInt(vv['position']));
      }
      _data = data;
      _configs = response.defendConfigs;
      // 加载优惠券信息
      if (response.commodities != null) {
        _configs?.forEach((val) {
          var tmp = response.commodities[val.position.toString()];
          if (tmp != null && tmp is Map) {
            val.couponModel =
                DefendCouponModel.fromJson(tmp as Map<String, dynamic>);
          }
        });
      }

      /// 选中已购买的第一个守护
      if (ids.isNotEmpty) {
        ids.sort();
        positionIndex = ids[0];
      }
      _positionIndex = positionIndex;
      _selectConfig = _configs?.firstWhereOrNull((DefendRelationModel config) {
        return config.position == positionIndex;
      });

      if (_selectConfig == null) {
        if (_configs != null && _configs!.isNotEmpty) {
          _selectConfig = _configs![0];
          _positionIndex = _selectConfig?.position ?? 0;
        }
      }
    } else {
      _errorMessage = response.msg;
    }

    _loading = false;

    if (mounted) setState(() {});
  }

  int targetUid = 0;

  /// 购买\续费 守护
  _onSubmit() async {
    if (Session.uid == widget.uid) {
      /// 在自己的页面开守护，需要选开通守护的对象
      targetUid = 0;
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      await roomManager.showContactSelectScreen(context, (BuildContext context,
          List<int> uidList, List<bool> isGroupList, Map room) async {
        // if (uidList == null || uidList.isEmpty) {
        //   Fluttertoast.showToast(msg: K.please_select_friend_to_give, gravity: ToastGravity.CENTER);
        //   return;
        // }
        if (uidList.isNotEmpty) {
          targetUid = uidList[0];
        }
        Navigator.of(context).pop(true);
      }, onlySelectOne: true, hideGroupTab: true);

      if (targetUid == 0) {
        return;
      }
    }

    if (_selectConfig?.couponModel != null &&
        _selectConfig!.couponModel!.couponId > 0) {
      _tryUseAvailable = true;
      _payNormal('available');
    } else {
      _displayPayDefend();
    }
  }

  void _displayPayDefend() async {
    //支付
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, _selectConfig?.payMoney ?? 0);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }
    _payNormal(result.value?.key ?? '');
  }

  /// 守护支付
  _payNormal(String type) {
    int uid = widget.uid;
    if (Session.uid == widget.uid && targetUid > 0) {
      /// 自己的页面给别人开守护
      uid = targetUid;
    }
    _payManager.pay(
      context,
      key: DEFEND_BUY_KEY,
      type: type,
      args: {
        'money': _selectConfig?.money,
        'type': 'defend',
        'params': {
          'defend': _positionIndex,
          'to': uid,
          'cid': _selectConfig?.couponModel?.couponId ?? 0,
          'duction_money': _selectConfig?.couponModel?.ductionMoney ?? 0,
          'unified_relation_version': 1
        }
      },
      onPayed: _onPayed,
      onError: _onPayError,
    );
  }

  void _onPayed() {
    if (_disposed) return;
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(true);
    }
    Fluttertoast.showToast(
        msg: K.common_open_succ, gravity: ToastGravity.CENTER);
  }

  void _onPayError(bool isErrorCatch) {
    if (_disposed) return;
    if (_tryUseAvailable == true) {
      _tryUseAvailable = false;
      _displayPayDefend();
    }
  }

  _onItemTaped(DefendRelationModel config) {
    if (_positionIndex == config.position) {
      return;
    }
    _positionIndex = config.position ?? 0;
    _selectConfig = config;
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          color: R.color.mainBgColor,
        ),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return Container(
        alignment: Alignment.center,
        height: 258,
        child: const CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null && _errorMessage!.isNotEmpty) {
      return Container(
        alignment: Alignment.center,
        height: 258,
        child: ErrorData(
          error: _errorMessage,
        ),
      );
    }

    Map? alreadyBuy;
    try {
      alreadyBuy = _data?.firstWhereOrNull((dynamic config) {
        return config['position'] == _positionIndex;
      });
    } catch (e) {}

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 17.0, bottom: 29),
          child: Row(
            children: [
              const SizedBox(
                width: 44,
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Text(
                K.personal_select_defend_relation,
                style: R.textStyle.medium16,
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              GestureDetector(
                onTap: () {
                  String url = Util.getHelpUrlWithQStr('k63');
                  BaseWebviewScreen.show(context, url: url);
                },
                child: R.img('ic_info.svg',
                    color: R.color.mainTextColor,
                    width: 24,
                    height: 24,
                    package: ComponentManager.MANAGER_BASE_ROOM),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.count(
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
            children: _configs?.map((DefendRelationModel config) {
                  return GestureDetector(
                    key: ValueKey(config.position),
                    onTap: () => _onItemTaped(config),
                    child: _DefendItem(
                      config: config,
                      selected: _positionIndex == config.position,
                    ),
                  );
                }).toList() ??
                [],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _buildBottom(alreadyBuy ?? {}),
      ],
    );
  }

  Widget _buildBottom(Map alreadyBuy) {
    String title = K.buy_defend;
    title = K.common_renew;
    return GestureDetector(
      onTap: _onSubmit,
      child: Container(
        margin: const EdgeInsetsDirectional.only(
            start: 20, end: 20, top: 12, bottom: 20),
        alignment: AlignmentDirectional.center,
        height: 48,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$title ',
              style: R.textStyle.medium16.copyWith(color: Colors.white),
            ),
            Text(
              '(${_selectConfig?.hasDefendCoupon == true ? _selectConfig?.couponPrice : _selectConfig?.originPrice}',
              style: R.textStyle.medium14.copyWith(color: Colors.white),
            ),
            if (_selectConfig?.hasDefendCoupon == true)
              Text(
                ' ',
                style: R.textStyle.medium14.copyWith(color: Colors.white),
              ),
            if (_selectConfig?.hasDefendCoupon == true)
              Text(
                '${_selectConfig?.originPrice}',
                style: R.textStyle.medium14.copyWith(
                  color: Colors.white,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            Text(
              Util.isVerify == true ? ')' : '/${BaseK.K.seven_days})',
              style: R.textStyle.medium14.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

/// 守护item
class _DefendItem extends StatelessWidget {
  final DefendRelationModel? config;
  final OnTapCallback? onTapCallback;
  final bool selected;

  const _DefendItem(
      {Key? key, this.config, this.selected = false, this.onTapCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          decoration: selected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: R.color.mainBrandColor, width: 2),
                )
              : null,
        ),
        DefendRelationHeader(
          defendRelationModel: config,
          showBorderIcon: true,
          iconSize: 68 * Util.ratio,
        ),
        if (config?.hasDefendUse == true)
          PositionedDirectional(
            top: 6,
            end: 6,
            width: 28,
            height: 14,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
                color: Color(0xFFFF305B),
              ),
              alignment: Alignment.center,
              child: Text(
                '${config?.couponModel?.num ?? 0}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        if (config?.hasDefendCoupon == true)
          PositionedDirectional(
              top: 6,
              end: 6,
              width: 28,
              height: 14,
              child: Coupon(
                size: const Size(28, 14),
                color: const Color(0xFFFF305B),
                child: Container(
                  width: 28,
                  height: 14,
                  alignment: Alignment.center,
                  child: Text(
                    '${config?.couponModel?.num ?? 0}',
                    style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
      ],
    );
  }
}
