import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/auction/model/auction_gift_bean.dart';
import 'package:chat_room/src/auction/model/auction_repo.dart';
import 'package:chat_room/src/auction/widget/auction_failure_dialog.dart';
import 'package:chat_room/src/auction/widget/auction_success_dialog.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';
import 'package:flutter/material.dart';

import 'auction_diy_apply_dialog.dart';
import 'auction_diy_relation_widget.dart';
import 'auction_gift_dialog.dart';
import 'auction_middle_widget.dart';
import 'auction_settings_sheet.dart';
import 'auction_total_progress_widget.dart';
import 'auction_user_widget.dart';
import 'bidder_widget.dart';

/// 拍卖房主入口
class AuctionMainWidget extends StatefulWidget {
  final ChatRoomData room;

  const AuctionMainWidget({Key? key, required this.room}) : super(key: key);

  @override
  _AuctionMainWidgetState createState() {
    return _AuctionMainWidgetState();
  }
}

class _AuctionMainWidgetState extends State<AuctionMainWidget> {
  AuctionConfigMessage? _auctionData;

  final DialogLoadingController _loadingController = DialogLoadingController();

  @override
  void initState() {
    super.initState();
    widget.room.addListener(
        '${RoomConstant.Event_Prefix}auction.sync', _onAuctionSyncEvent);
    widget.room.addListener('${RoomConstant.Event_Prefix}auction.gift.received',
        _onAuctionGiftReceivedEvent);
    widget.room.addListener('${RoomConstant.Event_Prefix}auction.stage.effect',
        _onAuctionResultEvent);
    widget.room.addListener(
        '${RoomConstant.Event_Prefix}auction.defend.diy.emit',
        _onAuctionDiyEvent);
    _load();
  }

  @override
  void dispose() {
    widget.room.removeListener(
        '${RoomConstant.Event_Prefix}auction.sync', _onAuctionSyncEvent);
    widget.room.removeListener(
        '${RoomConstant.Event_Prefix}auction.gift.received',
        _onAuctionGiftReceivedEvent);
    widget.room.removeListener(
        '${RoomConstant.Event_Prefix}auction.stage.effect',
        _onAuctionResultEvent);
    widget.room.removeListener(
        '${RoomConstant.Event_Prefix}auction.defend.diy.emit',
        _onAuctionDiyEvent);
    super.dispose();
  }

  void _load() async {
    RespAuctionConfig rsp = await AuctionRepo.loadData(widget.room.rid);
    if (!mounted) return;
    if (rsp.success) {
      _auctionData = rsp.data;
      setState(() {});
    } else {
      Toast.show(context, rsp.message);
    }
  }

  void _onAuctionSyncEvent(String name, dynamic data) {
    if (data is Map) {
      try {
        AuctionConfigMessage? config;
        if (data.containsKey('pb')) {
          config = AuctionConfigMessage.fromBuffer(List<int>.from(data['pb']));
        }
        if (config != null && mounted) {
          Log.d(config.toProto3Json());
          setState(() {
            _auctionData = config;
          });
        }
      } catch (e, st) {
        Log.e(e, stackTrace: st);
      }
    }
  }

  void _onAuctionDiyEvent(String name, dynamic value) {
    if (value is Map) {
      try {
        AuctionDefendDiyEmitMessage? data;
        if (value.containsKey('pb')) {
          data = AuctionDefendDiyEmitMessage.fromBuffer(
              List<int>.from(value['pb']));
        }
        if (data != null && data.targetUid == Session.uid) {
          Log.d(data.toProto3Json());
          AuctionDiyApplyDialog.show(context, data: data);
        }
      } catch (e, st) {
        Log.e(e, stackTrace: st);
      }
    }
  }

  /// 关系升级获得礼物
  void _onAuctionGiftReceivedEvent(String name, dynamic data) {
    _loadingController.close();
    Log.d(data);
    if (data is Map) {
      try {
        AuctionGiftBean auctionGift = AuctionGiftBean.fromJson(data);
        if (mounted) {
          DialogQueue.root.enqueue(
              context: context,
              builder: (context) {
                return AuctionGiftDialog(data: auctionGift);
              });
        }
      } catch (e, st) {
        Log.e(e, stackTrace: st);
      }
    }
  }

