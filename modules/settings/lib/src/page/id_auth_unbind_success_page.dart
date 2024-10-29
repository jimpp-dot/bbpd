import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/assets.dart';

import '../../k.dart';

class IdAuthUnbindSuccessPage extends StatefulWidget {
  const IdAuthUnbindSuccessPage({super.key});

  @override
  State<IdAuthUnbindSuccessPage> createState() =>
      _IdAuthUnbindSuccessPageState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const IdAuthUnbindSuccessPage(),
        settings: const RouteSettings(name: '/idAuthUnbindSuccessPage'),
      ),
    );
  }
}

class _IdAuthUnbindSuccessPageState extends State<IdAuthUnbindSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: BaseAppBar.custom(
          title: Text(
            K.unbind_user_auth,
            style: TextStyle(
              fontSize: 18,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          showBack: true,
          onBackPressedCallback: () {
            Navigator.popUntil(context, ModalRoute.withName('/accountSetting'));
          },
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              R.img(
                Assets.settings$unbind_success_webp,
                width: 64.dp,
                height: 64.dp,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                K.unbind_user_auth_success,
                style: TextStyle(
                  fontSize: 18,
                  color: R.color.mainTextColor,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomButton.of(
          margin: const EdgeInsetsDirectional.only(
              bottom: 12.0, top: 8.0, start: 20.0, end: 20.0),
          title: K.finish,
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/accountSetting'));
          },
        ),
      ),
    );
  }
}
