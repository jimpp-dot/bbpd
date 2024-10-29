import 'dart:io';
import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fmodifier/fmodifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/k.dart';
import 'package:login/src/api/api.dart';
import 'package:login/src/model/pb/generated/hisong_reg_config.pb.dart';
import 'package:login/src/profile/invite_code_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../assets.dart';
import 'gender.dart';
import 'profile_data.dart';

/// 头像与昵称
class NickAvatar extends StatefulWidget {
  final bool needOneKeyFollow;

  const NickAvatar({this.needOneKeyFollow = false, Key? key}) : super(key: key);

  @override
  State createState() => _NickAvatarState();
}

class _NickAvatarState extends State<NickAvatar> {
  final TextEditingController _nicknameController = TextEditingController();
  final GlobalKey<ImageUploadState> _imgUploadKey =
      GlobalKey<ImageUploadState>();
  final ILoginManager loginManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);

  HiSongRegConfig? _regConfig;
  bool _isRandomName = false;
  bool _isRandomIcon = false;
  bool _didNoticeChangeIcon = false;

  int get defaultSex {
    return _regConfig != null && _regConfig!.defaultSex == 1 ? 1 : 2;
  }

  @override
  void initState() {
    super.initState();
    ProfileData.reset();
    Tracker.instance
        .track(TrackEvent.register, properties: {'step': 'entrance'});
    if (ProfileData.icon.isEmpty) {
      ProfileData.icon = Session.icon ?? '';
    }
    if (ProfileData.nickName.isEmpty) {
      ProfileData.nickName = Session.name ?? '';
    }
    _nicknameController.text = ProfileData.nickName;

    _loadConfigData();
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  _loadConfigData() async {
    ResHiSongRegConfig hiSongRegConfig = await Api.getHiSongPlaceholderData();
    if (hiSongRegConfig.success) {
      if (mounted) {
        _regConfig = hiSongRegConfig.data;

        ProfileData.sex = hiSongRegConfig.data.defaultSex.toString();
        //初始化默认昵称、头像（默认女性）
        if (ProfileData.nickName.isEmpty) {
          _randomName(defaultSex);
        }
        if (ProfileData.icon.isEmpty) {
          _randomIcon(defaultSex);
        }
      }
    }
  }

  void _randomName(int sex) {
    if (_regConfig == null) {
      return;
    }

    String rName = '';
    HiSongRegConfig config = _regConfig!;

    if (config.thirdName.isNotEmpty) {
      //优先使用第三方的
      rName = config.thirdName;
    } else {
      List<String> namePrefix =
          sex == 1 ? config.maleRandPrefix : config.femaleRandPrefix;
      List<String> name =
          sex == 1 ? config.maleRandName : config.femaleRandName;

      if (namePrefix.isNotEmpty) {
        rName = namePrefix[Random().nextInt(namePrefix.length)];
      }
      if (name.isNotEmpty) {
        rName += name[Random().nextInt(name.length)];
      }

      if (rName.isNotEmpty) {
        setState(() {
          _isRandomName = true;
          ProfileData.nickName = rName;
          _nicknameController.text = rName;
        });
      }
    }
  }

  void _randomIcon(int sex) {
    if (_regConfig == null) {
      return;
    }

    HiSongRegConfig config = _regConfig!;
    String rIcon = '';
    if (config.thirdIcon.isNotEmpty) {
      //优先使用第三方的
      rIcon = config.thirdIcon;
    } else {
      rIcon = sex == 1 ? config.maleDefaultIcon : config.femaleDefaultIcon;
    }
    if (rIcon.isNotEmpty) {
      setState(() {
        _isRandomIcon = true;
        ProfileData.icon = rIcon;
      });
    }
  }

  _onClearNickname() {
    _nicknameController.text = '';
    setState(() {
      _isRandomName = _regConfig != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: R.colors.mainBgColor,
          bottomNavigationBar: BottomButton.of(
              title: K.next_step,
              onTap: _gotoNextPage,
              bgColor: R.colors.darkGradientColors),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Container(
          color: R.color.mainBgColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: R.img(
            BaseAssets.shared$normal_main_bg_webp,
            width: MediaQuery.of(context).size.width,
            package: ComponentManager.MANAGER_BASE_CORE,
            fit: BoxFit.fill,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 20.dp,
                      top: Util.statusHeight + 16.dp,
                      bottom: 56.dp),
                  child: Text(
                    K.icon_and_nickname,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight:
                          loginManager.bold ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.dp,
                      height: 120.dp,
                      margin: EdgeInsets.only(bottom: 10.dp),
                      alignment: Alignment.center,
                      child: _renderAvatarUpload(),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '上传',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: Util.fontFamily,
                                color: R.color.thirdTextColor),
                          ),
                          TextSpan(
                            text: ' ${K.login_avatar_clear} ',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: Util.fontFamily,
                                color: Colors.orange),
                          ),
                          TextSpan(
                            text: K.login_real_avatar,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: Util.fontFamily,
                                color: R.color.thirdTextColor),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildInput(K.please_input_nickname, _nicknameController,
                        _onClearNickname),
                    // const InviteCodeWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInput(
      String hintText, TextEditingController controller, VoidCallback onClear) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: R.color.secondBgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                counterText: '',
                hintStyle: TextStyle(
                    fontSize: 16, color: Colors.white.withOpacity(0.5)),
              ),
              textInputAction: TextInputAction.done,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              autofocus: false,
              autocorrect: false,
              maxLines: 1,
              maxLength: 20,
              cursorColor: R.color.cursorColor,
              onChanged: (value) {
                setState(() {
                  _isRandomName = _nicknameController.text.trim().isEmpty &&
                      _regConfig != null;
                });
              },
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                _isRandomName ? Icons.sync : Icons.clear,
                color: Colors.white,
                size: 16,
              ),
            ),
            onTap: () {
              if (_isRandomName) {
                int sex = Util.parseInt(ProfileData.sex) == 1 ? 1 : 2;
                _randomName(sex);
              } else {
                onClear();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _renderAvatarUpload() {
    return SizedBox(
      width: 110.dp,
      height: 110.dp,
      child: ClipOval(
        child: ImageUpload(
          key: _imgUploadKey,
          source: ImageSource.gallery,
          uploadUrl: '${System.domain}upload/image/',
          crop: true,
          minSize: Util.getUserUploadAvatarMinSize(),
          onComplete: (String? name, int width, int height, Map origin) {
            setState(() {
              _isRandomIcon = false;
              ProfileData.icon = name ?? '';
            });
            Tracker.instance.track(TrackEvent.upload_picture, properties: {
              'result': 'success',
            });
            return true;
          },
          onError: (String? error) {
            Fluttertoast.showToast(msg: error ?? BaseK.K.upload_error_retry);
            Tracker.instance.track(TrackEvent.upload_picture, properties: {
              'result': 'error',
            });
          },
          child: _renderAvatar(),
        ),
      ),
    );
  }

  Widget _renderAvatar() {
    if (ProfileData.icon.isEmpty) {
      return Container(
        width: 120.dp,
        height: 120.dp,
        decoration:
            BoxDecoration(color: R.color.secondBgColor, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: R.img(Assets.login$ic_login_avatar_svg,
            package: ComponentManager.MANAGER_LOGIN, width: 40, height: 40),
      );
    }
    return CommonAvatar(
      path: ProfileData.icon,
      size: 120.dp,
    );
  }

  void _gotoNextPage() async {
    Tracker.instance.track(TrackEvent.registerEntranceNextClick);

    if (ProfileData.icon.isEmpty) {
      PermissionStatus status = PermissionStatus.granted;
      Permission? permission;

      if (Platform.isAndroid) {
        permission = Permission.storage;
        if (DeviceInfo.androidSdkInt < 23) {
          status = PermissionStatus.granted;
        } else {
          status = await PermissionUtil.checkPermissions(context, permission);
        }
      } else if (Platform.isIOS) {
        permission = Permission.photos;
        status = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, permission);
      }

      /// 用户拒绝了相应权限，不强制传头像。相关法规要求：拒绝权限后需要能够完成注册。
      /// 用户打开对应权限，或者从未申请过权限，没有上传头像提示用户传头像
      if (status == PermissionStatus.granted ||
          Config.getBool('has_request_$permission', false) == false) {
        Fluttertoast.showToast(
            msg: K.please_select_a_photo_for_icon,
            gravity: ToastGravity.CENTER);
        return;
      }
    }

    String nickName = _nicknameController.text.trim();
    if (nickName.isEmpty) {
      Fluttertoast.showToast(
          msg: K.nickname_cant_be_null, gravity: ToastGravity.CENTER);
      return;
    }

    ProfileData.nickName = nickName;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GenderAndAge(
          defaultSex: ProfileData.sex,
          defaultBirthday: DateTime(2000),
          needOneKeyFollow: widget.needOneKeyFollow,
          changeSex: (int sex) {
            if (_isRandomIcon) {
              if (!_didNoticeChangeIcon) {
                _didNoticeChangeIcon = true;
                Toast.show(context, '已为你更换为系统默认头像');
              }
              //防止性别和头像不匹配，每次改性别后都换头像（头像只有男女、第三方三种，所以这里直接刷）
              _randomIcon(sex);
            }
          },
        ),
      ),
    );
  }
}
