import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

import '../../k.dart';
import '../images.dart';

class CreditTip extends StatefulWidget {
  final int uid;

  const CreditTip({Key? key, this.uid = 0}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreditTipState();
  }
}

class _CreditTipState extends State<CreditTip> {
  Map _data = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _load() async {
    _loading = true;
    try {
      String url = '${System.domain}profile/creditTip';
      Map<String, String> post = {
        'uid': widget.uid.toString(),
      };

      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);

      Map res = response.response as Map;
      if (res['success'] == true && res['data'] != null) {
        _data = res['data'];
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  reload() {
    if (!_loading) {
      _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    var score1 = Util.parseDouble(_data['score1']);
    var score2 = Util.parseDouble(_data['score2']);
    var score3 = Util.parseDouble(_data['score3']);

    var diffscore1 = score1 >= Util.parseDouble(_data['scorev1']);
    var diffscore2 = score2 >= Util.parseDouble(_data['scorev2']);
    var diffscore3 = score3 >= Util.parseDouble(_data['scorev3']);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 72.0,
              child: Text(
                '${K.personal_gog_level}：',
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              width: 67.0,
              alignment: AlignmentDirectional.centerEnd,
              child: Images.img(
                  'credit/credit_${max(0, Util.parseInt(_data['credit_level']))}.png',
                  width: 24,
                  height: 24),
            ),
            Container(
              width: 72.0,
              margin: const EdgeInsets.only(left: 39.0),
              child: Text(
                '${K.consistent_data}：',
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              width: 45.0,
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                score1.toString(),
                style: TextStyle(
                  color: R.color.thirdBrightColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 6.0),
                child: Images.img(
                  diffscore1 ? 'level_high.png' : 'level_low.png',
                  width: 14.0,
                  height: 14.0,
                )),
          ],
        ),
        Container(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 72.0,
              child: Text(
                '${K.number_of_invitations}：',
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              width: 67.0,
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                K.few_count(['${_data['ordernum']}']),
                style: TextStyle(
                  color: R.color.thirdBrightColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              width: 72.0,
              margin: const EdgeInsets.only(left: 39.0),
              child: Text(
                '${K.attitude_status}：',
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              width: 45.0,
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                score2.toString(),
                style: TextStyle(
                  color: R.color.thirdBrightColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 6.0),
                child: Images.img(
                  diffscore2 ? 'level_high.png' : 'level_low.png',
                  width: 14.0,
                  height: 14.0,
                )),
          ],
        ),
        Container(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 72.0,
              child: Text(
                '${K.achieving_rate}：',
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              width: 67.0,
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                '${_data['orderper']}%',
                style: TextStyle(
                  color: R.color.thirdBrightColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              width: 72.0,
              margin: const EdgeInsets.only(left: 39.0),
              child: Text(
                '${K.process_experience}：',
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              width: 45.0,
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                score3.toString(),
                style: TextStyle(
                  color: R.color.thirdBrightColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 6.0),
              child: Images.img(
                diffscore3 ? 'level_high.png' : 'level_low.png',
                width: 14.0,
                height: 14.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
