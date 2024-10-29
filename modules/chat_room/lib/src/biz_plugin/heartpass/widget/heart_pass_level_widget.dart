import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/heartpass/controller/heart_pass_move_controller.dart';
import 'package:chat_room/src/biz_plugin/heartpass/model/heart_pass_repos.dart';
import 'package:chat_room/src/biz_plugin/heartpass/model/heart_pass_view_model.dart';
import 'package:chat_room/src/biz_plugin/heartpass/widget/heart_pass_user_item_widget.dart';
import 'package:chat_room/src/protobuf/generated/plugin_lucky.pb.dart';

/// 心动闯关关卡布局
class HeartPassLevelWidget extends StatefulWidget {
  final HeartPassViewModel viewModel;

  const HeartPassLevelWidget({super.key, required this.viewModel});

  @override
  _HeartPassLevelWidgetState createState() => _HeartPassLevelWidgetState();
}

class _HeartPassLevelWidgetState extends State<HeartPassLevelWidget>
    with TickerProviderStateMixin, HeartPassMoveController {
  late AnimationController _startAnimationController;

  late List<ResLuckyBaseLocationList> _currentLevelList;
  final List<GlobalKey> _levelIconKeyList = []; // 关卡icon占位key,用户计算icon的位置
  final List<Offset> _levelIconPosition = []; // 占位widget的位置
  final GlobalKey _iconContainerKey = GlobalKey();
  Size? _iconContainerSize;

  @override
  void initState() {
    _currentLevelList = widget.viewModel.model!.locationList;
    _updateGlobalKey();
    _startAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (!widget.viewModel.noBoss) {
            _startAnimationController.stop();
            return;
          }
          _startAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _startAnimationController.forward();
        }
      });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HeartPassLevelWidget oldWidget) {
    if (viewModel.needUpdateLocationKey) {
      viewModel.needUpdateLocationKey = false;
      _updateGlobalKey();
    }
    _currentLevelList = widget.viewModel.model!.locationList;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _startAnimationController.dispose();
    super.dispose();
  }

  _joinMic() async {
    ChatRoomData room = widget.viewModel.room;

    int position = 8;
    if (widget.viewModel.room.positions.isNotEmpty) {
      position = widget.viewModel.room.positions.last.position;
    }

    if (room.config?.mode == RoomMode.Lock && Session.uid != room.config?.uid) {
      // 非自由上麦，排麦
      var isBoss = ChatRoomUtil.isBossChairByPosition(position);
      bool isAuction = (room.config?.types == RoomTypes.Auction &&
          position == room.auctionPosition);
      MicUpWaitList.show(
          context: context,
          builder: (BuildContext context) {
            return MicUpWaitList(
              room: room,
              isBoss: isBoss,
              isAuction: isAuction,
            );
          });
    } else {
      // 自由上麦，上麦
      await RoomRepository.joinMic(
        room.rid,
        position,
        uid: 0,
        toastError: true,
        toastSuccess: false,
        needCertify: true,
        type: room.needVerify,
        newType: room.needVerifyNew,
      );
    }
  }

  /// 老板闯关动画
  void _controlStartAnimate(bool start) {
    if (start) {
      // 开始动画
      if (!_startAnimationController.isAnimating) {
        _startAnimationController.forward();
      }
    } else {
      // 结束动画
      if (_startAnimationController.isAnimating) {
        _startAnimationController.stop();
      }
    }
  }

  void _updateGlobalKey() {
    _levelIconKeyList.clear();
    for (var _ in _currentLevelList) {
      _levelIconKeyList.add(GlobalKey());
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _levelIconPosition.clear();
      final RenderBox renderBox =
          _iconContainerKey.currentContext!.findRenderObject() as RenderBox;
      _iconContainerSize = renderBox.size;

      // 计算虚拟坑位的位置
      for (GlobalKey element in _levelIconKeyList) {
        if (element.currentContext == null) {
          _levelIconPosition.add(const Offset(0, 0));
          continue;
        }
        final RenderBox renderBox =
            element.currentContext!.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero,
            ancestor: _iconContainerKey.currentContext!.findRenderObject());
        _levelIconPosition.add(position);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> levelWidgetList = [];
    int length = _currentLevelList.length;
    int index = 0;
    for (var element in _currentLevelList) {
      if (index == 0 && widget.viewModel.noBoss) {
        levelWidgetList.add(_renderEmpty(_levelIconKeyList[index]));
      } else {
        levelWidgetList.insert(
            0, _renderItem(element, _levelIconKeyList[index], index));
      }
      if (index < length - 1) {
        levelWidgetList.insert(
            0,
            R.img(RoomAssets.chat_room$heartpass_ic_level_arrow_webp,
                width: 11.dp, height: 8.dp));
      }
      index++;
    }
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      child: Stack(
        key: _iconContainerKey,
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...levelWidgetList,
            ],
          ),
          ..._renderLevelUser(),
          _renderLevelPassing(),
        ],
      ),
    );
  }

  /// 关卡item
  Widget _renderItem(
      ResLuckyBaseLocationList level, GlobalKey globalKey, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (index == 0 &&
                !widget.viewModel.isPlaying &&
                widget.viewModel.hasPermission)
            ? GestureDetector(
                onTap: () {
                  HeartPassRepos.start(widget.viewModel.room.rid);
                },
                child: Container(
                    height: 16.dp,
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      K.room_wheel_start_game,
                      style: TextStyle(
                          color: const Color(0xff6CD5FF),
                          fontSize: 11.dp,
                          fontWeight: FontWeight.w500),
                    )),
              )
            : Container(
                height: 16.dp,
                alignment: AlignmentDirectional.center,
                child: Text(level.title,
                    style: TextStyle(color: Colors.white, fontSize: 10.dp))),
        SizedBox(height: 8.dp),

        /// 虚拟占位，用于计算用户的位置
        SizedBox(
          key: globalKey,
          width: 29.dp,
          height: 32.dp,
        ),
        SizedBox(height: 2.dp),
        _renderEdit(
            RoomAssets.chat_room$heartpass_ic_chassis_purple_webp, index),
      ],
    );
  }

  /// boss位置没人
  Widget _renderEmpty(GlobalKey globalKey) {
    _controlStartAnimate(true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 24.dp),
        GestureDetector(
          onTap: () {
            _joinMic();
          },
          child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              /// 虚拟占位，用于计算用户的位置
              SizedBox(
                key: globalKey,
                width: 29.dp,
                height: 32.dp,
              ),
              R.img(RoomAssets.chat_room$heartpass_ic_mic_empty_webp,
                  width: 29.dp, height: 32.dp),
              PositionedTransition(
                rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                            Rect.fromLTWH(-21.dp, -37.dp, 70.dp, 35.dp),
                            Size(29.dp, 32.dp)),
                        end: RelativeRect.fromSize(
                            Rect.fromLTWH(-21.dp, -31.dp, 70.dp, 35.dp),
                            Size(29.dp, 32.dp)))
                    .animate(_startAnimationController),
                child: Container(
                  width: 70.dp,
                  height: 35.dp,
                  padding: EdgeInsetsDirectional.only(bottom: 5.dp),
                  alignment: AlignmentDirectional.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            RoomAssets.chat_room$heartpass_bg_bubble_webp),
                        fit: BoxFit.fill),
                  ),
                  child: Text(
                    K.room_heart_pass_join,
                    style: TextStyle(
                        color: const Color(0xFF313131),
                        fontSize: 10.dp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.dp),
        _renderEdit(RoomAssets.chat_room$heartpass_ic_chassis_blue_webp, 0),
      ],
    );
  }

  Widget _renderEdit(String chassisPath, int index) {
    return SizedBox(
      width: 44.dp,
      height: 22.dp,
      child: Stack(
        fit: StackFit.loose,
        alignment: AlignmentDirectional.topCenter,
        children: [
          R.img(chassisPath, width: 44.dp, height: 12.dp),
          if (viewModel.edit && editIndex == index) ...[
            if (index < _currentLevelList.length - 1)
              PositionedDirectional(
                bottom: 0,
                start: 0,
                child: GestureDetector(
                  onTap: () {
                    moveLeft(index);
                  },
                  child: Padding(
                      padding: EdgeInsetsDirectional.only(bottom: 2.dp),
                      child: R.img(
                          RoomAssets.chat_room$heartpass_ic_arrow_left_webp,
                          width: 18.dp,
                          height: 18.dp)),
                ),
              ),
            if (index > 1 || (index == 1 && !widget.viewModel.noBoss))
              PositionedDirectional(
                bottom: 0,
                end: 0,
                child: GestureDetector(
                  onTap: () {
                    moveRight(index);
                  },
                  child: Padding(
                      padding: EdgeInsetsDirectional.only(bottom: 2.dp),
                      child: R.img(
                          RoomAssets.chat_room$heartpass_ic_arrow_right_webp,
                          width: 18.dp,
                          height: 18.dp)),
                ),
              )
          ]
        ],
      ),
    );
  }

  /// 关卡的用户
  List<Widget> _renderLevelUser() {
    List<Widget> widgetList = [];
    if (_levelIconPosition.isNotEmpty) {
      int index = 0;
      for (ResLuckyBaseLocationList level in _currentLevelList) {
        if (level.user.isEmpty) {
          index++;
          continue;
        }
        int length = level.user.length;
        List<double> translateX = [];
        switch (length) {
          case 1:
            translateX.add(0);
            break;
          case 2:
            translateX.add(4.5.dp);
            translateX.add(-4.5.dp);
            break;
          case 3:
            translateX.add(9.dp);
            translateX.add(0);
            translateX.add(-9.dp);
            break;
          case 4:
            translateX.add(13.5.dp);
            translateX.add(4.5);
            translateX.add(-4.5.dp);
            translateX.add(-13.5.dp);
            break;
        }
        List<Widget> childList = [];
        bool isLastLevel = index == _currentLevelList.length - 1;
        List<ResLuckyBaseUser> tempList = level.user;
        for (int i = 0; i < translateX.length; i++) {
          ResLuckyBaseUser userBean = tempList[i];
          Widget userWidget = HeartPassUserItemWidget(
            key: ValueKey('${userBean.origin}-${level.isBreaker}'),
            user: userBean,
            isBoss: level.isBreaker == 1,
            position: _levelIconPosition[index].translate(translateX[i], 0),
            containerSize: _iconContainerSize!,
            index: index,
            onTap: (value) {
              if (!widget.viewModel.hasPermission) return;
              if (viewModel.edit && !noMove()) return;
              initRecord(userBean.position, level.isBreaker == 1);
              viewModel.edit = true;
              editIndex = value;
              setState(() {});
            },
          );
          if (isLastLevel) {
            childList.insert(0, userWidget);
          } else {
            childList.add(userWidget);
          }
        }
        widgetList.addAll(childList);
        index++;
      }
    }
    return widgetList;
  }

  /// 闯关中
  Widget _renderLevelPassing() {
    int nextLevel = 0;
    int index = 0;
    for (ResLuckyBaseLocationList item in _currentLevelList) {
      if (item.isBreaker == 1) {
        nextLevel = index + 1;
        break;
      }
      index++;
    }
    if (viewModel.isPlaying &&
        _levelIconPosition.isNotEmpty &&
        nextLevel < _levelIconPosition.length) {
      return PositionedDirectional(
        top: _levelIconPosition[nextLevel].dy,
        start: _levelIconPosition[nextLevel].dx,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            SizedBox(
              width: 29.dp,
              height: 32.dp,
            ),
            PositionedDirectional(
              bottom: -7.dp,
              child: Container(
                width: 37.dp,
                height: 16.dp,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFFE04283), Color(0xFFEE474A)]),
                  borderRadius: BorderRadius.circular(8.dp),
                ),
                child: Text(
                  K.room_heart_pass_ing,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 9.dp),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
