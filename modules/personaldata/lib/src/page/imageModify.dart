import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personaldata/src/api/api.dart';
import 'package:personaldata/src/model/my_personal_data.dart';
import 'package:personaldata/src/module/job.dart';
import 'package:personaldata/src/page/citySelectWidget.dart';
import 'package:personaldata/src/page/num_select_widget.dart';
import 'package:personaldata/src/widget/pic_include_face_tapwidget.dart';
import 'package:shared/protobuf/lan/generated/people_info_industry.pb.dart';
import 'package:shared/shared.dart';

import '../../../k.dart';
import 'imageModify_height.dart';
import 'imageModify_single_selection_screen.dart';

typedef _infoCompleteCallBack = void Function(int completeness);

const int MAX_PHOTO_NUM = 8;
const int MAX_TAG_NUM = 8;

/// 修改个人资料
class ImageModifyScreen extends StatefulWidget {
  static const target_page_signature = 1;

  /// [showJob] 是否展现职业
  /// [showSignature] 是否展现签名
  /// [showAudio] 扩列卡音频信息
  /// [crop] 是否裁剪形象照
  static Future showImageModifyScreen(
    BuildContext context, {
    bool showSignature = true,
    bool showJob = true,
    bool showAudio = true,
    bool crop = false,
    int targetPage = 0,
    _infoCompleteCallBack? callBack,
  }) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ImageModifyScreen(
        showAudio: showAudio,
        showJob: showJob,
        showSignature: showSignature,
        crop: crop,
        targetPage: targetPage,
        callBack: callBack,
      ),
      settings: const RouteSettings(name: '/imageModify'),
    ));
  }

  final bool showSignature;
  final bool showJob;
  final bool showAudio;
  final bool crop;
  final int targetPage;
  final _infoCompleteCallBack? callBack;

  const ImageModifyScreen({
    Key? key,
    this.showSignature = true,
    this.showJob = true,
    this.showAudio = true,
    this.crop = false,
    this.targetPage = 0,
    this.callBack,
  }) : super(key: key);

  @override
  _ImageModifyState createState() => _ImageModifyState();
}

class _ImageModifyState extends State<ImageModifyScreen> {
  final GlobalKey<_PhotosState> _headerPhotoKey = GlobalKey<_PhotosState>();
  MyPersonalData _personalData = MyPersonalData();

  static const int MAX_BASE_INFO_NUM = 4;
  static const int MAX_PEOPLE_INFO_NUM = 2;
  static const int MAX_OTHER_INFO_NUM = 2;

  /// 个人资料头像审核中
  bool get _showHeaderInAudit => _personalData.inVerify ?? false;

  /// 个人资料相册审核中
  bool get _showPhotosInAudit =>
      (!Util.isCollectionEmpty(_personalData.photos.where((element) => (element.id > 0 && element.state == 0)).toList()));

  /// 基本资料审核中
  bool get _showBasicInfoInAudit => _personalData.inAudit?.userNameInAudit ?? false;

  /// 个人信息审核中
  bool get _showPersonalInfoInAudit =>
      (_personalData.inAudit?.userAudioInAudit ?? false) || (_personalData.inAudit?.userSignInAudit ?? false);

