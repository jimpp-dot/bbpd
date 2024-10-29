import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:profile/src/api/api.dart';
import 'package:profile/src/model/reception_info_model.dart';

import '../k.dart';

class ReceptionAuthPage extends StatefulWidget {
  const ReceptionAuthPage({super.key});

  @override
  _ReceptionAuthPageState createState() => _ReceptionAuthPageState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ReceptionAuthPage(),
      settings: const RouteSettings(name: '/receptionAuth'),
    ));
  }
}

class _ReceptionAuthPageState extends State<ReceptionAuthPage> {
  bool _loading = true;
  DataRsp<ReceptionConfig>? _dataRsp;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.profile_reception_auth,
      ),
      backgroundColor: R.color.mainBgColor,
      body: _buildBody(),
    );
  }

  _loadData() async {
    _dataRsp = await Api.getReceptionConfig();
    _loading = false;
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }
    if (Util.validStr(_dataRsp?.msg)) {
      return ErrorData(
        onTap: _loadData,
        error: _dataRsp?.msg,
      );
    }

    return Container(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: _buildUserInfoWidget()),
          SliverToBoxAdapter(child: _buildChannelTitleWidget()),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(_buildChannelItem,
                  childCount: _dataRsp!.data!.channel.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 166 / 108,
                  crossAxisSpacing: 11,
                  mainAxisSpacing: 11)),
          SliverToBoxAdapter(child: _buildAuthTips()),
        ]));
  }

  Widget _buildUserInfoWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [getCardBoxShadow()],
          color: R.color.mainBgColor),
      child: Stack(
        children: [
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: R.img('bg_reception_img.webp',
                width: 98,
                height: 80,
                package: ComponentManager.MANAGER_PROFILE),
          ),
          Container(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 24, 12, 24),
              child: Row(
                children: [
                  CommonAvatar(
                    path: _dataRsp!.data!.icon,
                    size: 52,
                    shape: BoxShape.circle,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            _dataRsp!.data!.name,
                            maxLines: 1,
                            style: R.textStyle.medium16,
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            K.profile_user_guild +
                                (Util.validStr(_dataRsp!.data!.bname)
                                    ? _dataRsp!.data!.bname
                                    : K.profile_guild_tips),
                            maxLines: 1,
                            style: R.textStyle.regular14.copyWith(
                                color: R.color.secondTextColor, fontSize: 13),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      IDWidget(uid: Session.uid)
                    ],
                  ))
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildChannelTitleWidget() {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
      child: Row(
        children: [
          Expanded(
              child: Text(
            K.profile_channel_reception_apply,
            maxLines: 1,
            style: R.textStyle.medium16,
          )),
          if (_dataRsp!.data!.failNum > 0)
            Text(
              K.profile_examine_fail_times(['${_dataRsp!.data!.failNum}']),
              style: R.textStyle.regular14
                  .copyWith(fontSize: 13, color: R.color.thirdBrightColor),
            )
        ],
      ),
    );
  }

  Widget _buildChannelItem(BuildContext buildContext, int index) {
    ChannelInfoModel model = _dataRsp!.data!.channel[index];
    String iconPath = '';
    String statusName = '';
    String btnTitle = K.profile_apply;
    if (model.verify == 1) {
      iconPath = 'icon_wait.webp';
      statusName = K.profile_wait_examine;
      btnTitle = K.profile_has_apply;
    }

    if (model.verify == 2) {
      iconPath = 'icon_check.webp';
      statusName = K.profile_has_auth;
      btnTitle = K.profile_cancle_auth;
    }

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(model.bgImg),
          fit: BoxFit.cover,
        ),
        PositionedDirectional(
          top: 12,
          start: 12,
          child: Text(
            model.label + K.profile_channel,
            style: R.textStyle.medium16.copyWith(color: Colors.white),
          ),
        ),
        if (model.verify > 0)
          PositionedDirectional(
            top: 39,
            start: 12,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img(iconPath,
                    width: 12,
                    height: 12,
                    package: ComponentManager.MANAGER_PROFILE),
                const SizedBox(
                  width: 4,
                ),
                Text(statusName,
                    style: R.textStyle.medium12
                        .copyWith(color: Colors.white.withOpacity(0.8))),
              ],
            ),
          ),
        PositionedDirectional(
          bottom: 12,
          start: 12,
          child: GestureDetector(
            onTap: () {
              _itemClick(model);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
              decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color:
                      Colors.white.withOpacity((model.verify == 1) ? 0.4 : 1)),
              child: Text(
                btnTitle,
                style: R.textStyle.medium12.copyWith(
                    fontSize: 13,
                    color:
                        model.color.withOpacity((model.verify == 1) ? 0.4 : 1)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAuthTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 33,
        ),
        Text(
          K.profile_auth_tips,
          style: R.textStyle.medium16,
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          _dataRsp!.data!.rules,
          style: R.textStyle.regular14.copyWith(color: R.color.secondTextColor),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _itemClick(ChannelInfoModel model) async {
    if (model.verify == 1) {
      return;
    }
    if (model.verify == 0) {
      DataRsp<ChannelInfoModel> rsp = await Api.startReceptionVerify(model.val);
      if (rsp.success == true) {
        _authFace(rsp.data!.verifyId);
      } else {
        Fluttertoast.showCenter(msg: rsp.msg);
      }

      // _showAlertDialog(context,K.profile_apply_confirm_tips([model.label])).then((value) async{
      //   if(Util.parseBool(value)){
      //
      //   }
      // });
    }

    if (model.verify == 2) {
      _showAlertDialog(context, K.profile_cancel_auth_tip).then((value) async {
        if (Util.parseBool(value)) {
          BaseResponse response = await Api.cancelReceptionVerify(model.val);
          if (response.success == true) {
            _loadData();
          } else {
            Fluttertoast.showCenter(msg: response.msg);
          }
        }
      });
    }
  }

  Future _showAlertDialog(BuildContext context, String content) {
    return showDialog(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            content: content,
          );
        });
  }

  _authFace(int verifyId) async {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager
        .openIdAuth(context, certifyType: CertifyType.check)
        .then((value) {
      if (Util.parseBool(value)) {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager
            .openAudioRecord(context,
                type: AudioRecordType.receptionAuth, verifyId: verifyId)
            .then((value) => _loadData());
      }
    });
  }
}
