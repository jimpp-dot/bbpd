import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 购买头像框的Dialog
/// 首次开箱时，提示买头像框送水晶
class BuyHeaderDialog extends StatefulWidget {
  final int cid;
  final int num;
  final String totalMoney;

  const BuyHeaderDialog(
      {Key? key,
      required this.cid,
      required this.num,
      required this.totalMoney})
      : super(key: key);

  static bool needShowDialog(int id) {
    return Config.getInt(_getKey(id), 0) == 0;
  }

  static String _getKey(int id) {
    String type;
    switch (id) {
      case 2:
      case 46:
        type = 'copper';
        break;
      case 3:
      case 47:
        type = 'silver';
        break;
      case 4:
      case 48:
        type = 'gold';
        break;
      default:
        type = id.toString();
        break;
    }
    return 'need_show_buy_header_dialog_for_$type';
  }

  @override
  _BuyHeaderDialogState createState() {
    return _BuyHeaderDialogState();
  }
}

class _BuyHeaderDialogState extends State<BuyHeaderDialog> {
  bool _checked = false;

  bool _loading = true;
  Map? _data;

  int _periodDays = 0;
  int _periodHours = 0;

  @override
  void initState() {
    super.initState();
    _load(widget.cid);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _load(int cid) async {
    String url = '${System.domain}commodity/keyheaderinfo?cid=$cid';
    XhrResponse response = await Xhr.getJson(url);
    _loading = false;
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        _data = res['data'];
        if (Util.parseInt(_data?['period']) > 0) {
          _periodDays = Util.parseInt(_data?['period']);
        } else if (Util.parseInt(_data?['period_hour']) > 0) {
          _periodHours = Util.parseInt(_data?['period_hour']);
        }
      } else {
        Fluttertoast.showCenter(msg: res['msg']);
      }
    } else {
      Fluttertoast.showCenter(msg: 'api error!');
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: R.color.mainBgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: _loading
          ? const SizedBox.shrink(child: CupertinoActivityIndicator())
          : _data == null
              ? const EmptyWidget()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: Text(
                        K.base_buy_header,
                        style: TextStyle(
                          color: R.color.mainTextColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: System.imageDomain + _data!['image'],
                      width: 96,
                      height: 96,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        '${MoneyConfig.moneyNum(Util.parseInt(_data?['price']))}${MoneyConfig.moneyName} x${widget.num}',
                        style: const TextStyle(
                          color: Color(0xFFFE6C56),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      _periodDays > 0
                          ? R.string('valid_days_remain',
                              args: [_periodDays.toString()])
                          : _periodHours > 0
                              ? R.string('valid_hours_remain',
                                  args: [_periodHours.toString()])
                              : '',
                      style: TextStyle(
                        fontSize: 11,
                        color: R.color.thirdTextColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 12,
                        bottom: 32,
                      ),
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 6,
                        bottom: 6,
                      ),
                      decoration: BoxDecoration(
                        color: R.color.secondBgColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            K.base_extra_send,
                            style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 13,
                            ),
                          ),
                          R.img(
                            _getImgByCid(Util.parseInt(_data?['key']['cid'])),
                            width:
                                Session.useStar == BoxGameType.None ? 20 : 32,
                            height:
                                Session.useStar == BoxGameType.None ? 20 : 32,
                            fit: BoxFit.contain,
                            package: ComponentManager.MANAGER_VIP,
                          ),
                          Text(
                            BoxUtil.getKeyNameByCid(
                                Util.parseInt(_data?['key']['cid'])),
                            style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            ' x${widget.num}',
                            style: const TextStyle(
                              color: Color(0xFFFE6C56),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(MoneyConfig.moneyIcon,
                              width: 20, height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: NumText(
                              MoneyConfig.moneyNum(Util.parseInt(
                                  Util.parseDouble(widget.totalMoney) * 100)),
                              style: TextStyle(
                                color: R.color.mainTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(false);
                              ISettingManager manager =
                                  ComponentManager.instance.getManager(
                                      ComponentManager.MANAGER_SETTINGS);
                              manager.openRechargeScreen(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    R.string('gift_recharge'),
                                    style: TextStyle(
                                      color: R.color.mainBrandColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(
                                    Icons.navigate_next,
                                    color: R.color.mainBrandColor,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          // 购买按钮
                          GestureDetector(
                            onTap: _submit,
                            child: Container(
                              width: 72,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: R.color.mainBrandColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                R.string('buy'),
                                style: const TextStyle(
                                  color: Color(0xFFFEFEFE),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Checkbox(
                          activeColor: R.color.mainBrandColor,
                          value: _checked,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value != null) {
                                _checked = value;
                              }
                            });
                          },
                        ),
                        Text(
                          K.base_not_show_notice_anymore,
                          style: TextStyle(
                            color: R.color.thirdTextColor,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
    );
  }

  String _getImgByCid(int cid) {
    return BoxUtil.getKeyIconByCid(cid);
  }

  _submit() async {
    // 保存偏好
    if (_checked) {
      Config.set(BuyHeaderDialog._getKey(widget.cid), '1');
    }
    Navigator.of(context).pop(true);
  }
}
