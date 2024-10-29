import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import '../../k.dart';
import 'package:image_picker/image_picker.dart';

import '../model/pbModel/generated/chat_account_info.pb.dart';
import '../repo/chat_repo.dart';

class ChatSettingScreen extends StatefulWidget {
  final int uid;
  final String? nickName;
  final String type;
  final String? userIcon;
  final List<MessageContent>? msgList; // 私聊消息列表

  const ChatSettingScreen(
      this.uid, this.nickName, this.type, this.userIcon, this.msgList,
      {super.key});

  static Future show(
      BuildContext context, int uid, String? nickName, String type,
      {String? icon = '', List<MessageContent>? msgList}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            ChatSettingScreen(uid, nickName, type, icon, msgList),
        settings: const RouteSettings(name: '/chatSetting'),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _ChatSettingState();
  }
}

class _ChatSettingState extends State<ChatSettingScreen> {
  bool _isTop = false;
  String _icon = '';
  int _age = 0;
  int _sex = 0;
  String? _sign;
  String? _mark_name;
  String? _nick_name;
  int _is_follow = 0;
  bool _isKAUser = false;
  List<ChatBgImage> photos = [];
  int totalNum = 0;
  int canUserNum = 0;
  @override
  void initState() {
    super.initState();
    if (!Util.isStringEmpty(widget.userIcon)) {
      _icon = widget.userIcon!;
    }
    _loadData();
  }

