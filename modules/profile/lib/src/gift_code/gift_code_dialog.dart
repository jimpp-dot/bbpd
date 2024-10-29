import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';
import '../model/pb/generated/gift_bag.pb.dart';
import 'gift_code_gain_dialog.dart';

class GiftCodeDialog extends StatefulWidget {
  const GiftCodeDialog({super.key});

  @override
  _GiftCodeDialogState createState() => _GiftCodeDialogState();

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return const GiftCodeDialog();
      },
    );
  }
}

class _GiftCodeDialogState extends State<GiftCodeDialog> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  RespGiftBagSend? _resp;
  bool _hasBeenInput = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Util.width - 60,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: R.color.mainBgColor,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    K.profile_please_input_gift_code,
                    style: TextStyle(
                      color: R.color.unionRankText1,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      height: 50,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: R.color.secondBgColor,
                      ),
                      child: TextField(
                        controller: _textEditingController,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          fillColor: R.color.secondBgColor,
                        ),
                        // autofocus: true,
                        autocorrect: false,
                        // readOnly: !this.widget.editable,
                        onChanged: _onTextChange,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      if (Util.validStr(_textEditingController.text)) {
                        _postGiftCode(_textEditingController.text);
                      } else {
                        Fluttertoast.showToast(
                            msg: K.profile_gift_code_empty_tip,
                            gravity: ToastGravity.CENTER);
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 48,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.dp),
                        gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors
                              .map(
                                  (e) => e.withOpacity(_hasBeenInput ? 1 : 0.3))
                              .toList(),
                        ),
                      ),
                      child: Text(
                        K.profile_sign_get,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0)
                ]),
          ),
          SizedBox(height: keyboard),
        ],
      ),
    );
  }

  void _postGiftCode(String code) async {
    String url = '${System.domain}go/yy/gift_bag/giftBagSend';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'code': code,
          },
          pb: true,
          throwOnError: false);

      _resp = RespGiftBagSend.fromBuffer(response.bodyBytes);
      if (_resp != null && _resp?.success == true) {
        Tracker.instance.track(
          TrackEvent.click,
          properties: {
            'click_page': 'gift_bag_get_click',
            'uid': Session.uid.toString(),
            'gift_bag_code': code
          },
        );
        Navigator.of(context).pop();
        if (Util.validList(_resp?.rewardList)) {
          GiftCodeGainDialog.show(context, _resp?.rewardList);
        } else {
          Fluttertoast.showToast(
              msg: K.profile_submmit_fail, gravity: ToastGravity.CENTER);
        }
      } else {
        Fluttertoast.showToast(
            msg: _resp?.msg ?? '', gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }
  }

  void _onTextChange(String text) {
    _hasBeenInput = Util.validStr(text);
    if (mounted) {
      setState(() {});
    }
  }
}
