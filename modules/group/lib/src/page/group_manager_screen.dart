import 'package:group/k.dart';
import 'package:shared/assets.dart';
import 'package:group/assets.dart';
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/shared.dart' hide SliverAppBar;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group/src/images.dart';
import 'package:group/src/page/groupBlackScreen.dart' hide ContactItem;
import 'package:group/src/page/groupPersonInfoScreen.dart';
import 'package:group/src/page/group_apply_list.dart';
import 'package:group/src/page/group_select_user_screen.dart';
import 'package:group/src/repo/group_repo.dart';
import 'package:group/src/util/group_reporter.dart';
import 'package:group/src/widget/contact_item.dart';
import 'package:image_picker/image_picker.dart';

import '../../a.dart';
import '../model/pb/generated/group_setting.pb.dart';

/// 新的群管理界面，强化了群主的权限，
class GroupManagerScreen extends StatefulWidget {
  final int? groupId;

  static Future openGroupManagerScreen(BuildContext context, int groupId) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GroupManagerScreen(groupId: groupId),
    ));
  }

  const GroupManagerScreen({Key? key, this.groupId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GroupManagerScreenState();
}

class _GroupManagerScreenState extends BaseScreenState<GroupManagerScreen> {
  static const LOG_TAG = '_GroupManagerScreenState';

  // 群消息通知(免打扰)
  bool _openMessage = true;

  BodySettingsData? _settingsData;

  int get _role => 0; //星舰群 0:队员  1: 议员 2: 副席 3: 群主

  List<String> get configs => A.group_config_normal;

  /// 是否有管理权限
  bool get isCanManager => isCreator || isManager;

  bool get isCreator =>
      _settingsData != null && _settingsData!.creator == Session.uid;

  bool get isManager =>
      _settingsData != null && (_settingsData!.isManager == 0);

  bool get _coverInAudit => _settingsData?.coverAudit == 1;

  bool get _nameInAudit => _settingsData?.nameAudit == 1;

  bool get _descInAudit => _settingsData?.descAudit == 1;

  final GlobalKey<ImageUploadState> _imageUploadKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(IGroupManager.EVENT_REFRESH_GROUP_INFO, _onEvent);
    _loadData();
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        IGroupManager.EVENT_REFRESH_GROUP_INFO, _onEvent);
    super.dispose();
  }

  void _onEvent(String type, dynamic data) {
    if (mounted) {
      _loadData();
    }
  }

  void _loadData() async {
    GroupSettingDataRsp resp = await GroupRepo.getGroupSettings(widget.groupId);
    if (resp.success == true) {
      _settingsData = resp.data;
      await getNotifyStatus();
      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  Future getNotifyStatus() async {
    try {
      _openMessage = await Im.getConversationNotificationStatus(
          'group', widget.groupId.toString(),
          syncFromServer: true);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  @override
  PreferredSizeWidget buildAppBar() {
    if (configs.isNotEmpty && configs[0].isNotEmpty) {
      return BaseAppBar(
        _settingsData == null ? "" : configs[0],
      );
    } else {
      return BaseAppBar(
        _settingsData == null ? "" : '',
      );
    }
  }

  @override
  Color getBgColor() {
    return R.colors.mainBgColor;
  }

  @override
  Widget buildContent() {
    List<Widget> widgets = [];

    if (isCanManager) {
      widgets.add(_wrapWidget(_buildCover(true)));
      widgets.add(const SizedBox(height: 8));
      widgets.add(_wrapWidget(_buildName(true)));
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildId()));
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildNotice(true)));
      widgets.add(const SizedBox(height: 8));
      widgets.add(_wrapWidget(_buildApply()));
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildMute()));
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildNickName()));
      widgets.add(_buildDivider());
      if (isCreator) {
        widgets.add(_wrapWidget((_buildForbid())));
      }
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildInvite()));
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildAddApply()));
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildSearch()));
      widgets.add(const SizedBox(height: 8));
      widgets.add(_wrapWidget(_buildBlack()));
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildMember(true)));
      widgets.add(_buildDivider());
      widgets.addAll(_buildMemberList());
    } else {
      widgets.add(_wrapWidget(_buildCover(false)));
      widgets.add(const SizedBox(height: 8));
      widgets.add(_wrapWidget(_buildName(false)));
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildId()));
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildNotice(false)));
      widgets.add(const SizedBox(height: 8));
      widgets.add(_wrapWidget(_buildMute()));
      widgets.add(_buildDivider());
      widgets.add(_wrapWidget(_buildNickName()));
      widgets.add(const SizedBox(height: 8));
      widgets.add(_wrapWidget(_buildMember(false)));
      widgets.add(_buildDivider());
      widgets.addAll(_buildMemberList());
    }

    widgets.add(const SizedBox(height: 30));
    widgets.add(BottomButton.of(
      title: isCreator ? configs[14] : configs[15],
      onTap: _pressBottomBtn,
    ));
    widgets.add(const SizedBox(height: 10));
    return ListView(
      children: widgets,
    );
  }

  @override
  onTapErrorWidget() {
    _loadData();
  }

  Container _wrapWidget(Widget widget) {
    return Container(color: Colors.transparent, child: widget);
  }

  /// 审核中
  TextSpan _inAuditWidget() {
    return TextSpan(
      text: K.group_in_auditing,
      style: TextStyle(
        fontSize: 13.0,
        color: R.color.thirdTextColor,
      ),
    );
  }

  /// 头像
  Widget _buildCover(bool canEdit) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 20.0, bottom: 20, end: 16, start: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text.rich(
            TextSpan(
              text: configs[1],
              style: R.textStyle.subhead,
              children: [if (_coverInAudit) _inAuditWidget()],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 56,
            height: 56,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: _getCoverImg(canEdit),
            ),
          ),
          if (canEdit)
            Icon(
              Icons.keyboard_arrow_right,
              color: R.color.thirdTextColor,
            )
        ],
      ),
    );
  }

  ///名称
  Widget _buildName(bool canEdit) {
    return WidgetUtils.buildIconListTile(
        title: Text.rich(
          TextSpan(
            text: configs[2],
            style: R.textStyle.subhead,
            children: [if (_nameInAudit) _inAuditWidget()],
          ),
        ),
        subTitle:
            !Util.isStringEmpty(_settingsData!.name) ? _settingsData!.name : "",
        hasArrow: canEdit,
        onTap: () {
          if (_nameInAudit) {
            return;
          }
          _onGroupNameTaped(canEdit);
        });
  }

  /// ID
  Widget _buildId() {
    return ListTile(
        title: Text(
          configs[3],
          style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
        ),
        trailing: IntrinsicWidth(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Clipboard.setData(ClipboardData(text: '${_settingsData!.id}'));
              Toast.show(context, K.group_id_copied);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${_settingsData!.id}',
                  style: R.textStyle.trailing,
                  softWrap: true,
                  maxLines: 2,
                ),
                const SizedBox(width: 2),
                R.img(Assets.group$group_ic_copy_svg, width: 16, height: 16)
              ],
            ),
          ),
        ));
  }

  /// 公告
  Widget _buildNotice(bool canEdit) {
    return WidgetUtils.buildListTile(configs[4],
        subTitle: !Util.isStringEmpty(_settingsData!.notice)
            ? _settingsData!.notice
            : "",
        hasArrow: canEdit, onTap: () {
      _onGroupNoticeTaped(canEdit);
    });
  }

  /// 进群申请
  Widget _buildApply() {
    return ListTile(
      title: Text(
        configs[5],
        style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
      ),
      onTap: () {
        GroupApplyListScreen.openGroupApplyListScreen(context, widget.groupId);
      },
      trailing: IntrinsicWidth(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RedDot(
                num: _settingsData!.applyNum,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: R.color.thirdTextColor,
              )
            ]),
      ),
    );
  }

  /// 消息免打扰
  Widget _buildMute() {
    return WidgetUtils.buildSwitchListTile(configs[6], !_openMessage,
        onChanged: (value) {
      _onMsgSwitchValueChangedByBBim(value);
    });
  }

  /// 昵称
  Widget _buildNickName() {
    return WidgetUtils.buildListTile(configs[7],
        subTitleWidget: Container(
          constraints: BoxConstraints(maxWidth: Util.width - 280),
          child: Text(
            !Util.isStringEmpty(_settingsData!.nickname)
                ? _settingsData!.nickname
                : Session.name,
            style: R.textStyle.trailing,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
          ),
        ),
        hasArrow: true,
        onTap: _onNickNameTaped);
  }

  /// 禁言
  Widget _buildForbid() {
    return WidgetUtils.buildSwitchListTile(
        configs[8], _settingsData!.forbidden == 1, onChanged: (value) {
      _updateSetting('forbidden', value ? "1" : "0");
    });
  }

  /// 邀请进人
  Widget _buildInvite() {
    return WidgetUtils.buildSwitchListTile(
        configs[9], _settingsData!.allowInvite == 0, onChanged: (value) {
      _updateSetting('allow_invite', value ? "0" : "1");
    });
  }

  ///加人审核
  Widget _buildAddApply() {
    return WidgetUtils.buildSwitchListTile(
        configs[10], _settingsData!.needAudit == 0, onChanged: (value) {
      _updateSetting('need_audit', value ? "0" : "1");
    });
  }

  /// 群搜索
  Widget _buildSearch() {
    return WidgetUtils.buildSwitchListTile(
        configs[11], _settingsData!.allowSearch == 0, onChanged: (value) {
      _updateSetting('allow_search', value ? "0" : "1");
    });
  }

  /// 黑名单
  Widget _buildBlack() {
    return WidgetUtils.buildListTile(K.blacklist,
        onTap: () => GroupBlackScreen.openGroupBlackScreen(context,
            groupId: widget.groupId));
  }

  /// 成员
  Widget _buildMember(bool canEdit) {
    int totalNum = _settingsData?.members.length ?? 0;
    String member = "$totalNum";
    return ListTile(
      dense: false,
      title: Row(
        children: <Widget>[
          Text(
            "${configs[12]}$member${configs[13]}",
            style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
      trailing: IntrinsicWidth(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _getAddMember(canEdit))),
      onTap: () {
        _onInviteMemberTaped(canEdit);
      },
    );
  }

  /// 成员列表
  List<Widget> _buildMemberList() {
    List<Widget> widgets = [];
    if (!Util.isCollectionEmpty(_settingsData!.members)) {
      for (var item in _settingsData!.members) {
        widgets.add(
          _wrapWidget(ListTile(
            dense: false,
            title: ContactItem(data: item),
            onTap: () {
              bool notSelf = item.uid != Session.uid;
              bool showPersonInfo =
                  (isCreator || (_role > 0 && _role > item.role)) && notSelf;
              if (showPersonInfo) {
                GroupPersonInfoScreen.openGroupPersonInfoScreen(
                  context,
                  groupId: widget.groupId,
                  uid: Util.parseInt(item.uid),
                  fromMangerScreen: true,
                );
              } else {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, item.uid,
                    refer: const PageRefer("group"));
              }
            },
          )),
        );
      }
    }
    return widgets;
  }

  Widget _getCoverImg(bool canEdit) {
    if (canEdit && !_coverInAudit) {
      return ImageUpload(
        key: _imageUploadKey,
        source: ImageSource.gallery,
        uploadUrl: '${System.domain}upload/image/',
        onTapFilter: null,
        onComplete: (String name, int width, int height, Map origin) {
          if (!Util.isStringEmpty(name)) {
            _updateSetting("cover", name);
          }
          return true;
        },
        child: _renderIcon(),
      );
    }
    return _renderIcon();
  }

  List<Widget> _getAddMember(bool canEdit) {
    List<Widget> list = [];
    if ((canEdit || _settingsData!.allowInvite == 1)) {
      list.add(
        Container(
            padding: const EdgeInsetsDirectional.only(end: 8.0),
            child: Images.img('group_add_member.svg',
                width: 20, height: 20, color: R.color.thirdTextColor)),
      );
      list.add(
        Text(K.add_member,
            textScaleFactor: 1.0,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 13.0, color: R.color.thirdTextColor)),
      );
    }

    return list;
  }

  Widget _renderIcon() {
    if (Util.isStringEmpty(_settingsData!.cover)) {
      return R.img(BaseAssets.shared$profile_add_png, width: 56.0);
    }
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(_settingsData!.cover),
        suffix: '!head150',
        fit: BoxFit.cover,
        width: 56.0,
        height: 56.0,
        fadeOutDuration: const Duration(microseconds: 0),
        fadeInDuration: const Duration(microseconds: 0),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
        height: 0.5,
        color: Colors.black.withOpacity(0.06));
  }

  void _onGroupNameTaped(bool canEdit) async {
    if (canEdit) {
      int index = FormScreen.config(
        title: configs[2],
        value:
            !Util.isStringEmpty(_settingsData!.name) ? _settingsData!.name : "",
        allowEmpty: false,
        maxLength: 20,
      );
      String value = await (_gotoFormScreen(index));
      if (!Util.isStringEmpty(value) && value != _settingsData!.name) {
        _updateSetting('name', value);
      }
    }
  }

  void _onGroupNoticeTaped(bool canEdit) async {
    if (canEdit) {
      int index = FormScreen.config(
        type: FormTypes.textArea,
        title: configs[4],
        value: !Util.isStringEmpty(_settingsData!.notice)
            ? _settingsData!.notice
            : "",
        allowEmpty: false,
        maxLength: 300,
      );
      String? value = await (_gotoFormScreen(index));
      if (value != _settingsData!.notice && value != null) {
        _updateSetting('notice', value);
      }
    }
  }

  void _onNickNameTaped() async {
    int index = FormScreen.config(
      type: FormTypes.input,
      title: configs[7],
      value: !Util.isStringEmpty(_settingsData!.nickname)
          ? _settingsData!.nickname
          : Session.name,
      allowEmpty: false,
      tip: K.group_nick_name_tips,
      maxLength: 8,
    );
    String value = await (_gotoFormScreen(index));
    if (!Util.isStringEmpty(value) && value != _settingsData!.nickname) {
      bool result = await GroupRepo.setGroupNickName(widget.groupId, value);
      if (result && mounted) {
        eventCenter.emit(IGroupManager.EVENT_NICK_NAME_CHANGED, value);
        _loadData();
      }
    }
  }

  void _onInviteMemberTaped(bool canEdit) async {
    if (canEdit || _settingsData!.allowInvite == 1) {
      List<int> uids = [];
      if (!Util.isCollectionEmpty(_settingsData!.members)) {
        for (var item in _settingsData!.members) {
          uids.add(item.uid);
        }
      }
      List<int>? uidList = await (SelectUserScreen.show(context,
          preSelectedUis: uids, title: K.group_invite_to_group));
      Log.d('uidList = $uidList');
      if (!Util.isCollectionEmpty(uidList)) {
        bool result = await GroupRepo.inviteUsers(widget.groupId, uidList!);
        if (result) {
          GroupReporter.inviteInGroup(isCreator);
        }
      }
    }
  }

  void _updateSetting(String key, String value) async {
    bool result = await GroupRepo.updateSettings(widget.groupId, key, value);
    if (result && mounted) {
      _loadData();
      if (key == 'notice' && !Util.isStringEmpty(value)) {
        await _sendNoticeAtAll(value);
      }
    }
  }

  /// 修改群公告后@所有人
  _sendNoticeAtAll(String value) async {
    String senderName = !Util.isStringEmpty(_settingsData!.nickname)
        ? _settingsData!.nickname
        : Session.name;
    MessageContent content = MessageContent(
      MessageType.Mention,
      SendUser(Session.uid.toString(), senderName, Session.icon),
    );
    content.content = K.group_at_all_notice([value]);
    content.extra =
        json.encode({'userList': [], 'mtype': MentionType.MENTION_TYPE_ALL});
    await Im.sendMessage(
      ConversationType.Group,
      '${widget.groupId}',
      content,
      supportVersion: ImSupportSDKVersions.AT_MESSAGE_SUPPORT_VERSION,
    );
  }

  void _onMsgSwitchValueChangedByBBim(bool value) async {
    try {
      bool res = await Im.setConversationNotificationStatus(
          'group', widget.groupId.toString(), value);

      Log.d(value);
      if (res == true) {
        _openMessage = !value;
        if (mounted) {
          setState(() {});
        }
        Fluttertoast.showToast(
            msg: K.setting_success, gravity: ToastGravity.CENTER);
      } else {
        Fluttertoast.showToast(
            msg: K.setting_failed, gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.CENTER);
    }
  }

  Future _gotoFormScreen(int index) async {
    return await FormScreen.openFormScreen(context, index);
  }

  void _pressBottomBtn() async {
    if (isCreator) {
      _onDismissGroup();
    } else {
      _onQuitGroup();
    }
  }

  void _onQuitGroup() async {
    bool? r = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: Text(K.notice),
              content: Text(configs[20]),
              actions: <Widget>[
                CupertinoButton(
                  child: Text(K.cancel),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                CupertinoButton(
                  child: Text(K.sure),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ]);
        });
    if (r != null && r == true) {
      bool result = await GroupRepo.quit(widget.groupId);
      if (result && mounted) {
        bool removeResult = await Im.removeConversation(
            ConversationType.Group, widget.groupId.toString());
        if (removeResult) {
          eventCenter.emit(
            Im.EventRemoveConversation,
            {
              'type': ConversationType.Group,
              'targetId': widget.groupId.toString(),
            },
          );
        }
        Navigator.pop(context);
      }
    }
  }

  void _onDismissGroup() async {
    bool? r = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(K.notice),
          content: Text(configs[19]),
          actions: <Widget>[
            CupertinoButton(
              child: Text(K.cancel),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            CupertinoButton(
              child: Text(K.sure),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
    if (r != null && r == true) {
      bool result = await GroupRepo.dismiss(widget.groupId);
      if (result && mounted) {
        Navigator.pop(context);
      }
    }
  }
}
