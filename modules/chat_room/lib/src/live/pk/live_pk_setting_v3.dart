import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/live/model/live_repository_v3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/live_pk_set_config_model_v3.dart';

//pk状态 是否接受pk邀请。1 允许  2 拒绝
enum AcceptPKInvitation {
  Accept, // 1 允许
  NoAccept, //2 不允许
}

//pk状态 是否接受互相关注主播 pk邀请。1--接受，2--不接受，3--不展示该字段（后台强制他接受）
enum AcceptFriendsPKInvitation {
  Accept, // 1 允许
  NoAccept, // 2 不允许
  Disable, // 3 不允许修改主播修改
}

//pk值支持金币礼物，1--支持，2--不支持
enum EnableCoinGift {
  Enable, // 1 支持
  NoEnable, //2 不支持
}

class LivePkSettingPanelWidget extends StatefulWidget {
  final int rid;

  const LivePkSettingPanelWidget(this.rid, {Key? key}) : super(key: key);

  @override
  State<LivePkSettingPanelWidget> createState() => LivePkSettingState();

  static Future show(BuildContext context, int rid) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                top: 12, bottom: 10 + Util.iphoneXBottom, start: 20, end: 20),
            child: LivePkSettingPanelWidget(rid),
          ),
        );
      },
    );
  }
}

class LivePkSettingState extends State<LivePkSettingPanelWidget> {
  static const List<int> _pkTimes = [180, 600, 900, 1800];

  bool _loadSuccess = false;
  Map? punishList;
  int? _selectPunishId;
  String? _punishContent;
  final TextEditingController _selectionController = TextEditingController();
  LivePKSetConfigModelV3? configModel;
  String _curPkTime = ''; //PK时间

  @override
  void initState() {
    super.initState();
    _selectionController.addListener(() {
      _punishContent = _selectionController.text;
    });
    _load();
  }

  @override
  void dispose() {
    _selectionController.dispose();
    super.dispose();
  }

