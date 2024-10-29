import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay/assets.dart';

import '../k.dart';
import 'package:pulse_log/pulse_log.dart';

class PTSheetWidget extends StatefulWidget {
  final int? accountType;
  final int price;
  final bool showBalance;
  final AsyncValueGetter<bool>? onInterceptClose;

  const PTSheetWidget({
    super.key,
    this.accountType,
    required this.price,
    this.showBalance = true,
    this.onInterceptClose,
  });

  @override
  State<PTSheetWidget> createState() => _PTSheetWidgetState();
}

class _PTSheetWidgetState extends State<PTSheetWidget> {
  static const double _padding = 16.0;
  static const configKey = 'Last_P_Type';
  static const String pSheetTypes = 'p_sheet_types';

  String? _selectedKey;
  BalanceInfo? _balanceInfo;
  bool _isLoading = true;
  List<String>? pTypes;

  @override
  void initState() {
    super.initState();

    String? value = Config.get(pSheetTypes);

    if (value.isEmpty) {
      pTypes = null;
    } else {
      pTypes = value.split(',');
    }

    BalanceInfo.loadBalanceInfo().then((BalanceInfo? balanceInfo) {
      if (mounted && balanceInfo != null) {
        refresh(() {
          _balanceInfo = balanceInfo;

          if (_selectedKey == null) {
            if (!widget.showBalance) {
              _selectedKey = Config.get(configKey, IPayManager.pTAvailable);
              if (_selectedKey == IPayManager.pTAvailable) {
                _selectedKey = IPayManager.pTA;
              }
            } else {
              if (isMoneyEnough) {
                _selectedKey = IPayManager.pTAvailable;
              } else {
                _selectedKey = Config.get(configKey, IPayManager.pTAvailable);
              }
            }

            pTypes = _balanceInfo!.pTypes;

            Config.set(pSheetTypes, pTypes != null && pTypes!.isNotEmpty ? pTypes!.join(',') : '');

            _isLoading = false;
          }
        });
      }
    });
  }

