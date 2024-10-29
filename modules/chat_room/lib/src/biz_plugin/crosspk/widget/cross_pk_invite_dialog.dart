import 'package:chat_room/k.dart';
import 'package:shared/dart_extensions/widget/box_extension.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';

/// 邀请弹窗
class CrossPKInviteDialog extends StatefulWidget {
  final int rid;
  final RoomCrossPkInviteMessage data;

  const CrossPKInviteDialog({
    Key? key,
    required this.rid,
    required this.data,
  }) : super(key: key);

  @override
  _CrossPKInviteDialogState createState() {
    return _CrossPKInviteDialogState();
  }

  static Future<void> show(
      {required BuildContext context, required int rid, Object? data}) async {
    if (data is Map && data.containsKey('pb')) {
      RoomCrossPkInviteMessage message =
          RoomCrossPkInviteMessage.fromBuffer(List<int>.from(data['pb']));
      return showDialog(
        context: context,
        builder: (context) {
          return CrossPKInviteDialog(rid: rid, data: message);
        },
        barrierDismissible: false,
        routeSettings: const RouteSettings(name: 'CrossPKInviteDialog'),
      );
    }
  }
}

class _CrossPKInviteDialogState extends State<CrossPKInviteDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: widget.data.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_TOWER
          ? Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topCenter,
              children: [
                _buildBody(),
                PositionedDirectional(
                  top: -65,
                  child: R.img(
                    'ic_laya_tower_pk.webp',
                    width: 134,
                    height: 80,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
              ],
            )
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    String title = K.room_you_matched_a_2rooms_invitation;
    if (widget.data.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_TOWER) {
      title = K.room_you_matched_a_tower_invitation;
    } else if (widget.data.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_3) {
      title = K.room_you_matched_a_3rooms_invitation;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 24),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF313131),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsetsDirectional.all(16),
          decoration: commonBoxDecorationWithParamsBeginAndEnd([
            const Color(0xFFF17A7A).withOpacity(0.1),
            const Color(0xFF6A87FF).withOpacity(0.1)
          ], 12, Alignment.centerLeft, Alignment.centerRight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildUserRow(widget.data.inviter),
              Container(
                height: 0.5,
                color: const Color(0x14202020),
              ),
              if (widget.data.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_3) ...[
                if (widget.data.target.isNotEmpty)
                  _buildUserRow(widget.data.target.first)
                else
                  _buildMatchingRow(),
                Container(
                  height: 0.5,
                  color: const Color(0x14202020),
                ),
              ],
              const SizedBox(height: 7),
              // 惩罚内容
              if (widget.data.setting.hasPunishment())
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 7),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        K.room_gpk_punish,
                        style: TextStyle(
                          color: const Color(0xFF313131).withOpacity(0.6),
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        widget.data.setting.punishment,
                        style: const TextStyle(
                            color: Color(0xFF313131),
                            fontWeight: FontWeight.w500,
                            height: 1),
                      ),
                    ],
                  ),
                ),
              // 支持金币礼物
              if (widget.data.setting.coinEnable == 1)
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsetsDirectional.only(
                      start: 3, end: 6, top: 3, bottom: 3),
                  margin: const EdgeInsetsDirectional.only(bottom: 7),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      R.img(
                        RoomAssets.chat_room$live_live_pk_gold_webp,
                        width: 14,
                        height: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        K.room_this_pk_supports_coin_gift,
                        style: const TextStyle(
                            color: Color(0xB3202020), fontSize: 9),
                      ),
                    ],
                  ),
                ),
              ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(12),
                  bottomEnd: Radius.circular(12),
                ).resolve(Directionality.of(context)),
                child: PkScoreWidget.noScore(),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GradientButton(
              K.room_refuse_pk,
              onTap: () {
                CrossPKRepo.reject(
                  widget.rid,
                  widget.data.inviter.rid,
                  mode: widget.data.mode,
                  inviteMode: widget.data.inviteMode,
                  version: widget.data.version,
                );
                Navigator.of(context).maybePop();
              },
              colors: const [
                Color(0xFFE5E5E5),
                Color(0xFFE5E5E5),
              ],
              width: 120,
              height: 48,
              textStyle:
                  const TextStyle(color: Color(0xB3202020), fontSize: 15),
            ),
            const SizedBox(width: 12),
            GradientButton(
              K.room_accept_pk,
              onTap: () {
                CrossPKRepo.accept(
                  widget.rid,
                  widget.data.inviter.rid,
                  mode: widget.data.mode,
                  inviteMode: widget.data.inviteMode,
                  version: widget.data.version,
                );
                Navigator.of(context).maybePop();
              },
              colors: const [Color(0xFF60FFF5), Color(0xFF9EFF4E)],
              width: 120,
              height: 48,
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
          child: _buildTimer(),
        ),
      ],
    );
  }

  Widget _buildUserRow(RoomCrossPkRole role) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 12, end: 8, top: 12, bottom: 12),
          child: CommonAvatar(
            path: role.icon,
            size: 52,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      role.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xFF242528),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 4),
                    child: UserSexAndAgeWidget(sex: role.sex, age: role.age),
                  ),
                ],
              ),
              RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style:
                      const TextStyle(color: Color(0x99313131), fontSize: 13),
                  // text: '房间有',
                  children: [
                    TextSpan(
                      text: Util.numberToSizeString(role.audience, fix: 1),
                      style: const TextStyle(
                        color: Color(0xFF242528),
                      ),
                    ),
                    TextSpan(
                      text: K.live_pk_agree_count_person,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (role.rid == widget.data.inviter.rid)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GradientButton(
              K.room_initiator,
              colors: const [Color(0xFF60FFF5), Color(0xFF9EFF4E)],
              width: 63,
              height: 28,
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
      ],
    );
  }

  /// 混战补位
  Widget _buildMatchingRow() {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          margin: const EdgeInsetsDirectional.only(
              start: 12, end: 8, top: 12, bottom: 12),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0x0A313131),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.add_rounded,
            color: Color(0xFFCDC6CF),
            size: 24,
          ),
        ),
        Text(
          K.room_cross_pk_target_is_coming,
          style: const TextStyle(color: Color(0x99313131), fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildTimer() {
    int timer = 10;
    if (timer <= 0) {
      return const SizedBox.shrink();
    }

    return TimerWidget(
      stop: Duration(seconds: timer),
      onTick: () {
        timer--;
        if (timer <= 0) {
          if (ModalRoute.of(context)?.isActive ?? false) {
            Navigator.of(context).maybePop();
          }
        }
      },
      builder: (context) {
        return Text(
          widget.data.actionWhenTimeout == 0
              ? K.live_pk_agree_timer(['$timer'])
              : K.room_live_pk_refuse_timer(['$timer']),
          style: const TextStyle(color: Color(0x99313131), fontSize: 12),
        );
      },
    );
  }
}
