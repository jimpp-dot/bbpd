import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/model/room_red_packet_setting_data.dart';

// 房间红包设置/查询页
class RedPacketSettingScreen extends StatefulWidget {
  final int rid;
  final String purview;
  final ChatRoomData room;

  const RedPacketSettingScreen(this.rid, this.purview, this.room, {super.key});

  @override
  _RedPacketSettingState createState() {
    return _RedPacketSettingState();
  }
}

class _RedPacketSettingState extends State<RedPacketSettingScreen> {
  // 是否已设置红包
  bool? hasSetting;
  RoomRedPacketSettingData? settingData;

  // 红包设置
  late TextEditingController _moneyController;
  late TextEditingController _numController;
  late TextEditingController _durationController;
  late TextEditingController _stayController;
  String? errorText;
  int? _money;
  int? _num;
  int? _duration;
  int? _stay;

  @override
  void initState() {
    super.initState();

    _moneyController = TextEditingController();
    _numController = TextEditingController();
    _durationController = TextEditingController();
    _stayController = TextEditingController();
    // 查询房间是否有红包
    _load();
  }

  void _load() async {
    try {
      XhrResponse response = await Xhr.postJson(
          '${System.domain}package/query?rid=${widget.rid}&uid=${Session.uid}',
          {},
          throwOnError: true);
      Map res = response.value();
      settingData =
          RoomRedPacketSettingData.fromJson(res as Map<String, dynamic>);
      if (settingData?.data?.money != null) {
        hasSetting = true;
      } else {
        hasSetting = false;
      }

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      Log.d(e.toString());
    }
  }

