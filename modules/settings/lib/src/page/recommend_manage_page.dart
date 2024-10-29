import 'package:settings/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/model/setting_repository.dart';
import 'package:shared/src/network/entity/settingsInfoRsp.dart';

import '../model/pb/generated/law.pb.dart';

/// 个性化推荐管理
class RecommendManagePage extends StatefulWidget {
  const RecommendManagePage({Key? key}) : super(key: key);

  static show(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const RecommendManagePage()));
  }

  @override
  State<RecommendManagePage> createState() => _RecommendManagePageState();
}

class _RecommendManagePageState extends BaseScreenState<RecommendManagePage> {
  bool _enable = true;
  String? _recommendText;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    ResRecommendDesc resp = await SettingRepository.getRecommendDesc();

    SettingsInfoRsp? settingsInfoRsp =
        await BaseRequestManager.getSettingsInfo();

    if (resp.success && settingsInfoRsp != null && settingsInfoRsp.success) {
      _recommendText = resp.desc;
      _enable = !settingsInfoRsp.data.enableRecommend;
      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return BaseAppBar(K.setting_recommend_manage);
  }

  @override
  Widget buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
            child: Text(_recommendText ?? '',
                style: TextStyle(color: R.color.mainTextColor, fontSize: 14)),
          ),
          const SizedBox(height: 4),
          SettingItemWithSwitchWidget(
            title: K.setting_person_recommend,
            value: _enable,
            onChanged: _onRecommendEnableChanged,
            contentPadding:
                const EdgeInsetsDirectional.only(start: 20, end: 20),
          ),
        ],
      ),
    );
  }

  void _onRecommendEnableChanged(bool value) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}account/openRecommend",
          {
            'value': value ? "0" : "1",
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        _enable = value;
        if (mounted) {
          setState(() {});
        }
        Fluttertoast.showToast(
            msg: K.setting_set_success, gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }
}
