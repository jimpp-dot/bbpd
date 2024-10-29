import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/tags.dart';
import 'package:chat_room/src/protobuf/generated/room_info.pb.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared/shared.dart';

import '../../under/model/underData.dart';

/// 修改派对
class RoomModifyScreen extends StatefulWidget {
  /// 21: 你说我猜优化
  /// 22: 明星空降大厅
  /// 23: 个人房支持连连看
  /// 25: 嫌疑人
  /// 26: 放开鉴定师和听歌房
  /// 27: 斗地主
  /// 28: 皮队友4麦房
  /// 29: 4麦房
  /// 30: 抢麦房
  /// 31: 连连看V2
  /// 32: 特殊麦位
  /// 33: 可切换房间列表，修改类型接口
  /// 34： 大哥房类型（my_house_room）
  /// 35： laya游戏（狼人杀 飞刀 炸弹猫 撞球）
  static const INFO_VERSION = 35;
  final int rid;
  final bool showRoomAfterModify; // 如果为true，则是创建房间，如果为false，则是从房间里面修改资料

  const RoomModifyScreen({super.key, required this.rid, this.showRoomAfterModify = false});

  @override
  _State createState() => _State();
}

class _State extends State<RoomModifyScreen> {
  String _prefix = '';
  String _name = 'YiYi';
  String _subtitle = '';
  String _description = K.room_what_the_hell;
  String? _greet;
  String _type = Tags.data.first.key;
  String _password = '';
  String _icon = '';
  String _coverIcon = '';
  String _reception = '0';
  String _paier = '0';
  String _property = 'private';
  bool _requestPassword = false;
  bool _closeBox = false;
  bool _loading = true;
  bool _showHideInRoomSet = false;
  bool _isSetHideInRoom = false;
  bool _showRoomIcon = false;
  bool _enableAuction = false;
  bool _showAuction = false;
  bool _showNewUserLimit = false; // 是否开启新用户限制
  bool _newUserLimit = false;
  bool _showPublishDeal = false; //是否显示狼人杀明牌场/暗牌场类型修改
  bool _isPublishDeal = false; //当前是否是明牌场
  bool _showSubType = false; //是否显示房间玩法
  String _subType = ''; //当前房间玩法
  List<RoomInfoSubType> _subTypes = []; //可选的房间玩法
  bool _mystery = true; //非诚勿扰神秘人模式
  bool _wishGiftOpen = true; //心愿礼物是否打开
  bool _esportMateSwitch = false; //电竞队友入口功能是否具备
  bool _esportMateShow = false; //电竞队友入口是否开放
  bool _ktvPkMode = false; // ktv房间是否打开PK模式
  int _nestEnable = -1; // 私密房玩法开关：-1 该房间不支持私密房玩法，0 未打开玩法，1 已打开玩法
  int _defendValue = 0;
  bool _roomNameInAudit = false; // 房间名称是否正在审核中
  bool _roomDescriptionInAudit = false; // 房间公告是否正在审核中

  List<RoomInfoMicNumOption> _micNum = []; // 麦位数量
  RoomInfoSpecialMicConfig? _specialMicConfig; // 特殊麦位

  final List<SheetItem> _tags = [];
  final GlobalKey<ImageUploadState> _imageUploadKey = GlobalKey();
  final GlobalKey<ImageUploadState> _imageUploadKey2 = GlobalKey();
  String? _lastSubType;

  @override
  initState() {
    super.initState();
    _load();
  }

