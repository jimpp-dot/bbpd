import 'dart:math';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vip/assets.dart';
import 'package:vip/k.dart';
import 'package:vip/src/vip_mall/pb/generated/buy_room_hot.pb.dart';
import '../api.dart';

/// 购买房间热度
class BuyRoomHotPanel extends StatefulWidget {
  final int rid;

  /// return 是否购买成功
  static Future<bool?> show(BuildContext context, int rid) {
    return displayModalBottomSheet(
      context: context,
      builder: (context) {
        return BuyRoomHotPanel(
          rid: rid,
        );
      },
      defineBarrierColor: Colors.black.withOpacity(0.4),
      maxHeightRatio: 1,
      settings: const RouteSettings(name: '/BuyRoomHotPanel'),
    );
  }

  const BuyRoomHotPanel({
    super.key,
    required this.rid,
  });

  @override
  State<StatefulWidget> createState() {
    return _BuyRoomHotPanelState();
  }
}

class _BuyRoomHotPanelState extends State<BuyRoomHotPanel> {
  static int minPayMoney = 1;

  bool _loading = true;
  String? _errorMessage;

  int _selectIndex = 0;
  int _num = 1;
  final FocusNode _numFocusNode = FocusNode();
  final TextEditingController _numController = TextEditingController(text: '1');
  double lastKeyboardHeight = 0;

  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  BuyHotData? _data;

  late BuyHotItem _selectItem;

  int _totalMoney = 0; // 原价

  String _buyType = 'mate-pay';

  static const int _maxLen = 2; //数字最大输入位数
  static const int _maxNum = 99; //数字最大值

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  void dispose() {
    _payManager.dispose(_buyType);
    super.dispose();
  }

  _loadData({bool reload = false}) async {
    ResRoomBuyHot response = await Api.getBuyRoomHotPanel(widget.rid);
    if (response.success) {
      _data = response.data;
      if (_data != null) {
        if (reload != true) {
          if (Util.validList(_data!.items)) {
            _selectItem = _data!.items[0];
          }
          _buyType = _data!.buyType;
          _calcPrice();
        }
      }
    } else {
      _errorMessage = response.msg;
    }
    _loading = false;
    if (mounted) setState(() {});
  }

  Future<void> _onReload() async {
    if (mounted) {
      setState(() {
        _errorMessage = null;
        _loading = true;
        _loadData();
      });
    }
  }

  /// 充值
  void _onCharge() {
    Navigator.of(context).pop();
    ISettingManager? settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager?.openRechargeScreen(context, refer: 'buy_room_hot');
  }

  void _onBuyTaped() async {
    _showPayBottomSheet();
  }

  void _showPayBottomSheet() async {
    int discountPrice = max(_totalMoney, minPayMoney);

    SheetCallback? result =
        await _payManager.showRechargeSheet(context, discountPrice);
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      // 充值成功，刷新余额
      _loadData(reload: true);
      return;
    }

