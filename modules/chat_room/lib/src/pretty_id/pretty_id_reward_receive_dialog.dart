import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

import 'model/generated/common_attribution.pb.dart';
import 'model/pretty_id_repo.dart';

class PrettyIdRewardReceiveDialog extends StatefulWidget {
  final List<AttributionBag> bags;
  final String description;

  const PrettyIdRewardReceiveDialog(
      {super.key, required this.bags, this.description = ''});

  @override
  State<PrettyIdRewardReceiveDialog> createState() =>
      _PrettyIdRewardReceiveDialogState();

  static void show(BuildContext? context) async {
    if (!Session.isLogined) return;
    ResAttributionReward resp = await PrettyIdRepo.attributionPopUpReward();
    if (resp.success &&
        resp.hasData() &&
        Util.parseBool(resp.data.pop) == true &&
        !Util.isCollectionEmpty(resp.data.bags)) {
      PrettyIdRewardReceiveDialog._show(
          context, resp.data.bags, resp.data.description);
    }
  }

  static Future<void> _show(BuildContext? context, List<AttributionBag> bags,
      String description) async {
    if (!Session.isLogined) return;
    showDialog(
      context: context ?? System.context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content:
              PrettyIdRewardReceiveDialog(bags: bags, description: description),
        );
      },
    );
  }
}

class _PrettyIdRewardReceiveDialogState
    extends State<PrettyIdRewardReceiveDialog> {
  int? selectIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0xFFFFF1DE), Color(0xFFE0B881)],
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            top: -30,
            end: -20,
            child: R.img(
              RoomAssets.chat_room$pretty_id_top_right_corner_silk_ribbon_webp,
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 104,
              height: 100,
            ),
          ),
          PositionedDirectional(
            top: 60,
            start: 0,
            child: R.img(
              RoomAssets.chat_room$pretty_id_round_dot_1_webp,
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 54,
              height: 49,
            ),
          ),
          PositionedDirectional(
            top: 72,
            end: 15,
            child: R.img(
              RoomAssets.chat_room$pretty_id_round_dot_2_webp,
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 15,
              height: 15,
            ),
          ),
          PositionedDirectional(
            bottom: 58,
            end: 0,
            child: R.img(
              RoomAssets.chat_room$pretty_id_round_dot_3_webp,
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 37,
              height: 49,
            ),
          ),
          PositionedDirectional(
            bottom: -20,
            start: -20,
            child: R.img(
              RoomAssets
                  .chat_room$pretty_id_bottom_left_corner_silk_ribbon_webp,
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: 104,
              height: 100,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                K.room_pretty_id_reward_title,
                style: const TextStyle(
                    color: Color(0xFF523609),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Text(
                K.room_pretty_id_reward_desc,
                style: TextStyle(
                    color: const Color(0xFF523609).withOpacity(0.8),
                    fontSize: 11),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 32),
                      R.img(
                        RoomAssets.chat_room$pretty_id_gift_reward_webp,
                        package: ComponentManager.MANAGER_BASE_ROOM,
                        width: 58,
                        height: 58,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.description,
                          style: const TextStyle(
                              color: Color(0xFF523609), fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 26),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                K.room_pretty_id_get_reward_desc,
                style: TextStyle(
                    color: const Color(0xFF523609).withOpacity(0.8),
                    fontSize: 11),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: widget.bags.length > 2
                        ? 121.0 * 2 + 12 + 4
                        : 121.0 * widget.bags.length + 4),
                child: ListView(
                  children: [
                    for (int i = 0; i < widget.bags.length; i++) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          height: 121,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectIndex = i;
                                  });
                                },
                                child: Container(
                                  height: 113,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      border: (selectIndex != null &&
                                              i == selectIndex)
                                          ? Border.all(
                                              color: const Color(0xFFBE9966),
                                              width: 2)
                                          : null),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        for (int j = 0;
                                            j < widget.bags[i].rewards.length;
                                            j++)
                                          _buildGiftItem(
                                              widget.bags[i].rewards[j])
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 58.0),
                child: GestureDetector(
                  onTap: () async {
                    if (selectIndex == null ||
                        Util.isCollectionEmpty(widget.bags)) return;
                    int rewardId = widget.bags[selectIndex!].id;
                    ResClaimReward resp =
                        await PrettyIdRepo.attributionClaimReward(rewardId);
                    if (resp.success) {
                      Fluttertoast.showCenter(msg: K.room_get_success);
                      Navigator.of(context).pop();
                    } else {
                      Fluttertoast.showCenter(
                          msg: Util.validStr(resp.msg)
                              ? resp.msg
                              : K.room_lucky_bag_get_fail);
                    }
                  },
                  child: Container(
                    height: 48,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF583500)
                              .withOpacity(selectIndex == null ? 0.5 : 1),
                          const Color(0xFF87642E)
                              .withOpacity(selectIndex == null ? 0.5 : 1),
                        ],
                      ),
                    ),
                    child: Text(
                      K.room_confirm_receive,
                      style: TextStyle(
                          color: Colors.white
                              .withOpacity(selectIndex == null ? 0.5 : 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildGiftItem(AttributionReward reward) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: R.color.secondBgColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: R.img(Util.getRemoteImgUrl(reward.icon),
              fit: BoxFit.cover, width: 52, height: 52),
        ),
        const SizedBox(height: 4),
        Text(
          reward.name,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 11.0,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          'X${reward.num}',
          style: TextStyle(
              color: R.color.mainTextColor.withOpacity(0.6), fontSize: 9.0),
        ),
      ],
    );
  }
}
