import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/api/gift_wall_api.dart';
import '../../../K.dart';
import '../../../assets.dart';
import '../../personal_util.dart';
import '../page/gift_detail_dialog.dart';

enum BtnType {
  TYPE_GET, // 去领取
  TYPE_UNLOCK, // 未解锁
  TYPE_DONE, // 已完成
  TYPE_LIGHT, // 去点亮
  TYPE_LIGHT_DISABLED, // 去点亮(未解锁)
  TYPE_GOT, //已领取
}

extension BtnTypeExt on BtnType {
  String get name {
    switch (this) {
      case BtnType.TYPE_GET:
        return K.gift_wall_task_btn_1;
      case BtnType.TYPE_UNLOCK:
        return K.gift_wall_task_btn_2;
      case BtnType.TYPE_DONE:
        return K.gift_wall_task_btn_3;
      case BtnType.TYPE_LIGHT:
      case BtnType.TYPE_LIGHT_DISABLED:
        return K.gift_wall_task_btn_4;
      case BtnType.TYPE_GOT:
        return K.gift_wall_task_btn_5;
      default:
        return "Confirm";
    }
  }
}

class GiftTaskView extends StatefulWidget {
  final int levelIndex;
  final String? type;
  final String? seriesType;
  final AwakeTaskRsp_Data? data;
  final Map<int, GiftBookRuleInfo>? ruleInfoMap;
  final bool isTaskLocked; // tab 栏任务的解锁状态

