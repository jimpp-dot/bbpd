import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:profile/assets.dart';
import 'package:profile/k.dart';
import 'package:profile/src/api/api.dart';

import 'coupon_dialog.dart';

/// 兑换
///
class CdKeyScreen extends StatefulWidget {
  static Future show(BuildContext context) async {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CdKeyScreen(),
    ));
  }

  const CdKeyScreen({super.key});

  @override
  _CdKeyScreenState createState() => _CdKeyScreenState();
}

class _CdKeyScreenState extends State<CdKeyScreen> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  bool _disabled = true;

  close() {
    _focusNode.unfocus();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    close();
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  _onSubmit(String text) async {
    if (Util.isStringEmpty(text)) return;
    FocusScope.of(context).requestFocus(FocusNode());
    Log.d('cdkey: $text');

    DataRsp<ShopMailCommodity> rsp = await Api.exchange(text);
    if (rsp.success == true) {
      ShopMailCommodity? data = rsp.data;
      if (data == null) {
        Fluttertoast.showToast(msg: K.profile_exchange_failed);
      } else {
        CouponDialog.show(context, data);
      }
    } else {
      Fluttertoast.showToast(msg: rsp.msg);
    }
  }

  _onChanged(String value) {
    setState(() {
      _disabled = value.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar.custom(
        title: Text(
          K.profile_exchange_code,
          style: R.textStyle.title,
        ),
        actions: [
          TextButton(
            onPressed: () => _onSubmit(_textEditingController.text),
            child: Text(
              BaseK.K.base_submmit,
              style: TextStyle(
                fontSize: 14,
                color: _disabled
                    ? R.color.mainTextColor.withOpacity(0.2)
                    : R.color.mainTextColor,
              ),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            const SizedBox(height: 32),
            R.img(Assets.ic_exchange_code_webp,
                package: Assets.package, width: 160.dp, height: 160.dp),
            const SizedBox(height: 8),
            Text(K.profile_exchange_input, style: R.textStyle.regular16),
            const SizedBox(height: 32),
            Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                    color: R.color.mainTextColor.withOpacity(0.08), width: 2),
              ),
              alignment: AlignmentDirectional.centerStart,
              margin: const EdgeInsets.symmetric(horizontal: 36),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: K.profile_exchange_input_hint,
                  counterText: '',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: R.color.thirdTextColor,
                  ),
                ),
                textInputAction: TextInputAction.done,
                style: TextStyle(
                  fontSize: 16,
                  color: R.color.secondTextColor,
                ),
                autofocus: false,
                autocorrect: false,
                maxLines: 1,
                maxLength: 30,
                focusNode: _focusNode,
                onSubmitted: _onSubmit,
                onChanged: _onChanged,
              ),
            ),
          ],
        ),
      );
}
