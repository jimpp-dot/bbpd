import 'package:settings/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/model/account_info_model.dart';
import 'package:settings/src/model/setting_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../assets.dart';

class WebAuthLoginScreen extends StatefulWidget {
  final String url;
  const WebAuthLoginScreen(this.url, {Key? key}) : super(key: key);

  static void show(BuildContext context, String url) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => WebAuthLoginScreen(url),
      settings: const RouteSettings(name: '/webAuthLogin'),
    ));
  }

  @override
  _WebAuthLoginScreenState createState() => _WebAuthLoginScreenState();
}

class _WebAuthLoginScreenState extends State<WebAuthLoginScreen> {
  DataRsp<AccountUserInfo>? _dataRsp;
  late int _selectUid;

  @override
  void initState() {
    super.initState();
    _selectUid = Session.uid;
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.settings_web_login,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_dataRsp == null) {
      return const Loading();
    }

    if (Util.validStr(_dataRsp?.msg) || !(_dataRsp?.success ?? false)) {
      return ErrorData(
        onTap: _loadData,
        error: _dataRsp?.msg,
      );
    }

    if (!Util.validList(_dataRsp?.data?.smallAccounts)) {
      return const Center(
        child: EmptyWidget(),
      );
    }

    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: _buildItem,
          itemCount: _dataRsp?.data?.smallAccounts?.length,
        )),
        GestureDetector(
          onTap: _confirmClick,
          child: Container(
            margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child: Container(
              alignment: AlignmentDirectional.center,
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors)),
              child: Text(
                K.settings_auth_login,
                style: R.textStyle.medium16.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Util.bottomMargin,
        )
      ],
    );
  }

  _loadData() async {
    _dataRsp = await SettingRepository.getAccountInfo();
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    AccountInfo? info = _dataRsp?.data?.smallAccounts?[index];
    bool selected = (info?.uid == _selectUid);
    return Container(
      height: 72,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Row(
        children: [
          CommonAvatar(
            path: info?.icon ?? '',
            size: 52,
            shape: BoxShape.circle,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Text(
                info?.name ?? '',
                style: R.textStyle.regular16,
                maxLines: 1,
              )),
              const SizedBox(
                height: 4,
              ),
              IDWidget(
                uid: info?.uid ?? 0,
                fontColor: R.color.secondTextColor,
              )
            ],
          )),
          const SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () {
              _selectUid = info?.uid ?? 0;
              if (mounted) {
                setState(() {});
              }
            },
            child: selected
                ? R.img(Assets.settings$ic_checkbox_select_svg,
                    width: 24,
                    height: 24,
                    package: ComponentManager.MANAGER_SETTINGS)
                : R.img(Assets.settings$ic_checkbox_normal_svg,
                    width: 24,
                    height: 24,
                    color: const Color(0x33313131),
                    package: ComponentManager.MANAGER_SETTINGS),
          )
        ],
      ),
    );
  }

  _confirmClick() async {
    String uuid = await SettingRepository.getUuid(_selectUid);
    if (Util.validStr(uuid) && Util.validStr(widget.url)) {
      Uri uri = Uri.parse(widget.url);
      String fullStr = widget.url;
      if (uri.queryParameters.isNotEmpty) {
        fullStr = '$fullStr&uid=$_selectUid&uuid=$uuid';
      } else {
        fullStr = '$fullStr?uid=$_selectUid&uuid=$uuid';
      }
      String officialUrl = Uri.encodeFull(fullStr);
      Navigator.of(context).pop();
      await launch(officialUrl, forceSafariVC: false);
    } else {
      Fluttertoast.showCenter(msg: R.array('xhr_error_type_array')[6]);
    }
  }
}