  @override
  void initState() {
    super.initState();
    _personalData.initReadSession();
    _load();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.showSignature && widget.targetPage == ImageModifyScreen.target_page_signature) {
        _onSignTaped();
      }
    });
  }

  bool _showCompleteness() {
    return (widget.showSignature == true && widget.showAudio == true);
  }

  _load() async {
    try {
      if (Job.needInit()) {
        await Job.init();
      }
      DataRsp<MyPersonalData> rsp = await Api.getMyPersonalData();
      if (rsp.success == true) {
        _personalData = rsp.data!;
        _refreshCompleteness();
      }
    } catch (e) {
      Log.d(e.toString());
    }
  }

  void _refreshCompleteness() {
    _personalData.calculateCompleteness();
    _refreshUI();
    if (widget.callBack != null) {
      widget.callBack!(_personalData.completenessValue);
    }
  }

  void _refreshUI() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<bool> _saveOtherInfo(Map<String, String> postData) async {
    try {
      Log.d("postData: $postData");
      XhrResponse response = await Xhr.postJson("${System.domain}rush/account/editFriendCard", postData, throwOnError: false);
      Map res = response.response as Map;
      Log.d("res: $res");
      if (res['success'] == true) {
        _load();
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Log.d(e.toString());
    }
    return false;
  }

  Future<bool> _save(String name, String value) async {
    BaseResponse baseResponse = await BaseRequestManager.editAccountInfo(name, value);
    if (baseResponse.success == true) {
      switch (name) {
        case 'name':
        case 'sign':
        case 'sex':
        case 'birthday':
          Session.setValue(name, value);
          break;
      }
      return true;
    } else {
      if (baseResponse.msg != null && baseResponse.msg?.isNotEmpty == true) {
        Fluttertoast.showToast(msg: baseResponse.msg, gravity: ToastGravity.CENTER);
      }
    }
    return false;
  }

  String _fillString(int value) {
    return value < 9 ? "0$value" : value.toString();
  }

  String _getBirthday() {
    if (_personalData.year == 0) return '';
    return "${_personalData.year}-${_fillString(_personalData.month)}-${_fillString(_personalData.date)}";
  }

  String _getSex() {
    if (_personalData.sex == 1) {
      return K.male;
    } else if (_personalData.sex == 2) {
      return K.female;
    } else {
      return '';
    }
  }

  Widget _buildAudio() {
    return SettingItemWidget(
      title: K.personaldata_voice,
      trailingWidget: (_personalData.cardInfo?.audio != null && _personalData.cardInfo?.audio!.isNotEmpty == true)
          ? SoundStadiumButton(
              audioUrl: _personalData.cardInfo?.audio ?? '',
              duration: _personalData.cardInfo?.duration ?? 0,
            )
          : _trailingWidget(K.personal_voice_tips, ''),
      onClicked: _onAudioTaped,
      startMargin: 0,
      endMargin: 0,
    );
  }

  Widget _trailingWidget(String tips, String value) {
    if (value.isNotEmpty) {
      return const SizedBox();
    }
    return Flexible(
      child: Text(
        tips,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          color: R.color.mainBrandColor,
        ),
      ),
    );
  }

  Widget _titleWidget(String title, int count, int totalCount, {bool inAudit = false}) {
    return Text.rich(
      TextSpan(text: title, style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor, fontWeight: FontWeight.w600), children: [
        if (_showCompleteness())
          TextSpan(
            text: " ($count/$totalCount)",
          ),
        if (inAudit) _inAuditWidget()
      ]),
    );
  }

  Widget _appBarTitleWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          K.modify_user_info,
          style: R.textStyle.medium18,
        ),
        Text(
          '${K.personal_completeness} ${_personalData.completenessValue}%',
          style: R.textStyle.regular12.copyWith(color: R.color.secondTextColor),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showCompleteness()
          ? BaseAppBar.custom(
              statusBrightness: darkMode ? Brightness.dark : Brightness.light,
              backgroundColor: Colors.transparent,
              backColor: R.colors.mainTextColor,
              title: _appBarTitleWidget(),
              onBackPressedCallback: _onBackClick,
            )
          : BaseAppBar(
              statusBrightness: darkMode ? Brightness.dark : Brightness.light,
              backgroundColor: Colors.transparent,
              backColor: R.colors.mainTextColor,
              titleColor: R.colors.mainTextColor,
              K.modify_user_info,
              onBackPressedCallback: _onBackClick,
            ),
      backgroundColor: Colors.transparent,
      body: ListView(
        addAutomaticKeepAlives: true,
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        children: <Widget>[
          _headerWidget(),
          Container(height: 0.5, color: R.color.dividerColor),
          Container(
            padding: const EdgeInsetsDirectional.only(top: 12, bottom: 14),
            child: _titleWidget(K.personal_photo_album, _personalData.currentPhotoNum, MAX_PHOTO_NUM, inAudit: _showPhotosInAudit),
          ),
          Photos(
            width: _getPhotoWidth(),
            height: _getPhotoHeight(),
            spacing: 5,
            runSpacing: 5,
            radius: 8,
            photos: _personalData.photos,
            onComplete: _load,
            addImagePath: 'icon_add.svg',
            progressWidth: _getPhotoWidth(),
            progressHeight: _getPhotoHeight(),
            crop: false,
            hasDynamicHeader: _personalData.hasDynamicHeader,
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: K.personal_upload_avatar,
                  style: TextStyle(fontSize: 13, fontFamily: Util.fontFamily, color: R.color.thirdTextColor)),
              TextSpan(
                  text: ' ${K.personal_avatar_clear} ', style: TextStyle(fontSize: 13, fontFamily: Util.fontFamily, color: Colors.orange)),
              TextSpan(
                  text: K.personal_real_avatar, style: TextStyle(fontSize: 13, fontFamily: Util.fontFamily, color: R.color.thirdTextColor))
            ]),
          ),
          const SizedBox(height: 15),
          Container(height: 0.5, color: R.color.dividerColor),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12.0, bottom: 17.0),
            child: _titleWidget(K.personal_base_info, _personalData.baseInfoCount, MAX_BASE_INFO_NUM, inAudit: _showBasicInfoInAudit),
          ),
          SettingItemWidget(
            title: K.nickname,
            trailingText: _personalData.name,
            onClicked: _onNickNameTaped,
            trailingWidget: _trailingWidget(K.personal_name_tips, _personalData.name ?? ''),
            startMargin: 0,
            endMargin: 0,
          ),
          SettingItemWidget(
            title: K.birthday,
            trailingText: _getBirthday(),
            onClicked: _onBirthdayTaped,
            trailingWidget: _trailingWidget(K.personal_birthday_tips, _getBirthday()),
            startMargin: 0,
            endMargin: 0,
          ),
          SettingItemWidget(
            title: K.gender,
            trailingText: _getSex(),
            trailingWidget: _trailingWidget(K.personal_sex_tips, _getSex()),
            onClicked: _onSexTaped,
            startMargin: 0,
            endMargin: 0,
          ),
          SettingItemWidget(
            title: K.personal_hometown,
            trailingText: _personalData.hometownCity,
            trailingWidget: _trailingWidget(K.personal_hometown_tips, _personalData.hometownCity ?? ''),
            onClicked: _onHometownTaped,
            startMargin: 0,
            endMargin: 0,
          ),
          Container(height: 0.5, color: R.color.dividerColor),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12.0, bottom: 17.0),
            child: _titleWidget(K.personal_info, _personalData.peopleInfoCount, MAX_PEOPLE_INFO_NUM, inAudit: _showPersonalInfoInAudit),
          ),
          if (widget.showAudio) _buildAudio(),
          if (widget.showSignature)
            SettingItemWidget(
              title: K.signature,
              trailingText: _personalData.sign,
              trailingWidget: _trailingWidget(K.personal_sign_tips, _personalData.sign ?? ''),
              onClicked: _onSignTaped,
              startMargin: 0,
              endMargin: 0,
            ),
          ...[
            SettingItemWidget(
              title: K.personal_height,
              trailingText:
                  (_personalData.cardInfo != null && _personalData.cardInfo!.height > 0) ? _personalData.cardInfo!.height.toString() : '',
              trailingWidget: _trailingWidget(K.personal_info_height_tips,
                  (_personalData.cardInfo != null && _personalData.cardInfo!.height > 0) ? _personalData.cardInfo!.height.toString() : ''),
              onClicked: _onHeightTaped,
              startMargin: 0,
              endMargin: 0,
            ),
            SettingItemWidget(
              title: K.personal_info_industry_title,
              trailingText: _personalData.cardInfo?.industry,
              trailingWidget: _trailingWidget(K.personal_info_industry_tips, _personalData.cardInfo?.industry ?? ''),
              onClicked: () => _onIndustryTaped(true),
              startMargin: 0,
              endMargin: 0,
              space: 10,
            ),
            SettingItemWidget(
              title: K.personal_info_education_title,
              trailingText: _personalData.cardInfo?.education,
              trailingWidget: _trailingWidget(K.personal_info_education_tips, _personalData.cardInfo?.education ?? ''),
              onClicked: () => _onIndustryTaped(false),
              startMargin: 0,
              endMargin: 0,
            ),
          ],
          Container(height: 0.5, color: R.color.dividerColor),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12.0, bottom: 17.0),
            child: _titleWidget(K.personal_other_info, _personalData.otherInfoCount, MAX_OTHER_INFO_NUM),
          ),
          SettingItemWidget(
            title: K.personal_self_tag,
            trailingText: _personalData.tags.isNotEmpty ? '${_personalData.tags.length}/$MAX_TAG_NUM' : '',
            trailingWidget: _trailingWidget(K.personal_tag_tips, _personalData.tags.isNotEmpty ? '1' : ''),
            onClicked: () {
              _onInterestTaped(true);
            },
            startMargin: 0,
            endMargin: 0,
          ),
          SettingItemWidget(
            title: K.personal_friend_tag,
            trailingText: _personalData.friendTags.isNotEmpty ? '${_personalData.friendTags.length}/$MAX_TAG_NUM' : '',
            trailingWidget: _trailingWidget(K.personal_friend_tag_tips, _personalData.friendTags.isNotEmpty ? '1' : ''),
            onClicked: () {
              _onInterestTaped(false);
            },
            startMargin: 0,
            endMargin: 0,
          ),
          const SizedBox(height: 20),
        ],
      ),
    ).withCommonBg();
  }

  Widget _headerWidget() {
    return SizedBox(
      height: 62,
      child: InkWell(
        onTap: () async {
          _headerPhotoKey.currentState?.iconTapAction();
        },
        child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          Expanded(
            child: Text.rich(
              TextSpan(
                text: K.avatar,
                style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor, fontWeight: FontWeight.w600),
                children: [if (_showHeaderInAudit) _inAuditWidget()],
              ),
            ),
          ),
          if (_personalData.headerPhoto != null)
            Photos(
              key: _headerPhotoKey,
              width: 36,
              height: 36,
              spacing: 5,
              runSpacing: 5,
              radius: 6,
              photos: [_personalData.headerPhoto!],
              onComplete: _load,
              addImagePath: 'icon_add.svg',
              progressWidth: 36,
              progressHeight: 36,
              crop: false,
              bottomSpacing: 0,
              hasDynamicHeader: _personalData.hasDynamicHeader,
            ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8.0),
            child: R.img(
              'ic_next.svg',
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_PROFILE,
              color: R.color.secondTextColor,
            ),
          ),
        ]),
      ),
    );
  }

  double _getPhotoWidth() {
    return (MediaQuery.of(context).size.width - 40 - 15) / 4;
  }

  double _getPhotoHeight() {
    return (MediaQuery.of(context).size.width - 40 - 15) / 4;
  }

  _onAudioTaped() async {
    IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
    await manager.openAudioRecord(context,
        type: AudioRecordType.editAudio, url: _personalData.cardInfo?.audio ?? '', duration: _personalData.cardInfo?.duration ?? 0);
    _load();
  }

  _onNickNameTaped() async {
    int index = FormScreen.config(
      title: K.please_input_your_nickname,
      value: _personalData.name,
      allowEmpty: false,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    value = Util.removeUnsupportedCharacters(value) ?? '';
    bool result = await _save('name', value);
    if (result) {
      _personalData.name = value;
      _refreshCompleteness();
    }
  }

  _onStatureTaped() async {
    int select = _personalData.stature > 0 ? _personalData.stature : 160;
    NumSelectWidget.show(context, select, List.generate(200, (index) => index + 1)).then((value) async {
      if (value is int) {
        int stature = value;
        bool result = await _save('stature', '$stature');
        if (result) {
          _personalData.stature = stature;
          _refreshUI();
        }
      }
    });
  }

  _onWeightTaped() async {
    int select = _personalData.weight > 0 ? _personalData.weight : 50;
    NumSelectWidget.show(context, select, List.generate(100, (index) => index + 1)).then((value) async {
      if (value is int) {
        int weight = value;
        bool result = await _save('weight', '$weight');
        if (result) {
          _personalData.weight = weight;
          _refreshUI();
        }
      }
    });
  }

  _onCardNameTaped() async {
    int index = FormScreen.config(
      title: K.personal_pls_edit_name,
      value: _personalData.externalName,
      allowEmpty: false,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    value = Util.removeUnsupportedCharacters(value) ?? '';
    bool result = await _save('external_name', value);
    if (result) {
      _personalData.externalName = value;
      _refreshUI();
    }
  }

  _onCardPhotoTaped() async {
    IProfileManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);
    await manager.openGsPhotoPage(context);
    _load();
  }

  /// 修改性别
  _onSexTaped() async {
    if (_personalData.sexInfo == null || _personalData.sexInfo?.isEmpty == true) return;
    bool? confirm = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            content: _personalData.sexInfo?['doc'] ?? '',
          );
        });
    if (confirm != true) {
      return;
    }

    int? sex = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: R.color.mainBgColor,
            title: Center(
              child: Text(
                K.plz_reselect_gender,
                style: R.textStyle.title,
              ),
            ),
            content: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, 1);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      R.img(
                        'gender_male.png',
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                        package: ComponentManager.MANAGER_PERSONALDATA,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          K.male,
                          style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 48),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, 2);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      R.img(
                        'gender_female.png',
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                        package: ComponentManager.MANAGER_PERSONALDATA,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          K.female,
                          style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
    if (sex != null) {
      bool ret = await _save('sex', sex.toString());
      if (mounted && ret) {
        _personalData.sex = sex;
        _refreshCompleteness();
        Toast.show(context, K.personal_modify_success);
        // this.setState(() {
        //   this._sex = sex;
        // });
      }
    }
  }

  /// 审核中
  /// 相册的审核，用photos里的state判断，0表示审核中，1-已审核
  /// 昵称、音频、签名的审核中状态，用in_audit，对应的字段值为1表示审核中
  TextSpan _inAuditWidget() {
    return TextSpan(
      text: '(${K.checking})',
      style: TextStyle(
        fontSize: 13.0,
        color: R.color.thirdTextColor,
      ),
    );
  }

  _onHometownTaped() async {
    await CitySelectWidget.show(context, _personalData.cityCode ?? 0).then((value) {
      if (value != null && value is String) {
        String cityCode = value;
        if (cityCode.isNotEmpty) {
          _saveOtherInfo({'hometownCityCode': cityCode}).then((bool value) {});
        }
      }
    });
  }

  _onBirthdayTaped() async {
    DateTime now = DateTime.now();
    int maxYear = now.year - 18;
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        backgroundColor: R.color.mainBgColor,
        cancel: Text(
          K.cancel,
          style: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 17,
            fontFamily: Util.fontFamily,
            fontWeight: FontWeight.normal,
          ),
        ),
        confirm: Text(
          K.sure,
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
        _personalData.year == 0 ? 1990 : _personalData.year,
        _personalData.month == 0 ? 1 : _personalData.month,
        _personalData.date == 0 ? 1 : _personalData.date,
      ),
      onConfirm: (DateTime dateTime, List<int> selectedIndex) async {
        String birthday = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
        bool result = await _save('birthday', birthday);
        if (result) {
          _personalData.year = dateTime.year;
          _personalData.month = dateTime.month;
          _personalData.date = dateTime.day;
          _personalData.birthday = birthday;
          _refreshCompleteness();
        }
      },
    );
  }

  _onHeightTaped() async {
    ImageModifyHeightScreen.show(
      context,
      height: (_personalData.cardInfo?.height != null && (_personalData.cardInfo?.height ?? 0) > 0
          ? _personalData.cardInfo!.height.toDouble()
          : null),
      clickSave: (height) async {
        NormalNull res = await Api.editSingleInfo({'height': height.toString()});
        if (res.success) {
          Navigator.of(context).pop();
          Fluttertoast.showToast(msg: K.save_success);
        } else if (!Util.isNullOrEmpty(res.msg)) {
          Fluttertoast.showToast(msg: res.msg);
        }
      },
    ).then((value) => _load());
  }

  _onIndustryTaped(bool industry) async {
    if (industry) {
      //行业
      ImageModifySingleSelectionScreen.show(
        context,
        selectedItemName: !Util.isNullOrEmpty(_personalData.cardInfo?.industry) ? _personalData.cardInfo?.industry : null,
        loadDataFunc: () async {
          ResAccountIndustryList list = await ConversationUserInfoApi.getIndustrySelections();
          if (!list.success || list.data.isEmpty) {
            return SingleSelectionRes(list.msg, null);
          }

          List<SingleSelectionItem> items = [];
          for (var element in list.data) {
            items.add(SingleSelectionItem(element.id, element.name));
          }
          return SingleSelectionRes(null, items);
        },
        clickSave: (item) async {
          NormalNull res = await Api.editSingleInfo({'industry': item.id.toString()});
          if (res.success) {
            Navigator.of(context).pop();
            Fluttertoast.showToast(msg: K.save_success);
          } else if (!Util.isNullOrEmpty(res.msg)) {
            Fluttertoast.showToast(msg: res.msg);
          }
        },
      ).then((value) => _load());
    } else {
      //学历
      ImageModifySingleSelectionScreen.show(
        context,
        title: K.personal_info_education_title,
        selectedItemName: !Util.isNullOrEmpty(_personalData.cardInfo?.education) ? _personalData.cardInfo?.education : null,
        loadDataFunc: () async {
          return SingleSelectionRes(null, SingleSelectionItem.ducationSelections());
        },
        clickSave: (item) async {
          NormalNull res = await Api.editSingleInfo({'education': item.id.toString()});
          if (res.success) {
            Navigator.of(context).pop();
            Fluttertoast.showToast(msg: K.save_success);
          } else if (!Util.isNullOrEmpty(res.msg)) {
            Fluttertoast.showToast(msg: res.msg);
          }
        },
      ).then((value) => _load());
    }
  }

  _onSignTaped() async {
    int index = FormScreen.config(
      type: FormTypes.textArea,
      title: K.introduce_yourself,
      value: _personalData.sign,
      allowEmpty: false,
      maxLength: 64,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    if (value != null) {
      bool result = await _save('sign', value);
      if (result) {
        _personalData.sign = value;
        _refreshCompleteness();
      }
    }
  }

  // 打开兴趣标签修改页
  _onInterestTaped(bool aboutSelf) async {
    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    await loginManager.openTagSetPage(true, aboutSelf);
    _load();
  }

  _onBackClick() async {
    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    await loginManager.showCompleteInfoWidget(context);
    Navigator.of(context).pop();
  }
}

