import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../k.dart';
import 'package:pulse_log/pulse_log.dart';

class NobilityBuyDialog extends StatefulWidget {
  final VoidCallback? onPayed;

  const NobilityBuyDialog({super.key, this.onPayed});

  @override
  _NobilityBuyDialogState createState() => _NobilityBuyDialogState();

  static Future show(BuildContext context, {VoidCallback? onPayed}) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      disableTapDismissible: true,
      defineBarrierColor: const Color(0xFF000000).withOpacity(0.2),
      builder: (BuildContext context) => NobilityBuyDialog(onPayed: onPayed),
    );
  }
}

class _NobilityBuyDialogState extends State<NobilityBuyDialog> {
  int _selectedId = 0;
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  NobilityMealsResponse? _response;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _payManager.dispose('title');
    super.dispose();
  }

  _loadData() async {
    _response = await NobilityRepository.getNobilitySubscribeList();
    if (mounted) {
      if (_response!.success == true) {
        if (_response?.items?.isNotEmpty ?? false) {
          _selectedId = (_response?.items?.first.mealId ?? 0);
        }
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => _buildContent();

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 35,
          height: 1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x001C1C1E), Color(0xFFF4D49C)])),
        ),
        const SizedBox(width: 1),
        Text(
          K.nobility_privilege,
          style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFF4D49C),
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 1),
        Container(
          width: 35,
          height: 1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFF4D49C), Color(0x001C1C1E)])),
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (_response == null) {
      return const Center(child: Loading());
    }

    if (_response!.success == false) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: const Color(0xFF2A292E),
            child: Center(
              child: ErrorData(
                error: _response?.msg ?? base.K.server_return_error_retry,
                onTap: _loadData,
              ),
            ),
          ),
        ],
      );
    }

    if (_response!.items == null || _response!.items!.isEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: const Color(0xFF2A292E),
            child: Center(
              child: ErrorData(
                error: base.K.no_data,
                onTap: _loadData,
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF2A292E),
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16), topEnd: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          _buildTitle(),
          const SizedBox(height: 15),
          Container(
              alignment: AlignmentDirectional.centerStart,
              child: _buildMeals()),
          _buildAgreement(),
          const SizedBox(height: 18),
          _buildOpenNobilityButton(),
          if (BaseConfig.instance.showAutoBuyProtocol) ...[
            const SizedBox(height: 8),
            _autoBuyProtocolWidgets,
          ],
          SizedBox(height: Util.iphoneXBottom + 12),
        ],
      ),
    );
  }

  Widget _buildAgreement() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 11.0),
          Text(
            K.vip_renewing_subscriptions_desc,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 11.0,
                color: Color(0xB3FFFFFF),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          ..._buyDeclarationLabels,
        ],
      ),
    );
  }

  Widget _buildMeals() {
    List<Widget> widgets = [];
    if (_response!.items != null) {
      for (var element in _response!.items!) {
        widgets.add(const SizedBox(width: 16));
        widgets.add(_buildMealItem(element));
      }
    }
    widgets.add(const SizedBox(width: 16));

    if ((_response?.items?.length ?? 0) <= 3) {
      return Center(
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets),
      );
    }
    return SingleChildScrollView(
      padding: const EdgeInsetsDirectional.only(top: 8),
      scrollDirection: Axis.horizontal,
      child: Center(
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets),
      ),
    );
  }

  Widget _buildMealItem(MealInfo item) {
    return GestureDetector(
      onTap: () {
        _selectedId = item.mealId;
        refresh();
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 90,
            height: 116,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              gradient: const LinearGradient(
                colors: [Color(0xFFF9D9A1), Color(0xFFDBAD5D)],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: const Color(0xFF2A292E),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: (_selectedId == item.mealId)
                      ? const Color(0x4DF0CE93)
                      : const Color(0xFF2A292E),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 14),
                    Text(
                      item.name ?? '',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.only(bottom: 6),
                          child: Text(
                            '￥',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFF0CE93)),
                          ),
                        ),
                        Text(
                          _response!.isFirst
                              ? '${item.showFirstPrice}'
                              : '${item.showPrice}',
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF0CE93)),
                        ),
                      ],
                    ),
                    if (item.desc != null && item.desc!.isNotEmpty)
                      _buildDescText(item)
                    else
                      _buildDiscountsInfo(item),
                  ],
                ),
              ),
            ),
          ),
          if (item.tag != null && item.tag!.isNotEmpty)
            PositionedDirectional(end: 0, top: -8, child: _buildTag(item))
        ],
      ),
    );
  }

  Widget _buildDescText(MealInfo item) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 2, end: 2),
      child: Text(
        item.desc ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF909096),
        ),
      ),
    );
  }

  String discountPrice(MealInfo item) {
    if (_response!.isFirst) {
      return item.oriPrice != item.firstPrice
          ? ('￥' '${item.showOriPrice}')
          : '';
    } else {
      return item.oriPrice != item.price ? ('￥' '${item.showOriPrice}') : '';
    }
  }

  Widget _buildDiscountsInfo(MealInfo item) {
    return Text(
      discountPrice(item),
      style: const TextStyle(
          fontSize: 15,
          color: Color(0xFFF0CE93),
          decoration: TextDecoration.lineThrough),
    );
  }

  Widget _buildTag(MealInfo item) {
    return Container(
      height: 17,
      alignment: Alignment.center,
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(8.5),
          topEnd: Radius.circular(8.5),
          bottomEnd: Radius.circular(8.5),
        ),
        gradient:
            LinearGradient(colors: [Color(0xFFF76394), Color(0xFFFFB645)]),
      ),
      child: Text(
        item.tag ?? '',
        style: const TextStyle(
            fontSize: 9, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }

  void _showConfirmDialog() async {
    bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: K.vip_confirm_open,
          contentBuilder: (context) {
            return Padding(
              padding: const EdgeInsetsDirectional.only(top: 10),
              child: Text.rich(TextSpan(
                style: TextStyle(fontSize: 14, color: R.color.mainTextColor),
                children: [
                  TextSpan(text: K.vip_plz_read_and_agree),

                  /// 自动续费服务协议
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        BaseWebviewScreen.show(
                          context,
                          url: Util.getHelpUrlWithQStr('k94'),
                          title: K.vip_auto_renewing_url_title,
                        );
                      },
                      child: Text(
                        K.vip_auto_renewing_url_title,
                        style: TextStyle(
                          fontSize: 14,
                          color: R.color.mainBrandColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  const TextSpan(text: '、'),

                  /// 用户服务协议
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () => BaseWebviewScreen.show(
                        context,
                        url: Util.licenseUrl(LicenseType.USER_AGREEMENT2),
                        title: base.K.setting_user_protcol_agreement2,
                      ),
                      child: Text(
                        base.K.setting_user_protcol_agreement2,
                        style: TextStyle(
                          fontSize: 14,
                          color: R.color.mainBrandColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  TextSpan(text: base.K.base_and),

                  /// 隐私政策
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () => BaseWebviewScreen.show(
                        context,
                        url: Util.licenseUrl(LicenseType.USER_AGREEMENT3),
                        title: base.K.setting_user_protcol_agreement3,
                      ),
                      child: Text(
                        base.K.setting_user_protcol_agreement3,
                        style: TextStyle(
                          fontSize: 14,
                          color: R.color.mainBrandColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            );
          },
          negativeButton: const NegativeButton(),
          positiveButton: PositiveButton(text: K.vip_continue_open),
        );
      },
    );
    if (result == true) {
      _onBuyNobility();
    }
  }

  _buildOpenNobilityButton() {
    return GestureDetector(
      onTap: Platform.isAndroid ? _showConfirmDialog : _onBuyNobility,
      child: Container(
        height: 44,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFF5D39F), Color(0xFFF6C068)]),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          K.vip_confrim_protocol_and_buy,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF533400),
          ),
        ),
      ),
    );
  }

  MealInfo? get currentSelectedMeal {
    if (_response?.items == null || _response!.items!.isEmpty) return null;
    MealInfo? item;
    for (MealInfo e in _response!.items!) {
      if (_selectedId == e.mealId) {
        item = e;
      }
    }
    return item;
  }

  void _onBuyNobility() async {
    if(Platform.isIOS){
      Fluttertoast.showToast(msg:'IOS暂时无法充值，请联系客服咨询充值方式', gravity: ToastGravity.CENTER);
      return;
    }



    if (currentSelectedMeal == null) return;

    if (_response!.autoSubscribedType != AutoSubType.Null) {
      Fluttertoast.showToast(
          msg: K.nobility_already_auto_sub + _response!.autoSubscribedString);
      return;
    }

    if (Platform.isIOS) {
      IPayManager payManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
      String? iapSubPrefix = payManager.getIAPConfig().subscriptionPrefix;
      String? iapAutoSubPrefix = payManager.getIAPConfig().autoSubPrefix;
      String productId = "$iapSubPrefix.${currentSelectedMeal!.mealId}";
      if (currentSelectedMeal!.cycleId != 0 && (iapAutoSubPrefix.isNotEmpty)) {
        productId = "$iapAutoSubPrefix.${currentSelectedMeal!.mealId}";
      }

      PulseLog.instance
          .log(NobilityBody(NobilityAction.showIap, {'type': 'iap'}, true));

      payManager.pay(
        context,
        key: 'nobility',
        type: 'iap',
        refer: 'nobility',
        args: null,
        productId: productId,
        onPayed: _onPayed,
        onError: _onPayError,
      );
      return;
    }

    int price = _response!.isFirst
        ? currentSelectedMeal!.firstPrice
        : currentSelectedMeal!.price;
    if (currentSelectedMeal!.cycleId != 0) {
      PulseLog.instance.log(NobilityBody(
          NobilityAction.showIap, {'type': 'ali', 'cycle': 1}, true));
      //连续订阅
      _payManager.pay(
        context,
        key: 'nobility',
        type: 'ali',
        refer: 'nobility',
        args: {
          'money': price,
          'type': 'cycle',
          'name': currentSelectedMeal!.name,
          'params': {
            'cycle_id': currentSelectedMeal!.cycleId,
            'title_id': currentSelectedMeal!.mealId
          }
        },
        canUseCoin: false,
        onPayed: _onPayed,
        onError: _onPayError,
      );
    } else {
      SheetCallback? result = await _payManager.showPTSheet(context, price,
          showBalance: System.isDevHost);
      if (result == null || result.reason == SheetCloseReason.Active) {
        return;
      }
      PulseLog.instance.log(NobilityBody(NobilityAction.showIap,
          {'type': result.value?.key ?? '', 'cycle': 0}, true));
      _payManager.pay(
        context,
        key: 'nobility',
        type: result.value?.key ?? '',
        refer: 'nobility',
        args: {
          'money': price,
          'type': 'cycle',
          'name': currentSelectedMeal!.name,
          'params': {
            'cycle_id': currentSelectedMeal!.cycleId,
            'title_id': currentSelectedMeal!.mealId
          },
          'extra': {'mini_id': result.extra},
        },
        canUseCoin: false,
        onPayed: _onPayed,
        onError: _onPayError,
      );
    }
  }

  void _onPayed() async {
    if (widget.onPayed != null) widget.onPayed!();

    //解决不同地方购买贵族之后贵族弹窗活动消失
    eventCenter.emit(EventConstant.EventActivityBuySuccess, {'type': 1});

    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted &&
        Navigator.canPop(context) &&
        ModalRoute.of(context)?.isCurrent == true) {
      Navigator.pop(context, true);
    }
  }

  void _onPayError(bool isErrorCatch) {}

  showUserLicense(LicenseType licenseType) async {
    String fileName = 'agreement2.html';
    String title = base.K.setting_user_protcol_agreement2;
    if (licenseType == LicenseType.USER_AGREEMENT2) {
      fileName = 'agreement2.html';
      title = base.K.setting_user_protcol_agreement2;
    } else if (licenseType == LicenseType.USER_AGREEMENT3) {
      fileName = 'agreement3.html';
      title = base.K.setting_user_protcol_agreement3;
    }

    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName');
    bool fileExist = false;
    try {
      fileExist = await file.exists();
    } catch (e) {
      Log.d(e.toString());
    }
    if (fileExist)
      BaseWebviewScreen.show(context,
          url: Uri.file(file.path).toString(), title: title);
  }

  /// 付款声明
  List<Widget> get _buyDeclarationLabels {
    Text buildLabel(String title) {
      return Text(title,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 11.0, color: Color(0x66FFFFFF)));
    }

    if (Util.isAndroid) {
      return [
        buildLabel(_response?.desc?.desc1 ?? ''),
        buildLabel(_response?.desc?.desc2 ?? ''),
        buildLabel(_response?.desc?.desc3 ?? ''),
      ];
    } else if (Util.isIOS) {
      return [buildLabel(_response?.desc?.desc1 ?? '')];
    }

    return <Widget>[];
  }

  /// 自动续费协议
  Widget get _autoBuyProtocolWidgets {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          K.vip_auto_buy_protocol_prefix_new,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0x66FFFFFF),
          ),
        ),
        const SizedBox(width: 4),

        /// 自动续费服务协议
        if (Platform.isAndroid) ...[
          GestureDetector(
            onTap: () {
              BaseWebviewScreen.show(
                context,
                url: Util.getHelpUrlWithQStr('k94'),
                title: K.vip_auto_renewing_url_title,
              );
            },
            child: Text(
              K.vip_auto_renewing_url_title,
              style: TextStyle(
                fontSize: 11,
                color: R.color.mainBrandColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const Text(
            "、",
            style: TextStyle(fontSize: 11, color: Color(0x66FFFFFF)),
          ),
        ],

        /// 用户服务协议
        GestureDetector(
          onTap: () => BaseWebviewScreen.show(
            context,
            url: Util.licenseUrl(LicenseType.USER_AGREEMENT2),
            title: base.K.setting_user_protcol_agreement2,
          ),
          child: Text(
            base.K.setting_user_protcol_agreement2,
            style: TextStyle(
              fontSize: 11,
              color: R.color.mainBrandColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          base.K.base_and,
          style: const TextStyle(fontSize: 11, color: Color(0x66FFFFFF)),
        ),
        const SizedBox(width: 4),

        /// 隐私政策
        GestureDetector(
          onTap: () => BaseWebviewScreen.show(
            context,
            url: Util.licenseUrl(LicenseType.USER_AGREEMENT3),
            title: base.K.setting_user_protcol_agreement3,
          ),
          child: Text(
            base.K.setting_user_protcol_agreement3,
            style: TextStyle(
              fontSize: 11,
              color: R.color.mainBrandColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
