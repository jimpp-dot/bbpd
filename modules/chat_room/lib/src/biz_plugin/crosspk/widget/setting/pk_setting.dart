import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:chat_room/src/protobuf/generated/punish.pb.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';

class CrossPKSettingPanel extends StatefulWidget {
  final int rid;

  const CrossPKSettingPanel(this.rid, {Key? key}) : super(key: key);

  @override
  State<CrossPKSettingPanel> createState() => CrossPKSettingPanelState();

  static show({required BuildContext context, required int rid}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      routeSettings: const RouteSettings(name: '/CrossPKSettingPanel'),
      builder: (BuildContext context) {
        return Container(
          height: Util.height * 0.75,
          padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16), topEnd: Radius.circular(16)),
            color: Colors.white,
          ),
          alignment: AlignmentDirectional.topCenter,
          child: CrossPKSettingPanel(rid),
        );
      },
    );
  }
}

class CrossPKSettingPanelState extends State<CrossPKSettingPanel> {
  bool _loading = true;
  late TextEditingController _textController;
  RoomCrossPkSettingData? _data;
  int _selectPunishId = -1;
  String _punishContent = '';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(() {
      _punishContent = _textController.text;
    });
    _load();
  }

  void _load() async {
    try {
      RespRoomCrossPkSetting rsp = await CrossPKRepo.getSettings(widget.rid);
      _loading = false;
      if (rsp.success) {
        _data = rsp.data;
        _selectPunishId = rsp.data.setting.punish;
        _punishContent = rsp.data.setting.punishment;
        if (_selectPunishId == -1 && Util.validStr(_punishContent)) {
          /// 已经设置过自定义惩罚，在自定义输入栏展示内容
          _textController.text = _punishContent;
        }
      } else {
        Fluttertoast.showToast(msg: rsp.msg);
      }
      refresh();
    } catch (e) {
      Log.e(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const SizedBox(
        height: 300,
        child: Loading(),
      );
    } else if (_data == null) {
      return const EmptyWidget();
    }

    List<Widget> res = [];

    if (_data!.hasPunishments()) {
      List<int> keys = _data!.punishments.config.keys.toList();
      keys.sort((a, b) => a.compareTo(b));
      for (var key in keys) {
        SystemPunishConfigItem punish = _data!.punishments.config[key]!;
        res.add(
          GestureDetector(
            onTap: () {
              refresh(() {
                _textController.clear();
                _selectPunishId = punish.id;
                _punishContent = punish.name;
              });
            },
            child: _buildPunishItem(punish.name, _selectPunishId == punish.id),
          ),
        );
      }
    }

    return Column(
      children: [
        _buildAppBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),
                _buildInviteWidget(),
                _buildFollowInviteWidget(),
                _buildPkTimeWidget(),
                if (_data!.hasPunishments()) ...[
                  SizedBox(
                    height: 52,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 20),
                        Text(K.live_pk_my_punish,
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xFF313131))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(0.0),
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 3,
                      childAspectRatio: 2.2,
                      shrinkWrap: true,
                      children: res,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildTextEditorWidget(),
                ],
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: _uploadPkSetting,
          child: Container(
            height: 52,
            margin: const EdgeInsetsDirectional.only(
                start: 16, end: 16, top: 8, bottom: 8),
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(K.room_confirm,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return SizedBox(
      height: 44,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              child: IconButton(
                padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
                icon: R.img(
                  BaseAssets.shared$ic_titlebar_back_svg,
                  width: 24,
                  height: 24,
                  color: const Color(0xFF313131),
                ),
                onPressed: () {
                  Navigator.maybePop(context);
                },
              ),
            ),
          ),
          Text(
            K.live_pk_setting,
            style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF313131),
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  /// 接受随机匹配PK邀请
  Widget _buildInviteWidget() {
    return SizedBox(
      height: 52,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              K.room_receive_pk_invite_from_match,
              style: const TextStyle(fontSize: 16, color: Color(0xFF313131)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CupertinoSwitch(
            activeColor: const Color(0xFF37DFD1),
            trackColor: R.color.switchInActiveColor,
            value: _data!.setting.acceptInvite == 1,
            onChanged: (value) {
              refresh(() {
                _data!.setting.acceptInvite = value ? 1 : 0;
              });
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  /// 接受主播PK邀请
  Widget _buildFollowInviteWidget() {
    return SizedBox(
      height: 52,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              K.room_receive_pk_invite_from_anchor,
              style: const TextStyle(fontSize: 16, color: Color(0xFF313131)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CupertinoSwitch(
            activeColor: const Color(0xFF37DFD1),
            trackColor: R.color.switchInActiveColor,
            value: _data!.setting.acceptSpecialInvite == 1,
            onChanged: (value) {
              refresh(() {
                _data!.setting.acceptSpecialInvite = value ? 1 : 0;
              });
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildPkTimeWidget() {
    return InkWell(
      onTap: _changePkTime,
      child: SizedBox(
        height: 52,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                K.live_pk_my_time,
                style: const TextStyle(fontSize: 16, color: Color(0xFF313131)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              K.room_hat_n_mins(['${(_data?.setting.duration ?? 0) ~/ 60}']),
              style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xFF313131).withOpacity(0.6)),
            ),
            R.img(RoomAssets.chat_room$livev3_icon_live_pk_setting_next_webp,
                width: 16, height: 16),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  _changePkTime() async {
    TextStyle textStyle =
        const TextStyle(color: Color(0xFF313131), fontSize: 16);
    int? i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Center(
              child: Text(K.live_pk_select_time,
                  style:
                      const TextStyle(color: Color(0xFF313131), fontSize: 18))),
          contentPadding: const EdgeInsetsDirectional.only(
              start: 20, end: 20, bottom: 10, top: 10),
          children: <Widget>[
            Divider(
                height: 1, color: const Color(0xFF313131).withOpacity(0.08)),
            InkWell(
              onTap: () => Navigator.pop(context, 180),
              child: Container(
                padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                child: Text(K.room_hat_n_mins(['3']), style: textStyle),
              ),
            ),
            Divider(
                height: 1, color: const Color(0xFF313131).withOpacity(0.08)),
            InkWell(
              onTap: () => Navigator.pop(context, 300),
              child: Container(
                padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                child: Text(K.room_hat_n_mins(['5']), style: textStyle),
              ),
            ),
            Divider(
                height: 1, color: const Color(0xFF313131).withOpacity(0.08)),
            InkWell(
              onTap: () => Navigator.pop(context, 600),
              child: Container(
                padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                child: Text(K.room_hat_n_mins(['10']), style: textStyle),
              ),
            ),
            Divider(
                height: 1, color: const Color(0xFF313131).withOpacity(0.08)),
            InkWell(
              onTap: () => Navigator.pop(context, 1800),
              child: Container(
                padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                child: Text(K.room_hat_n_mins(['30']), style: textStyle),
              ),
            ),
          ],
        );
      },
    );
    refresh(() {
      if (i != null) {
        _data!.setting.duration = i;
      }
    });
  }

  /// 自定义编辑惩罚
  Widget _buildTextEditorWidget() {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x1A313131), width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          R.img(
            RoomAssets.chat_room$livev3_icon_live_pk_setting_edit_svg,
            width: 20,
            height: 20,
            color: const Color(0x99313131),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _textController,
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
              maxLengthEnforcement:
                  MaxLengthEnforcement.truncateAfterCompositionEnds,
              textInputAction: TextInputAction.done,
              onChanged: (text) {
                refresh(() {
                  _punishContent = _textController.text;
                  _selectPunishId = -1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPunishItem(String text, bool select) {
    return Container(
      width: 106,
      height: 48,
      decoration: BoxDecoration(
        color: select ? null : const Color(0xFFF6F7F9),
        gradient: select
            ? LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: R.color.mainBrandGradientColors,
              )
            : null,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: select ? Colors.black : const Color(0xFF313131),
          fontSize: 13,
        ),
      ),
    );
  }

  void _uploadPkSetting() async {
    var resp = await CrossPKRepo.saveSettings(
      rid: widget.rid,
      acceptMatch: _data!.setting.acceptInvite,
      acceptInvite: _data!.setting.acceptSpecialInvite,
      coinEnable: _data!.setting.coinEnable,
      duration: _data!.setting.duration,
      punishId: _selectPunishId,
      punishContent: _punishContent,
    );
    if (resp.success) {
      Fluttertoast.showCenter(msg: K.room_set_success);
    } else {
      if (Util.validStr(resp.msg)) {
        Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
      }
    }

    if (resp.success) {
      Navigator.of(context).pop();
    }
  }
}
