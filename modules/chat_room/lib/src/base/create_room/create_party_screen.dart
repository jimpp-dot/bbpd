import 'dart:collection';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/src/base/model/create_party_beans.dart';
import 'package:chat_room/src/base/repo/room_create_repo.dart';
import 'package:chat_room/src/base/widget/create_room_tips_dialog.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

/// 发起派对
class CreatePartyScreen extends StatefulWidget {
  final String? partyType;

  final String? refer;

  /// 是否在当前页面打开房间
  final bool openRoomScreen;

  const CreatePartyScreen(
      {Key? key, this.partyType, this.refer, this.openRoomScreen = true})
      : super(key: key);

  @override
  State<CreatePartyScreen> createState() => _CreatePartyScreenState();
}

class _CreatePartyScreenState extends BaseScreenState<CreatePartyScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  CreatePartyInfo? _createPartyInfo;
  Set<int> _selectedUids = HashSet();
  int _privateAttr = 0;
  bool _notify = true;
  String _selectedRoomType = '';
  String _partyName = '';
  final GlobalKey<_EditableTitleWidgetState> _titleKey =
      GlobalKey<_EditableTitleWidgetState>();

  List<String> _data = []; //热门标题，从服务器获取

  /// 房间类型
  static const SETTING_ROOM_TYPE = 0;

  /// 公开，私密，仅好友可见
  static const SETTING_PRIVATE_ATTR = 1;

  /// 通知粉丝
  static const SETTING_NOTIFY = 2;

  final int _selectCid = 0;

  final ValueNotifier<bool> _switchController = ValueNotifier<bool>(false);
  final IGiftManager _giftManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

  /// 是否打开了进房门票开关，默认为false
  bool _isOpenEnterRoomSwitch = false;
  int _giftId = 0;

  @override
  void initState() {
    super.initState();
    _loadData();

    _switchController.addListener(() async {
      refresh(() {
        _isOpenEnterRoomSwitch = _switchController.value;
      });
      Tracker.instance.track(TrackEvent.click, properties: {
        'click_page': 'click_roomtickets_setup',
        'on': _switchController.value ? 1 : 0
      });
    });
  }

  @override
  void dispose() {
    _switchController.dispose();
    super.dispose();
  }

  Future<bool?> _showLicenseDialog() async {
    bool? createLicenseAgreed =
        'true' == Config.get('createLicenseAgreed', 'false');
    if (!createLicenseAgreed) {
      String url = Util.licenseUrl(LicenseType.CREATE_FLEET);
      createLicenseAgreed = await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return LicenseDialog(title: K.room_create_room_protocl, url: url);
          });

      if (createLicenseAgreed != null && createLicenseAgreed) {
        Config.set('createLicenseAgreed', 'true');
        return true;
      } else {
        if (Navigator.of(context).canPop()) Navigator.of(context).pop();
        return false;
      }
    }
    return true;
  }

  Future<bool?> _checkVerify() async {
    if (Utility.isNeedVerify(0, _createPartyInfo?.needVerify)) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool? suc = await loginManager.openAuthDialog(context,
          type: 0,
          newType: _createPartyInfo?.needVerify ?? 0,
          refer: 'start_party_screen');
      if (suc == true) {
        _createPartyInfo?.needVerify = 0;
        return _showLicenseDialog();
      } else {
        Navigator.of(context).pop();
        return false;
      }
    } else {
      return _showLicenseDialog();
    }
  }

  void _loadData() async {
    DataRsp<CreatePartyInfo> resp =
        await PartyCreateRepo.getCreatePartyInfo(widget.partyType.toString());
    if (resp.success == true) {
      _createPartyInfo = resp.data;

      if (Util.isCollectionEmpty(_createPartyInfo?.friends)) {
        _createPartyInfo?.friends = [];
      }

      if (_createPartyInfo!.friends.length < 4) {
        ILoginManager loginManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_LOGIN);
        List<IThirdPlatform> platforms = loginManager.getThirdPlatforms();
        for (var element in platforms) {
          if (element.supportShare()) {
            _createPartyInfo!.friends.add(FriendItem.type(element.tag()));
          }
        }
      }

      for (var item in _createPartyInfo!.friends) {
        if (item.online == true) {
          _selectedUids.add(item.uid);
        }
      }

      /// 更多
      if (_createPartyInfo!.friendNext) {
        _createPartyInfo!.friends.add(FriendItem.type(FriendItem.TYPE_MORE));
      }

      _selectedRoomType = _createPartyInfo!.roomList[0].roomType;
      _privateAttr = _createPartyInfo!.privateLevels[0].level;
      _partyName = _createPartyInfo!.partyName;
      _notify = (_createPartyInfo!.closeNotify != 1);
      setScreenReady();
      _loadNames();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  void _loadNames() async {
    _data = await PartyCreateRepo.getPartyRecommendNames(_selectedRoomType);
    if (!Util.isCollectionEmpty(_data)) {
      _partyName = _data[Random().nextInt(_data.length)];
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(16), topEnd: Radius.circular(16)),
      ),
      child: GestureDetector(
        onTap: () => _titleKey.currentState?.unfocus(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PositionedDirectional(
              top: 30,
              start: 20,
              child: R.img(
                'create_step2.svg',
                width: 133,
                height: 117,
                color: R.color.secondBgColor,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(
                  top: 40, bottom: Util.iphoneXBottom + 25, start: 20, end: 20),
              child: buildStatusContent(),
            ),
            PositionedDirectional(
              top: 0,
              start: 0,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: kToolbarHeight,
                  height: kToolbarHeight,
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: R.img(
                      'ic_titlebar_back.svg',
                      package: ComponentManager.MANAGER_BASE_CORE,
                      width: 24,
                      height: 24,
                      color: R.color.mainTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 44),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _createPartyInfo?.partyName ?? '',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: R.color.mainTextColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  K.room_invite_friend_title,
                  style:
                      TextStyle(fontSize: 14.0, color: R.color.mainTextColor),
                ),
                const SizedBox(height: 24),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    K.room_create_v_title,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: R.color.secondTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 12),
                _EditableTitleWidget(
                  key: _titleKey,
                  candidates: _data,
                  title: _partyName,
                  onChanged: (String title) => _partyName = title,
                ),

                ///不是斗地主才展示
                if (widget.partyType != 'landlord')
                  _InviteWidget(
                      partyInfo: _createPartyInfo!,
                      onSelection: (Set<int> uids) => _selectedUids = uids),
                if (Util.parseBool(_createPartyInfo?.ticketSetting) &&
                    widget.partyType != 'landlord')
                  _buildSettingEnterRoomTicket(),
              ],
            ),
          ),
        ),

        ///不是斗地主才展示
        if (widget.partyType != 'landlord') _buildSetting(),
        _buildStartParty(),
      ],
    );
  }

  @override
  onTapErrorWidget() {
    _loadData();
  }

  Widget _buildSetting() {
    return Row(
      children: [
        Expanded(
          child: _getSettingItem(SETTING_ROOM_TYPE),
        ),
        const SizedBox(width: 8),
        Expanded(child: _getSettingItem(SETTING_PRIVATE_ATTR)),
        const SizedBox(width: 8),
        Expanded(child: _getSettingItem(SETTING_NOTIFY)),
      ],
    );
  }

  Widget _getSettingItem(int type) {
    Widget child = const SizedBox.shrink();
    if (type == SETTING_ROOM_TYPE) {
      Color textColor = R.color.mainTextColor;
      if (_createPartyInfo?.roomList.length == 1) {
        textColor = R.color.mainTextColor;
      }

      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 5),
          LimitedBox(
            maxWidth: 90,
            child: Text(
              _createPartyInfo!.roomList
                  .firstWhere(
                      (element) => element.roomType == _selectedRoomType)
                  .show,
              style: TextStyle(color: textColor, fontSize: 13),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (_createPartyInfo!.roomList.length > 1)
            R.img('icon_next.svg',
                matchTextDirection: true,
                width: 16,
                height: 16,
                color: R.color.mainTextColor,
                package: ComponentManager.MANAGER_BASE_CORE),
          const SizedBox(width: 5),
        ],
      );
    } else if (type == SETTING_PRIVATE_ATTR) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 5),
          LimitedBox(
            maxWidth: 90,
            child: Text(
              _createPartyInfo!.privateLevels
                  .firstWhere((element) => element.level == _privateAttr)
                  .display,
              style: TextStyle(color: R.color.mainTextColor, fontSize: 13),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          R.img('icon_next.svg',
              matchTextDirection: true,
              width: 16,
              height: 16,
              color: R.color.secondTextColor,
              package: ComponentManager.MANAGER_BASE_CORE),
          const SizedBox(width: 5)
        ],
      );
    } else if (type == SETTING_NOTIFY) {
      Widget notifyCheckBox = _notify
          ? CheckBoxChecked(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
            )
          : CheckBoxUnchecked(
              color: R.color.mainTextColor,
            );
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 5),
          notifyCheckBox,
          const SizedBox(
            width: 8,
          ),
          LimitedBox(
            maxWidth: 80,
            child: Text(
              K.room_notify_fans,
              style: TextStyle(color: R.color.mainTextColor, fontSize: 13),
              maxLines: 1,
            ),
          )
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        if (type == SETTING_ROOM_TYPE &&
            _createPartyInfo!.roomList.length > 1) {
          _showRoomTypeSheet();
        } else if (type == SETTING_PRIVATE_ATTR) {
          _showAttributeSheet();
        } else if (type == SETTING_NOTIFY) {
          _notify = !_notify;
          setState(() {});
        }
      },
      child: Container(
        height: 32,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: R.color.dividerColor,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: child,
      ),
    );
  }

  void _showAttributeSheet() async {
    List<PrivateLevel> attrs = _createPartyInfo?.privateLevels ?? [];
    List<SheetItem> res = [];
    for (int i = 0; i < attrs.length; i++) {
      res.add(SheetItem(attrs[i].display, attrs[i].level.toString()));
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    String key = result.value?.key ?? '';
    _privateAttr = Util.parseInt(key);
    setState(() {});
  }

  _showRoomTypeSheet() async {
    List<RoomType> roomList = _createPartyInfo?.roomList ?? [];
    List<SheetItem> res = [];
    for (int i = 0; i < roomList.length; i++) {
      res.add(SheetItem(roomList[i].show, roomList[i].roomType));
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    String key = result.value?.key ?? '';

    /// 狼人需要特殊处理
    if (widget.partyType == 'wolf_all') {
      RoomType roomType = _createPartyInfo!.roomList
          .firstWhere((element) => element.roomType == key);
      if (roomType.lock) {
        await _handWolfLock(roomType);
        return;
      }
    }

    _selectedRoomType = key;
    _loadNames();
    setState(() {});
  }

  Future _handWolfLock(RoomType roomType) async {
    bool? result = await showDialog(
      context: context,
      builder: (context) {
        return ConfirmDialog(
          title: K.room_answer_or_leve5_lock,
          negativeButton: NegativeButton(
            text: K.cancel,
          ),
          positiveButton: PositiveButton(
            text: K.room_go_answer,
          ),
        );
      },
    );
    if (result == true) {
      int mode = _getTestMode(roomType.roomType);
      Navigator.of(context).pop();
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.showWolfTestScreen(context, mode: mode);
    }
  }

  int _getTestMode(String type) {
    switch (type) {
      case IWereWolfManager.WOLF9:
      case IWereWolfManager.NEWWOLF9:
        return 1;
      case IWereWolfManager.WOLF12:
        return 3;
    }
    return 1;
  }

  Widget _buildStartParty() {
    return GestureDetector(
      onTap: onTapStartParty,
      child: Container(
        height: 56,
        width: Util.width,
        alignment: AlignmentDirectional.center,
        margin: const EdgeInsetsDirectional.only(top: 12),
        decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            gradient: LinearGradient(colors: R.color.mainBrandGradientColors)),
        child: Text(
          K.room_start_party,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void onTapStartParty() async {
    IPremadeManager premadeManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PREMADE);
    bool intercept = await premadeManager.checkMatchAndIntercept();
    if (intercept) return;

    /// 建房是否有限制，有限制就弹窗提示
    if (!Util.isStringEmpty(_createPartyInfo?.toast)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CreateTipsDialog(
            content: _createPartyInfo!.toast,
            btnText: K.room_btn_confirm,
          );
        },
      );
      return;
    }

    bool? success = await _checkVerify();
    if (success == true) {
      if (_createPartyInfo?.roomInfo != null) {
        await _modifyRoom();
      } else {
        await _newRoom();
      }
    }
  }

  Future _modifyRoom() async {
    if (Util.isStringEmpty(_partyName)) {
      Fluttertoast.showToast(
          msg: K.room_input_party_name, gravity: ToastGravity.CENTER);
      return;
    }

    bool? result = await PartyCreateRepo.modifyRoom(
      _selectedRoomType,
      _partyName,
      _privateAttr,
      _notify,
      _createPartyInfo!.roomInfo!,
      _selectedUids,
      cid: _selectCid,
      giftId: (_isOpenEnterRoomSwitch ? _giftId : 0),
    );
    if (result == true) {
      _handleSuccess(_createPartyInfo!.roomInfo!.rid);
    }
  }

  Future _newRoom() async {
    if (Util.isStringEmpty(_partyName)) {
      Fluttertoast.showToast(
          msg: K.room_input_party_name, gravity: ToastGravity.CENTER);
      return;
    }
    int rid = await PartyCreateRepo.newRoom(
      _selectedRoomType,
      _partyName,
      _privateAttr,
      _notify,
      _selectedUids,
      cid: _selectCid,
      giftId: (_isOpenEnterRoomSwitch ? _giftId : 0),
    );
    if (rid > 0) {
      _handleSuccess(rid);
    }
  }

  void _handleSuccess(int rid) {
    Tracker.instance.track(TrackEvent.start_party, properties: {
      'party_type': widget.partyType,
      'room_type': _selectedRoomType,
      'invited_num': _selectedUids.length,
      'is_Informfans': _notify,
      'visible_range': _privateAttr
    });

    Navigator.pop(context, rid);

    if (widget.openRoomScreen) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.setFirstRid(rid);
      roomManager.openChatRoomScreenShow(context, rid,
          autoJoin: 1, matchRid: rid, refer: 'start_party_screen');
    }
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  /// 设置进房门票
  Widget _buildSettingEnterRoomTicket() {
    return Column(
      children: [
        Divider(color: Colors.white.withOpacity(0.1), height: 1),
        if (!_isOpenEnterRoomSwitch)
          SizedBox(
            height: 72,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        K.room_set_enter_room_titck_title,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        K.room_set_enter_room_titck_desc,
                        style: TextStyle(
                            color: R.color.mainTextColor.withOpacity(0.4),
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Session.titleNew >= 60
                    ? _buildAdvancedSwitchWidget()
                    : Stack(
                        children: [
                          IgnorePointer(
                            child: _buildAdvancedSwitchWidget(),
                          ),
                          GestureDetector(
                            onTap: () {
                              Fluttertoast.showCenter(
                                  msg: K.room_set_enter_room_titck_switch_tip);
                            },
                            child: Container(
                              width: 46,
                              height: 28,
                              color: Colors.transparent,
                            ),
                          )
                        ],
                      ),
              ],
            ),
          )
        else ...[
          const SizedBox(height: 10),
          SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  K.room_set_enter_room_titck_title,
                  style: TextStyle(
                      color: R.color.unionRankText1,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Session.titleNew >= 60
                    ? _buildAdvancedSwitchWidget()
                    : Stack(
                        children: [
                          IgnorePointer(
                            child: _buildAdvancedSwitchWidget(),
                          ),
                          GestureDetector(
                            onTap: () {
                              Fluttertoast.showCenter(
                                  msg: K.room_set_enter_room_titck_switch_tip);
                            },
                            child: Container(
                              width: 46,
                              height: 28,
                              color: Colors.transparent,
                            ),
                          )
                        ],
                      ),
              ],
            ),
          )
        ],
        _giftManager.getEnterRoomTicketGiftWidget(context,
            open: _isOpenEnterRoomSwitch, onGiftItemTap: (int giftId) {
          _giftId = giftId;
        }),
      ],
    );
  }

  Widget _buildAdvancedSwitchWidget() {
    return AdvancedSwitch(
      activeColor: R.color.mainBrandColor,
      inactiveColor: Colors.grey.withOpacity(0.2),
      thumb: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
        ),
      ),
      width: 46,
      height: 28,
      controller: _switchController,
    );
  }
}