  _load() async {
    ResRoomInfo rsp = await RoomRepository.getRoomInfo(widget.rid);
    if (!mounted) return;

    if (rsp.success) {
      setState(() {
        _loading = false;
        _property = rsp.data.property;
        _prefix = rsp.data.prefix;
        _name = rsp.data.name;
        _description = rsp.data.description;
        _greet = rsp.data.welcomeJoinWords;
        _type = rsp.data.type;

        _password = rsp.data.password;
        _icon = rsp.data.icon;
        _coverIcon = rsp.data.coverIcon;
        _showRoomIcon = rsp.data.iconEditable;
        _requestPassword = _password.isNotEmpty;
        _closeBox = rsp.data.closeBox > 0;
        _enableAuction = rsp.data.auction > 0;
        _showAuction = rsp.data.isAuction > 0;
        _showNewUserLimit = rsp.data.showNew > 0;
        _newUserLimit = rsp.data.onlyNew > 0;

        _reception = rsp.data.reception.toString();
        _paier = rsp.data.paier.toString();

        _showPublishDeal = rsp.data.displayOpenCard;
        _isPublishDeal = rsp.data.isOpenCard > 0;
        _wishGiftOpen = rsp.data.giftWish > 0;
        _esportMateSwitch = rsp.data.esportMateSwitch;
        _esportMateShow = rsp.data.esportMateShow;
        _ktvPkMode = rsp.data.ktvPkMode > 0;

        _micNum = rsp.data.micNumOption;

        _tags.clear();
        List<RoomInfoRoomType> tags = rsp.data.types;
        for (RoomInfoRoomType val in tags) {
          _tags.add(SheetItem(val.label, val.val, Util.parseColor(val.color)));
        }

        if (rsp.data.hasHidden()) {
          _showHideInRoomSet = rsp.data.hidden.authed;
          _isSetHideInRoom = rsp.data.hidden.ishidden;
        }

        _showSubType = rsp.data.showSubType;
        _subType = rsp.data.subType;
        _subTypes = rsp.data.subTypeList;
        _lastSubType = _subType; // 保存初始的玩法类型
        _mystery = rsp.data.mystery > 0;
        _nestEnable = rsp.data.nestEnable;
        _defendValue = rsp.data.defenseVal;

        if (rsp.data.hasSpecialMicConfig()) {
          _specialMicConfig = rsp.data.specialMicConfig;
        }

        // 房间名称，0-正常，1-审核中
        _roomNameInAudit = rsp.data.inAudit.roomName == 1;
        // 房间公告，0-正常，1-审核中
        _roomDescriptionInAudit = rsp.data.inAudit.roomDescription == 1;

        _subtitle = rsp.data.subtitle;
      });
    }
  }

  _submit() async {
    if (_name.isEmpty) {
      Fluttertoast.showToast(msg: K.room_named_notice);
      return;
    }
    if (_requestPassword && _password.length != 4) {
      Fluttertoast.showToast(msg: K.room_set_password_notice);
      return;
    }

    Map<String, String> post = {
      'icon': _icon,
      'cover_icon': _coverIcon,
      'type': _type,
      'prefix': _prefix,
      'name': _name,
      'subtitle': _subtitle,
      'description': _description,
      'rid': widget.rid.toString(),
      'password': _password,
      'clientVersion': '${RoomConstant.createClientVersion}',
      'reception': _reception,
      'paier': _paier,
      'close_box': _closeBox ? '1' : '0',
      'auction': _enableAuction ? '1' : '0',
      if (_subType != _lastSubType) 'sub_type': _subType,
      'mystery': _mystery ? '1' : '0',
      'gift_wish': _wishGiftOpen ? '1' : '0',
      'esport_mate_show': (_esportMateSwitch && _esportMateShow) ? '1' : '0',
      'ktv_pk_mode': _ktvPkMode ? '1' : '0',
      'nest_enable': '$_nestEnable',
      'defense_val': '$_defendValue',
    };

    if (_greet != null) {
      post['welcomeJoinWords'] = _greet!.trim();
    }

    if (_showHideInRoomSet == true) {
      post['hide'] = _isSetHideInRoom == true ? '1' : '0';
    }

    if (_showNewUserLimit) {
      post['only_new'] = _newUserLimit == true ? '1' : '0';
    }

    if (_showPublishDeal) {
      post['is_open_card'] = _isPublishDeal == true ? '1' : '0';
    }

    if (_selectMicNum != null) {
      post['room_factory_type'] = _selectMicNum!.roomFactoryType;
    }

    if (_selectMicNum != null) {
      post['room_position_num'] = _selectMicNum!.roomPositionNum.toString();
    }

    if (_showSpecialMic && _selectSpecialMic != null) {
      post['special_mic_type'] = _selectSpecialMic!.type.toString();
    }

    bool result = await RoomRepository.roomCreate(post);
    if (!result || !mounted) return;

    /// 麦位上报
    if (_showSpecialMic && _selectSpecialMic != null) {
      final currentTime = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).toyyyyMMddHHmmss();
      Tracker.instance.track(TrackEvent.cp_maiwei_opetate, properties: {
        'rid': widget.rid,
        'maiwei_status': _selectSpecialMic!.title,
        'maiwei_operate_time': currentTime,
      });
    }

