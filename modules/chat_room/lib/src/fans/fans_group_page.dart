import 'package:cached_network_image/cached_network_image.dart' hide CachedNetworkImage;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/fansLabel.dart';
import 'package:chat_room/src/fans/fans_group_util.dart';
import 'package:chat_room/src/fans/fans_privilege_bag.dart';
import 'package:chat_room/src/fans/model/fans_group_beans.dart';
import 'package:chat_room/src/fans/repo/fans_group_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:shared/util/color_constant.dart';

import '../../assets.dart';

// 粉丝任务 粉丝排行榜
class FansGroupPage extends StatefulWidget {
  final int rid;
  final int roomCreatorUid;

  const FansGroupPage({Key? key, required this.rid, required this.roomCreatorUid}) : super(key: key);

  @override
  _FansGroupPageState createState() => _FansGroupPageState();

  static Future<void> show(BuildContext context, int rid, int roomCreatorUid) {
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1.0,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {},
            child: FansGroupPage(rid: rid, roomCreatorUid: roomCreatorUid),
          );
        });
  }
}

class _FansGroupPageState extends State<FansGroupPage> with SingleTickerProviderStateMixin {
  late ExtendedTabController _tabController;
  late List<String> _tabs;
  FansGroupRsp? _rsp;
  bool _fansPrivilegeBagCanTap = true;

  bool get isCreator => Session.uid == widget.roomCreatorUid;

  @override
  void initState() {
    super.initState();

    _tabs = [K.room_fans_task_list, '团成员'];
    _tabController = ExtendedTabController(length: _tabs.length, vsync: this);

    _load();
  }

  _load() async {
    _rsp = await FansGroupRepo.getFansTaskRankData(widget.rid);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = 113 + (Util.width - 32) * 82 / 343 + 40 + 72 * 4 + (isCreator ? 0 : 72) + Util.iphoneXBottom;
    double ratioHeight = Util.height * 650 / 812;

    return Container(
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      height: ratioHeight > height ? height : ratioHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(16), topEnd: Radius.circular(16)),
      ),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_rsp == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    if (_rsp != null && _rsp!.success == false) {
      return EmptyWidget(
        onTap: () {
          _load();
        },
        desc: _rsp!.msg ?? BaseK.K.no_data,
      );
    }

