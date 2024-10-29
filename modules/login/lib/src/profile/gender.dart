import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/k.dart';
import 'package:login/src/api/api.dart';
import 'package:login/src/profile/invite_code_widget.dart';
import 'package:login/src/profile/tag_set.dart';

import '../../login.dart';
import 'one_key_follow_screen.dart';

/// 选择性别
class GenderAndAge extends StatefulWidget {
  final bool needShowInviteCode; //第三方登录如果有头像和验证码跳过填写昵称页面需要在这个页面显示邀请码入口
  final bool needOneKeyFollow;
  final String? defaultSex;
  final DateTime? defaultBirthday;
  final Function(int sex)? changeSex;

  const GenderAndAge({
    Key? key,
    this.needShowInviteCode = false,
    this.needOneKeyFollow = false,
    this.defaultSex,
    this.defaultBirthday,
    this.changeSex,
  }) : super(key: key);

  @override
  State createState() => _GenderAndAgeState();
}

class _GenderAndAgeState extends State<GenderAndAge> {
  String _gender = '0';
  final ILoginManager _loginManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
  final DialogLoadingController _dialogController = DialogLoadingController();
  final TextEditingController _textController = TextEditingController();

  String _dateStr = '';

  DateTime? cacheInitTime;

  @override
  void initState() {
    super.initState();
    if (widget.needShowInviteCode) {
      ProfileData.nickName = Session.name ?? '';
      ProfileData.icon = Session.icon ?? '';
    }
    if (widget.defaultSex != null) {
      ProfileData.sex = widget.defaultSex!;
      _gender = widget.defaultSex!;
    }
    if (widget.defaultBirthday != null) {
      _textController.text =
          Utility.formatDateToDayAndChinese(widget.defaultBirthday!);
      _dateStr = Utility.formatDateToDayFromDateTime(widget.defaultBirthday!);
      cacheInitTime = widget.defaultBirthday;
      ProfileData.birthDay = _dateStr;
    }
    Tracker.instance.track(TrackEvent.register, properties: {'step': 'gender'});
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  _onAgeSelect() {
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
      initialDateTime: DateTime(1990, 1, 1,),
      onConfirm: (DateTime dateTime, List<int> selectedIndex) async {
        cacheInitTime = dateTime;
        _textController.text = Utility.formatDateToDayAndChinese(dateTime);
        _dateStr = Utility.formatDateToDayFromDateTime(dateTime);
        refresh();
      },
    );
    // DateTime initTime =
    //     cacheInitTime ?? (widget.defaultBirthday ?? DateTime(2000));
    // if (widget.defaultBirthday == null) {
    //   _textController.text = Utility.formatDateToDayAndChinese(initTime);
    //   _dateStr = Utility.formatDateToDayFromDateTime(initTime);
    //   refresh();
    // }
    //
    // showModalBottomSheet(
    //   backgroundColor: Colors.white,
    //   context: context,
    //   builder: (BuildContext context) {
    //     return SizedBox(
    //       height: 200,
    //       child: CupertinoDatePicker(
    //         mode: CupertinoDatePickerMode.date,
    //         initialDateTime: initTime,
    //         minimumDate: DateTime(1970),
    //         maximumDate: DateTime(DateTime.now().year - 30,
    //             DateTime.now().month, DateTime.now().day),
    //         onDateTimeChanged: (DateTime time) {
    //           cacheInitTime = time;
    //           _textController.text = Utility.formatDateToDayAndChinese(time);
    //           _dateStr = Utility.formatDateToDayFromDateTime(time);
    //           refresh();
    //         },
    //       ),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !widget.needShowInviteCode;
      },
      child: Scaffold(
        appBar: BaseAppBar(
          '',
          backgroundColor: Colors.transparent,
          showBack: !widget.needShowInviteCode,
          actionTitle: K.login_skip,
          backColor: Colors.white,
          actionColor: Colors.white,
          onPressed: () {
            _gotoNextPage(true);
          },
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                const SizedBox(height: 16),
                Text(
                  K.select_your_gender_and_age,
                  style: TextStyle(
                    fontSize: 26,
                    color: R.color.mainTextColor,
                    fontWeight:
                        _loginManager.bold ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 51),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GenderLayout('1', _gender == '1', _onSelectGender),
                    GenderLayout('2', _gender == '2', _onSelectGender),
                  ],
                ),
                const SizedBox(height: 44),
                Container(
                  width: 295,
                  height: 54,
                  padding: const EdgeInsetsDirectional.only(start: 24, end: 20),
                  decoration: BoxDecoration(
                    color: R.color.secondBgColor,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  alignment: AlignmentDirectional.centerStart,
                  child: TextField(
                    readOnly: true,
                    onTap: _onAgeSelect,
                    controller: _textController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: K.login_select_age,
                      counterText: '',
                      hintStyle: TextStyle(
                          fontSize: 16, color: Colors.white.withOpacity(0.5)),
                    ),
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    autofocus: false,
                    autocorrect: false,
                    maxLines: 1,
                    maxLength: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  K.age_mark,
                  style: TextStyle(
                      fontSize: 13,
                      color: R.color.thirdTextColor,
                      fontWeight: FontWeight.w500),
                ),
                if (widget.needShowInviteCode) const InviteCodeWidget(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomButton.of(
          title: K.next_step,
          onTap: () => _gotoNextPage(false),
          bgColor: R.colors.darkGradientColors,
        ),
      ).withCommonBg(),
    );
  }

