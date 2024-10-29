import 'package:shared/assets.dart';
import 'package:chat_room/assets.dart';
import 'package:gift/k.dart';
import 'dart:async';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/intimate_interact/intimate_constant.dart';
import 'package:gift/src/intimate_interact/intimate_interact_sent_dialog.dart';
import 'package:gift/src/intimate_interact/intimate_interact_receive_dialog.dart';
import 'package:gift/src/intimate_interact/repo/intimate_interact_repo.dart';
import '../../assets.dart';
import 'model/intimate_interact_create_invite_data.dart';
import 'model/intimate_interact_gift_data.dart';
import 'model/intimate_interact_task_data.dart';
import 'num_select_widget.dart';
import 'task_select_widget.dart';

/// 亲密互动发送邀请
class IntimateInteractInviteDialog extends StatefulWidget {
  final IntimateInteractCreateInviteData data;
  final bool forceCreate;

  const IntimateInteractInviteDialog(
      {Key? key, required this.data, this.forceCreate = false})
      : super(key: key);

  @override
  _IntimateInteractInviteDialogState createState() =>
      _IntimateInteractInviteDialogState();

  static bool _requesting = false;

  static Future<bool> show(BuildContext context,
      {bool forceCreate = false}) async {
    if (_requesting) {
      return true;
    }
    _requesting = true;
    DataRsp<IntimateInteractCreateInviteData> rsp =
        await IntimateInteractRepo.createInviteDialog(
            ChatRoomData.getInstance()!.rid);
    _requesting = false;
    if (rsp.success == true && rsp.data != null) {
      if (!forceCreate && rsp.data!.selfTaskList.isNotEmpty) {
        if (rsp.data!.listType == 1) {
          return IntimateInteractSentDialog.show(
              context, rsp.data!.selfTaskList);
        } else {
          return IntimateInteractReceiveDialog.show(
              context, rsp.data!.selfTaskList);
        }
      } else {
        return await DialogTransition.scaleShow(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return IntimateInteractInviteDialog(
              data: rsp.data!,
              forceCreate: forceCreate,
            );
          },
        );
      }
    } else {
      Fluttertoast.showToast(msg: rsp.msg ?? '');
      return false;
    }
  }
}

