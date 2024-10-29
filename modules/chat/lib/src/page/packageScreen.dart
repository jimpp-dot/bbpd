import 'package:chat/k.dart';
import 'package:shared/shared.dart' hide SliverAppBar;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 发红包
class PackageScreen extends StatefulWidget {
  final String type;
  final String targetId;

  static Future openPackageScreen(BuildContext context,
      {Key? key, required String type, required String targetId}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PackageScreen(
        type: type,
        targetId: targetId,
      ),
      settings: const RouteSettings(name: '/package'),
    ));
  }

  const PackageScreen({super.key, required this.type, required this.targetId});

  @override
  _PackageState createState() => _PackageState();
}

const List<int> _coins = [1, 6, 21, 66, 99, 188, 520, 1314, 3344];

class _PackageState extends State<PackageScreen> {
  int _money = 0;
  int _confirm = 0;
  String? _name;
  String? _mark;
  String? _icon;
  int _total_user = 0;
  String packageType = 'random';
  int _num = 0;

  bool _loading = true;
  double _moneyDouble = 0.00;
  String _description = R.string('package_all_the_best');

  // 防诈骗提示
  bool _showAntiCheat = false;

  late FocusNode _focusNode;
  final TextEditingController _textController = TextEditingController(text: '');
  final TextEditingController _moneyController =
      TextEditingController(text: '');
  final TextEditingController _numController = TextEditingController(text: '');
  final TextEditingController _descController =
      TextEditingController(text: R.string('package_all_the_best'));

