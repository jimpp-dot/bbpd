import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:shared/shared.dart';

import '../../k.dart';
import 'gender.dart';

class EditGenderAgeWidget extends StatefulWidget {
  const EditGenderAgeWidget({super.key});

  @override
  _EditGenderAgeWidgetState createState() => _EditGenderAgeWidgetState();
}

class _EditGenderAgeWidgetState extends State<EditGenderAgeWidget> {
  bool _showGender = true;
  bool _showAge = true;
  String _selectGender = '';
  final TextEditingController _textController = TextEditingController();
  String _dateStr = '';
  DateTime? cacheInitTime;
  String _title = '';

  @override
  void initState() {
    super.initState();
    _showGender = !(Session.sex > 0);
    _showAge = !Util.validStr(Session.birthday);
    if (_showGender && _showAge) {
      _title = K.select_your_gender_and_age;
    } else if (_showAge) {
      _title = K.select_your_age;
    } else if (_showGender) {
      _title = K.select_your_gender;
    }
    Tracker.instance.track(TrackEvent.genderFillPop);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 22),
          Row(
            children: [
              const SizedBox(width: 44),
              const Spacer(),
              Text(
                _title,
                style: R.textStyle.medium18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).maybePop();
                },
                child: R.img(
                  'ic_close_translucent.svg',
                  width: 24,
                  height: 24,
                  color: R.color.mainTextColor,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 9),
          Text(
            K.login_complete_info_tips,
            style: R.textStyle.regular14.copyWith(fontSize: 13, color: R.color.secondTextColor),
          ),
          if (_showGender)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(width: 40.dp),
                  GenderLayout('1', _selectGender == '1', _onSelectGender),
                  Expanded(child: Container()),
                  GenderLayout('2', _selectGender == '2', _onSelectGender),
                  SizedBox(width: 40.dp),
                ],
              ),
            ),
          if (_showAge)
            Container(
              height: 54,
              margin: EdgeInsetsDirectional.only(top: 21, start: 40 * Util.ratio, end: 40 * Util.ratio),
              padding: const EdgeInsetsDirectional.only(start: 24, end: 20),
              decoration: BoxDecoration(
                color: R.color.secondBgColor,
                borderRadius: BorderRadius.circular(27),
              ),
              alignment: AlignmentDirectional.centerStart,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      onTap: () {
                        DateTime now = DateTime.now();
                        int maxYear = now.year - 18;
                        DatePicker.showDatePicker(
                          context,
                          pickerTheme: DateTimePickerTheme(
                            backgroundColor: R.color.mainBgColor,
                            cancel: Text(
                              '取消',
                              style: TextStyle(
                                color: R.color.secondTextColor,
                                fontSize: 17,
                                fontFamily: Util.fontFamily,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            confirm: Text(
                              '确认',
                              style: TextStyle(
                                color: R.color.mainBrandColor,
                                fontSize: 17,
                                fontFamily: Util.fontFamily,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            itemTextStyle: TextStyle(color: R.color.mainTextColor, fontSize: 15),
                            itemHeight: 40,
                          ),
                          minDateTime: DateTime(1970, 1, 1),
                          maxDateTime: DateTime(maxYear, 12, 31),
                          initialDateTime: DateTime(
                            1990,
                            1,
                            1,
                          ),
                          onConfirm: (DateTime dateTime, List<int> selectedIndex) async {
                            cacheInitTime = dateTime;
                            _textController.text = Utility.formatDateToDayAndChinese(dateTime);
                            _dateStr = Utility.formatDateToDayFromDateTime(dateTime);
                            refresh();
                          },
                        );
                        // DateTime initTime = cacheInitTime ?? DateTime(2000);
                        // _textController.text =
                        //     Utility.formatDateToDayAndChinese(initTime);
                        // _dateStr =
                        //     Utility.formatDateToDayFromDateTime(initTime);
                        // setState(() {});
                        //
                        // showModalBottomSheet(
                        //     backgroundColor: Colors.white,
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return SizedBox(
                        //         height: 200,
                        //         child: CupertinoDatePicker(
                        //           mode: CupertinoDatePickerMode.date,
                        //           initialDateTime: initTime,
                        //           minimumDate: DateTime(1970),
                        //           maximumDate: DateTime(
                        //               DateTime.now().year - 18,
                        //               DateTime.now().month,
                        //               DateTime.now().day),
                        //           onDateTimeChanged: (DateTime time) {
                        //             cacheInitTime = time;
                        //             _textController.text =
                        //                 Utility.formatDateToDayAndChinese(time);
                        //             _dateStr =
                        //                 Utility.formatDateToDayFromDateTime(
                        //                     time);
                        //             setState(() {});
                        //           },
                        //         ),
                        //       );
                        //     });
                      },
                      controller: _textController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: K.login_select_age,
                        counterText: '',
                        hintStyle: TextStyle(fontSize: 16, color: R.color.thirdTextColor),
                      ),
                      style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
                      autofocus: false,
                      autocorrect: false,
                      maxLines: 1,
                      maxLength: 20,
                    ),
                  ),
                ],
              ),
            ),
          if (_showAge)
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 16),
              child: Text(
                K.age_mark,
                style: TextStyle(fontSize: 13, color: R.color.thirdTextColor, fontWeight: FontWeight.w500),
              ),
            ),
          GestureDetector(
            onTap: _gotoNextPage,
            child: Container(
              height: 52,
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsetsDirectional.only(top: 24, start: 20, end: 20, bottom: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: _canGotoNextPage() ? R.color.mainBrandGradientColors : R.color.darkGradientColors),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                K.login_ensure,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }

  _canGotoNextPage() {
    return (!_showAge || Util.validStr(_dateStr)) && (!_showGender || (Util.parseInt(_selectGender, 0) > 0));
  }

  _gotoNextPage() async {
    bool hasFail = false;
    if (_showAge) {
      BaseResponse response = await BaseRequestManager.editAccountInfo('birthday', _dateStr);
      if (response.success == true) {
        Session.setValue('birthday', _dateStr);
      } else {
        hasFail = true;
        if (response.msg != null && response.msg!.isNotEmpty) {
          Fluttertoast.showCenter(msg: response.msg);
        }
      }
    }

    if (_showGender && !hasFail) {
      BaseResponse response = await BaseRequestManager.editAccountInfo('sex', _selectGender);
      if (response.success == true) {
        Session.setValue('sex', _selectGender);
      } else {
        if (response.msg != null && response.msg!.isNotEmpty) {
          Fluttertoast.showCenter(msg: response.msg);
        }
        hasFail = true;
      }
    }
    if (!hasFail) {
      Navigator.of(context).maybePop();
    }
  }

  _onSelectGender(String gender) {
    _selectGender = gender;
    refresh();
  }
}