class _EditableTitleWidget extends StatefulWidget {
  final List<String> candidates;
  final String title;
  final Function(String title) onChanged;

  const _EditableTitleWidget(
      {Key? key,
      required this.candidates,
      required this.title,
      required this.onChanged})
      : super(key: key);

  @override
  _EditableTitleWidgetState createState() => _EditableTitleWidgetState();
}

class _EditableTitleWidgetState extends State<_EditableTitleWidget> {
  String _partyName = '';
  bool _isEdit = false;
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    _partyName = widget.title;
    _textEditingController.text = widget.title;
  }

  void unfocus() {
    _focusNode.unfocus();
    _onSubmitted(_textEditingController.text);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_EditableTitleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _partyName = widget.title;
    _textEditingController.text = widget.title;
  }

  Widget _buildTitleText() {
    double textWidth = Util.width - 36 * 2;
    List data = widget.candidates;

    return GestureDetector(
      onTap: () async {
        _isEdit = true;
        setState(() {});
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              constraints: BoxConstraints(maxWidth: textWidth),
              child: Text(
                _partyName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (Util.isCollectionEmpty(data)) {
                Fluttertoast.showToast(
                    msg: K.room_random_title_empty,
                    gravity: ToastGravity.CENTER);
                return;
              }
              String label = data[Random().nextInt(data.length)];
              setState(() {
                _partyName = label;
              });
              _setInputText(label);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img("room_ic_refresh_small.svg",
                    width: 16,
                    height: 16,
                    color: R.color.secondTextColor,
                    package: ComponentManager.MANAGER_BASE_ROOM),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameInputText() {
    List data = widget.candidates;
    TextStyle textStyle = TextStyle(
        color: R.color.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w500);
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                cursorColor: R.color.mainBrandColor,
                controller: _textEditingController,
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                scrollPadding: EdgeInsets.zero,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  hintText: K.room_input_room_name,
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(color: R.color.thirdTextColor, fontSize: 15),
                  counterText: '',
                ),
                style: textStyle,
                autofocus: true,
                autocorrect: false,
                onChanged: (String text) {},
                onSubmitted: (text) {
                  _onSubmitted(text);
                },
              )
            ],
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (Util.isCollectionEmpty(data)) {
              Fluttertoast.showToast(
                  msg: K.room_random_title_empty, gravity: ToastGravity.CENTER);
              return;
            }
            String label = data[Random().nextInt(data.length)];
            _setInputText(label);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img("room_ic_refresh_small.svg",
                  width: 16,
                  height: 16,
                  color: R.color.secondTextColor,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ],
          ),
        )
      ],
    );
  }

  void _setInputText(String label) {
    _textEditingController.text = label;
    _textEditingController.selection = TextSelection.fromPosition(
      TextPosition(affinity: TextAffinity.downstream, offset: label.length),
    );
  }

  void _onSubmitted(String text) {
    _partyName = text;
    _isEdit = false;
    widget.onChanged(text);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      decoration: BoxDecoration(
          color: R.color.secondBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: _isEdit ? _buildNameInputText() : _buildTitleText(),
    );
  }
}