  late FocusNode _moneyFocusNode;
  late FocusNode _numFocusNode;
  late FocusNode _descFocusNode;

  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _numFocusNode = FocusNode();
    _numFocusNode.addListener(_onFocus);
    _moneyFocusNode = FocusNode();
    _moneyFocusNode.addListener(_onFocus);
    _descFocusNode = FocusNode();
    _descFocusNode.addListener(_onFocus);
    _load();
  }

  @override
  void dispose() {
    _payManager.dispose('chat-package');
    _payManager.dispose('group-package');
    _focusNode.removeListener(_onFocus);
    _moneyFocusNode.removeListener(_onFocus);
    _numFocusNode.removeListener(_onFocus);
    _focusNode.dispose();
    _moneyFocusNode.dispose();
    _numFocusNode.dispose();

    _descController.removeListener(_onFocus);
    _descFocusNode.dispose();
    super.dispose();
  }

  /// 查询关注状态
  _queryFollowStatus() async {
    XhrResponse response = await Xhr.postJson(
        "${System.domain}go/yy/friend/isFollow", {'uids': widget.targetId},
        throwOnError: false, formatJson: true);
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        List<Map> results = List<Map>.from(res['data']);
        if (results.isNotEmpty) {
          _showAntiCheat = Util.parseInt(results[0]['friend']) == 0;
          setState(() {});
        }
      } else {
        Log.d(res['msg']);
      }
    } else {
      Log.d(response.error.toString());
    }
  }

  String _getPackageType() {
    if (packageType == 'random') {
      return R.string('random_lucky');
    }
    return R.string('normal_red_envelope');
  }

  _onFocus() {
    Log.d("focus --------------- ${_focusNode.hasFocus}");
  }

  _load() {
    if (widget.type == 'private') {
      _loadPrivate();
      _queryFollowStatus();
    } else if (widget.type == 'group') {
      _loadGroup();
    }
  }

  _loadPrivate() async {
    try {
      ResCloudProfile profile = await BaseRequestManager.cloudProfile(
          widget.targetId,
          type: 'private');

      if (!mounted) return;
      setState(() {
        _loading = false;

        if (profile.hasData()) {
          _mark = profile.data.mark;
          _name =
              (_mark != null && _mark!.isNotEmpty) ? _mark : profile.data.name;
          _icon = profile.data.icon;
        }
      });
    } catch (e) {
      Log.d(e);
    }
  }

  _loadGroup() async {
    String url = "${System.domain}fleet/packageConfig/";
    Map<String, String> post = {
      'groupId': widget.targetId,
    };
    XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
    Map res = response.value();
    Log.d(res);
    Map profile = res['data']['profile'];
    if (!mounted) return;
    setState(() {
      _loading = false;
      _name = profile['name'];
      _icon = profile['icon'];
      _total_user = Util.parseInt(res['data']['num']);
    });
  }

  _submit() async {
    int moneyHunderd = 0;
    if (widget.type == 'group') {
      if (_moneyDouble <= 0) {
        Toast.showCenter(context, K.please_input_total_money_of_envelope);
        return;
      }

      if (_num <= 0) {
        Toast.showCenter(context, K.please_input_num_of_envelope);
        return;
      }

      if (_num > _total_user) {
        Toast.showCenter(context, K.the_num_of_envelop_more_than_person);
        return;
      }

      if (_moneyDouble * MoneyConfig.multiple < _num) {
        Toast.showCenter(context, K.the_money_of_envelop_too_little);
        return;
      }
      moneyHunderd = Util.parseInt(_moneyDouble * MoneyConfig.multiple);
    } else {
      int money = 0;
      if (_money >= 1) {
        money = _money;
      } else {
        String text = _textController.value.text;
        if (text.isNotEmpty) {
          text = text.trim();
          if (text.isNotEmpty) {
            if (text.contains('.')) {
              Toast.showCenter(context, K.the_money_can_be_integer);
              return;
            } else {
              money = Util.parseInt(text, 0);
            }
          }
        }
      }
      if (money < 1) {
        Toast.showCenter(context, K.please_select_the_money);
        return;
      }
      moneyHunderd = money * MoneyConfig.multiple;
    }
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, moneyHunderd,
        showDiamondRecharge: true, accountType: 1);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    Log.d(moneyHunderd);

    if (widget.type == 'group') {
      _payManager.pay(context,
          key: 'group-package',
          type: result.value?.key ?? '',
          args: {
            'money': moneyHunderd,
            'type': 'group-package',
            'params': {
              'groupId': widget.targetId,
              'total': _num,
              'desc': _description,
              'type': packageType
            }
          },
          canUseCoin: false,
          onPayed: _onPayed,
          onError: _onPayError);
    } else {
      _payManager.pay(context,
          key: 'chat-package',
          type: result.value?.key ?? '',
          args: {
            'money': moneyHunderd,
            'type': 'chat-package',
            'params': {
              'to': widget.targetId,
              'confirm': _confirm > 0 ? 1 : 0,
            }
          },
          canUseCoin: false,
          onPayed: _onPayed,
          onError: _onPayError);
    }
  }

  void _onPayed() {
    Fluttertoast.showToast(
        msg: R.string('chat_reward_suc'), gravity: ToastGravity.BOTTOM);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  void _onPayError(bool isErrorCatch) {}

  void onTapType() async {
    List<SheetItem> res = [
      SheetItem(R.string('normal_red_envelope'), "normal"),
      SheetItem(R.string('random_lucky'), "random")
    ];

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
              title: R.string('select_red_envelope_type'), data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    setState(() {
      packageType = result.value?.key ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(R.string('give_red_envelope')),
      body: _renderBody(),
    );
  }

  Widget _renderBody() {
    if (_loading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (widget.type == 'group') {
        return _buildGroup();
      } else {
        return _buildPrivate();
      }
    }
  }

  Widget _buildPrivate() {
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      margin: EdgeInsets.only(
          bottom: ((keyboard == 0.0 && Util.isIphoneX) ? 32.0 : 0.0)),
      child: Column(children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              if (_showAntiCheat)
                Container(
                  color: const Color(0xFFFFEDED),
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 11,
                    right: 16,
                    bottom: 11,
                  ),
                  child: Text(
                    R.string('base_anti_cheat'),
                    style: TextStyle(
                      fontSize: 13,
                      color: R.color.thirdBrightColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              _renderIcon(),
              _renderName(),
              Container(
                height: 30.0,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  R.string('select_the_money_of_red_envelop'),
                  style: TextStyle(
                      color: R.color.secondTextColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              _renderSwitch(),
              Container(
                height: 30.0,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  R.string(
                    'or_custom_money_of_red_envelop',
                  ),
                  style: TextStyle(
                      color: R.color.secondTextColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 48.0,
                padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                margin:
                    const EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: EditableText(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    cursorColor: R.color.mainBrandColor,
                    backgroundCursorColor: R.color.mainBrandColor,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
                    focusNode: _focusNode,
                    controller: _textController,
                    autocorrect: true,
                    autofocus: false,
                    onChanged: (String text) {
                      setState(() {
                        _money = 0;
                      });
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _confirm = _confirm == 0 ? 1 : 0;
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 18.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _confirm > 0
                          ? const CheckBoxChecked()
                          : const CheckBoxUnchecked(),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          R.string('confirm_again_then_adversary_receive'),
                          style: TextStyle(
                              color: R.color.secondTextColor, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        _renderButton()
      ]),
    );
  }

  Widget _buildGroup() {
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      margin: EdgeInsets.only(
          bottom: ((keyboard == 0.0 && Util.isIphoneX) ? 34.0 : 0.0)),
      child: Column(children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              ListSectionWrapper(isEnd: true, children: [
                WidgetUtils.buildListTile(R.string('type_of_red_envelope'),
                    subTitle: _getPackageType(), onTap: onTapType),
              ]),
              ListSectionWrapper(isEnd: false, children: [
                ListTile(
                  dense: true,
                  title: Text(
                    R.string('package_total_money'),
                    style: R.textStyle.subhead,
                  ),
                  trailing: IntrinsicWidth(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 80,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.send,
                            cursorColor: Theme.of(context).primaryColor,
                            cursorWidth: 1.0,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 17.0,
                              color: R.color.mainTextColor,
                            ),
                            focusNode: _moneyFocusNode,
                            controller: _moneyController,
                            autocorrect: true,
                            autofocus: false,
                            onChanged: (value) {
                              _moneyDouble = Util.parseDouble(value);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: R.string('total_money_of_red_envelop'),
                              hintStyle: R.textStyle.trailing,
                            ),
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter(
                                  RegExp('^[1-9]\\d*\$'),
                                  allow: true)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            MoneyConfig.moneyName,
                            style: R.textStyle.subhead,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(_moneyFocusNode);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    K.the_num_of_red_envelope,
                    style: R.textStyle.subhead,
                  ),
                  trailing: IntrinsicWidth(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 120,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.send,
                            cursorColor: Theme.of(context).primaryColor,
                            cursorWidth: 1.0,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 17.0,
                              color: R.color.mainTextColor,
                            ),
                            focusNode: _numFocusNode,
                            controller: _numController,
                            autocorrect: true,
                            autofocus: false,
                            onChanged: (value) {
                              if (Util.parseInt(value) > 0) {
                                _num = Util.parseInt(value);
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: R.string('total_num_of_the_family',
                                  args: ['$_total_user']),
                            ),
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter(
                                  RegExp('^[1-9]\\d*\$'),
                                  allow: true)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(_numFocusNode);
                  },
                ),
              ]),
              Container(
                color: R.color.secondBgColor,
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(left: 18.0, right: 18.0),
                width: Util.width,
                height: 96,
                alignment: Alignment.center,
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.send,
                  cursorColor: R.color.mainBrandColor,
                  cursorWidth: 1.0,
                  textAlign: TextAlign.left,
                  style: R.textStyle.subhead,
                  focusNode: _descFocusNode,
                  controller: _descController,
                  autocorrect: true,
                  autofocus: false,
                  onChanged: (value) {
                    _description = value;
//													_descController.text = _description;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: R.string('package_all_the_best'),
                    hintStyle: R.textStyle.inputHint,
                  ),
                  maxLines: 3,
                  maxLength: 30,
                ),
              ),
            ],
          ),
        ),
        _renderButton()
      ]),
    );
  }

  Widget _renderButton() {
    if (widget.type == 'group') {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 30,
            child: Text(
              R.string('unclaimed_red_envelope_will_return',
                  args: [Util.appName]),
              style: TextStyle(
                  fontSize: 12.0,
                  color: R.color.secondTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          BottomButton.of(
            title: R.string('give_money_to_red_envelope'),
            onTap: _submit,
          ),
        ],
      );
    }

    return BottomButton.of(
      title: R.string('give_money_to_red_envelope'),
      onTap: _submit,
    );
  }

  Widget _renderIcon() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(37.5)),
        child: CachedNetworkImage(
          imageUrl: "${System.imageDomain}$_icon!head100",
          width: 75.0,
          height: 75.0,
        ),
      ),
    );
  }

  Widget _renderName() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        _name ?? '',
        style: TextStyle(color: R.color.secondTextColor, fontSize: 14.0),
      ),
    );
  }

  Widget _renderSwitch() {
    double spacing = 12.0;
    double itemWidth = (Util.width - spacing * 2 - 32.0) / 3;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Wrap(
        spacing: spacing,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: _coins.map((int coin) {
          bool selected = _money == coin;
          return Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              onTap: () {
                setState(() {
                  _money = coin;
                });
                _textController.clear();
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                width: itemWidth,
                height: 50.0,
                decoration: BoxDecoration(
                    color: R.color.secondBgColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: selected
                          ? R.color.mainBrandColor
                          : Colors.transparent,
                      width: 2,
                      style: BorderStyle.solid,
                    )),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        MoneyConfig.moneyNum(coin * 100),
                        style: TextStyle(
                            color: R.color.mainTextColor, fontSize: 16.0),
                      ),
                      Image.asset(MoneyConfig.moneyIcon, width: 24, height: 24),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