    return Column(
      children: [
        _buildHeader(),
        _buildTab(),
        Expanded(
          child: ExtendedTabBarView(
            controller: _tabController,
            children: [
              _buildFansTaskList(),
              _buildFansRankList(),
            ],
          ),
        ),
        if (!isCreator) _buildMyRank(_rsp?.data?.userInfo),
      ],
    );
  }

  //头部
  Widget _buildHeader() {
    return SizedBox(
      width: Util.width,
      // height: 113 + (Util.width - 32) * 82 / 343,
      height: 20 + (Util.width - 32) * 82 / 343,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            top: -0.5,
            child:
                R.img(RoomAssets.chat_room$join_fans_top_bg_png, width: Util.width, height: Util.width * 100 / 375, fit: BoxFit.fitWidth),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  if (_rsp?.data?.groupInfo != null) _buildAvatar(_rsp?.data?.groupInfo),
                  if (_rsp?.data?.groupInfo != null) _buildRank(_rsp?.data?.groupInfo)
                ],
              ).paddingOnly(left: 16),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_rsp?.data?.groupInfo?.name}的粉丝团',
                    style: TextStyle(fontSize: 16, color: R.color.mainTextColor, fontWeight: FontWeight.w500),
                  ).paddingOnly(left: 12),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '周累计积分：',
                            style: TextStyle(fontSize: 12, color: R.color.mainTextColor, fontWeight: FontWeight.w500),
                          ).paddingOnly(left: 12),
                          Text(
                            '${FansGroupUtil.scoreToString((_rsp?.data?.groupInfo?.credit ?? 0).toString())}分',
                            style: const TextStyle(fontSize: 12, color: Color(0xFFFFDD84), fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '团成员：',
                            style: TextStyle(fontSize: 12, color: R.color.mainTextColor, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${_rsp?.data?.groupInfo?.memberNum.toString()}人',
                            style: const TextStyle(fontSize: 12, color: Color(0xFFFFDD84), fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ).paddingOnly(top: 32),

              //
            ],
          ),

          PositionedDirectional(
            top: 11,
            child: Text(
              '',
              style: R.textStyle.medium18.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          PositionedDirectional(
            end: 0,
            child: GestureDetector(
              onTap: () {
                if (ModalRoute.of(context)?.isCurrent == true) {
                  Navigator.of(context).pop();
                }
              },
              child: R.img('fans/room_fans_group_close_button.webp', width: 44, height: 44, package: ComponentManager.MANAGER_BASE_ROOM),
            ),
          ),
          // PositionedDirectional(
          //   top: 44,
          //   child: _buildFansInfo(_rsp?.data?.groupInfo),
          // ),
          // PositionedDirectional(
          //   top: 113,
          //   child: _buildFansBox(),
          // ),
        ],
      ),
    );
  }

  Widget _buildAvatar(GroupInfoData? groupInfo) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), shape: BoxShape.circle),
      child: CommonAvatar(
        path: groupInfo?.icon,
        size: 55,
        shape: BoxShape.circle,
        loadingWidget: const CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _buildRank(GroupInfoData? groupInfo) {
    return Positioned(
      top: 60,
      left: 0,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        height: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFFFF48C1), Color(0xFFFF4EA3)]),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Center(
          child: Text(
            K.room_fans_group_rank_week(['${groupInfo?.rank}']),
            style: const TextStyle(color: Colors.white, fontSize: 8),
          ),
        ),
      ).onTap(() {
        IRoomManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        manager.openFansGroupRankPage(context, widget.rid);
      }),
    );
  }

  //粉丝团信息
  Widget _buildFansInfo(GroupInfoData? groupInfo) {
    if (groupInfo == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 14, end: 15),
      width: Util.width,
      height: 65,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2, color: Colors.white),
            ),
            child: CommonAvatar(
              path: groupInfo.icon,
              size: 56,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 300),
                    child: Text(
                      groupInfo.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    K.room_fans_info_person_num([groupInfo.memberNum.toString()]),
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              RichText(
                  text: TextSpan(
                style: TextStyle(
                  fontFamily: Util.fontFamily,
                ),
                children: [
                  TextSpan(
                    text: K.room_fans_week_score,
                    style: TextStyle(fontSize: 13, color: const Color(0x80FFFFFF), fontFamily: Util.fontFamily),
                  ),
                  TextSpan(
                    text: FansGroupUtil.scoreToString(groupInfo.credit.toString()),
                    style: TextStyle(fontSize: 13, color: const Color(0xFFFCA252), fontFamily: Util.fontFamily),
                  ),
                ],
              )),
            ],
          ),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              IRoomManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
              manager.openFansGroupRankPage(context, widget.rid);
            },
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(R.imagePath('fans/fans_group_rank_week_bg.webp'), package: ComponentManager.MANAGER_BASE_ROOM),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  YouSheText(
                    groupInfo.rank < 100 ? '${groupInfo.rank}' : '99+',
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    K.room_fans_group_this_week,
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //粉丝礼包
  Widget _buildFansBox() {
    double width = Util.width - 32;
    double ratio = 82 / 343;
    double height = width * ratio;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (!_fansPrivilegeBagCanTap) return;

        _fansPrivilegeBagCanTap = false;

        FansPrivilegeRsp rsp = await FansGroupRepo.getFansPrivilegeBagData(widget.rid);
        if (rsp.success == true && rsp.data != null && rsp.data!.list.isNotEmpty) {
          if (ModalRoute.of(context)?.isCurrent == true) {
            Navigator.of(context).pop();
          }

          FansPrivilegeBag.show(context, widget.rid, widget.roomCreatorUid, rsp.data!);
        } else {
          Fluttertoast.showCenter(msg: rsp.msg ?? BaseK.K.no_data);
        }

        _fansPrivilegeBagCanTap = true;
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                CachedNetworkImageProvider(Util.getImgUrl('fans/fans_privilege_bag_bg.webp', package: ComponentManager.MANAGER_BASE_ROOM)),
          ),
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              bottom: (height - height * 6 / 82 - 32) / 2,
              end: 12,
              child: Container(
                width: 67,
                height: 34,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          (R.img(RoomAssets.chat_room$icon_fans_btn_buy_png, width: 67, height: 34, package: RoomAssets.package) as Image)
                              .image,
                      fit: BoxFit.fill),
                ),
                child: Text(
                  K.room_fans_privilege_buy,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFFA24E00)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab() {
    return Container(
      height: 36.0,
      margin: const EdgeInsets.only(bottom: 2.0, top: 2.0),
      child: CommonTabBar(
        tabs: _tabs.map((e) {
          return Text(e);
        }).toList(),
        isScrollable: true,
        controller: _tabController,
        labelColor: const Color(0xFFF95A97),
        unselectedLabelColor: Colors.black,
        labelStyle: const TextStyle(color: Color(0xFFF95A97), fontSize: 15, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
        indicator: const CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Color(0xFFF95A97)),
            insets: EdgeInsetsDirectional.only(bottom: 0),
            wantWidth: 24,
            draggingWidth: 20.0),
        indicatorWeight: 0,
        labelPadding: const EdgeInsetsDirectional.only(start: 50, end: 50),
      ),
    );
  }

  //任务列表
  Widget _buildFansTaskList() {
    return showRankListByKey(roomFansKey)
        ? ListView.builder(
            itemCount: _rsp?.data?.taskList.length,
            itemBuilder: ((context, index) => _buildTaskItem(_rsp!.data!.taskList[index], index)),
          )
        : const SizedBox.shrink();
  }

  //粉丝列表
  Widget _buildFansRankList() {
    return ListView.builder(
      itemCount: _rsp?.data?.rankList.length,
      itemBuilder: ((context, index) => _buildRankItem(_rsp!.data!.rankList[index], index)),
    );
  }

  //分享直播间
  _onShare(int rid) async {
    ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.share(context, rid, tp: 1, needInApp: true, newShareInRoom: true, rid: rid, title: K.room_invite_friend);
  }

  Widget _buildTaskItem(FansTaskItem item, int index) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 12, end: 16, bottom: 12),
      height: 72,
      child: Row(
        children: [
          CommonAvatar(
            path: item.icon,
            size: 48,
            shape: BoxShape.circle,
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 2,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: Util.width - 170),
                child: Text(
                  item.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              !isCreator
                  ? (showRankScoreByKey(roomFansKey)
                      ? Container(
                          constraints: BoxConstraints(maxWidth: Util.width - 170),
                          child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: Util.fontFamily,
                              ),
                              children: [
                                TextSpan(
                                  text: '${item.completeNote} ',
                                  style: TextStyle(fontSize: 13, color: const Color(0xFF999999), fontFamily: Util.fontFamily),
                                ),
                                TextSpan(
                                  text: ' ${item.awardCredit}${item.awardNote}',
                                  style: TextStyle(fontSize: 13, color: const Color(0xFF999999), fontFamily: Util.fontFamily),
                                ),
                              ],
                            ),
                          ))
                      : const SizedBox.shrink())
                  : Text(
                      K.room_task_only_fans_cando,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF999999)),
                    ),
            ],
          ),
          const Spacer(),
          if (!isCreator) _buildTaskStatusWidget(item),
        ],
      ),
    );
  }

  Widget _buildTaskStatusWidget(FansTaskItem item) {
    bool hasFinished = item.completeNum == item.maxNum;
    String btnText = '';

    if (hasFinished) {
      btnText = K.room_fans_task_finish;
    } else {
      if (item.label == 'live_sign') {
        btnText = K.room_fans_task_sign;
      } else if (item.label == 'live_listen') {
        btnText = K.room_fans_task_not_finish;
      } else if (item.label == 'live_share') {
        btnText = K.room_fans_task_share;
      } else if (item.label == 'live_gift') {
        btnText = K.room_fans_task_send_gift;
      }
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (hasFinished) return;

        if (item.label == 'live_share') {
          await _onShare(widget.rid);
        } else if (item.label == 'live_gift') {
          if (ModalRoute.of(context)?.isCurrent == true) {
            Navigator.of(context).pop();
          }
          IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
          await giftManager.showRoomGiftPanel(context, room: ChatRoomData.getInstance());
        } else if (item.label == 'live_sign') {
          BaseResponse res = await FansGroupRepo.fansSign(widget.rid);
          if (res.success == true) {
            Fluttertoast.showCenter(msg: K.room_fans_task_sign_success);
            _load();
          } else {
            Fluttertoast.showCenter(msg: res.msg ?? K.room_fans_task_sign_fail);
          }
        }
      },
      child: Container(
        width: 63,
        height: 32,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: AlignmentDirectional.topEnd,
            end: AlignmentDirectional.topStart,
            colors: hasFinished ? [Color(0xFFC9C9C9), Color(0xFFC9C9C9)] : ColorConstant.joinGroupButtonColor,
          ),
        ),
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildRankWidget(int index) {
    return SizedBox(
      width: 40,
      height: 27,
      child: Center(
        child: FansGroupUtil.fansRankWidget(index),
      ),
    );
  }

  Widget _buildRankItem(FansRankItem item, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, item.uid, refer: const PageRefer('/fans_group_page'));
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 10, end: 16, top: 8, bottom: 9),
        height: 65,
        child: Row(
          children: [
            if (showRankByKey(roomFansKey)) ...[
              _buildRankWidget(index),
              const SizedBox(
                width: 5,
              ),
            ],
            CommonAvatar(
              path: item.icon,
              size: 48,
              shape: BoxShape.circle,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: Util.width - 230),
                  child: Text(
                    item.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                FansLabel(item.label ?? '', item.labelImage ?? '', item.labelColors.isNotEmpty ? Util.parseColors(item.labelColors) : []),
              ],
            ),
            const Spacer(),
            if (showRankScoreByKey(roomFansKey))
              NumText(
                //
                '${FansGroupUtil.scoreToString(item.credit.toString())}${K.room_fans_group_score}',
                style: const TextStyle(fontSize: 15, color: Color(0xFFF95A97), fontWeight: FontWeight.w800, fontStyle: FontStyle.italic),
              ),
          ],
        ),
      ),
    );
  }

  //我的粉丝排名信息
  Widget _buildMyRank(FansUserInfo? userInfo) {
    if (userInfo == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
      height: 72,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -4.0),
            blurRadius: 4.0,
            spreadRadius: 0,
            color: Color(0x14000000),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Center(
              child: FansGroupUtil.fansRankWidget(userInfo.rank - 1),
            ),
          ),
          CommonAvatar(
            path: userInfo.icon,
            size: 52,
            shape: BoxShape.circle,
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: Util.width - 240),
                child: Text(
                  userInfo.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              FansLabel(userInfo.label ?? '', userInfo.labelImage ?? '',
                  userInfo.labelColors.isNotEmpty ? Util.parseColors(userInfo.labelColors) : []),
            ],
          ),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              //跳转粉丝积分和粉丝牌说明页
              BaseWebviewScreen.show(context, url: Util.getHelpUrlWithQStr('k29'));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${FansGroupUtil.scoreToString(userInfo.credit.toString())}${K.room_fans_my_rank_score}',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
                Container(
                  width: 32,
                  alignment: AlignmentDirectional.centerStart,
                  child: R.img('fans/fan_my_rank_arrow_right.webp',
                      color: Colors.black, width: 16, height: 16, package: ComponentManager.MANAGER_BASE_ROOM),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