  void _load() async {
    try {
      configModel = await LiveRepositoryV3.getPKConfig(widget.rid);

      if (configModel == null || configModel?.data == null) {
        return;
      }
      if (!mounted) {
        return;
      }
      _selectPunishId = configModel!.data!.punishId;
      _punishContent = configModel!.data!.punishContent;
      punishList = configModel!.systemPunishList;
      _curPkTime = configModel!.data!.pkTime;
      Log.d('eagle uploadPkSetting  11 _curPkTime=$_curPkTime');
      setState(() {
        _loadSuccess = true;
      });
    } catch (e) {
      Log.d('getPKConfig failed:${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_loadSuccess) {
      return const SizedBox(height: 300, child: Loading());
    }

    List<Widget> res = [];

    if (configModel?.systemPunishList != null) {
      List keys = punishList?.keys.toList() ?? [];
      for (var key in keys) {
        SystemPunish punish =
            SystemPunish.fromJson(configModel!.systemPunishList![key]);
        res.add(
          GestureDetector(
            onTap: () {
              setState(() {
                _selectPunishId = punish.punishId;
                _punishContent = punish.name;
                _selectionController.clear();
              });
            },
            child: _buildPunishItem(
                punish.name, _selectPunishId == punish.punishId),
          ),
        );
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.centerStart,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: R.img(
                    RoomAssets.chat_room$livev3_icon_left_pk_setting_webp,
                    width: 24,
                    height: 24,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 13, bottom: 13),
              child: Text(
                K.live_pk_setting,
                style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF313131),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: _uploadPkSetting,
                child: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    K.live_pk_submit,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildInviteWidget(),
        _buildFollowInviteWidget(),
        _buildPkTimeWidget(),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 18, bottom: 18),
          child: Text(
            K.live_pk_my_punish,
            style: const TextStyle(fontSize: 16, color: Color(0xFF313131)),
          ),
        ),
        GridView.count(
          primary: false,
          padding: const EdgeInsets.all(0.0),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3,
          childAspectRatio: 2.2,
          shrinkWrap: true,
          children: res,
        ),
        const SizedBox(height: 8),
        _buildTextEditorWidget(),
      ],
    );
  }

  /// 接受随机PK邀请
  Widget _buildInviteWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 18, bottom: 18),
          child: Text(
            K.accept_random_PK_invitation,
            style: const TextStyle(fontSize: 16, color: Color(0xFF313131)),
          ),
        ),
        const Spacer(),
        CupertinoSwitch(
          activeColor: const Color(0xFF35DFD1),
          trackColor: R.color.switchInActiveColor,
          value: configModel!.data?.acceptPKInvitation ==
              AcceptPKInvitation.Accept,
          onChanged: (value) {
            setState(() {
              value
                  ? configModel!.data?.acceptPKInvitation =
                      AcceptPKInvitation.Accept
                  : configModel!.data?.acceptPKInvitation =
                      AcceptPKInvitation.NoAccept;
            });
          },
        )
      ],
    );
  }

  /// 接受好友PK邀请
  Widget _buildFollowInviteWidget() {
    if (configModel?.data?.acceptPKHostInvitation ==
        AcceptFriendsPKInvitation.Disable) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 18, bottom: 18),
          child: Text(
            K.accept_friend_PK_invitation,
            style: const TextStyle(fontSize: 16, color: Color(0xFF313131)),
          ),
        ),
        const Spacer(),
        CupertinoSwitch(
          activeColor: const Color(0xFF35DFD1),
          trackColor: R.color.switchInActiveColor,
          value: configModel?.data?.acceptPKHostInvitation ==
              AcceptFriendsPKInvitation.Accept,
          onChanged: (value) {
            if (configModel?.data?.acceptPKHostInvitation ==
                AcceptFriendsPKInvitation.Disable) {
              Fluttertoast.showCenter(
                  msg: K.currently_modification_is_not_allowed);
              return;
            }
            setState(() {
              value
                  ? configModel!.data?.acceptPKHostInvitation =
                      AcceptFriendsPKInvitation.Accept
                  : configModel!.data?.acceptPKHostInvitation =
                      AcceptFriendsPKInvitation.NoAccept;
            });
          },
        )
      ],
    );
  }

  /// 自定义编辑惩罚
  Widget _buildTextEditorWidget() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x1A313131), width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: [
          const SizedBox(width: 10),
          R.img(
            RoomAssets.livev3_icon_live_pk_setting_edit_svg,
            width: 20,
            height: 20,
            color: const Color(0x99313131),
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _selectionController,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: const TextStyle(
                  color: Color(0x99313131), fontSize: 13, height: 1),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintStyle: const TextStyle(
                    color: Color(0x99313131), fontSize: 13, height: 1),
                hintText: K.room_diy_pk_punish,
              ),
              keyboardType: TextInputType.text,
              maxLength: 10,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              textInputAction: TextInputAction.done,
              onChanged: (text) {
                setState(() {
                  _punishContent = _selectionController.text;
                  _selectPunishId = -1;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPunishItem(String text, bool select) {
    return Container(
      width: 106,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: select ? null : const Color(0xFFF6F7F9),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        gradient: select
            ? LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: R.color.mainBrandGradientColors,
              )
            : null,
      ),
      child: Text(text,
          style: TextStyle(
              color: select ? Colors.black : const Color(0xFF313131),
              fontSize: 13)),
    );
  }

  Widget _buildPkTimeWidget() {
    return InkWell(
      onTap: _changePkTime,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 18, bottom: 18),
        child: Row(
          children: [
            Text(K.live_pk_my_time,
                style: const TextStyle(fontSize: 16, color: Color(0xFF313131))),
            const Spacer(),
            Text(
              K.live_pk_second([_curPkTime]),
              style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xFF313131).withOpacity(0.6)),
            ),
            R.img(RoomAssets.livev3_icon_live_pk_setting_next_webp,
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_BASE_ROOM),
          ],
        ),
      ),
    );
  }

  Widget _buildPkTimeItem(int time) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(height: 1, color: const Color(0xFF313131).withOpacity(0.08)),
        InkWell(
          onTap: () {
            Navigator.pop(context, time);
          },
          child: Container(
            padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
            alignment: Alignment.center,
            child: Text(
              K.live_pk_second([time.toString()]),
              style: const TextStyle(color: Color(0xFF313131), fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  _changePkTime() async {
    int? i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Center(
            child: Text(
              K.live_pk_select_time,
              style: const TextStyle(color: Color(0xFF313131), fontSize: 18),
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.only(
              start: 20, end: 20, bottom: 10, top: 10),
          children: _pkTimes.map((e) => _buildPkTimeItem(e)).toList(),
        );
      },
    );
    setState(() {
      if (i != null) {
        _curPkTime = i.toString();
      }
    });
  }

  void _uploadPkSetting() async {
    Log.d('eagle uploadPkSetting _curPkTime=$_curPkTime');
    if (configModel == null) return;

    DataRsp resp = await LiveRepositoryV3.setPKConfig(
        rid: widget.rid,
        configId: configModel!.data?.configId ?? 0,
        pkStatus:
            configModel!.data?.acceptPKInvitation == AcceptPKInvitation.Accept
                ? '1'
                : '2',
        pkTime: _curPkTime,
        punishId: _selectPunishId ?? -1,
        punishContent: _punishContent ?? '',
        hostInvite: configModel!.data?.acceptPKHostInvitation ==
                AcceptFriendsPKInvitation.Accept
            ? '1'
            : (configModel!.data?.acceptPKHostInvitation ==
                    AcceptFriendsPKInvitation.NoAccept
                ? '2'
                : '3'),
        coinEnable: configModel!.data?.enableCoinGift == EnableCoinGift.Enable
            ? '1'
            : '2');

    if (!(resp.success == true)) {
      Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
    } else if (null != resp.data && resp.data.isNotEmpty) {
      Fluttertoast.showToast(msg: resp.data, gravity: ToastGravity.CENTER);
    }
    Navigator.of(context).pop();
  }
}
