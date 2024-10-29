import 'package:personaldata/k.dart';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personaldata/src/model/credit_record_bean.dart';
import 'package:intl/intl.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:provider/provider.dart' hide Selector;

class CreditRecordScreen extends StatefulWidget {
  const CreditRecordScreen({Key? key}) : super(key: key);

  @override
  _CreditRecordScreenState createState() => _CreditRecordScreenState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CreditRecordScreen(),
      settings: const RouteSettings(name: '/creditRecordScreen'),
    ));
  }
}

class _CreditRecordScreenState extends State<CreditRecordScreen> {
  bool _loading = false;

  int _totalScore = 0;
  Map _runInfo = {};
  List<CreditRecordItem> _data = [];

  @override
  initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      String url = "${System.domain}/games/credit/getCreditScoreList";
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      CreditRecord record =
          CreditRecord.fromJson(response.response as Map<String, dynamic>);
      if (!mounted) return;
      setState(() {
        _loading = false;
        if (record.success && record.data != null) {
          _totalScore = record.creditScore;
          _runInfo = record.runInfo!;
          _data = record.data!;
        }
      });
    } catch (e) {
      Log.d(e.toString());
      if (!mounted) return;
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        _buildHeader(),
        Expanded(
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildJumpAlarm() {
    var formatter = DateFormat(K.personaldata_jump_car_datetime_format);
    String jumpTime = formatter.format(
        DateTime.fromMicrosecondsSinceEpoch(_runInfo['out_time'] * 1000000));
    int remainingTime = _runInfo['out_time'] +
        _runInfo['duration'] -
        DateTime.now().millisecondsSinceEpoch ~/ 1000;
    int hour = _runInfo['duration'] ~/ 3600;
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 16, start: 16),
      padding: const EdgeInsetsDirectional.only(
          top: 10, bottom: 16, end: 16, start: 16),
      decoration: const BoxDecoration(
        color: Color(0xff2C2D2F),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 95,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: const Color(0xffFF740F), width: 1),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 14,
                      height: 12,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xffFF740F),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Text(
                        K.personaldata_jump_car,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      K.personaldata_jump_car_title(['$hour']),
                      style: const TextStyle(
                          color: Color(0xffFF740F),
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              CountDownText(
                due: DateTime.now().add(Duration(seconds: remainingTime)),
                finishedText: '0',
                showLabel: false,
                prefix: K.personaldata_jump_car_remain_time,
                style: TextStyle(
                    color: R.color.secondTextColor,
                    fontSize: 14,
                    fontFeatures: const [FontFeature.tabularFigures()],
                    fontFamily: Util.numFontFamily,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            K.personaldata_jump_car_desc([jumpTime, '$hour']),
            style: TextStyle(
                color: R.color.secondTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_data.isEmpty) {
      return Center(
        child: Text(
          K.personaldata_no_data,
          style: R.textStyle.body1,
        ),
      );
    }

    return RefreshIndicatorFactory.of(
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(index);
          }),
      onRefresh: _load,
    );
  }

  Widget _buildItem(int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: R.color.dividerColor,
            width: 0.5,
          ),
        ),
      ),
      margin: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
      padding: const EdgeInsetsDirectional.only(
        top: 12.0,
        bottom: 12.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  _data[index].description ?? '',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: R.color.mainTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                children: [
                  NumText(_data[index].changeScore ?? '',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: R.color
                              .mainBrandColor, //Color(0xffffffff).withOpacity(0.5),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal)),
                  const SizedBox(width: 2),
                  R.img(
                    'credit_score.webp',
                    width: 15,
                    height: 15,
                    package: ComponentManager.MANAGER_PERSONALDATA,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Visibility(
                visible: Util.parseInt(_data[index].changeDiamond) < 0,
                child: Row(
                  children: [
                    const SizedBox(width: 16, height: 1),
                    NumText(_data[index].changeDiamond ?? '',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: R.color
                                .mainBrandColor, //Color(0xffffffff).withOpacity(0.5),
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal)),
                    const SizedBox(width: 2),
                    R.img(
                      'credit_score_diamond.webp',
                      width: 15,
                      height: 15,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                Util.parseInt(_data[index].changeScore) > 0
                    ? K.personal_credit_award
                    : K.personal_credit_punish,
                style: TextStyle(
                  fontSize: 13.0,
                  color: R.color.mainTextColor.withOpacity(0.25),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                DateFormat('yyyy.MM.dd HH:mm').format(
                    DateTime.fromMicrosecondsSinceEpoch(
                        Util.parseInt(_data[index].dateline) * 1000000)),
                style: TextStyle(
                  fontSize: 13.0,
                  color: R.color.mainTextColor.withOpacity(0.25),
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: R.color.mainBgColor,
      width: MediaQuery.of(context).size.width,
      height: 172 +
          (_runInfo == null ? 0 : 100) +
          MediaQuery.of(context).padding.top,
      child: Stack(
        children: [
          R.img(
            'credit_record_bg.webp',
            width: MediaQuery.of(context).size.width,
            height: 172 + MediaQuery.of(context).padding.top,
            package: ComponentManager.MANAGER_PERSONALDATA,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              BaseAppBar.custom(
                backColor: const Color(0xffffffff),
                backgroundColor: Colors.transparent,
                title: Text(
                  K.personal_credit_record,
                  style: R.textStyle.title.copyWith(
                    color: const Color(0xffffffff),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: <Widget>[
                  InkWell(
                    child: Container(
                      padding:
                          const EdgeInsetsDirectional.only(end: 16, start: 16),
                      alignment: Alignment.center,
                      child: Text(
                        K.personal_credit_desc,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    onTap: () {
                      BaseWebviewScreen.show(context,
                          url:
                              "https://page.${System.mainDomain}/rule-collection/reputation-rule.html");
                    },
                  )
                ],
              ),
              Container(
                height: 10.0,
              ),
              _buildCreditBalance(),
              Container(
                height: 16.0,
              ),
              _buildJumpAlarm(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreditBalance() {
    return Container(
      child: Consumer<PersonalInfoProvider>(
        builder: (context, moneyLoad, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              NumText(
                _totalScore == 0 ? '--' : '$_totalScore',
                style: const TextStyle(
                  fontSize: 32,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                height: 6,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  R.img(
                    'credit_score_white.webp',
                    width: 15,
                    height: 15,
                    package: ComponentManager.MANAGER_PERSONALDATA,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    width: 6.0,
                  ),
                  Text(
                    K.personal_credit_score,
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xffffffff).withOpacity(
                        0.6,
                      ),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
