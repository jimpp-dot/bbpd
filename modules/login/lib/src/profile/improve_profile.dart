import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/src/api/api.dart';
import 'package:login/src/profile/gender.dart';

import 'slp_complete_information.dart';
import 'nick_avatar.dart';

/// 注册后完善个人资料
class ImproveProfile extends StatefulWidget {
  final bool canBack;

  const ImproveProfile({this.canBack = true, Key? key}) : super(key: key);

  @override
  _ImproveProfileState createState() => _ImproveProfileState();
}

class _ImproveProfileState extends State<ImproveProfile> {
  BaseResponse? _baseResponse;
  RegType? _regType;

  @override
  void initState() {
    super.initState();
    _getRegConfig();
  }

  @override
  Widget build(BuildContext context) {
    if (_regType == null) {
      return Container(
        color: R.color.mainBgColor,
        child: const Loading(),
      );
    }

    if (_regType!.easyMode == true) {
      return SlpCompleteInformation(regType: _regType!);
    }

    if (_needCheckNameIcon()) {
      if (_baseResponse == null) {
        return Container(
          color: R.color.mainBgColor,
          child: const Loading(),
        );
      }
      if (_baseResponse!.success == true) {
        return GenderAndAge(
          needShowInviteCode: true,
          needOneKeyFollow: _regType!.needOneKeyFollow,
        );
      }
    }
    return NickAvatar(needOneKeyFollow: _regType!.needOneKeyFollow);
  }

  ///第三方登录自带头像和昵称是需要服务端校验是否符合规则 满足条件则跳过填写
  bool _needCheckNameIcon() {
    return Util.validStr(Session.icon) && Util.validStr(Session.name);
  }

  _getRegConfig() async {
    _regType = await Api.getRegConfig();
    if (!mounted) {
      return;
    }
    if (_regType?.easyMode == true) {
      /// 使用简易注册页面
      refresh();
    } else {
      _checkNameIcon();
    }
  }

  _checkNameIcon() async {
    _baseResponse = await Api.postFilterNameIcon(Session.name, Session.icon);
    refresh();
  }
}