/// 邀请朋友
class _InviteWidget extends StatefulWidget {
  final CreatePartyInfo partyInfo;
  final Function(Set<int> uids) onSelection;

  const _InviteWidget(
      {Key? key, required this.partyInfo, required this.onSelection})
      : super(key: key);

  @override
  _InviteWidgetState createState() => _InviteWidgetState();
}

class _InviteWidgetState extends State<_InviteWidget> {
  final Set<int> _selectedUids = HashSet();
  bool _selectAll = false;

  @override
  void initState() {
    super.initState();
    _selectAll = (widget.partyInfo.closeNotify != 1);
    //默认全选邀请朋友
    _onTapSelectAll();
  }

  void _onTapSelectAll() {
    if (_selectAll) {
      _selectedUids.clear();
      CreatePartyInfo partyInfo = widget.partyInfo;
      for (var element in partyInfo.friends) {
        if (element.type == FriendItem.TYPE_USER) {
          _selectedUids.add(element.uid);
        }
      }
    } else {
      _selectedUids.clear();
    }
    widget.onSelection(_selectedUids);

    setState(() {});
  }

  Widget _buildItem(FriendItem item) {
    if (item.type == FriendItem.TYPE_MORE) {
      return _buildMore();
    } else if (item.type == FriendItem.TYPE_USER) {
      return _buildUserItem(item);
    } else {
      return _buildSharePlatform(item.type);
    }
  }

