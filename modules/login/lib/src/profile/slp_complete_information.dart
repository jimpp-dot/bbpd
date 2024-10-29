import 'dart:math';

import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/k.dart';
import 'package:login/src/api/api.dart';
import 'package:login/src/profile/tag_set.dart';

import '../../assets.dart';
import 'invite_code_widget.dart';
import 'profile_data.dart';

/// 网赚渠道用户注册流失率高，新增一个简易注册流程
class SlpCompleteInformation extends StatefulWidget {
  final RegType regType;

  const SlpCompleteInformation({Key? key, required this.regType})
      : super(key: key);

  @override
  SlpCompleteInformationState createState() {
    return SlpCompleteInformationState();
  }
}

class SlpCompleteInformationState extends State<SlpCompleteInformation> {
  final TextEditingController _nicknameController = TextEditingController();
  final FocusNode _nicknameFocusNode = FocusNode();
  final GlobalKey<ImageUploadState> _imgUploadKey =
      GlobalKey<ImageUploadState>();
  String _icon = '';

  String _gender = '0';
  final ILoginManager _loginManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
  final TextEditingController _dateController = TextEditingController();

  String _dateStr = '';

  DateTime? cacheInitTime;

  @override
  void initState() {
    super.initState();

    Tracker.instance.track(TrackEvent.register, properties: {'step': 'merged'});

    if (widget.regType.thirdSex == 1 || widget.regType.thirdSex == 2) {
      /// 优先取三方平台的性别
      _gender = widget.regType.thirdSex.toString();
    } else if (widget.regType.defaultSex == 1 ||
        widget.regType.defaultSex == 2) {
      _gender = widget.regType.defaultSex.toString();
    }

    if (Util.validStr(widget.regType.thirdName)) {
      _nicknameController.text = widget.regType.thirdName;
    }

    if (Util.validStr(widget.regType.thirdIcon)) {
      /// 优先取三方平台的icon
      _icon = widget.regType.thirdIcon;
    } else if (_gender == '1' &&
        Util.validStr(widget.regType.maleDefaultBgIcon)) {
      _icon = widget.regType.maleDefaultBgIcon;
    } else if (_gender == '2' &&
        Util.validStr(widget.regType.femaleDefaultBgIcon)) {
      _icon = widget.regType.femaleDefaultBgIcon;
    }
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double marginTop =
        112 * Util.ratio - MediaQuery.of(context).padding.top - kToolbarHeight;
    if (marginTop < 0) {
      marginTop = 0;
    }
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: BaseAppBar(null, showBack: false),
        backgroundColor: R.color.mainBgColor,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            width: Util.width,
            height: Util.height -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
            margin: const EdgeInsetsDirectional.only(start: 36, end: 36),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                children: [
                  SizedBox(height: marginTop),
                  Text(
                    K.login_improve_profile,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor,
                    ),
                  ),
                  SizedBox(height: 6.dp),
                  Text(
                    K.icon_and_nickname,
                    style: TextStyle(
                      fontSize: 13,
                      color: R.color.secondTextColor,
                    ),
                  ),
                  SizedBox(height: 24.dp),
                  _renderAvatarUpload(),
                  SizedBox(height: 24.dp),
                  Container(
                    width: Util.width - 36 - 36,
                    height: 56,
                    padding:
                        const EdgeInsetsDirectional.only(start: 24, end: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: _nicknameFocusNode.hasFocus
                            ? R.color.mainBrandColor
                            : R.color.secondBgColor,
                        width: 2,
                      ),
                    ),
                    child: _renderNameWidget(),
                  ),
                  const SizedBox(height: 12),
                  _renderGenders(),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        K.login_gender_desc,
                        style: TextStyle(
                          fontSize: 13,
                          color: R.color.thirdBrightColor,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _renderBirthday(),
                  const Spacer(),
                  GestureDetector(
                    onTap: _gotoNextPage,
                    child: Container(
                      width: Util.width - 36 - 36,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        K.login_go_app_main([Util.appName]),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const InviteCodeWidget(),
                  SizedBox(height: 25 + Util.iphoneXBottom),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderAvatarUpload() {
    return SizedBox(
      width: 120.dp,
      height: 120.dp,
      child: Stack(
        children: [
          ClipOval(
            child: ImageUpload(
              key: _imgUploadKey,
              source: ImageSource.gallery,
              uploadUrl: '${System.domain}upload/image/',
              crop: true,
              minSize: Util.getUserUploadAvatarMinSize(),
              onComplete: (String name, int width, int height, Map origin) {
                setState(() {
                  _icon = name;
                });
                Tracker.instance.track(TrackEvent.click, properties: {
                  'click_page': 'register_avatar',
                });
                Tracker.instance.track(TrackEvent.upload_picture, properties: {
                  'result': 'success',
                });
                return true;
              },
              onError: (String? error) {
                Fluttertoast.showToast(
                    msg: error ?? BaseK.K.upload_error_retry);
                Tracker.instance.track(TrackEvent.upload_picture, properties: {
                  'result': 'error',
                });
              },
              child: _renderAvatar(),
            ),
          ),
          if (Util.validStr(_icon))
            PositionedDirectional(
              top: 2,
              end: 2,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: R.color.mainBgColor, width: 2),
                  gradient: LinearGradient(
                    colors: R.color.mainBrandGradientColors,
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                ),
                alignment: AlignmentDirectional.center,
                child: R.img(
                  Assets.login$ic_edit_svg,
                  width: 24,
                  height: 24,
                  package: ComponentManager.MANAGER_LOGIN,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _renderAvatar() {
    if (_icon.isEmpty) {
      return Container(
        width: 120 * Util.ratio,
        height: 120 * Util.ratio,
        decoration: BoxDecoration(
          color: R.color.secondBgColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: R.img(Assets.login$ic_login_avatar_svg,
            package: ComponentManager.MANAGER_LOGIN, width: 40, height: 40),
      );
    }
    return CachedNetworkImage(
      imageUrl: Util.getUserSmallIcon(_icon),
      fit: BoxFit.cover,
      width: 120 * Util.ratio,
      height: 120 * Util.ratio,
      fadeOutDuration: const Duration(microseconds: 0),
      fadeInDuration: const Duration(microseconds: 0),
    );
  }

  Widget _renderNameWidget() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: _nicknameFocusNode,
            controller: _nicknameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: K.please_input_nickname,
              counterText: '',
              hintStyle: TextStyle(
                fontSize: 16,
                color: R.color.thirdTextColor,
              ),
            ),
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontSize: 16,
              color: R.color.mainTextColor,
            ),
            autofocus: false,
            autocorrect: false,
            maxLines: 1,
            maxLength: 20,
            onChanged: (String text) {
              refresh();
            },
          ),
        ),
        if (Util.validStr(_nicknameController.text))
          GestureDetector(
            onTap: () {
              _nicknameController.text = '';
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
              child: R.img(
                Assets.login$ic_input_clear_svg,
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_LOGIN,
              ),
            ),
          ),
        if (Util.validStr(_nicknameController.text))
          Container(
            width: 1,
            height: 24,
            color: R.color.secondBgColor,
          ),
        GestureDetector(
          onTap: _randomName,
          child: Container(
            height: 32,
            margin: const EdgeInsetsDirectional.only(start: 12),
            padding: const EdgeInsetsDirectional.only(start: 14, end: 14),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            ),
            child: Text(
              K.login_random,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void _randomName() {
    String text = '';

    List<String> prefix = [];
    List<String> name = [];

    int sex = Util.parseInt(_gender);
    if (sex != 1 && sex != 2) {
      sex = 1 + Random().nextInt(2);
    }

    if (sex == 1) {
      prefix.addAll(widget.regType.maleRandomPrefix);
      name.addAll(widget.regType.maleRandomName);
    } else if (sex == 2) {
      prefix.addAll(widget.regType.femaleRandomPrefix);
      name.addAll(widget.regType.femaleRandomName);
    }

    int adjLength = prefix.length;
    int randomPrefix = -1;
    if (adjLength > 0) {
      randomPrefix = Random().nextInt(adjLength);
      text += prefix[randomPrefix];
    }

    int nounLength = name.length;
    int randomName = -1;
    if (nounLength > 0) {
      randomName = Random().nextInt(nounLength);
      text += name[randomName];
    }

    setState(() {
      _nicknameController.text = text;
    });

    Tracker.instance.track(TrackEvent.click, properties: {
      'click_page': 'register_nick',
    });
  }

  Widget _renderGenders() {
    return Row(
      children: [
        _renderGender(1),
        const SizedBox(width: 11),
        _renderGender(2),
      ],
    );
  }

  Widget _renderGender(int sex) {
    String imagePath = sex == 2
        ? Assets.login$ic_gender_female_svg
        : Assets.login$ic_gender_male_svg;
    return GestureDetector(
      onTap: () {
        onGenderTap(sex);
      },
      child: Container(
        width: (Util.width - 36 - 36 - 11) / 2,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
              color: Util.parseInt(_gender) == sex
                  ? R.color.mainBrandColor
                  : R.color.secondBgColor,
              width: 2),
        ),
        child: Row(
          children: [
            const SizedBox(width: 24),
            Text(
              sex == 2 ? BaseK.K.female : BaseK.K.male,
              style: TextStyle(
                fontSize: 16,
                color: sex == Util.parseInt(_gender)
                    ? R.color.mainTextColor
                    : R.color.thirdTextColor,
              ),
            ),
            const Spacer(),
            R.img(
              imagePath,
              width: 12,
              height: 12 * 21 / 17,
              package: ComponentManager.MANAGER_LOGIN,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  void onGenderTap(int sex) {
    if (Util.parseInt(_gender) == sex) {
      _gender = '0';
    } else {
      _gender = sex.toString();
    }

    if (_gender == '1' && _icon == widget.regType.femaleDefaultBgIcon) {
      _icon = widget.regType.maleDefaultBgIcon;
    } else if (_gender == '2' && _icon == widget.regType.maleDefaultBgIcon) {
      _icon = widget.regType.femaleDefaultBgIcon;
    }

    Tracker.instance.track(TrackEvent.click, properties: {
      'click_page':
          _gender == '0' ? 'register_gender_cancel' : 'register_gender_change',
    });

    refresh();
  }

  Widget _renderBirthday() {
    return Container(
      width: Util.width - 36 - 36,
      height: 56,
      padding: const EdgeInsetsDirectional.only(start: 24, end: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: R.color.secondBgColor, width: 2),
      ),
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
              itemTextStyle:
                  TextStyle(color: R.color.mainTextColor, fontSize: 15),
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
              _dateController.text =
                  Utility.formatDateToDayAndChinese(dateTime);
              _dateStr = Utility.formatDateToDayFromDateTime(dateTime);
              refresh();
            },
          );
          // DateTime initTime = cacheInitTime ?? DateTime(2000);
          // _dateController.text = Utility.formatDateToDayAndChinese(initTime);
          // _dateStr = Utility.formatDateToDayFromDateTime(initTime);
          // setState(() {});
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
          //         maximumDate: DateTime(DateTime.now().year - 18,
          //             DateTime.now().month, DateTime.now().day),
          //         onDateTimeChanged: (DateTime time) {
          //           cacheInitTime = time;
          //           _dateController.text =
          //               Utility.formatDateToDayAndChinese(time);
          //           _dateStr = Utility.formatDateToDayFromDateTime(time);
          //           setState(() {});
          //         },
          //       ),
          //     );
          //   },
          // );
        },
        controller: _dateController,
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
    );
  }

  void _gotoNextPage() async {
    Tracker.instance.track(TrackEvent.registerGenderNextClick, properties: {});
    String nickName = _nicknameController.text.trim();
    if (nickName.isEmpty) {
      Fluttertoast.showToast(
          msg: K.nickname_cant_be_null, gravity: ToastGravity.CENTER);
      return;
    }

    CommonLoading.show(
        status: K.login_loading, maskType: EasyLoadingMaskType.clear);
    BaseResponse response = await Api.postAccountProfile(
        nickName, _gender, _dateStr, _icon, ProfileData.inviteCode);
    CommonLoading.dismiss();
    if (!(response.success == true)) {
      Fluttertoast.showToast(
          msg: response.msg ?? '', gravity: ToastGravity.CENTER);
      return;
    }

    ProfileData.reset();

    Tracker.instance.user_set({
      'uname': nickName,
      'gender': Util.parseInt(_gender, 0),
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

    /// 上报注册成功事件
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    mainManager.trackEvent(AppsFlyerEvent.COMPLETE_REGISTRATION, eventValue: {
      AppsFlyerParameter.REGSITRATION_METHOD: Session.uid.toString(),
    });
  }
}

class RegType {
  bool easyMode = false;
  bool needOneKeyFollow = false;
  String maleDefaultBgIcon = '';

  /// 带背景icon，用于用户的icon上传和展示
  String femaleDefaultBgIcon = '';
  int defaultSex = 0;
  String thirdName = '';
  String thirdIcon = '';
  int thirdSex = 0;
  List<String> maleRandomPrefix = [];
  List<String> maleRandomName = [];
  List<String> femaleRandomPrefix = [];
  List<String> femaleRandomName = [];

  RegType({
    this.easyMode = false,
    this.needOneKeyFollow = false,
    this.thirdIcon = '',
    this.thirdName = '',
    this.thirdSex = 0,
    this.defaultSex = 0,
    this.femaleDefaultBgIcon = '',
    this.maleDefaultBgIcon = '',
    this.femaleRandomPrefix = const [],
    this.femaleRandomName = const [],
    this.maleRandomPrefix = const [],
    this.maleRandomName = const [],
  });

  factory RegType.fromJson(Map? json) {
    if (json == null) {
      return RegType(easyMode: false, needOneKeyFollow: false);
    }
    return RegType(
      easyMode: Util.parseBool(json['easy_mode'], false),
      needOneKeyFollow: Util.parseBool(json['need_one_key_follow'], false),
      maleDefaultBgIcon: Util.parseStr(json['male_default_bg_icon']) ?? '',
      femaleDefaultBgIcon: Util.parseStr(json['female_default_bg_icon']) ?? '',
      defaultSex: Util.parseInt(json['default_sex']),
      thirdIcon: Util.parseStr(json['third_icon']) ?? '',
      thirdName: Util.parseStr(json['third_name']) ?? '',
      thirdSex: Util.parseInt(json['third_sex']),
      maleRandomPrefix: Util.parseList(
          json['male_rand_prefix'], (e) => (Util.parseStr(e) ?? '')),
      maleRandomName: Util.parseList(
          json['male_rand_name'], (e) => (Util.parseStr(e) ?? '')),
      femaleRandomPrefix: Util.parseList(
          json['female_rand_prefix'], (e) => (Util.parseStr(e) ?? '')),
      femaleRandomName: Util.parseList(
          json['female_rand_name'], (e) => (Util.parseStr(e) ?? '')),
    );
  }
}
