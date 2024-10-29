import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';

import '../assets.dart';
import '../k.dart';
import 'login_help_with_id_auth.dart';

/// 账号登录问题
///
class LoginHelp extends StatefulWidget {
  const LoginHelp({Key? key}) : super(key: key);

  @override
  _LoginHelpState createState() => _LoginHelpState();
}

class _LoginHelpState extends State<LoginHelp> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
  }

  //登录成功,需要退出该界面
  _onLogin(String type, dynamic data) {
    Navigator.pop(context);
  }

  _buildItem(String content, {VoidCallback? onTap}) {
    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 56,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                content,
                style: TextStyle(
                  fontSize: 16.0,
                  color: R.color.mainTextColor,
                ),
              )),
              R.img(Assets.login$ic_login_next_svg,
                  width: 16,
                  height: 16,
                  color: R.color.thirdTextColor,
                  package: ComponentManager.MANAGER_LOGIN)
            ],
          ),
        ),
      );
    }

    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            K.operations_step_three,
            style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(fontSize: 14.0, color: R.color.secondTextColor),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.account_login_error),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 20.0, bottom: 12.0, start: 20.0, end: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                K.following_these_operations_when_login_error,
                style:
                    TextStyle(fontSize: 14.0, color: R.color.secondTextColor),
              ),
              const SizedBox(height: 12.0),
              _buildItem(
                K.operations_step_one,
                onTap: () {
                  ISettingManager settingManager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_SETTINGS);
                  settingManager.openSafeMobileInputScreen(context,
                      type: 'select', uid: '0');
                },
              ),
              if (!Util.isLocale)
                _buildItem(K.operations_step_two, onTap: loginWithIDAuth),
              const SizedBox(height: 12.0),
              Divider(height: 1, color: R.color.dividerColor),
              const SizedBox(height: 12.0),
              _buildItem(K.operations_step_three_content(
                  [BaseConfig.instance.mailAddress])),
              const Spacer(),
              _buildFeedback(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeedback() {
    return InkWell(
      onTap: () {
        Tracker.instance.track(TrackEvent.click, properties: {
          'click_page': 'feedbackEntrance_login',
        });
        BaseWebviewScreen.show(context, url: Constant.feedbackUrl);
      },
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(BaseK.K.feedback,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
      ),
    );
  }

  void loginWithIDAuth() async {
    //身份认证
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    dynamic data =
        await settingManager.openIdAuth(context, certifyType: CertifyType.find);

    if (data == null || data is! Map || Util.parseInt(data['status']) != 1)
      return;
    List accounts = data['users'];
    if (accounts.isEmpty) {
      Fluttertoast.showToast(msg: K.no_account_bind);
      return;
    }

    List<AccountItem> items = [];
    try {
      for (var json in accounts) {
        items.add(AccountItem.fromJson(json));
      }
    } catch (e) {
      Log.d(e);
    }

    bool success =
        await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LoginHelpWithIDAuth(
        accountItems: items,
      );
    }));

    Navigator.of(context).pop();

    if (success) {
      ISettingManager settingManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_SETTINGS);
      settingManager.openSafeMobileInputScreen(
        context,
        type: 'rebind',
        uid: '${items[0].uid}',
      );
    }
  }
}