  /// 拍卖结果
  void _onAuctionResultEvent(String name, dynamic data) {
    _loadingController.close();
    if (data is Map) {
      try {
        AuctionStageEffectMessage? result;
        if (data.containsKey('pb')) {
          result =
              AuctionStageEffectMessage.fromBuffer(List<int>.from(data['pb']));
          if (mounted) {
            Log.d(result.toProto3Json());
            if (result.stage == AuctionStatus.UPGRADE) {
              // 拍卖成功
              AuctionSuccessDialog.show(context, result);
            } else if (result.stage == AuctionStatus.AUCTION) {
              // 拍卖失败
              if (result.url.isNotEmpty) {
                AuctionFailureDialog.show(context, result);
              }
            }
          }
        }
      } catch (e, st) {
        Log.e(e, stackTrace: st);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTopRow(),
            _buildAuctionRow(),
            _buildBottomRow(),
            _buildUserList(),
          ],
        ),
        if (_auctionData?.status == AuctionStatus.UPGRADE)
          AuctionDiyRelationWidget(auctionData: _auctionData!),
      ],
    );
  }

  /// 接待位、嘉宾位、竞拍阶段
  Widget _buildTopRow() {
    RoomPosition pos0 = widget.room.positions[0]; // 接待位
    RoomPosition pos2 = widget.room.positions[2]; // 嘉宾位
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  UserIcon(
                    size: 48,
                    room: widget.room,
                    position: pos0,
                    border:
                        const BorderSide(color: Color(0xFFF863D3), width: 2),
                  ),
                  PositionedDirectional(
                    bottom: -5,
                    child: Container(
                      width: 26,
                      height: 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFE62A5),
                            Color(0xFFF86AFF),
                          ],
                        ),
                      ),
                      child: Text(
                        K.room_reception,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 50),
                margin: const EdgeInsetsDirectional.only(top: 6),
                child: _buildTitle((pos0.name.isNotEmpty)
                    ? pos0.name
                    : K.room_wait_for_seated),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 138.dp,
                      height: 35.dp,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              RoomAssets.chat_room$auction_logo_bg_webp),
                          fit: BoxFit.contain,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        K.room_auction_main_slogan,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildStep(K.room_auction_setting, AuctionStatus.SETTING),
                    _buildStepLine(),
                    _buildStep(
                        K.room_auction_step_auction, AuctionStatus.AUCTION),
                    // 守护关系拍卖 才显示 升级环节
                    if ((_auctionData?.mode ?? 0) == 0) ...[
                      _buildStepLine(),
                      _buildStep(
                          K.room_auction_step_upgrade, AuctionStatus.UPGRADE),
                    ],
                  ],
                ),
                _buildStepControlRow(),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  UserIcon(
                    size: 48,
                    room: widget.room,
                    position: pos2,
                    border:
                        const BorderSide(color: Color(0xFF71C7F9), width: 2),
                  ),
                  PositionedDirectional(
                    bottom: -5,
                    child: Container(
                      width: 26,
                      height: 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF6FB7FF),
                            Color(0xFF74D8F4),
                          ],
                        ),
                      ),
                      child: Text(
                        K.room_guest_title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 50),
                margin: const EdgeInsetsDirectional.only(top: 6),
                child: _buildTitle((pos2.name.isNotEmpty)
                    ? pos2.name
                    : K.room_wait_for_seated),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep(String text, AuctionStatus status) {
    String bg = RoomAssets.chat_room$auction_ic_current_step_svg;
    Color textColor = Colors.white;
    if (_auctionData?.status == status) {
      bg = RoomAssets.chat_room$auction_ic_current_step_svg;
      textColor = Colors.white;
    } else if (status.value < (_auctionData?.status.value ?? 0)) {
      bg = RoomAssets.chat_room$auction_ic_complete_step_svg;
      textColor = Colors.white70;
    } else {
      bg = RoomAssets.chat_room$auction_ic_coming_step_svg;
      textColor = const Color(0xFF53008E);
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        R.img(
          bg,
          width: 56,
          height: 16,
          fit: BoxFit.fill,
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine() {
    return Container(
      width: 12,
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFD99BFC).withOpacity(0.6),
            const Color(0xFFE1A0FD).withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  /// 倒计时以及回合控制
  Widget _buildStepControlRow() {
    AuctionStatus? status = _auctionData?.status;
    if (status != AuctionStatus.AUCTION && status != AuctionStatus.UPGRADE) {
      return const SizedBox.shrink();
    }
    int diff = max(_auctionData!.endline - widget.room.timestamp, 0);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 拍卖阶段及亲密升级阶段展示倒计时
          Container(
            width: 55,
            height: 18,
            margin: const EdgeInsetsDirectional.only(end: 8),
            decoration: BoxDecoration(
              color: const Color(0x7A000000),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img(
                  RoomAssets.chat_room$auction_ic_stopwatch_svg,
                  width: 12,
                  height: 12,
                ),
                TimerWidget(
                  stop: Duration(seconds: diff),
                  onTick: () {
                    if (diff > 0) diff--;
                  },
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(start: 3),
                      child: Text(
                        Util.formatTimeToMinute(diff),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          if (widget.room.isReception ||
              Session.uid == widget.room.positions[0].uid)
            GestureDetector(
              onTap: () async {
                _loadingController.show(context: context);
                RespAuctionConfig rsp =
                    await AuctionRepo.end(widget.room.rid, _auctionData!.vvc);
                _loadingController.close();
                if (rsp.success) {
                  // pass
                } else {
                  Toast.show(context, rsp.message);
                }
              },
              child: Container(
                width: 70,
                height: 18,
                decoration: BoxDecoration(
                  color: const Color(0x7A000000),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    R.img(
                      RoomAssets.chat_room$auction_ic_close_svg,
                      width: 12,
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 3),
                      child: Text(
                        K.room_auction_round_end,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// 拍卖信息
  Widget _buildAuctionRow() {
    if (_auctionData == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topStart,
        children: [
          SizedBox(width: Util.width), // 撑大Stack布局宽度
          // 拍卖人
          AuctionUserWidget(room: widget.room, auctionData: _auctionData!),
          // 竞拍人
          PositionedDirectional(
            end: 0,
            child: BidderWidget(room: widget.room, auctionData: _auctionData!),
          ),
          // 中间
          Center(
              child: AuctionMiddleWidget(
                  auctionData: _auctionData!, room: widget.room)),
        ],
      ),
    );
  }

  Widget _buildBottomRow() {
    RoomPosition auctionPos =
        widget.room.positions[widget.room.auctionPosition];
    AuctionStatus? status = _auctionData?.status;
    if (status == AuctionStatus.SETTING && auctionPos.uid == Session.uid) {
      // 只有拍卖人才能设置
      return Padding(
        padding: const EdgeInsets.only(top: 27, bottom: 16),
        child: GestureDetector(
          onTap: () {
            AuctionSettingsSheet.show(
                context: context, rid: widget.room.rid, vvc: _auctionData!.vvc);
          },
          child: Container(
            width: 146,
            height: 52,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(RoomAssets.chat_room$auction_big_btn_webp),
                fit: BoxFit.contain,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              K.room_auction_setting,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    } else if (status == AuctionStatus.AUCTION) {
      return Padding(
        padding: const EdgeInsets.only(top: 27, bottom: 16),
        child: GestureDetector(
          onTap: () {
            if (_auctionData?.commodity.cid == 25 &&
                Session.vipNew < 15 &&
                Session.popularityLevel < 15) {
              // 羁绊关系等级限制
              Fluttertoast.showCenter(msg: K.auction_jibang_need_viplevel);
              return;
            }

            // 打赏给拍卖人
            int uid = auctionPos.uid;
            if (uid == 0) {
              // 离线
              uid = _auctionData!.auctionUser.uid;
            }
            String? refer = 'auction_start_${_auctionData!.mode}';
            if (uid == Session.uid) {
              refer = null;
            }
            IGiftManager giftManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_GIFT);
            giftManager.showRoomGiftPanel(context,
                room: widget.room, uid: uid, refer: refer);
          },
          child: Container(
            width: 146,
            height: 52,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(RoomAssets.chat_room$auction_big_btn_webp),
                fit: BoxFit.contain,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              K.room_click_to_auction,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    } else if (status == AuctionStatus.UPGRADE) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 6),
        child: AuctionTotalProgressWidget(auctionData: _auctionData!),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildUserList() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 8, start: 12, end: 12, bottom: 8),
      child: Row(
        children: [
          Expanded(child: _buildUserIcon(widget.room.positions[3])),
          Expanded(child: _buildUserIcon(widget.room.positions[4])),
          Expanded(child: _buildUserIcon(widget.room.positions[5])),
          Expanded(child: _buildUserIcon(widget.room.positions[6])),
        ],
      ),
    );
  }

  Widget _buildUserIcon(RoomPosition pos) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserIcon(
          size: 48,
          room: widget.room,
          position: pos,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 6, start: 2, end: 2),
          child: _buildTitle(
              (pos.name.isNotEmpty) ? pos.name : K.room_wait_for_seated),
        ),
      ],
    );
  }

  Widget _buildTitle(String name) {
    return Text(
      name,
      style: const TextStyle(color: Colors.white, fontSize: 9, height: 1),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