  _loadData() async {
    try {
      // 置顶状态查询
      _isTop = await Im.getTargetIsTop(widget.type, '${widget.uid}');
      // 个人信息查询
      ResAccountUserInfo userInfo = await ChatRepo.getUserInfo(widget.uid);
      if (userInfo.success) {
        _icon = userInfo.data.profile.icon;
        _age = userInfo.data.age;
        _sex = userInfo.data.profile.sex;
        _sign = userInfo.data.profile.sign;
        _mark_name = userInfo.data.markName;
        _nick_name = userInfo.data.profile.name;
        _is_follow = Util.parseInt(userInfo.data.isFollow, 0);
        _isKAUser = Util.parseInt(userInfo.data.userType, 0) == 1; //0普通用户，1KA用户
        photos = userInfo.data.list;
        totalNum = userInfo.data.totalCount;
        canUserNum = userInfo.data.canUseCount;
      }
    } catch (e) {
      Log.d('ChatSetting _loadData error: $e');
    }

    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String iconUrl =
        _icon.startsWith("http") ? _icon : System.imageDomain + _icon;
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        suppDark: true,
        onBackPressedCallback: () {
          Navigator.of(context).pop(_mark_name);
        },
        title: Text(
          K.chat_setting_title,
          style: TextStyle(fontSize: 17, color: R.colors.mainTextColor),
        ),
      ),
      body: Column(
        children: <Widget>[
          InkWell(
            onTap: _userTap,
            child: Container(
              height: 88,
              padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: CachedNetworkImage(
                        imageUrl: iconUrl,
                        suffix: '!head150',
                        placeholder: const CupertinoActivityIndicator(),
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _renderBasic(),
                        Text(_sign ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: R.colors.secondTextColor,
                              fontSize: 14.0,
                            ))
                      ],
                    ),
                  ),
                  R.img(Assets.chat$ic_next_svg,
                      width: 16,
                      color: R.colors.secondTextColor,
                      package: ComponentManager.MANAGER_CHAT)
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(
                start: 16.0, end: 16.0, top: 10.0, bottom: 10.0),
            height: 0.5,
            color: R.colors.dividerColor,
          ),
          if (_is_follow > 0) ChatSettingItem(K.chat_mark_name, _markName),
          ChatSettingItem(K.chat_create_group_title, _createchatGroup),
          SizedBox(
            height: 56,
            child: SwitchListTile(
              activeColor: Colors.white,
              title: Text(
                K.chat_reset_top,
                style: TextStyle(fontSize: 17, color: R.colors.mainTextColor),
              ),
              contentPadding:
                  const EdgeInsetsDirectional.only(start: 16, end: 6),
              value: _isTop,
              onChanged: _onSetTopChange,
            ),
          ),
          ChatSettingItem(K.chat_report, _report),
          if (_isKAUser)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    K.setting_chat_background(['$canUserNum', '$totalNum']),
                    style: TextStyle(
                        fontSize: 17.0, color: R.colors.mainTextColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                  alignment: AlignmentDirectional.centerStart,
                  child: backGroundWidget(context),
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget backGroundWidget(BuildContext context) {
    // 本地添加一个本地上传对象
    ChatBgImage localUploadImg =
        ChatBgImage(id: -0, status: 3, isUse: 1, url: '');
    if (totalNum > canUserNum) {
      if (!photos.contains(localUploadImg)) {
        photos.add(localUploadImg);
      }
    } else {
      // 上传够数了，就不展示上传按钮
      photos.remove(localUploadImg);
    }
    return Wrap(
        runSpacing: 7.5,
        spacing: 8,
        alignment: WrapAlignment.start,
        children: photos.map((ChatBgImage photo) {
          if (photo.id > 0) {
            return SizedBox(
              width: 80,
              height: 80,
              child: _renderIconUpload(photo),
            );
          }
          return SizedBox(
            width: 80,
            height: 80,
            child: _renderUpload(photo: photo),
          );
        }).toList());
  }

  Widget _renderIconUpload(ChatBgImage photo) {
    return ImageUpload(
      source: ImageSource.gallery,
      uploadUrl: '${System.domain}upload/image/',
      postFields: const {
        'hook': 'editChatBgImg',
      },
      minSize: Util.getUserUploadImageMinSize(),
      cropAspectRatio: 3.0 / 4.0,
      onTapFilter: (state) {
        state.showDefaultActionSheet(
            showExchange: false,
            showSelect: (photo.isUse == 1 || photo.status == 0) ? false : true,
            showDelete: photo.id == 4000000000 ? false : true);
      },
      onDelete: (state) async {
        SetBgImgResNormal rsp =
            await ChatRepo.setChatBgImg(widget.uid, photo.id, 1); // 1删除图片
        if (rsp.success) _loadData();
      },
      onSelect: (state) async {
        SetBgImgResNormal rsp =
            await ChatRepo.setChatBgImg(widget.uid, photo.id, 0); // 0设置图片
        if (rsp.success) _loadData();
      },
      child: Container(
          alignment: AlignmentDirectional.center,
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              color: darkMode && photo.id == 4000000000
                  ? const Color(0xFF060721)
                  : const Color(0xFFF4F3FF), // photo?.id == 4000000000 为默认图
              border: darkMode && photo.id == 4000000000
                  ? Border.all(color: const Color(0x29FFFFFF), width: 0.5)
                  : null),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: "${System.imageDomain}${photo.url}",
                  suffix: '!head150',
                  fit: BoxFit.cover,
                  fadeOutDuration: const Duration(microseconds: 0),
                  fadeInDuration: const Duration(microseconds: 0),
                  width: 80,
                  height: 80,
                ),
                PositionedDirectional(
                    top: 3,
                    start: 3,
                    child: Container(
                      height: 18,
                      width: photo.status == 2 ? 60 : 42,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: tipsColor(photo),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: Text(userText(photo),
                          style: TextStyle(
                              color: photo.isUse == 1
                                  ? Colors.white
                                  : const Color(0xFF000000),
                              fontFamily: Util.fontFamily,
                              fontSize: 10,
                              height: 1.1,
                              fontWeight: FontWeight.w600)),
                    )),
              ],
            ),
          )),
    );
  }

  Widget _renderUpload({ChatBgImage? photo}) {
    return ImageUpload(
      // key: _imageUploadKey,
      source: ImageSource.gallery,
      uploadUrl: '${System.domain}upload/image/',
      postFields: const {
        'hook': 'editChatBgImg',
      },
      minSize: Util.getUserUploadImageMinSize(),
      cropAspectRatio: 3.0 / 4.0,
      onComplete: (String name, int width, int height, Map origin) {
        _loadData();
        return true;
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: darkMode ? const Color(0x0AFFFFFF) : const Color(0x0A000000),
        ),
        child: Rext.autoStyleImg('chat_add_image.webp',
            width: 28, height: 28, package: ComponentManager.MANAGER_CHAT),
      ),
    );
  }

  String userText(ChatBgImage photo) {
    switch (photo.status) {
      case 0:
        return K.recruit_wait_system_agree;
      case 1:
        return photo.isUse == 1
            ? K.chat_bg_in_use
            : photo.id == 4000000000
                ? K.chat_default
                : '';
      case 2:
        return K.recruit_system_reject;
      default:
        return K.chat_default;
    }
  }

  Color tipsColor(ChatBgImage photo) {
    if (photo.status == 1) {
      if (photo.isUse == 1) {
        return const Color(0xFF926AFF);
      }
      if (photo.id == 4000000000) {
        return const Color(0xE6FFFFFF);
      }
      return Colors.transparent;
    } else {
      return const Color(0xE6FFFFFF);
    }
  }

  Widget _renderBasic() {
    return SizedBox(
        height: 26,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                (_mark_name != null && _mark_name!.isNotEmpty)
                    ? _mark_name!
                    : (widget.nickName ?? ''),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16.0,
                  color: R.colors.mainTextColor,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 4, end: 4, top: 1.5),
                child: UserSexAndAgeWidget(
                    sex: _sex, age: _age, width: 31, height: 14))
          ],
        ));
  }

  _userTap() {
    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, widget.uid,
        refer: const PageRefer('ChatSettingScreen'));
  }

  _markName() async {
    int index = FormScreen.config(
      title: R.string('please_input_remark_name'),
      tip: (_nick_name != null && _nick_name!.isNotEmpty)
          ? K.chat_nick_name + _nick_name!
          : '',
      value: _mark_name ?? '',
      allowEmpty: true,
      keyboardType: TextInputType.text,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    if (value != null && mounted) {
      try {
        await Xhr.postJson(
          '${System.domain}account/mark',
          {
            'target': widget.uid.toString(),
            'name': value,
          },
          throwOnError: true,
        );
        if (mounted) {
          CachedNames.instance().remove(widget.uid);
          Toast.showCenter(context, R.string('remark_name_set_success'));
          setState(() {
            _mark_name = value;
          });
        }
      } catch (e) {
        if (mounted) Toast.showCenter(context, e.toString());
      }
    }
  }

  _createchatGroup() async {
    IGroupManager groupManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GROUP);
    List<int>? uids = await groupManager.openSelectUserScreen(context,
        title: R.string('create_group'), selectedUis: [widget.uid]);
    if (!Util.isCollectionEmpty(uids)) {
      _submitCreateChatGroup(0, uids!);
    }
  }

  _submitCreateChatGroup(int groupId, List<int> uidList) async {
    try {
      String url = "${System.domain}go/yy/group/create";
      if (groupId > 0) {
        url = "${System.domain}go/yy/group/add";
      }
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'groupId': groupId.toString(),
            'uids': uidList.join(','),
            'version': '12',
          },
          formatJson: true,
          throwOnError: true);
      if (response.error == null) {
        Map res = response.value();
        if (res['success'] == true) {
          try {
            int needVerify = Util.parseInt(res['data']['need_verify'], 0);
            int needVerifyNew =
                Util.parseInt(res['data']['need_verify_new'], 0);
            if (groupId == 0 &&
                (Utility.isNeedVerify(needVerify, needVerifyNew))) {
              ILoginManager loginManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_LOGIN);
              loginManager.openAuthDialog(context,
                  type: needVerify,
                  newType: needVerifyNew,
                  refer: 'create_group');
              return;
            }
            Navigator.of(context).pop();
            Fluttertoast.showToast(
                msg: R.string('add_success'), gravity: ToastGravity.CENTER);
          } catch (e, s) {
            Log.e(e, stackTrace: s);
          }
        } else {
          Fluttertoast.showToast(msg: res['msg']);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }
  }

  _onSetTopChange(bool value) async {
    setState(() {
      _isTop = value;
    });
    await Im.setConversationToTop(widget.type, '${widget.uid}', value);
  }

  _report() {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    if (Util.validList(widget.msgList)) {
      manager.openReportScreen(context,
          uid: widget.uid,
          reportType: ReportType.PrivateChat,
          msgList: widget.msgList);
    } else {
      manager.openReportScreen(context,
          uid: widget.uid, reportType: ReportType.User);
    }
  }
}

class ChatSettingItem extends StatelessWidget {
  final VoidCallback onClicked;
  final String title;

  const ChatSettingItem(this.title, this.onClicked, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        height: 56,
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 17.0, color: R.colors.mainTextColor),
            ),
            Expanded(
              child: Container(),
            ),
            R.img(Assets.chat$ic_next_svg,
                color: R.colors.secondTextColor,
                width: 16,
                package: ComponentManager.MANAGER_CHAT)
          ],
        ),
      ),
    );
  }
}
