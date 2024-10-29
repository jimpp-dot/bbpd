import 'package:flutter/foundation.dart' hide describeEnum;
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/src/bonus/model/bonus_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/bonus/model/bonus_beans.dart';
import 'package:chat_room/src/bonus/model/bonus_model.dart';
import 'package:chat_room/src/bonus/model/bonus_repo.dart';
import 'package:chat_room/src/bonus/widget/bonus_theme.dart';

class BonusCreateWidget extends StatefulWidget {
  final int rid;

  const BonusCreateWidget({super.key, required this.rid});

  @override
  _BonusCreateWidgetState createState() => _BonusCreateWidgetState();

  static void show(BuildContext context, int rid) {
    displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.75,
      defineBarrierColor: Colors.black.withOpacity(0.1),
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {},
          child: BonusCreateWidget(
            rid: rid,
          ),
        );
      },
    );
  }
}

class _BonusCreateWidgetState extends State<BonusCreateWidget> {
  static const int defaultCount = 10;
  static const int defaultTotalMoney = 100;

  BonusConfig? _bonusConfig;
  late ValueNotifier<BonusType> _bonusType;
  late ValueNotifier<BonusCreateCondition?> _selectedCondition;
  late ValueNotifier<int> _totalMoney;

  int _money = defaultTotalMoney;
  int _count = defaultCount;
  String _signContent = '';

  late TextEditingController _moneyController;
  late TextEditingController _countController;
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  String get _redPackKey => 'red-packet';

  bool _showHelp = false;

  @override
  void initState() {
    super.initState();

    _bonusType = ValueNotifier(BonusType.random);
    _totalMoney = ValueNotifier<int>(defaultTotalMoney);

    BonusModel bonusModel = context.read<BonusModel>();
    _bonusConfig = bonusModel.config;
    _selectedCondition =
        ValueNotifier<BonusCreateCondition?>(_bonusConfig?.conditions.first);

    BonusRepo.getBonusConfig(widget.rid).then((rsp) {
      if (rsp.success == true) {
        bonusModel.config = _bonusConfig = rsp.data;
        _selectedCondition.value = _bonusConfig?.conditions.first;
        if (mounted) setState(() {});
      }
    });

    _moneyController =
        TextEditingController(text: BonusUtil.getMoneyStr(_money));
    _countController = TextEditingController(text: '$_count');

    _bonusType.addListener(_updateTotalMoney);
  }

  void _updateTotalMoney() {
    _totalMoney.value =
        _bonusType.value == BonusType.random ? _money : _count * _money;
  }

  @override
  void dispose() {
    _bonusType.removeListener(_updateTotalMoney);
    _payManager.dispose(_redPackKey);
    super.dispose();
  }

  String get moneyInputTitle => _bonusType.value == BonusType.random
      ? K.room_bonus_money
      : K.room_single_bonus_money;

  double get minMoney => _bonusType.value == BonusType.random ? 1.0 : 0.1;

  String get moneyUnit => MoneyConfig.moneyName;