    Navigator.of(context).pop();

    if (widget.showRoomAfterModify) {
      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(System.context, widget.rid, from: RoomFrom.create);
    }
  }

  _changePassword() async {
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room != null &&
        room.config?.game == Games.Under &&
        room.config?.underData?.gameUnderState != GameUnderState.Wait &&
        room.config?.underData?.gameUnderState != GameUnderState.End) {
      Fluttertoast.showToast(msg: K.room_modify_pwd_on_playing, gravity: ToastGravity.CENTER);
      return;
    }

    int index = FormScreen.config(title: K.room_input_pwd, value: _password, allowEmpty: false, keyboardType: TextInputType.number);
    String? value = await FormScreen.openFormScreen(context, index);
    if (mounted) {
      setState(() {
        _password = value ?? '';
      });
    }
  }

  String _getDescription() {
    return _description.replaceAll("\n", "");
  }

  String get subTypeStr {
    return curSubType?.value ?? '';
  }

  RoomInfoSubType? get curSubType {
    if (_subType.isEmpty || _subTypes.isEmpty) return null;
    return _subTypes.firstWhereOrNull((_) => _.key == _subType);
  }

  RoomInfoMicNumOption? get _selectMicNum {
    if (Util.isCollectionEmpty(_micNum)) return null;
    return _micNum.firstWhereOrNull((element) => element.selected);
  }

  RoomInfoSpecialMicType? get _selectSpecialMic {
    if (!_showSpecialMic) return null;
    return _specialMicConfig?.list.firstWhereOrNull((element) => element.type == _specialMicConfig?.selectedType);
  }

  // 是否展现特殊麦位
  bool get _showSpecialMic {
    return _specialMicConfig != null && !Util.isCollectionEmpty(_specialMicConfig?.list);
  }

  _onRoomCategoryTaped() async {
    ChatRoomData? room = ChatRoomData.getInstance();

    if (room?.config?.game == Games.Under &&
        room?.config?.underData?.gameUnderState != GameUnderState.Wait &&
        room?.config?.underData?.gameUnderState != GameUnderState.End) {
      Fluttertoast.showToast(msg: K.room_modify_category_on_playing, gravity: ToastGravity.CENTER);
      return;
    }

    //狼人杀游戏过程不允许修改房间类型
    if (room?.config != null && room?.config?.game == Games.Wolf) {
      IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
      if (wereWolfManager.isGaming()) {
        Fluttertoast.showToast(msg: K.room_modify_category_on_playing, gravity: ToastGravity.CENTER);
        return;
      }
    }

    SheetCallback result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: _tags);
        });
    if (result.reason == SheetCloseReason.Active) {
      return;
    }

    if (!mounted) return;
    setState(() {
      _type = result.value?.key ?? '';
    });
  }

  /// 麦位数量选择
  _onMicNumTaped() async {
    SheetCallback? result = await displayModalBottomSheet<SheetCallback?>(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: _micNum.map((e) => SheetItem(e.label, e.label)).toList());
        });
    if (result == null || SheetCloseReason.Active == result.reason) {
      return;
    }

    if (result.value?.key != null && mounted) {
      for (RoomInfoMicNumOption element in _micNum) {
        if (element.label == result.value?.key) {
          element.selected = true;
        } else {
          element.selected = false;
        }
      }
      setState(() {});
    }
  }

  /// 房间玩法切换
  _onRoomTypeTaped() async {
    List<SheetItem> subTypeItems = _subTypes.map((_) => SheetItem(_.value, _.key)).toList();
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: subTypeItems);
        });
    if (result == null || SheetCloseReason.Active == result.reason) {
      return;
    }
    if (!mounted) return;

    setState(() {
      _subType = result.value?.key ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        leading: const CloseButton(),
        title: Text(K.room_modify_chat_room),
        showShape: false,
      ),
      body: _renderBody(),
      bottomNavigationBar: BottomButton.of(title: K.sure, onTap: _loading ? null : _submit),
    );
  }

  Widget _buildRoomIcon() {
    if (_icon.isEmpty) {
      return R.img(
        'profile_add.png',
        width: 104.0,
        color: R.color.mainTextColor,
        package: ComponentManager.MANAGER_BASE_CORE,
      );
    }

    return CommonAvatar(
      path: _icon,
      size: 104,
      borderRadius: BorderRadius.circular(5),
    );
  }

  Widget _buildRoomIcon2() {
    if (_coverIcon.isEmpty) {
      return const SizedBox();
    }

    return CommonAvatar(
      path: _coverIcon,
      size: 104,
      borderRadius: BorderRadius.circular(5),
    );
  }

  Widget _renderBody() {
    if (_loading) {
      return const Loading();
    }

    SheetItem? tag;
    for (int i = 0; i < _tags.length; i++) {
      if (_tags[i].key == _type) {
        tag = _tags[i];
        break;
      }
    }
    String tagLabel = tag == null ? '' : tag.label;

    final isMarry = _type == 'marry';

    return ListView(
      children: <Widget>[
        Container(height: 18.0),
        if (_showRoomIcon) ...[
          SettingItemWidget(
            title: K.room_icon,
            height: 96,
            trailingWidget: SizedBox(
              width: 64,
              height: 64,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: ImageUpload(
                  key: _imageUploadKey,
                  source: ImageSource.gallery,
                  uploadUrl: '${System.domain}upload/image/',
                  crop: false,
                  child: _buildRoomIcon(),
                  onComplete: (String name, int width, int height, Map origin) {
                    setState(() {
                      _icon = name;
                    });
                    return true;
                  },
                ),
              ),
            ),
            onClicked: () => _imageUploadKey.currentState?.switchImage(),
          ),
          // SettingItemWidget(
          //   title: K.room_vertical_cover,
          //   height: 96,
          //   trailingWidget: SizedBox(
          //     width: 64,
          //     height: 64,
          //     child: ClipRRect(
          //       borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          //       child: ImageUpload(
          //         key: _imageUploadKey2,
          //         source: ImageSource.gallery,
          //         uploadUrl: System.domain + 'upload/image/',
          //         crop: false,
          //         child: _buildRoomIcon2(),
          //         onComplete: (String name, int width, int height, Map origin) {
          //           setState(() {
          //             _coverIcon = name;
          //           });
          //           return true;
          //         },
          //       ),
          //     ),
          //   ),
          //   onClicked: () => _imageUploadKey2.currentState?.switchImage(),
          // ),
        ],
        SettingItemWidget(
          title: K.room_title,
          trailingText: _name,
          onClicked: () async {
            // 婚礼房不能修改
            if (isMarry) return;

            int index = FormScreen.config(title: K.room_input_title, value: _name, allowEmpty: false);
            String? value = await FormScreen.openFormScreen(context, index);
            if (mounted) {
              setState(() {
                if (value != null) {
                  _name = value;
                }
              });
            }
          },
        ),
        SettingItemWidget(
          title: K.room_subtitle,
          trailingText: _subtitle,
          onClicked: () async {
            int index = FormScreen.config(title: K.room_input_subtitle, value: _subtitle, allowEmpty: false, maxLength: 15);

            String? value = await FormScreen.openFormScreen(context, index);
            if (mounted) {
              setState(() {
                if (value != null) {
                  _subtitle = value;
                }
              });
            }
          },
        ),
        if (tagLabel.isNotEmpty) SettingItemWidget(title: K.room_category, trailingText: tagLabel, onClicked: _onRoomCategoryTaped),
        SettingItemWidget(
          title: K.room_placard,
          trailingText: _getDescription(),
          inAudit: _roomDescriptionInAudit,
          onClicked: () async {
            int index = FormScreen.config(
              title: K.room_play_intro,
              value: _description,
              allowEmpty: false,
              type: FormTypes.textArea,
            );
            String? value = await FormScreen.openFormScreen(context, index);
            if (mounted) {
              setState(() {
                if (value != null) {
                  _description = value;
                }
              });
            }
          },
        ),
        SettingItemWidget(
          title: K.room_setting_welcome_title,
          trailingText: _greet?.replaceAll("\n", "") ?? '',
          onClicked: () async {
            Tracker.instance.track(TrackEvent.welcome_click, properties: {'entrance': 'compile'});

            int index = FormScreen.config(
              title: K.room_setting_welcome_title,
              value: _greet,
              placeholder: K.room_setting_welcome_placeholder,
              allowEmpty: true,
              type: FormTypes.textArea,
              maxLength: 20,
            );
            String? value = await FormScreen.openFormScreen(context, index);

            if (value != null && value.isNotEmpty) {
              Tracker.instance.track(TrackEvent.welcome_click, properties: {'entrance': 'compile', 'page': 'submit'});
            }

            if (mounted) {
              setState(() {
                _greet = value;
              });
            }
          },
        ),
        Container(
          height: 1 / Util.devicePixelRatio,
          color: R.color.dividerColor,
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
        _buildMicNum(),

        if (_defendValue > 0)
          SettingItemWidget(
            title: K.room_defend_value,
            trailingText: '$_defendValue',
            onClicked: _onClickDefendValue,
          ),
        Container(
          height: 1 / Util.devicePixelRatio,
          color: R.color.dividerColor,
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
        if (_showPublishDeal)
          SettingItemWithSwitchWidget(
            title: K.room_wolf_publish_deal,
            value: _isPublishDeal,
            onChanged: (bool selected) {
              setState(() {
                _isPublishDeal = selected;
              });
            },
          ),
        // SettingItemWithSwitchWidget(
        //   title: K.room_add_lock,
        //   value: _requestPassword,
        //   onChanged: (bool selected) {
        //     setState(() {
        //       _requestPassword = selected;
        //       _password = '';
        //     });
        //   },
        // ),
        // if (_property == 'business')
        //   SettingItemWithSwitchWidget(
        //     title: K.room_wish_gift_func,
        //     value: _wishGiftOpen,
        //     onChanged: (bool selected) {
        //       setState(() {
        //         _wishGiftOpen = selected;
        //       });
        //     },
        //   ),
        if (_esportMateSwitch)
          SettingItemWithSwitchWidget(
            title: K.room_et_rank_show,
            value: _esportMateShow,
            onChanged: (bool selected) {
              setState(() {
                _esportMateShow = selected;
              });
            },
          ),
        if (_type == 'ktv')
          SettingItemWithSwitchWidget(
            title: K.room_pk_link,
            value: _ktvPkMode,
            onChanged: (bool selected) {
              setState(() {
                _ktvPkMode = selected;
              });
            },
          ),
        if (_showHideInRoomSet)
          Container(
            height: 1 / Util.devicePixelRatio,
            color: R.color.dividerColor,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
        if (_showHideInRoomSet)
          SettingItemWithSwitchWidget(
            title: K.room_setting_hide_switch,
            value: _isSetHideInRoom,
            onChanged: (bool selected) {
              setState(() {
                _isSetHideInRoom = selected;
              });
            },
          ),
        // SettingItemWidget(
        //   title: K.password,
        //   trailingText: _password,
        //   onClicked: _requestPassword ? _changePassword : null,
        // ),
        if (_showAuction)
          SettingItemWithSwitchWidget(
            title: K.room_auction_enable,
            value: _enableAuction,
            onChanged: (bool selected) {
              setState(() {
                _enableAuction = selected;
              });
            },
          ),

        /// 房间玩法
        if (_showSubType && _subTypes.isNotEmpty) ...[
          SettingItemWidget(
            title: K.room_sub_type,
            trailingText: subTypeStr,
            onClicked: _onRoomTypeTaped,
          ),
          if (_subType == 'theone')
            SettingItemWithSwitchWidget(
              title: K.room_theone_mystery_setting,
              value: _mystery,
              onChanged: (bool selected) {
                setState(() {
                  _mystery = selected;
                });
              },
            ),
        ],
        // 新用户进房
        if (_showNewUserLimit)
          SettingItemWithSwitchWidget(
            title: K.room_new_user_limit,
            value: _newUserLimit,
            onChanged: (bool selected) {
              setState(() {
                _newUserLimit = selected;
              });
            },
          ),
        if (_nestEnable == 0 || _nestEnable == 1)
          SettingItemWithSwitchWidget(
            title: K.room_nest_func,
            value: _nestEnable == 1,
            onChanged: (bool selected) {
              setState(() {
                _nestEnable = selected ? 1 : 0;
              });
            },
          ),

        // _buildSpecialMic(),
      ],
    );
  }

  /// 麦位数量
  Widget _buildMicNum() {
    if (Util.isCollectionEmpty(_micNum)) return const SizedBox.shrink();

    return SettingItemWidget(
      title: K.room_mic_num_selector,
      trailingText: _selectMicNum?.label ?? '',
      onClicked: _onMicNumTaped,
    );
  }

  /// 特殊麦位开关 cp麦位、vip麦位、包厢
  Widget _buildSpecialMic() {
    if (!_showSpecialMic) return const SizedBox.shrink();
    return SettingItemWidget(
      title: K.room_open_special_mic,
      trailingText: (_selectSpecialMic?.title) ?? '',
      onClicked: () async {
        SheetCallback? result = await displayModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return RadioBottomSheet(data: _specialMicConfig?.list.map((e) => SheetItem(e.title, e.type.toString())).toList());
            });
        if (result == null || result.reason == SheetCloseReason.Active) {
          return;
        }

        if (result.value?.key != null && mounted) {
          for (RoomInfoSpecialMicType element in _specialMicConfig!.list) {
            if (element.type.toString() == result.value?.key) {
              _specialMicConfig?.selectedType = element.type;
              if (element.type == 3) {
                /// 房间包厢
                _reportRoomCubicleSpecialMic();
              }
              break;
            }
          }
          setState(() {});
        }
      },
    );
  }

  void _onClickDefendValue() async {
    int index = FormScreen.config(
      title: K.room_defend_value,
      value: '$_defendValue',
      allowEmpty: false,
      type: FormTypes.input,
      keyboardType: TextInputType.number,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    int num = Util.parseInt(value);
    if (num > 0 && mounted) {
      setState(() {
        _defendValue = num;
      });
    }
  }

  /// 打开房间包厢特殊麦位上报统计
  _reportRoomCubicleSpecialMic() {
    Tracker.instance.track(
      TrackEvent.room_cubicle_special_mic,
      properties: {
        'rid': widget.rid,
      },
    );
  }
}