  Widget _buildUserItem(FriendItem item) {
    return GestureDetector(
      onTap: () {
        if (_selectedUids.contains(item.uid)) {
          _selectedUids.remove(item.uid);
        } else {
          _selectedUids.add(item.uid);
        }
        widget.onSelection(_selectedUids);
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(end: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                CommonAvatar(
                  path: item.icon,
                  size: 60,
                  shape: BoxShape.circle,
                ),
                if (_selectedUids.contains(item.uid))
                  PositionedDirectional(
                    bottom: 0,
                    end: 2,
                    child: CheckBoxChecked(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors),
                      ),
                      width: 20,
                      height: 20,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 6),
            Container(
              constraints: const BoxConstraints(maxWidth: 60),
              child: Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 14),
              ),
            ),
            Text(
              item.online
                  ? K.room_online_now
                  : Utility.getDateDiff(item.onlineDateTime),
              style: TextStyle(color: R.color.thirdTextColor, fontSize: 11),
            )
          ],
        ),
      ),
    );
  }

  Container _buildMore() {
    return Container(
      padding: const EdgeInsetsDirectional.only(end: 20),
      child: GestureDetector(
        onTap: () {
          IRoomManager roomManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.inviteMoreFriendsScreen(
            context,
            onFinish: (List<int> uidList) {
              _selectedUids.clear();
              _selectedUids.addAll(uidList);
              setState(() {});
            },
            uids: _selectedUids.toList(),
          );
        },
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: R.color.secondBgColor),
              alignment: AlignmentDirectional.center,
              child: R.img(
                'icon_next_center.svg',
                matchTextDirection: true,
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_BASE_CORE,
                color: R.color.mainTextColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              K.room_more,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: R.color.mainTextColor, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSharePlatform(String tag) {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    List<IThirdPlatform> platforms = loginManager.getThirdPlatforms();
    IThirdPlatform? platform =
        platforms.firstWhereOrNull((element) => element.tag() == tag);
    if (platform != null) {
      return Container(
        padding: const EdgeInsetsDirectional.only(end: 20),
        child: GestureDetector(
          onTap: () {
            ISettingManager settingManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_SETTINGS);
            settingManager.shareDirect(context, Session.uid, tag);
          },
          child: Column(
            children: [
              platform.getIcon(
                width: 60.0,
                height: 60.0,
              ),
              const SizedBox(height: 6),
              Text(
                platform.getName(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 14),
              )
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    CreatePartyInfo partyInfo = widget.partyInfo;

    List<FriendItem> friends = [];
    friends.addAll(partyInfo.friends);
    friends.removeWhere((element) => element.type != FriendItem.TYPE_USER);

    if (!(friends.isNotEmpty && friends.last.type == FriendItem.TYPE_MORE)) {
      FriendItem more = FriendItem.fromJson({'type': 'more'});
      friends.add(more);
    }

    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            Text(
              K.room_invite_friend_tips,
              style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 6),
            Text("(${_selectedUids.length})",
                style: TextStyle(
                    color: R.color.secondTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            const Spacer(),
            GestureDetector(
              onTap: () {
                _selectAll = !_selectAll;
                _onTapSelectAll();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _selectAll
                      ? CheckBoxChecked(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: R.color.mainBrandGradientColors),
                          ),
                        )
                      : CheckBoxUnchecked(
                          color: R.color.mainTextColor.withOpacity(0.2)),
                  const SizedBox(width: 4),
                  Text(
                    K.room_select_all,
                    style:
                        TextStyle(color: R.color.secondTextColor, fontSize: 13),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _buildItem(friends[index]);
            },
            itemCount: friends.length,
          ),
        ),
      ],
    );
  }
}