  Widget _buildTitleBar(BuildContext context) {
    return Container(
        height: 55.dp,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                RoomAssets.chat_room$bonus_bg_bonus_create_header_webp),
          ),
        ),
        child: Stack(
          alignment: _showHelp
              ? AlignmentDirectional.centerStart
              : AlignmentDirectional.centerEnd,
          children: [
            Center(
              child: Text(
                K.room_bonus_create_title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            _showHelp
                ? IconButton(
                    icon: R.img('ic_titlebar_back.svg',
                        package: ComponentManager.MANAGER_BASE_CORE),
                    onPressed: () {
                      _showHelp = false;
                      setState(() {});
                    })
                : IconButton(
                    icon: R.img('ic_help.svg',
                        package: ComponentManager.MANAGER_BASE_CORE),
                    onPressed: () {
                      _showHelp = true;
                      setState(() {});
                    }),
          ],
        ));
  }

  String? get moneyIcon {
    int money = 0;
    try {
      money = _totalMoney.value ~/ _count;
    } on Exception {}
    return _bonusConfig?.icons.firstWhereOrNull((_) => money >= _.min)?.icon;
  }

  Widget _buildMoney() {
    return ValueListenableBuilder(
      valueListenable: _totalMoney,
      builder: (context, value, _) {
        String? moneyIconUrl = moneyIcon;
        return Container(
          height: 52.dp,
          padding: EdgeInsetsDirectional.only(end: 12.dp),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F7F9),
            borderRadius: BorderRadius.circular(8.dp),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8, end: 2),
                child: (moneyIconUrl?.isNotEmpty ?? false)
                    ? CachedNetworkImage(
                        imageUrl: moneyIconUrl,
                        width: 32,
                        height: 32,
                      )
                    : const SizedBox(),
              ),
              Text(
                moneyInputTitle,
                style: BonusTheme.mainTextStyle,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  textAlign: TextAlign.end,
                  controller: _moneyController,
                  // keyboardType: TextInputType.number,
                  keyboardType:
                      const TextInputType.numberWithOptions(signed: true),
                  cursorColor: BonusTheme.hintTextStyle.color,
                  decoration: const InputDecoration(
                    // hintText: '$minMoney',
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0x33313131)),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    _money =
                        ((double.tryParse(value) ?? 0) * MoneyConfig.multiple)
                            .truncate();
                    _totalMoney.value = _bonusType.value == BonusType.random
                        ? _money
                        : _count * _money;
                  },
                ),
              )),
              Text(
                moneyUnit,
                style: BonusTheme.mainTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCount() {
    return Container(
      height: 52.dp,
      padding: EdgeInsets.symmetric(horizontal: 12.dp),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F9),
        borderRadius: BorderRadius.circular(8.dp),
      ),
      child: Row(
        children: [
          Text(
            K.room_bonus_count,
            style: BonusTheme.mainTextStyle,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _countController,
              textAlign: TextAlign.end,
              // keyboardType: TextInputType.number,
              keyboardType: const TextInputType.numberWithOptions(signed: true),
              cursorColor: BonusTheme.hintTextStyle.color,
              decoration: const InputDecoration(
                // hintText: '${K.room_bonus_count_hint}',
                hintStyle: TextStyle(fontSize: 16, color: Color(0x33313131)),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                _count = int.tryParse(value) ?? 0;
                _totalMoney.value = _bonusType.value == BonusType.random
                    ? _money
                    : _count * _money;
              },
            ),
          )),
          Text(
            K.room_bonus_count_unit,
            style: BonusTheme.mainTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildMoneyDesc() {
    if ((_bonusConfig?.notifyMoney ?? 0) <= 0) {
      return const SizedBox(height: 24);
    }
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        Text(
          '${BonusUtil.getMoneyStr(_bonusConfig?.notifyMoney ?? 0)}$moneyUnit${K.room_bonus_money_desc}',
          style: BonusTheme.hintTextStyle
              .copyWith(fontSize: 13, color: const Color(0x99313131)),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            _count = defaultCount;
            if (_bonusType.value == BonusType.random) {
              _money = _bonusConfig!.notifyMoney;
            } else {
              _money = _bonusConfig!.notifyMoney ~/ _count;
            }
            _moneyController.text = BonusUtil.getMoneyStr(_money);
            _countController.text = '$_count';

            _updateTotalMoney();

            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: 60,
            height: 24,
            alignment: Alignment.center,
            decoration: const ShapeDecoration(
                shape: StadiumBorder(
                    side: BorderSide(color: BonusTheme.hlColor, width: 1))),
            child: Text(
              K.room_onekey_input,
              style: const TextStyle(fontSize: 11, color: BonusTheme.hlColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCondition() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          K.room_bonus_condition,
          style: const TextStyle(
              fontSize: 13,
              color: Color(0x99313131),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        BonusConditionSelectWidget(
          conditions: _bonusConfig?.conditions,
          onSelect: (_) => _selectedCondition.value = _,
        ),
      ],
    );
  }

  Widget _buildType() {
    return BonusTypeSelectWidget(
      onSelect: (_) {
        _count = defaultCount;
        if (_ == BonusType.random) {
          _money = defaultTotalMoney;
        } else {
          _money = defaultTotalMoney ~/ defaultCount;
        }
        _moneyController.text = BonusUtil.getMoneyStr(_money);
        _countController.text = '$_count';

        _bonusType.value = _;
        _updateTotalMoney();
        FocusScope.of(context).unfocus();
      },
    );
  }

  Widget _buildSignInput() {
    return ValueListenableBuilder(
      valueListenable: _selectedCondition,
      builder: (context, createCondition, _) {
        if (createCondition?.type != BonusConditionType.sign) {
          return const SizedBox(
            height: 24,
          );
        } else {
          return Container(
            height: 52.dp,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7F9),
              borderRadius: BorderRadius.circular(8.dp),
            ),
            child: TextField(
              textAlign: TextAlign.start,
              cursorColor: BonusTheme.hintTextStyle.color,
              cursorHeight: 16,
              decoration: InputDecoration(
                  hintText: K.room_bonus_sign_hint,
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Color(0x33313131)),
                  border: InputBorder.none),
              onChanged: (value) {
                _signContent = value;
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildTotalMoney() {
    return ValueListenableBuilder(
        valueListenable: _totalMoney,
        builder: (context, value, _) {
          return RichText(
            text: TextSpan(
                text: BonusUtil.getMoneyStr(value),
                style: TextStyle(
                    fontSize: 52,
                    color: const Color(0xFF313131),
                    fontFamily: Util.numFontFamily,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: moneyUnit,
                    style:
                        TextStyle(fontSize: 18, fontFamily: Util.numFontFamily),
                  )
                ]),
          );
        });
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: () async {
        int availableMoney = _bonusConfig?.availableMoney ?? 0;
        int totalMoney =
            (_bonusType.value == BonusType.random ? _money : _count * _money);

        String pType = 'available';
        if (availableMoney < totalMoney) {
          SheetCallback? result = await _payManager
              .showRechargeSheet(context, totalMoney, accountType: 1);
          if (result == null ||
              result.reason == SheetCloseReason.Active ||
              result.value?.key == IPayManager.pTRecharge) {
            return;
          } else {
            pType = result.value?.key ?? '';
          }

          BaseResponse checkRsp = await BonusRepo.check(
              rid: widget.rid,
              money: _money,
              num: _count,
              type: _bonusType.value,
              conditionType: _selectedCondition.value?.type,
              sign: _signContent);
          if (checkRsp.success != true) {
            BaseResponse.toast(checkRsp);
            return;
          }
        }

        _payManager.pay(context,
            key: _redPackKey,
            type: pType,
            refer: _redPackKey,
            args: {
              'money': totalMoney,
              'type': _redPackKey,
              'params': {
                'rid': widget.rid,
                'money': _money,
                'num': _count,
                'type': describeEnum(_bonusType.value),
                'cond': describeEnum(
                    _selectedCondition.value?.type ?? BonusConditionType.none),
                if (_selectedCondition.value?.type == BonusConditionType.sign)
                  'sign': _signContent,
                'version': '1',
              }
            }, onPayed: () {
          Navigator.pop(context);
        }, onError: (_) {});
      },
      child: Container(
        width: 252.dp,
        height: 63.dp,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                RoomAssets.chat_room$bonus_bg_room_bonus_submit_webp),
          ),
        ),
        child: Text(
          K.room_bonus_create_title,
          style: const TextStyle(
              fontSize: 18,
              color: BonusTheme.hlColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildCreateContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _buildMoney(),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 12, top: 8, bottom: 16),
            child: _buildMoneyDesc(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _buildCount(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _buildType(),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12),
            child: _buildCondition(),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 12, end: 12, top: 12),
            child: _buildSignInput(),
          ),
          const SizedBox(
            height: 5,
          ),
          _buildTotalMoney(),
          SizedBox(
            height: 150.dp,
          ),
        ],
      ),
    );
  }

  Widget _buildHelpContent() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: WebView(
        initialUrl: Util.getWebUrl('envelope-rule/'),
        gestureRecognizers: {Factory(() => EagerGestureRecognizer())},
      ),
    );
  }

  Widget _buildContent() {
    return _showHelp ? _buildHelpContent() : _buildCreateContent();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFF6A96),
              // gradient: LinearGradient(colors: [Color(0xFFFFC4A6), Color(0xFFFF6A96)]),
              borderRadius: BorderRadiusDirectional.horizontal(
                  start: Radius.circular(16), end: Radius.circular(16))),
          child: Column(
            children: [
              _buildTitleBar(context),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(8),
                          topEnd: Radius.circular(8))),
                  child: _buildContent(),
                ),
              ),
            ],
          ),
        ),
        if (!_showHelp)
          PositionedDirectional(
            start: 0,
            bottom: 0,
            width: 375.dp,
            height: 146.dp,
            child: Container(
                width: Util.width,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                        RoomAssets.chat_room$bonus_bg_bonus_create_bottom_webp),
                  ),
                ),
                child: _buildSubmitButton()),
          ),
      ],
    );
  }
}

