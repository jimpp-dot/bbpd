import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';

import '../../assets.dart';
import 'verify_phone_num.dart';

enum CancellationState {
  Normal, // 正常
  PendingApproval, // 已申请待审核
  Approved, // 已批准
  Rejected, // 已拒绝
}

/// 申请注销账号
class ApplyCancellation extends StatefulWidget {
  const ApplyCancellation({super.key});

  @override
  _ApplyCancellationState createState() {
    return _ApplyCancellationState();
  }

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ApplyCancellation(),
      settings: const RouteSettings(name: '/cancellation'),
    ));
  }
}

class _ApplyCancellationState extends State<ApplyCancellation> {
  CancellationState _state = CancellationState.Normal;
  String? _phone;
  String? _areaCode;

  @override
  void initState() {
    super.initState();

    _queryState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.account_cancel_title),
      body: Center(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    if (_state == CancellationState.Normal) {
      return _buildNormal();
    } else if (_state == CancellationState.PendingApproval) {
      return _buildPendingApproval();
    } else if (_state == CancellationState.Approved) {
      return _buildApproved();
    } else {
      return _buildError();
    }
  }

  Widget _buildError() {
    return Center(
      child: Text(K.setting_invalid_state),
    );
  }

  Widget _buildNormal() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 76),
          child: ListView(
            padding: EdgeInsets.only(
                left: 18, right: 18, bottom: Util.iphoneXBottom),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Text(
                  K.setting_account_delete_condition_lable,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 19,
                ),
                child: Text(
                  K.setting_account_delete_condition,
                  style: TextStyle(
                    color: R.color.secondTextColor,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  K.setting_account_delete_will_be_lable,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  K.setting_account_delete_will_be,
                  style: TextStyle(
                    color: R.color.secondTextColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: Util.iphoneXBottom,
            ),
            child: Container(
              color: R.color.mainBgColor,
              width: double.infinity,
              height: 76,
              padding: const EdgeInsets.only(
                left: 18,
                top: 14,
                right: 18,
                bottom: 14,
              ),
              alignment: Alignment.center,
              child: SizedBox.expand(
                child: GestureDetector(
                  onTap: _phone == null ? null : _onApply,
                  child: Container(
                    decoration: BoxDecoration(
                      color: R.color.mainBrandColor,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      K.setting_apply_delete_account,
                      style: TextStyle(
                        color: R.color.mainBgColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPendingApproval() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: R.img(
            Assets.settings$review_review_pending_png,
            width: 180,
            height: 180,
            package: ComponentManager.MANAGER_SETTINGS,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            K.setting_apply_delete_wait_check,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
          padding: const EdgeInsetsDirectional.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.03),
            borderRadius: BorderRadius.circular(12),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '1.账户注销处理期限为',
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.5)),
                ),
                TextSpan(
                  text: "15日\n",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.9)),
                ),
                TextSpan(
                  text: '2.若主动登陆则视为取消账号注销申请，您的申请审核结果将自动记为不通过，账号注销失败\n',
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.5)),
                ),
                TextSpan(
                  text: '3.审核通过后，您需在当前页面进行',
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.5)),
                ),
                TextSpan(
                  text: "最终确认",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.9)),
                ),
                TextSpan(
                  text: '，才能完成注销\n',
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.5)),
                ),
                TextSpan(
                  text: '4.账号一旦注销完成，则',
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.5)),
                ),
                TextSpan(
                  text: "无法恢复",
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.9)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildApproved() {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: R.img(
                Assets.settings$review_review_approved_png,
                width: 125,
                height: 125,
                package: ComponentManager.MANAGER_SETTINGS,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                bottom: 10,
              ),
              child: Text(
                K.setting_del_account_apply_pass,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF313133),
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        PositionedDirectional(
          bottom: 0,
          start: 0,
          end: 0,
          child: BottomButton.of(
              title: K.setting_delete_account, onTap: _onConfirmCancellation),
        ),
      ],
    );
  }

  /// 查询状态
  _queryState() async {
    String url = '${System.domain}account/cancelstatus';
    XhrResponse response = await Xhr.postJson(url, null);
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        String status = res['data']['status'].toString();
        refresh(() {
          _phone = Utility.splitPhone(res['phone'])['phone'];
          _areaCode = Utility.splitPhone(res['phone'])['area'];
          if (status == "0") {
            _state = CancellationState.Normal;
          } else if (status == "1") {
            _state = CancellationState.PendingApproval;
          } else if (status == "2") {
            _state = CancellationState.Approved;
          } else {
            _state = CancellationState.Normal;
          }
        });
      } else {
        Fluttertoast.showCenter(msg: res['msg']);
        refresh(() {
          _state = CancellationState.Normal;
        });
      }
    } else {
      Fluttertoast.showCenter(msg: response.error.toString());
      if (!mounted) {
        return;
      }
      refresh(() {
        _state = CancellationState.Normal;
      });
    }
  }

  /// 点击申请注销按钮
  _onApply() async {
    bool result = await VerifyPhoneNum.show(context, _areaCode, _phone);
    if (result) {
      await _queryState();
    }
  }

  /// 确认注销
  _onConfirmCancellation() async {
    bool confirm = await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(K.setting_del_account_notice),
            actions: <Widget>[
              CupertinoButton(
                  child: Text(K.setting_not_del_account),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  }),
              CupertinoButton(
                  child: Text(K.setting_delete_account),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  }),
            ],
          );
        });

    String url = '${System.domain}account/cancelconfirm';
    if (confirm) {
      XhrResponse response = await Xhr.postJson(url, {'op': 'confirm'});
      if (response.error == null) {
        Map res = response.value();
        if (res['success'] == true) {
          Toast.showCenter(context, K.setting_del_account_success);
          Navigator.of(context).popUntil(ModalRoute.withName('/'));
          Session.logout();
        } else {
          Toast.showCenter(context, res['msg']);
        }
      } else {
        Toast.showCenter(context, response.error.toString());
      }
    } else {
      XhrResponse response = await Xhr.postJson(url, {'op': 'cancel'});
      if (response.error == null) {
        Map res = response.value();
        if (res['success'] == true) {
          Toast.showCenter(context, K.setting_recall_del_account);
          Navigator.of(context).pop();
        } else {
          Toast.showCenter(context, res['msg']);
        }
      } else {
        Toast.showCenter(context, response.error.toString());
      }
    }
  }
}