class ModifyPhoto {
  final int id;
  final String path;
  final bool isIcon;
  final int header; //是否包含人像
  final int state; //相册的审核，用photos里的state判断，0表示审核中，1-已审核

  ModifyPhoto(this.id, this.path, this.isIcon, this.header, this.state);

  ModifyPhoto.fromJson(Map map)
      : id = Util.parseInt(map['id']),
        path = map['path'],
        isIcon = false,
        header = Util.parseInt(map['header']),
        state = Util.parseInt(map['state']);

  ModifyPhoto.empty()
      : id = 0,
        isIcon = false,
        path = '',
        header = 0,
        state = 0;

  ModifyPhoto.icon(String iconPath, this.header)
      : id = -1,
        isIcon = true,
        path = iconPath,
        state = 0;
}

class Photos extends StatefulWidget {
  final List<ModifyPhoto>? photos;
  final VoidCallback? onComplete;
  final double width;
  final double height;
  final double spacing;
  final double runSpacing;
  final String addImagePath;
  final double radius;
  final double progressWidth;
  final double progressHeight;
  final bool crop;
  final double bottomSpacing;
  final bool hasDynamicHeader;

  const Photos({
    Key? key,
    this.photos,
    this.onComplete,
    this.width = 48,
    this.height = 48,
    this.spacing = 10,
    this.runSpacing = 10,
    this.addImagePath = 'profile_add.png',
    this.radius = 5.0,
    this.progressWidth = 100,
    this.progressHeight = 100,
    this.crop = false,
    this.bottomSpacing = 8.0,
    this.hasDynamicHeader = false,
  }) : super(key: key);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  final GlobalKey<ImageUploadState> _imageUploadKey = GlobalKey();