  const GiftTaskView(
      {Key? key,
      this.type,
      this.seriesType,
      this.levelIndex = 0,
      this.isTaskLocked = false,
      this.data,
      this.ruleInfoMap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => GiftTaskViewState();
}

class GiftTaskViewState extends State<GiftTaskView>
    with AutomaticKeepAliveClientMixin<GiftTaskView> {
  bool isTaskDone = false;
  final String _tag = "GiftTaskViewState";

  @override
  void initState() {
    super.initState();
    isTaskDone = (widget.data?.awakeNum ?? 0) >=
            (widget.data?.levelTaskList[widget.levelIndex].awakeNum ?? 0)
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.data == null ||
        (widget.data?.levelTaskList.length ?? 0) <= widget.levelIndex ||
        widget.data?.levelTaskList[widget.levelIndex].awakeNum == 0) {
      return Padding(
        padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp, top: 0),
        child: Column(children: [
          R.img(Assets.personaldata$gift_wall_task_task_state_empty_webp)
        ]),
      );
    }
    return Padding(
        padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                Stack(
                  children: [
                    R.img(Assets.personaldata$gift_wall_task_award_bg_webp,
                        width: constraints.maxWidth, fit: BoxFit.fitWidth),
                    PositionedDirectional(
                        end: 16.dp,
                        top: 16.dp,
                        child: _buildBtn(getAwardType())),
                    PositionedDirectional(
                        width: constraints.maxWidth,
                        bottom: 16.dp,
                        child: _buildAward()),
                  ],
                ),
                SizedBox(height: 16.dp),
                Stack(
                  children: [
                    R.img(Assets.personaldata$gift_wall_task_task_bg_webp,
                        width: Util.width, fit: BoxFit.fitWidth),
                    PositionedDirectional(
                        bottom: 16.dp,
                        width: constraints.maxWidth,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 16.dp, end: 16.dp),
                          child: Row(
                            children: [
                              R.img(
                                  Assets
                                      .personaldata$gift_wall_task_ic_award_webp,
                                  width: 16.dp,
                                  height: 16.dp,
                                  fit: BoxFit.contain),
                              SizedBox(width: 4.dp),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                      K.gift_wall_award_text([
                                        "${widget.data?.levelTaskList[widget.levelIndex].awakeNum ?? 0}"
                                      ]),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: const Color(0xFF42077D)
                                            .withOpacity(0.7),
                                        fontSize: 14.dp,
                                        fontWeight: FontWeight.w900,
                                      ))),
                              _buildBtn(getTaskType()),
                            ],
                          ),
                        )),
                  ],
                ),
              ],
            );
          },
        ));
  }

  Widget _buildAward() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(alignment: AlignmentDirectional.center, children: [
          SizedBox(
            width: 140.dp,
            child: GestureDetector(
              onTap: () async {
                _showGiftDetail();
              },
              child: R.img(
                  Util.getRemoteImgUrl(widget.data?.rewardInfo.icon ?? ''),
                  width: 100.dp,
                  height: 100.dp),
            ),
          ),
          if (!isTaskDone) ...[
            ClipOval(
                child: GestureDetector(
                    onTap: () async {
                      _showGiftDetail();
                    },
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                      width: 100.dp,
                      height: 100.dp,
                    ))),
            R.img(Assets.personaldata$gift_wall_task_ic_lock_webp,
                width: 21.dp, height: 21.dp),
          ],
          PositionedDirectional(
              top: 0.dp,
              end: 0.dp,
              child: _buildNum(
                  widget.data?.levelTaskList[widget.levelIndex].rewardNum ??
                      0)),
        ]),
        Text(widget.data?.rewardInfo.name ?? '',
            style: TextStyle(
              color: const Color(0xFF42077D).withOpacity(0.7),
              fontSize: 14.dp,
              fontFamily: Util.fontFamily,
              fontWeight: FontWeight.w900,
            ))
      ],
    );
  }

  void _showGiftDetail() async {
    GiftHandbookGiftListRsp rsp = await GiftWallApi.getGiftList(
        Session.uid, widget.type ?? '', 'all', 'star', 'false',
        giftId: widget.data?.rewardInfo.gid ?? 0);
    if (rsp.success && mounted && rsp.data.giftInfo.id > 0) {
      GiftDetailDialog.show(
        context,
        rsp.data.giftInfo,
        Session.uid,
        widget.ruleInfoMap?[rsp.data.giftInfo.price],
        widget.type ?? '',
      );
    } else {
      Log.d(tag: _tag, "request error,${rsp.msg}");
    }
  }

  Widget _buildNum(int num) {
    return Container(
      height: 22.dp,
      alignment: AlignmentDirectional.center,
      padding: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.42),
        borderRadius: BorderRadiusDirectional.all(Radius.circular(11.dp)),
      ),
      child: Text("*$num",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.dp,
              fontWeight: FontWeight.bold,
              fontFamily: Util.numFontFamily,
              package: ComponentManager.MANAGER_BASE_CORE)),
    );
  }

  BtnType getAwardType() {
    if (!isTaskDone) {
      return BtnType.TYPE_UNLOCK;
    } else {
      if (widget.data?.levelTaskList[widget.levelIndex].rewardState == 1) {
        return BtnType.TYPE_GOT;
      } else {
        return BtnType.TYPE_GET;
      }
    }
  }

  BtnType getTaskType() {
    return widget.isTaskLocked
        ? BtnType.TYPE_LIGHT_DISABLED
        : isTaskDone
            ? BtnType.TYPE_DONE
            : BtnType.TYPE_LIGHT;
  }

  int lastClickTime = 0;

  Widget _buildBtn(BtnType btnType) {
    return GestureDetector(
      onTap: () async {
        if (DateTime.now().millisecondsSinceEpoch - lastClickTime <= 500) {
          return;
        }
        lastClickTime = DateTime.now().millisecondsSinceEpoch;
        switch (btnType) {
          case BtnType.TYPE_LIGHT:
            LightJumpRsp res = await GiftWallApi.getHotRoom();
            if (!mounted) {
              return;
            }
            if (res.success) {
              int rid = res.data.rid;
              if (rid > 0) {
                PersonalUtil.jumpRoom(System.context, rid, 0,
                    refer: 'GiftBook');
              } else if (res.msg.isNotEmpty) {
                Fluttertoast.showCenter(msg: res.msg);
              }
            } else if (res.msg.isNotEmpty) {
              Fluttertoast.showCenter(msg: res.msg);
            }
            break;
          case BtnType.TYPE_GET:
            NormalNull res = await GiftWallApi.getSingleAward(
                widget.type ?? '',
                widget.seriesType ?? '',
                widget.data?.levelTaskList[widget.levelIndex].level ?? 0);
            if (res.success) {
              Fluttertoast.showCenter(msg: res.msg);
              Navigator.pop(context);
              IVipManager vipManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_VIP);
              vipManager.showBagPage(context, tabType: "gift");
            } else {
              Fluttertoast.showCenter(msg: res.msg);
            }
            break;
        }
      },
      child: Container(
        height: 28.dp,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:
                  (btnType == BtnType.TYPE_GET || btnType == BtnType.TYPE_LIGHT)
                      ? [const Color(0xFFF5C58F), const Color(0xFFFBE9C1)]
                      : [const Color(0xFFEAEAEA), const Color(0xFFB8B8B8)],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(14.dp)),
          border: (btnType == BtnType.TYPE_GET || btnType == BtnType.TYPE_LIGHT)
              ? Border.all(color: Colors.white)
              : null,
        ),
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        child: Text(btnType.name,
            style: const TextStyle(
                color: Color(0xFF303849),
                fontSize: 12,
                fontWeight: FontWeight.w900)),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }
}