class BonusConditionSelectWidget extends StatefulWidget {
  final List<BonusCreateCondition>? conditions;
  final ValueChanged<BonusCreateCondition>? onSelect;

  const BonusConditionSelectWidget({Key? key, this.conditions, this.onSelect})
      : super(key: key);

  @override
  _BonusConditionSelectWidgetState createState() =>
      _BonusConditionSelectWidgetState();
}

class _BonusConditionSelectWidgetState
    extends State<BonusConditionSelectWidget> {
  BonusCreateCondition? _curSelection;

  @override
  void initState() {
    super.initState();
    _curSelection = widget.conditions?.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.dp,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            BonusCreateCondition item = widget.conditions![index];
            return BonusCreateConditionWidget(
              selected: _curSelection?.type == item.type,
              condition: item,
              onTap: () {
                if (widget.onSelect != null) widget.onSelect!(item);

                _curSelection = item;
                setState(() {});
              },
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 8.dp,
              ),
          itemCount: widget.conditions?.length ?? 0),
    );
  }
}

class BonusCreateConditionWidget extends StatelessWidget {
  final bool selected;
  final BonusCreateCondition? condition;
  final VoidCallback? onTap;

  const BonusCreateConditionWidget(
      {Key? key, this.selected = false, this.condition, this.onTap})
      : super(key: key);