  @override
  void didUpdateWidget(Photos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      setState(() {});
    }
  }

  Widget _renderIcon(ModifyPhoto photo) {
    if (Session.tempIcon.isEmpty) {
      return R.img(
        widget.addImagePath,
        width: widget.width,
        color: R.color.mainTextColor,
        package: ComponentManager.MANAGER_BASE_CORE,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(widget.radius),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: (Session.tempIcon.startsWith("http")) ? Session.tempIcon : "${System.imageDomain}${Session.tempIcon}",
            suffix: '!head150',
            fit: BoxFit.cover,
            width: widget.width,
            height: widget.height,
            fadeOutDuration: const Duration(microseconds: 0),
            fadeInDuration: const Duration(microseconds: 0),
          ),
          if (photo.header == 1)
            PositionedDirectional(
              end: 4,
              bottom: 4,
              child: PicIncludeFaceTap(
                bubbleChild: Text(K.personal_pic_include_face,
                    style: TextStyle(color: Colors.white, fontFamily: Util.fontFamily, fontSize: 11, fontWeight: FontWeight.w500)),
                child: R.img('ic_avatar_include_person.svg', width: 16, height: 16, package: ComponentManager.MANAGER_PERSONALDATA),
              ),
            ),
        ],
      ),
    );
  }

  Widget _renderUpload(ModifyPhoto photo) {
    return ImageUpload(
      source: ImageSource.gallery,
      uploadUrl: '${System.domain}upload/image/',
      postFields: {'hook': 'editPhoto', 'id': photo.id.toString()},
      onComplete: (String name, int width, int height, Map origin) {
        if (widget.onComplete != null) {
          widget.onComplete!();
        }
        return true;
      },
      minSize: Util.getUserUploadImageMinSize(),
      crop: widget.crop,
      cropAspectRatio: 3.0 / 4.0,
      progressWidth: widget.progressWidth,
      progressHeight: widget.progressHeight,
      onTapFilter: (state) {
        if (photo.id > 0) {
          state.showDefaultActionSheet();
        } else {
          state.switchImage();
        }
      },
      onDelete: (state) async {
        await state.deletePhoto(photo.id.toString());
        if (widget.onComplete != null) {
          widget.onComplete!();
        }
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.radius),
          ),
          color: R.color.secondBgColor,
        ),
        child: photo.id > 0
            ? ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: "${System.imageDomain}${photo.path}",
                      suffix: '!head150',
                      fit: BoxFit.cover,
                      fadeOutDuration: const Duration(microseconds: 0),
                      fadeInDuration: const Duration(microseconds: 0),
                      width: widget.width,
                      height: widget.height,
                    ),
                    if (photo.header == 1)
                      PositionedDirectional(
                        end: 4,
                        bottom: 4,
                        child: PicIncludeFaceTap(
                          bubbleChild: Text(K.personal_pic_include_face,
                              style:
                                  TextStyle(color: Colors.white, fontFamily: Util.fontFamily, fontSize: 11, fontWeight: FontWeight.w500)),
                          child:
                              R.img('ic_avatar_include_person.svg', width: 16, height: 16, package: ComponentManager.MANAGER_PERSONALDATA),
                        ),
                      ),
                  ],
                ),
              )
            : R.img(
                widget.addImagePath,
                width: 28,
                height: 28,
                fit: BoxFit.cover,
                color: R.color.mainTextColor,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
      ),
    );
  }

  Widget _renderIconUpload(ModifyPhoto photo) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        child: ImageUpload(
          key: _imageUploadKey,
          source: ImageSource.gallery,
          uploadUrl: '${System.domain}upload/image/',
          postFields: const {'hook': 'editIcon'},
          crop: true,
          minSize: Util.getUserUploadAvatarMinSize(),
          onComplete: (String name, int width, int height, Map origin) {
            if (widget.onComplete != null) {
              widget.onComplete!();
            }
            return true;
          },
          onTapFilter: (state) async {
            iconTapAction(state: state);
          },
          child: _renderIcon(photo),
        ),
      ),
    );
  }

  Future<void> iconTapAction({ImageUploadState? state}) async {
    state ??= _imageUploadKey.currentState;
    List<SheetItem> res = [];
    res.add(SheetItem(K.personal_static_avatar_upload, 'static_image', {'sub_title': K.personal_static_avatar_upload_tip}));
    res.add(SheetItem(K.personal_dynamic_avatar_upload, 'dynamic_image', {'sub_title': K.personal_dynamic_avatar_upload_tip}));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
              data: res,
              render: (context, item, index, {VoidCallback? callback}) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: R.color.dividerColor, width: 0.0)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item?.label ?? '',
                        maxLines: 1,
                        style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
                      ),
                      Text(
                        Util.parseStr(item?.extra['sub_title']) ?? '',
                        maxLines: 1,
                        style: TextStyle(color: R.color.mainTextColor.withOpacity(0.5), fontSize: 13),
                      ),
                    ],
                  ),
                );
              });
        });

    if (result != null && result.value != null) {
      if (result.value?.key == 'static_image') {
        state?.onlyGif = 0;
        state?.crop = true; // 打开裁切，则不筛选.gif
      } else if (result.value?.key == 'dynamic_image') {
        if (!Session.dynamicHeader) {
          Fluttertoast.showCenter(msg: K.personal_dynamic_avatar_no_permission_tip);
          return;
        }

        state?.onlyGif = 1; // 筛选.gif，则关闭裁切
        state?.crop = false;
      }
      state?.switchImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: widget.bottomSpacing),
      child: Wrap(
        runSpacing: widget.runSpacing,
        spacing: widget.spacing,
        alignment: WrapAlignment.start,
        children: widget.photos?.map((ModifyPhoto photo) {
              if (photo.isIcon) {
                return SizedBox(
                  width: widget.width,
                  height: widget.height,
                  child: _renderIconUpload(photo),
                );
              }

              // if (photo.id == 0) {
              return SizedBox(
                width: widget.width,
                height: widget.height,
                child: _renderUpload(photo),
              );
            }).toList() ??
            [],
      ),
    );
  }
}