  @override
  void dispose() {
    _moneyController.dispose();
    _numController.dispose();
    _durationController.dispose();
    _stayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.room_red_packet_setting_title,
      ),
      body: hasSetting == null ? const Loading() : _buildBody(),
      // 自己不是发红包的人不能提前结束
      bottomNavigationBar: (hasSetting == null)
          ? null
          : (hasSetting == true ? _buildFinishButton() : _buildSettingButton()),
    );
  }

  Widget _buildSettingButton() {
    bool enable = _money != null &&
        _num != null &&
        _duration != null &&
        errorText == null;
    return BottomButton.of(
      title: K.room_red_packet_setting_start,
      bgColor: enable ? null : [Colors.grey.withOpacity(0.5), Colors.grey],
      onTap: _submit,
    );
  }

  Widget? _buildFinishButton() {
    if (hasSetting! && Session.uid != settingData?.data?.sender) {
      return null;
    }

    return BottomButton.of(
      title: K.room_red_packet_setting_finish,
      onTap: _submit,
    );
  }

  Widget _buildBody() {
    if (hasSetting!) {
      int leftTime = settingData!.data!.money - settingData!.data!.moneySend;
      if (leftTime < 0) {
        leftTime = 0;
      }

      // 已设置，状态查询
      return Column(
        children: <Widget>[
          _buildHasSettingItem(
              K.room_red_packet_residue_money_new([(MoneyConfig.moneyName)]),
              MoneyConfig.moneyNum(leftTime)),
          Container(
            height: 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: R.color.dividerColor,
          ),
          _buildHasSettingItem(K.room_red_packet_residue_num,
              '${settingData!.data!.total - settingData!.data!.num}'),
          Container(
            height: 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: R.color.dividerColor,
          ),
          _buildHasSettingItem(K.room_red_packet_residue_duration,
              '${DateTime.fromMillisecondsSinceEpoch(settingData!.data!.periodEnd * 1000).difference(DateTime.now()).inMinutes}'),
          Container(
            height: 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: R.color.dividerColor,
          ),
        ],
      );
    } else {
      // 红包设置
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            if (errorText != null && errorText!.isNotEmpty)
              Container(
                height: 40,
                width: Util.width,
                alignment: Alignment.center,
                color: R.color.thirdBrightColor.withOpacity(0.08),
                child: Text(
                  errorText!,
                  style: TextStyle(
                    fontSize: 13,
                    color: R.color.thirdBrightColor,
                  ),
                ),
              ),
            _buildSettingItem(
              K.room_red_packet_total_money_new([(MoneyConfig.moneyName)]),
              _buildInput(K.room_red_packet_total_money_hint, 6,
                  onInputMoneyChange, _moneyController),
            ),
            Container(
              height: 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: R.color.dividerColor,
            ),
            _buildSettingItem(
              K.room_red_packet_total_num,
              _buildInput(K.room_red_packet_total_num_hint, 6, onInputNumChange,
                  _numController),
            ),
            Container(
              height: 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: R.color.dividerColor,
            ),
            _buildSettingItem(
              K.room_red_packet_total_duration,
              _buildInput(K.room_red_packet_total_duration_hint, 6,
                  onInputDurationChange, _durationController),
            ),
            Container(
              height: 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: R.color.dividerColor,
            ),
            _buildSettingItem(
              K.room_red_packet_setting_stay_time,
              _buildInput(K.room_red_packet_setting_stay_time_hint, 6,
                  onInputStayChange, _stayController),
            ),
          ],
        ),
      );
    }
  }

  onInputMoneyChange(String money) {
    money = _moneyController.text;
    if (money.isEmpty) {
      _money = null;
    } else {
      _money = Util.parseInt(money);
    }

    _checkValidInput();
    if (mounted) {
      setState(() {});
    }
  }

  onInputNumChange(String num) {
    num = _numController.text;
    if (num.isEmpty) {
      _num = null;
    } else {
      _num = Util.parseInt(num);
    }

    _checkValidInput();
    if (mounted) {
      setState(() {});
    }
  }

  onInputDurationChange(String duration) {
    duration = _durationController.text;
    if (duration.isEmpty) {
      _duration = null;
    } else {
      _duration = Util.parseInt(duration);
    }

    _checkValidInput();
    if (mounted) {
      setState(() {});
    }
  }

  onInputStayChange(String duration) {
    duration = _stayController.text;
    if (duration.isEmpty) {
      _stay = null;
    } else {
      _stay = Util.parseInt(duration);
    }

    _checkValidInput();
    if (mounted) {
      setState(() {});
    }
  }

  _checkValidInput() {
    // 红包总金额
    if (_money != null) {
      int max = Util.parseInt(MoneyConfig.moneyNum(1000 * 100));
      int min = Util.parseInt(MoneyConfig.moneyNum(1 * 100));
      if (settingData?.config?.total != null &&
          settingData!.config!.total.length >= 2) {
        max = Util.parseInt(
            MoneyConfig.originPrice2(settingData!.config!.total[1]));
        min = Util.parseInt(
            MoneyConfig.originPrice2(settingData!.config!.total[0]));
      }
      if (_money! > max) {
        errorText = K.room_red_packet_total_money_maximum_new(
            ['$max${MoneyConfig.moneyName}']);
        return;
      } else if (_money! < min) {
        errorText = K.room_red_packet_total_money_minimum_new(
            ['$min${MoneyConfig.moneyName}']);
        return;
      }
    }

    // 单个红包金额
    if (_money != null && _num != null) {
      double max = Util.parseDouble(MoneyConfig.moneyNum(100 * 100));
      double min =
          Util.parseDouble(MoneyConfig.moneyNum(Util.parseInt(0.01 * 100)));
      if (settingData?.config?.per != null &&
          settingData!.config!.per.length >= 2) {
        max =
            Util.parseDouble(MoneyConfig.moneyNum(settingData!.config!.per[1]));
        min =
            Util.parseDouble(MoneyConfig.moneyNum(settingData!.config!.per[0]));
      }
      if (_num == 0) {
        errorText = K.room_red_packet_single_money_maximum_new(
            ['$max${MoneyConfig.moneyName}']);
        return;
      }
      double singleMoney = _money! / _num!;
      if (singleMoney > max) {
        errorText = K.room_red_packet_single_money_maximum_new(
            ['$max${MoneyConfig.moneyName}']);
        return;
      } else if (singleMoney < min) {
        errorText = K.room_red_packet_single_money_minimum_new(
            ['$min${MoneyConfig.moneyName}']);
        return;
      }
    }

    // 红包时长
    if (_duration != null) {
      int max = 120;
      int min = 10;
      if (settingData?.config?.period != null &&
          settingData!.config!.period.length >= 2) {
        max = settingData!.config!.period[1];
        min = settingData!.config!.period[0];
      }
      if (_duration! > max) {
        errorText = K.room_red_packet_total_duration_maximum(['$max']);
        return;
      } else if (_duration! < min) {
        errorText = K.room_red_packet_total_duration_minimum(['$min']);
        return;
      }
    }

    // 在房时长
    if (_stay != null) {
      int max = 60;
      int min = 1;
      if (settingData?.config?.stay != null &&
          settingData!.config!.stay.length >= 2) {
        max = settingData!.config!.stay[1];
        min = settingData!.config!.stay[0];
      }
      if (_stay! > max) {
        errorText = K.room_red_packet_setting_stay_maximum(['$max']);
        return;
      } else if (_stay! < min) {
        errorText = K.room_red_packet_setting_stay_minnum(['$min']);
        return;
      }
    }

    errorText = null;
  }

  Widget _buildHasSettingItem(String title, String value) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 20),
        Container(
          height: 56,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: R.color.mainTextColor,
            ),
          ),
        ),
        const Spacer(),
        NumText(
          value,
          style: TextStyle(
            fontSize: 16,
            color: R.color.mainTextColor,
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _buildSettingItem(String title, Widget input) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 20),
        Container(
          height: 56,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: R.color.mainTextColor,
            ),
          ),
        ),
        Expanded(
          child: input,
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _buildInput(String hint, int maxLength, ValueChanged<String> onChanged,
      TextEditingController controller) {
    return TextField(
      textAlign: TextAlign.end,
      style: TextStyle(
        color: R.color.mainTextColor,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        counterText: '',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: R.color.mainTextColor.withOpacity(0.2),
          fontSize: 16,
        ),
        hintText: hint,
      ),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      onChanged: onChanged,
      enableInteractiveSelection: false,
      controller: controller,
    );
  }

  void _submit() async {
    if (hasSetting!) {
      // 已设置，提前结束按钮
      try {
        XhrResponse response = await Xhr.postJson(
            '${System.domain}package/refund?packageId=${settingData!.data!.id}&uid=${Session.uid}',
            {},
            throwOnError: true);
        Map? res = response.value();
        if (res['success'] == true) {
          Fluttertoast.showToast(msg: K.room_red_packet_finish_suc);
          Navigator.of(context).pop();
        } else {
          if (res['msg'] is String) {
            Fluttertoast.showToast(
                msg: res['msg'], gravity: ToastGravity.CENTER);
          }
        }
      } catch (e) {
        Log.d(e.toString());
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      }
    } else {
      // 触摸收起键盘
      FocusScope.of(context).requestFocus(FocusNode());
      // 确定开启
      if (_money != null &&
          _num != null &&
          _duration != null &&
          errorText == null) {
        // 余额是否够
        if (settingData!.money >= _money! * MoneyConfig.multiple) {
          _pay('available');
        } else {
          _displayPay();
        }
      } else {
        // do nothing
      }

      Tracker.instance.track(TrackEvent.room_redpacket_start, properties: {
        'rid': widget.rid,
        'role': widget.purview,
        'total_price': _money,
        'total_num': _num,
        'total_duration': _duration,
      });
    }
  }

  void _pay(String type) {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    payManager.pay(
      context,
      key: 'room-package',
      type: type,
      args: {
        'money': _money! * MoneyConfig.multiple,
        'type': 'room-package',
        'params': {
          'rid': widget.rid,
          'total': _num,
          'period': _duration,
          'refer': '${widget.room.refer}:room',
          'stay': _stayController.text
        }
      },
      onPayed: _onPayed,
      onError: _onPayError,
    );
  }

  _displayPay() async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result = await payManager.showRechargeSheet(
        context, _money! * MoneyConfig.multiple,
        accountType: 1);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    _pay(result.value?.key ?? '');
  }

  void _onPayed() {
    Fluttertoast.showToast(msg: K.room_red_packet_setting_suc);
    Navigator.of(context).pop();
  }

  void _onPayError(bool isErrorCatch) {}
}