  _onSelectGender(String gender) {
    _gender = gender;
    ProfileData.sex = gender;
    if (widget.changeSex != null) {
      widget.changeSex!(Util.parseInt(gender));
    }
    refresh();
  }

  bool _canGotoNextPage() {
    if (_gender != '1' && _gender != '2') {
      return false;
    }

    if (_textController.text.isEmpty || _dateStr.isEmpty) {
      return false;
    }

    return true;
  }

  void _gotoNextPage(bool skip) async {
    bool genderEmpty = (_gender != '1' && _gender != '2');
    bool dateEmpty = (_textController.text.isEmpty || _dateStr.isEmpty);

    if (skip) {
      String str = 'none';
      if (genderEmpty && dateEmpty) {
        str = 'both';
      } else if (genderEmpty) {
        str = 'gender';
      } else if (dateEmpty) {
        str = 'bith';
      }
      Tracker.instance.track(TrackEvent.registerGenderSkip,
          properties: {'lack_of_information': str});
    } else {
      Tracker.instance
          .track(TrackEvent.registerGenderNextClick, properties: {});
      if (genderEmpty) {
        Toast.show(context, K.please_select_your_gender);
        return;
      }
      if (dateEmpty) {
        Toast.show(context, K.please_select_your_age);
        return;
      }
    }
    ProfileData.sex = _gender;
    ProfileData.birthDay = _dateStr;

    _dialogController.show(context: context, message: K.login_loading);
    BaseResponse response = await Api.postAccountProfile(
        ProfileData.nickName,
        ProfileData.sex,
        ProfileData.birthDay,
        ProfileData.icon,
        ProfileData.inviteCode,
        needAutoInRoom: widget.needOneKeyFollow != true);
    _dialogController.close();
    if (!(response.success == true)) {
      Fluttertoast.showToast(
          msg: response.msg ?? '', gravity: ToastGravity.CENTER);
      return;
    }
    ProfileData.reset();
    ProfileData.markLaunchAfterFirstRegisterIfNeeded();
    Tracker.instance.user_set({
      'uname': Session.name,
      'gender': Session.sex,
      'birthday': _dateStr,
      'mac': DeviceInfo.mac,
      'channel_id': DeviceInfo.channel,
    });

    Tracker.instance.track(TrackEvent.register, properties: {'step': 'finish'});

    if (mounted && _loginManager.showInterestSetPage == true) {
      PageRoute route = MaterialPageRoute(
        builder: (context) => const TagSet(),
        fullscreenDialog: true,
        settings: const RouteSettings(name: '/tagSet'),
      );
      Navigator.of(context).pushAndRemoveUntil(route, ModalRoute.withName('/'));
    } else {
      if (widget.needOneKeyFollow == true) {
        /// 需要展示一键关注/打招呼页面
        PageRoute route = MaterialPageRoute(
          builder: (context) => const OneKeyFollowScreen(),
          settings: const RouteSettings(name: '/OneKeyFollowScreen'),
        );
        Navigator.of(context)
            .pushAndRemoveUntil(route, ModalRoute.withName('/'));
      } else {
        Navigator.popUntil(context, ModalRoute.withName('/'));
        if (Util.isLoginBeforeBoot()) {
          eventCenter.emit(EventConstant.EventLoginBeforeBoot, context);
          await Future.delayed(const Duration(milliseconds: 100));
        }

        // 弹新用户礼包
        if (_loginManager.isNoviceGuide) {
          eventCenter.emit(EventConstant.ShowNewUserGuide);
        } else {
          eventCenter.emit(EventConstant.ShowNewUserPackage);
        }
      }
    }

    /// 上报注册成功事件
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    mainManager.trackEvent(AppsFlyerEvent.COMPLETE_REGISTRATION, eventValue: {
      AppsFlyerParameter.REGSITRATION_METHOD: Session.uid.toString(),
    });
  }
}

typedef OnSelect = Function(String gender);

class GenderLayout extends StatelessWidget {
  final OnSelect onSelect;
  final bool selected;
  final String gender;

  const GenderLayout(this.gender, this.selected, this.onSelect, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath =
        gender == '2' ? 'ic_gender_female.svg' : 'ic_gender_male.svg';
    Color? iconColor = selected ? Colors.white : null;

    List<Color> linearGradientColors = gender == '2'
        ? R.color.femaleGradientColors
        : R.color.maleGradientColors;
    if (!selected) {
      linearGradientColors = [
        Colors.white.withOpacity(0.1),
        Colors.white.withOpacity(0.1)
      ];
    }

    return GestureDetector(
      onTap: () => onSelect(gender),
      child: Align(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            gradient: selected
                ? LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: linearGradientColors,
                  )
                : LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: linearGradientColors,
                  ),
          ),
          width: 130,
          height: 54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              R.img(imagePath,
                  package: ComponentManager.MANAGER_LOGIN,
                  color:
                      selected ? Colors.black : Colors.white.withOpacity(0.5),
                  width: 17,
                  height: 21),
              const SizedBox(width: 10),
              Text(
                gender == '2' ? BaseK.K.female : BaseK.K.male,
                style: TextStyle(
                  fontSize: 16,
                  color:
                      selected ? Colors.black : Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