  Widget _buildTitle() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        const SizedBox(height: 56),
        PositionedDirectional(
          top: 0,
          start: 0,
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: R.color.thirdTextColor,
            ),
            onPressed: () async {
              bool shouldClose = widget.onInterceptClose != null ? await widget.onInterceptClose!() : true;
              if (shouldClose) {
                Navigator.of(context).pop(SheetCallback(SheetCloseReason.Active));
              }
            },
          ),
        ),
        Center(
          child: Text(
            K.choose_p_type,
            style: R.textStyle.button,
          ),
        ),
      ],
    );
  }

  String _getIconPath(String key) {
    if (key == IPayManager.pTAvailable) {
      return 'static/normal/ic_b.png';
    } else if (key == IPayManager.pTA) {
      return 'static/normal/ic_z.png';
    } else if (key == IPayManager.pTW) {
      return 'static/normal/ic_w.png';
    } else if (key == IPayManager.ptWd) {
      return 'static/normal/ic_w.png';
    } else if (key == IPayManager.pTAums) {
      return 'static/normal/ic_y.webp';
    } else {
      return 'static/normal/ic_b.png';
    }
  }

  Widget _buildItem(BuildContext context, SheetItem item) {
    return InkWell(
      onTap: () {
        _selectedKey = item.key;
        refresh();
      },
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(_getIconPath(item.key)),
            width: 28,
            height: 28,
          ),
          const SizedBox(width: 12, height: 56),
          ...getLabelAndTag(item),
          if (item.key == (_selectedKey ?? IPayManager.pTAvailable))
            R.img(Assets.pay$ic_check_svg, color: R.color.mainBrandColor, width: 17),
        ],
      ),
    );
  }

  List<Widget> getLabelAndTag(SheetItem item) {
    List<Widget> widgets = [];
    if ((item.key == 'a' 'li') && Util.validStr(_balanceInfo?.aliKa)) {
      widgets.add(Text(item.label, style: R.textStyle.body1));
      widgets.add(const SizedBox(width: 8));
      widgets.add(buildAliKaTag(_balanceInfo?.aliKa ?? ''));
      widgets.add(const Spacer());
    } else {
      widgets.add(Expanded(child: Text(item.label, style: R.textStyle.body1)));
    }
    return widgets;
  }

  Widget buildAliKaTag(String aliKa) {
    return Container(
      height: 24,
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      margin: const EdgeInsetsDirectional.only(bottom: 2),
      alignment: AlignmentDirectional.centerStart,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF71C6F), Color(0xFFFA9E61)],
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
        ),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          bottomStart: Radius.circular(4),
          topEnd: Radius.circular(12),
          bottomEnd: Radius.circular(12),
        ),
      ),
      child: Text(
        aliKa,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white, height: 1.2),
        maxLines: 1,
      ),
    );
  }

  bool get isMoneyEnough => availableMoney >= widget.price;

  Widget _buildBottomButton() {
    String txt =
        !isMoneyEnough && _selectedKey == IPayManager.pTAvailable ? K.to_recharge : '${K.pay}${(widget.price / 100).toStringAsFixed(2)}';

    return InkWell(
      onTap: () {
        if (_selectedKey == null) {
          if (!widget.showBalance) {
            _selectedKey = IPayManager.pTA;
          } else {
            _selectedKey = IPayManager.pTAvailable;
          }
        }
        if (_selectedKey == IPayManager.pTAvailable && !isMoneyEnough) {
          PulseLog.instance.log(PayBody(PayAction.showPMethod, {'type': 'iap-recharge'}, true));
          Navigator.of(context).pop(
            SheetCallback(
              SheetCloseReason.Result,
              -1,
              SheetItem(K.to_recharge, 'iap-recharge'),
              _balanceInfo?.miniId,
            ),
          );
        } else {
          PulseLog.instance.log(PayBody(PayAction.showPMethod, {'type': _selectedKey}, true));
          Navigator.of(context).pop(
            SheetCallback(
              SheetCloseReason.Result,
              -1,
              sheetItems.firstWhere((element) => element.key == _selectedKey),
              _balanceInfo?.miniId,
            ),
          );
        }

        if (_selectedKey != IPayManager.pTAvailable) Config.set(configKey, _selectedKey);
      },
      child: Container(
        height: 48,
        margin: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.alphaBlend(R.color.mainBrandColor, Colors.white.withOpacity(0.5)),
              Color.alphaBlend(R.color.mainBrandColor, Colors.black.withOpacity(0.3))
            ],
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          txt,
          style: R.textStyle.button.copyWith(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<SheetItem> items) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: _padding, end: _padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[...items.map((item) => _buildItem(context, item)), _buildBottomButton()],
      ),
    );
  }

  int get availableMoney {
    int money = 0;
    if (_balanceInfo != null) {
      if (widget.accountType == 1) {
        money = _balanceInfo!.availableOrder;
      } else {
        money = _balanceInfo!.available;
      }
    }
    return money;
  }

  bool canShowByServer(String key) {
    if (pTypes == null) {
      return true;
    }

    return pTypes!.contains(key);
  }

  List<SheetItem> get sheetItems {
    List<SheetItem> res = [];
    if (_isLoading) {
      return res;
    }
    bool useIap = Util.isVerify || Platform.isIOS || Util.isLocale;
    if (widget.showBalance && (useIap || canShowByServer('available'))) {
      res.add(SheetItem("${K.account_balance}(${MoneyConfig.moneyNum(availableMoney, fractionDigits: 2)}${MoneyConfig.moneyName})",
          IPayManager.pTAvailable));
    }

    if (!useIap) {
      if (canShowByServer(IPayManager.pTA) && (!Platform.isAndroid || DeviceInfo.androidSdkInt >= 26)) {
        // Android8.0 以下系统使用支付宝h5支付报错
        res.add(SheetItem(K.string_zhi + K.string_fu + K.string_bao, IPayManager.pTA));
      }

      List<String>? ptWdList = pTypes?.where((item) => item == IPayManager.ptWd).toList();
      if (ptWdList != null && ptWdList.isNotEmpty) {
        res.add(SheetItem(R.string('string_wechat'), IPayManager.ptWd));
      }
      List<String>? ptWList = pTypes?.where((item) => item == IPayManager.pTW).toList();
      if (ptWList != null && ptWList.isNotEmpty) {
        res.add(SheetItem(R.string('string_wechat'), IPayManager.pTW));
      }
      List<String>? pTWH5List = pTypes?.where((item) => item == IPayManager.pTWH5).toList();
      if (pTWH5List != null && pTWH5List.isNotEmpty) {
        res.add(SheetItem(R.string('string_wechat'), IPayManager.pTWH5));
      }
    }
    return res;
  }

  Widget _buildBody() => _buildContent(context, sheetItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(topStart: Radius.circular(16), topEnd: Radius.circular(16)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildTitle(),
            _buildBody(),
          ],
        ),
      ),
    );
  }
}

typedef DataWidgetBuilder<T> = Widget Function(BuildContext context, T data);

class AsyncWidget<T> extends StatelessWidget {
  final AsyncSnapshot<T> snapshot;
  final DataWidgetBuilder<T> builder;
  final VoidCallback? onReload;

  const AsyncWidget({super.key, required this.snapshot, required this.builder, this.onReload});

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasError) {
      return ErrorData(
        error: '${snapshot.error}',
        onTap: onReload,
      );
    }
    if (snapshot.connectionState == ConnectionState.done) {
      return builder(context, snapshot.data as T);
    } else {
      return const CupertinoActivityIndicator();
    }
  }
}