  BorderSide get borderSide => selected
      ? const BorderSide(color: BonusTheme.hlColor, width: 1.5)
      : BorderSide.none;

  Color get bgColor =>
      selected ? const Color(0x0FFF5F7D) : const Color(0xFFF6F7F9);

  TextStyle get titleStyle => TextStyle(
      fontSize: 13,
      color: selected ? BonusTheme.hlColor : const Color(0x99313131));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 97.dp,
        height: 60.dp,
        child: Container(
          width: 97.dp,
          height: 60.dp,
          decoration: BoxDecoration(
              color: bgColor,
              border: Border.fromBorderSide(borderSide),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                condition?.name ?? '',
                style: titleStyle,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                condition?.desc ?? '',
                style: const TextStyle(fontSize: 11, color: Color(0x66313131)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BonusTypeSelectWidget extends StatefulWidget {
  final List<BonusType> types = BonusType.values;
  final ValueChanged<BonusType>? onSelect;

  const BonusTypeSelectWidget({Key? key, this.onSelect}) : super(key: key);

  @override
  _BonusTypeSelectWidgetState createState() => _BonusTypeSelectWidgetState();
}

class _BonusTypeSelectWidgetState extends State<BonusTypeSelectWidget> {
  late BonusType _curSelection;

  @override
  void initState() {
    super.initState();
    _curSelection = widget.types.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.dp,
      alignment: AlignmentDirectional.centerStart,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            BonusType item = widget.types[index];
            return BonusTypeWidget(
              selected: _curSelection == item,
              type: item,
              onTap: () {
                if (widget.onSelect != null) widget.onSelect!(item);

                _curSelection = item;
                setState(() {});
              },
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 8.dp,
              ),
          itemCount: widget.types.length),
    );
  }
}

class BonusTypeWidget extends StatelessWidget {
  final bool selected;
  final BonusType type;
  final VoidCallback? onTap;

  const BonusTypeWidget(
      {Key? key, this.selected = false, required this.type, this.onTap})
      : super(key: key);

  Widget get checkBox => selected
      ? const CheckBoxChecked(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: BonusTheme.hlColor,
          ),
        )
      : const CheckBoxUnchecked(
          color: Color(0x33313131),
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          checkBox,
          const SizedBox(
            width: 4,
          ),
          Text(
            R.array('room_bonus_types')[BonusType.values.indexOf(type)],
            style: const TextStyle(fontSize: 13, color: Color(0xFF313131)),
          ),
        ],
      ),
    );
  }
}
