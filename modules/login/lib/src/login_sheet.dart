import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_help.dart';

/// 快捷登录界面
class LoginSheet extends StatefulWidget {
  final BuildContext context;
  final bool isBarrierDismissible;
  final bool? isQQInstalled;
  final bool? isWxInstalled;
  final bool canPhoneAuth;
  final ValueSetter<int> onItemClick;

  const LoginSheet({
    super.key,
    required this.context,
    this.isQQInstalled = false,
    this.isWxInstalled = false,
    required this.canPhoneAuth,
    required this.onItemClick,
    this.isBarrierDismissible = true,
  });

  bool _onError(String message) {
    Navigator.pop(context);
    return false;
  }

  bool _onComplete(Object result) {
    return false;
  }

  /// 点击手机号登录
  _onPhoneLogin() async {
    onItemClick(2);
    if (isBarrierDismissible) {
      Navigator.pop(context);
    }
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    if (canPhoneAuth == true) {
      loginManager.openOneKeyLogin(context);
    } else {
      loginManager.openPhoneLogin(context);
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LoginSheet> {
  final List<Widget> _thirdItems = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _build();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(10), topEnd: Radius.circular(10))),
      child: _loading
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LoginHeader(),
                Container(
                  padding: const EdgeInsets.only(bottom: 12.0, top: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _thirdItems),
                ),
                const LoginFooter(),
              ],
            ),
    );
  }

  Future _build() async {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    List<IThirdPlatform> validPlatforms = await loginManager.getValidPlatform();
    for (IThirdPlatform platform in validPlatforms) {
      _thirdItems.add(GestureDetector(
          child: platform.getIcon(width: 56, height: 56),
          onTap: () {
            widget.onItemClick(0);
            platform.onLoginTap(context, "login", (result) {
              widget._onComplete(result);
            }, (msg) {
              widget._onError(msg);
            });
          }));
    }
    _thirdItems.add(GestureDetector(
      onTap: widget._onPhoneLogin,
      child: SvgPicture.asset(
        R.imagePath("login_phone.svg", package: ComponentManager.MANAGER_LOGIN),
        width: 56.0,
        height: 56.0,
      ),
    ));

    if (!mounted) {
      return;
    }

    setState(() {
      _loading = false;
    });
  }
}

class _LoginIcon extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? url;

  const _LoginIcon({Key? key, this.onTap, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: R.color.dividerColor, width: 1.5),
        ),
        alignment: Alignment.center,
        child: R.img(
          url,
          package: ComponentManager.MANAGER_LOGIN,
          width: 36.0,
          height: 36.0,
        ),
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 75.0, right: 75, top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Separator(
            height: 0.5,
            color: R.color.dividerColor,
          ),
          Container(
            margin: const EdgeInsets.only(left: 9.0, right: 9.0),
            child: Text(
              R.string('select_login_way'),
              style: TextStyle(
                fontSize: 15,
                color: R.color.mainTextColor,
              ),
            ),
          ),
          Separator(
            height: 0.5,
            color: R.color.dividerColor,
          ),
        ],
      ),
    );
  }
}

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      child: TextButton(
        child: Text(
          R.string('encounter_problems_when_login'),
          style: TextStyle(
            fontSize: 13,
            color: R.color.thirdTextColor,
          ),
        ),
        onPressed: () async {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginHelp()));
        },
      ),
    );
  }
}

class Separator extends StatelessWidget {
  const Separator(
      {Key? key,
      this.height = 16.0,
      this.width = double.infinity,
      this.indent = 0.0,
      this.color})
      : assert(height >= 0.0),
        super(key: key);

  final double height;
  final double width;
  final double indent;
  final Color? color;

  static BorderSide createBorderSide(BuildContext context,
      {Color? color, double width = 0.0}) {
    return BorderSide(
      color: color ?? Theme.of(context).dividerColor,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: height,
      child: Center(
        child: Container(
          height: 0.0,
          margin: EdgeInsetsDirectional.only(start: indent),
          decoration: BoxDecoration(
            border: Border(
              bottom: createBorderSide(context,
                  color: color, width: height - indent),
            ),
          ),
        ),
      ),
    ));
  }
}