    _payManager.pay(
      context,
      key: _buyType,
      type: result.value?.key ?? '',
      refer: 'buy_room_hot',
      args: {
        'money': _totalMoney,
        'type': _buyType,
        'params': {
          'rid': widget.rid,
          'sub_type': 'buy_hot',
          'num': _num,
          'cid': _selectItem.cid,
          'price': _selectItem.unitPrice,
          'version': 2,
          'gift_scene': 'room',
          'money_type': 'money',
        }
      },
      onPayed: _onPayed,
      onError: _onPayError,
    );
  }

  void _onPayError(bool isErrorCatch) {}

  void _onPayed() {
    Tracker.instance.track(TrackEvent.room_hot_buy, properties: {
      'uid': Session.uid,
      'rid': widget.rid,
      'hot_num': _selectItem.hot,
      'last_time': _num,
    });
    Navigator.of(context).pop(true);
  }

  _onItemSelect(int index) {
    _selectIndex = index;
    _selectItem = _data!.items[_selectIndex];
    _calcPrice();
    if (mounted) setState(() {});
  }

  void _onAdd() {
    if (_num >= _maxNum) {
      return;
    }
    _num++;
    _numController.text = _num.toString();
    _setNumInputCursor();
    _calcPrice();
    setState(() {});
  }

  void _onMin() {
    if (_num > 1) {
      _num--;
      _numController.text = _num.toString();
      _setNumInputCursor();
      _calcPrice();
      setState(() {});
    }
  }

  void _calcPrice() {
    // 商品总价
    _totalMoney = _selectItem.unitPrice * _num;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).viewInsets.bottom;
    if (h == 0 && lastKeyboardHeight > 0) {
      _numFocusNode.unfocus();
      if (Util.isStringEmpty(_numController.text)) {
        _numController.text = '1';
      }
    }
    lastKeyboardHeight = h;
    return GestureDetector(
      onTap: () {
        _numFocusNode.unfocus();
        if (Util.isStringEmpty(_numController.text)) {
          _numController.text = '1';
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              color: _loading || _errorMessage != null
                  ? R.color.mainBgColor
                  : Colors.transparent,
            ),
            constraints: const BoxConstraints(minHeight: 300),
            child: _buildBody(),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(error: _errorMessage, onTap: () => _onReload());
    }

    if (_data == null || !Util.validList(_data!.items)) {
      return ErrorData(
          error: K.vip_get_commodity_info_failed, onTap: () => _onReload());
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: Util.width,
          height: 210,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: Util.parseIcon(_data!.imageBackground),
                  width: Util.width,
                  height: 210,
                  cachedWidth: Util.width.px,
                  cachedHeight: 210.px,
                  fit: BoxFit.cover,
                  placeholder: Container(color: R.color.secondBgColor),
                  errorWidget: Container(color: R.color.secondBgColor),
                ),
              ),
              Center(
                child: CachedNetworkImage(
                  imageUrl: Util.parseIcon(_data!.image),
                  width: 193,
                  height: 193,
                  cachedWidth: 193.px,
                  cachedHeight: 193.px,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.only(
              start: 16, end: 16, top: 10, bottom: 10 + Util.iphoneXBottom),
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _data!.name,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                _data!.desc,
                style: TextStyle(
                    color: R.color.secondTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              _buildCommodityPanel(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCommodityPanel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategory(),
        const SizedBox(height: 18),
        _buildRoomHotHourRow(),
        const SizedBox(height: 18),
        _buildBottomPanel(),
      ],
    );
  }

  Widget _buildRoomHotHourRow() {
    return Row(
      children: [
        Text(
          K.vip_room_hot_unit_desc,
          style: TextStyle(color: R.color.mainTextColor, fontSize: 13),
        ),
        const Spacer(),
        _buildNumRow(),
      ],
    );
  }

  Widget _buildNumRow() {
    return Container(
      width: 102,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: R.color.dividerColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _onMin,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: R.img(
                Assets.ic_minus_no_border_webp,
                width: 30,
                height: 30,
                package: ComponentManager.MANAGER_VIP,
              ),
            ),
          ),
          Container(width: 1, height: 30, color: R.color.dividerColor),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: _buildNumInput(),
            ),
          ),
          Container(width: 1, height: 30, color: R.color.dividerColor),
          InkWell(
            onTap: _onAdd,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: R.img(
                Assets.ic_add_no_border_webp,
                width: 30,
                height: 30,
                package: ComponentManager.MANAGER_VIP,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumInput() {
    return TextField(
      textAlign: TextAlign.center,
      style: TextStyle(
          color: R.color.mainTextColor,
          fontSize: 13,
          fontWeight: FontWeight.w500),
      focusNode: _numFocusNode,
      controller: _numController,
      autofocus: false,
      maxLines: 1,
      maxLength: _maxLen,
      decoration: null,
      cursorColor: R.color.mainBrandColor,
      keyboardType: TextInputType.number,
      onChanged: (str) {
        if (Util.validStr(str)) {
          if (str.startsWith('0')) {
            int num = Util.parseInt(str);
            str = num > 0 ? num.toString() : '';
            _numController.text = str;
            _setNumInputCursor();
          }
          _num = Util.parseInt(str, 1);
        } else {
          _num = 1;
        }
        _calcPrice();
        setState(() {});
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(_maxLen)
      ],
    );
  }

  void _setNumInputCursor() {
    _numController.selection = TextSelection.fromPosition(
        TextPosition(offset: _numController.text.length));
  }

  Widget _buildCategory() {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildGoodsNum(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 11);
        },
        itemCount: _data!.items.length,
      ),
    );
  }

  Widget _buildGoodsNum(int index) {
    bool select = index == _selectIndex;

    BuyHotItem item = _data!.items[index];

    double width = (Util.width - 32 - 2 * 12) / 3;
    return GestureDetector(
      onTap: () => _onItemSelect(index),
      child: Container(
        width: width,
        height: 46,
        margin: const EdgeInsetsDirectional.only(top: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: select ? R.color.mainBrandColor : R.color.dividerColor),
          color: select ? R.color.mainBrandColor.withOpacity(0.08) : null,
        ),
        child: Text(
          item.period,
          style: TextStyle(
            color: select ? R.color.mainTextColor : R.color.thirdTextColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPanel() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGoodsPrice(),
            const SizedBox(height: 2),
            _buildMyMoney(),
          ],
        ),
        Flexible(child: _buildBuyButton()),
      ],
    );
  }

  // 商品价格
  Widget _buildGoodsPrice() {
    int discountPrice = max(_totalMoney, minPayMoney);

    String pricesStr = Util.removeDecimalZeroFormat(discountPrice / 1);
    Widget icon = Image.asset(
      MoneyConfig.moneyIcon,
      width: 16,
      height: 16,
    );
    pricesStr = MoneyConfig.moneyNum(discountPrice);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        // 折扣价
        NumText(
          pricesStr,
          style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  // 我的余额
  Widget _buildMyMoney() {
    String getText = K.vip_recharge;
    String myMoney =
        '${MoneyConfig.moneyNum(_data!.money)}${MoneyConfig.moneyName1}';
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onCharge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            myMoney,
            style: TextStyle(
                color: R.color.thirdTextColor,
                fontSize: 13.0,
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 1,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                color: R.color.thirdTextColor,
              ),
              Text(
                getText,
                style: TextStyle(
                    color: R.color.thirdTextColor,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500),
              ),
              R.img(
                'mall/ic_arrow.svg',
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_VIP,
                color: R.color.thirdTextColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBuyButton() {
    String btnText = K.vip_buy_now;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onBuyTaped,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 160, minWidth: 100),
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.5),
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