class _IntimateInteractInviteDialogState
    extends State<IntimateInteractInviteDialog> {
  List<UserBean>? _users;
  final Map<int, bool> _checked = {}; // 用户是否被选中
  final GlobalKey _selectNumKey = GlobalKey();
  final GlobalKey _selectTaskKey = GlobalKey();
  bool _showGiftPanel = false;
  List<IntimateInteractGiftData>? _gifts;
  IntimateInteractGiftData? _selectGift;
  Map? _taskMap;
  Object? _currTaskKey;
  Map? _numMap;
  int _giftNum = 1;
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    _taskMap = widget.data.taskMap;
    if (_taskMap != null && _taskMap!.isNotEmpty) {
      _currTaskKey = _taskMap!.keys.first;
    }
    _numMap = widget.data.numMap;
    if (_numMap == null || _numMap!.isEmpty) {
      _errorMsg = 'gift num list empty';
    }
    _gifts = widget.data.giftList;
    if (_gifts != null && _gifts!.isNotEmpty) {
      _selectGift = _gifts![0];
    } else {
      _errorMsg = 'gift list empty';
    }
    _users = widget.data.userList;
    _initUserCheck();
  }

  void _initUserCheck() {
    bool defaultValue = true;
    if (_users != null) {
      for (UserBean user in _users!) {
        _checked[user.uid] = defaultValue;
      }
    }
  }

  String get _currTask {
    if (_taskMap != null && _currTaskKey != null) {
      return _taskMap![_currTaskKey] ?? '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      alignment: AlignmentDirectional.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            end: 0,
            top: -94,
            child: R.img(
              Assets.intimate_interact_dialog_top_bg_png,
              width: 312,
              height: 156,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 312,
                child: _buildMainContent(),
              ),
              const SizedBox(height: 20),
              _buildClose(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      height: 437,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF79A7C),
            Color(0xFFF122B0),
            Color(0xFFC233FF),
          ],
          begin: AlignmentDirectional.topEnd,
          end: AlignmentDirectional.bottomStart,
        ),
      ),
      padding: const EdgeInsetsDirectional.only(top: 11, start: 12, end: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          const SizedBox(height: 8),
          if (_showGiftPanel) _buildGiftPanel(),
          if (!_showGiftPanel) ..._taskPanelWidgets(),
        ],
      ),
    );
  }

  Widget _buildGiftPanel() {
    return Container(
      width: 288,
      height: 371,
      padding: const EdgeInsetsDirectional.only(
        top: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 36,
                  height: 36,
                  margin: const EdgeInsetsDirectional.only(start: 5),
                  alignment: Alignment.center,
                  child: Center(
                    child: R.img(
                      BaseAssets.ic_titlebar_back_svg,
                      width: 16,
                      height: 16,
                      color: const Color(0xFF222222),
                      package: ComponentManager.MANAGER_BASE_CORE,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _showGiftPanel = false;
                  });
                },
              ),
              Text(
                K.gift_add_gift,
                style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF222222),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 36,
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 8,
              crossAxisSpacing: 0,
              crossAxisCount: 4,
              shrinkWrap: true,
              childAspectRatio: 36 / 52,
              padding:
                  const EdgeInsetsDirectional.only(start: 6, end: 6, bottom: 6),
              children: _gifts!.map((gift) {
                return _buildGiftItem(gift);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftItem(IntimateInteractGiftData gift) {
    bool selected = gift == _selectGift;
    return InkWell(
      onTap: () {
        setState(() {
          _selectGift = gift;
          _showGiftPanel = false;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? R.color.mainBrandColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              placeholder: const CupertinoActivityIndicator(),
              imageUrl: gift.icon,
              width: 60,
              height: 60,
              fit: BoxFit.contain,
              fadeInDuration: const Duration(microseconds: 0),
              fadeOutDuration: const Duration(microseconds: 0),
            ),
            Text(
              gift.name,
              style: const TextStyle(
                color: Color(0xFF313131),
                fontSize: 12,
              ),
              maxLines: 1,
            ),
            Text(
              '${MoneyConfig.moneyNum(Util.parseInt(gift.price))}${MoneyConfig.moneyName}',
              style: TextStyle(
                color: const Color(0xFF202020).withOpacity(0.4),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _taskPanelWidgets() {
    bool dataError = _users == null || _users!.isEmpty || _errorMsg != null;
    return [
      Container(
        height: 270,
        padding: EdgeInsetsDirectional.only(
            top: dataError ? 0 : 16, bottom: dataError ? 15 : 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: dataError
            ? EmptyWidget(
                paddingBottom: 0,
                desc: _errorMsg ?? K.gift_no_one_to_invite_now,
              )
            : Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 12, end: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${K.gift_invite}：',
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          K.gift_select_interact_objects,
                          style: TextStyle(
                            fontSize: 11,
                            color: const Color(0xFF202020).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  _buildUsers(),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 12, end: 12, top: 16, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${K.gift_select_interact_behavior}：',
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          K.gift_allow_anchor_done_task,
                          style: TextStyle(
                            fontSize: 11,
                            color: const Color(0xFF202020).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      RenderBox rowRenderBox = _selectTaskKey.currentContext
                          ?.findRenderObject() as RenderBox;
                      Offset offset = rowRenderBox.localToGlobal(
                          Offset(rowRenderBox.size.width + 8, -5));
                      TaskSelectWidget.show(
                              context, _taskMap!, _currTaskKey!, offset)
                          .then((value) {
                        if (value != null) {
                          if (mounted) {
                            setState(() {
                              _currTaskKey = value;
                            });
                          }
                        }
                      });
                    },
                    child: Container(
                      width: 264,
                      height: 44,
                      padding:
                          const EdgeInsetsDirectional.only(start: 12, end: 12),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: const Color(0xFF202020).withOpacity(0.1),
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            _currTask,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF202020),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            key: _selectTaskKey,
                            width: 50,
                            height: 40,
                          ),
                          R.img(
                            Assets.intimate_interact_ic_arrow_down_svg,
                            width: 12,
                            height: 12,
                            package: ComponentManager.MANAGER_GIFT,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 12, end: 12, top: 16, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          '${K.gift_send_out_gift}：',
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          K.gift_target_gift_not_less_than,
                          style: TextStyle(
                            fontSize: 11,
                            color: const Color(0xFF202020).withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          '1000${MoneyConfig.moneyName}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFFFCA252),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showGiftPanel = true;
                          });
                        },
                        child: Container(
                          width: 190,
                          height: 44,
                          padding: const EdgeInsetsDirectional.only(
                              start: 12, end: 12),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: const Color(0xFF202020).withOpacity(0.1),
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: _selectGift!.icon,
                                width: 32,
                                height: 32,
                              ),
                              Text(
                                _selectGift!.name,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF202020),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                '(${MoneyConfig.moneyNum(Util.parseInt(_selectGift!.price))}${MoneyConfig.moneyName})',
                                style: TextStyle(
                                  fontSize: 11,
                                  color:
                                      const Color(0xFF202020).withOpacity(0.4),
                                ),
                              ),
                              const Spacer(),
                              R.img(
                                Assets.intimate_interact_ic_arrow_right_svg,
                                width: 12,
                                height: 12,
                                package: ComponentManager.MANAGER_GIFT,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          RenderBox rowRenderBox = _selectNumKey.currentContext
                              ?.findRenderObject() as RenderBox;
                          Offset offset = rowRenderBox.localToGlobal(
                              Offset(rowRenderBox.size.width / 2, -5));
                          NumSelectWidget.show(
                                  context, _numMap!, _giftNum, offset)
                              .then((value) {
                            int num = Util.parseInt(value);
                            if (num > 0) {
                              if (mounted) {
                                setState(() {
                                  _giftNum = num;
                                });
                              }
                            }
                          });
                        },
                        child: Container(
                          key: _selectNumKey,
                          width: 62,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: const Color(0xFF202020).withOpacity(0.1),
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'x$_giftNum',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF202020),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              R.img(
                                Assets.intimate_interact_ic_arrow_down_svg,
                                width: 12,
                                height: 12,
                                package: ComponentManager.MANAGER_GIFT,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
      const SizedBox(height: 16),
      _buildBottomBtn(),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            K.gift_send_invite_to_agree,
            style:
                TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.7)),
          ),
          const SizedBox(
            width: 0,
          ),
          GestureDetector(
            onTap: () {
              BaseWebviewScreen.show(context, url: IntimateConstant.specsUrl);
            },
            child: Text(
              K.gift_intimate_interact_specs,
              style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFFDF152),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    ];
  }

  Widget _buildTitle() {
    return SizedBox(
      width: 312,
      child: Row(
        children: [
          const Expanded(child: SizedBox()),
          R.img(
            Assets.intimate_interact_dialog_title_peach_left_png,
            width: 32,
            height: 22,
            package: ComponentManager.MANAGER_GIFT,
          ),
          const SizedBox(width: 4),
          R.img(
            Assets.intimate_interact_dialog_title_text_png,
            width: 130,
            height: 35,
            package: ComponentManager.MANAGER_GIFT,
          ),
          const SizedBox(width: 4),
          R.img(
            Assets.intimate_interact_dialog_title_peach_right_png,
            width: 32,
            height: 22,
            package: ComponentManager.MANAGER_GIFT,
          ),
          Expanded(
            child: Row(
              children: [
                const Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    BaseWebviewScreen.show(context,
                        url: IntimateConstant.helpUrl);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: R.img(
                      RoomAssets.info_svg,
                      width: 20,
                      height: 20,
                      color: Colors.white.withOpacity(0.7),
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ),
                ),
                // SizedBox(width: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsers() {
    if (_users == null || _users!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      height: 38,
      padding: const EdgeInsetsDirectional.only(start: 11),
      alignment: AlignmentDirectional.centerStart,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsetsDirectional.only(end: 11),
        itemCount: _users!.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return _buildMicAvatar(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 16,
          );
        },
      ),
    );
  }

  Widget _buildMicAvatar(int index) {
    UserBean user = _users![index];
    String image = user.icon ?? '';
    bool selected =
        _checked.containsKey(user.uid) ? _checked[user.uid]! : false;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_checked.containsKey(user.uid)) {
            _checked[user.uid] = !_checked[user.uid]!;
          } else {
            _checked[user.uid] = true;
          }
        });
      },
      child: Container(
        height: 38,
        width: 36,
        alignment: AlignmentDirectional.center,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selected ? R.color.mainBrandColor : Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: CommonAvatar(
                key: ValueKey(image),
                size: 36,
                path: image,
                shape: BoxShape.circle,
              ),
            ),
            PositionedDirectional(
              end: -1,
              top: -1,
              child: IgnorePointer(
                child: selected ? _buildSelectMic() : null,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectMic() {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: R.color.mainBrandGradientColors,
        ),
        shape: BoxShape.circle,
      ),
      alignment: AlignmentDirectional.center,
      child: R.img(
        Assets.ic_mic_select_svg,
        package: ComponentManager.MANAGER_GIFT,
        width: 16,
        height: 16,
      ),
    );
  }

  Widget _buildBottomBtn() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _commit,
      child: Container(
        width: 224,
        height: 48,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFFFF8000), Color(0xFFFFC659)]),
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            R.img(
              Assets.intimate_interact_dialog_ic_hi_svg,
              width: 24,
              height: 24,
              package: ComponentManager.MANAGER_GIFT,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              K.gift_send_invite,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClose() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: R.img(
        Assets.intimate_interact_dialog_close_svg,
        width: 47,
        height: 47,
        package: ComponentManager.MANAGER_GIFT,
      ),
    );
  }

  Future<void> _commit() async {
    if (_users == null || _users!.isEmpty) {
      Fluttertoast.showToast(msg: K.gift_no_one_to_invite_now);
      Navigator.pop(context);
      return;
    }

    List<int> uids = [];
    _checked.forEach((key, value) {
      if (value) {
        uids.add(key);
      }
    });
    if (uids.isEmpty) {
      Fluttertoast.showToast(msg: K.gift_pls_select_invite_objects);
      return;
    }

    int total = _selectGift!.price * _giftNum * uids.length;
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result = await payManager.showRechargeSheet(context, total);
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    payManager.pay(context,
        key: 'intimate_interact_invite',
        type: result.value?.key ?? '',
        refer: 'intimate_interact_invite',
        args: {
          'money': total,
          'type': 'intimate-invite',
          'params': {
            'giftId': _selectGift!.giftId,
            'giftNum': _giftNum,
            'taskType': _currTaskKey,
            'rid': ChatRoomData.getInstance()?.rid,
            'uids': uids.join(','),
          }
        }, onPayed: () async {
      Navigator.pop(context);
      DataRsp<List<IntimateInteractTaskData>> rsp =
          await IntimateInteractRepo.taskList(1);
      if (rsp.success == true && rsp.data != null && rsp.data!.isNotEmpty) {
        IntimateInteractSentDialog.show(System.context, rsp.data!);
      }
    });
  }
}
