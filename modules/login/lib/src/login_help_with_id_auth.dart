import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../k.dart';

class LoginHelpWithIDAuth extends StatefulWidget {
  final List<AccountItem>? accountItems;

  const LoginHelpWithIDAuth({Key? key, this.accountItems}) : super(key: key);

  @override
  _LoginHelpWithIDAuthState createState() => _LoginHelpWithIDAuthState();
}

class _LoginHelpWithIDAuthState extends State<LoginHelpWithIDAuth> {
  List<Widget> _buildDescTitle() {
    List<Widget> widgets = [];

    widgets.add(Container(
      height: 46,
    ));
    widgets.add(
      Text(
        K.update_accounts_title,
        style: R.textStyle.title.copyWith(fontSize: 22),
      ),
    );
    widgets.add(Container(
      height: 4,
    ));
    widgets.add(
      Text(
        K.login_chang_safe_detail,
        style: R.textStyle.caption,
      ),
    );
    widgets.add(Container(
      height: 32,
    ));

    return widgets;
  }

  Widget _buildAccountItem(AccountItem item) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: '${System.imageDomain}${item.icon}',
              suffix: '!head150',
              placeholder: const CupertinoActivityIndicator(),
              width: 56.0,
              height: 56.0,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
            ),
            child: Text(
              item.name,
              style: R.textStyle.subhead,
            ),
          )),
          IDWidget(
            uid: item.uid,
            fontSize: 14,
            fontColor: R.color.thirdTextColor,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }

  List<Widget> _buildAccountList() {
    return widget.accountItems?.isNotEmpty == true
        ? widget.accountItems!
            .map((item) => _buildAccountItem(item))
            .toList(growable: false)
        : [];
  }

  _onNext() async {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.addAll(_buildDescTitle());
    widgets.addAll(_buildAccountList());

    return Scaffold(
      appBar: BaseAppBar(''),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(
            left: R.dimen.defaultScreenMarginLeft,
            right: R.dimen.defaultScreenMarginRight),
        child: Column(
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: widgets,
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 12, top: 12),
              child: RawMaterialButton(
                onPressed: _onNext,
                fillColor: R.color.mainBrandColor,
                constraints:
                    const BoxConstraints.expand(width: 343, height: 48),
                shape: const StadiumBorder(),
                child: Text(
                  K.next_step,
                  style: R.textStyle.button
                      .copyWith(color: const Color(0xFFFFFFFF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
