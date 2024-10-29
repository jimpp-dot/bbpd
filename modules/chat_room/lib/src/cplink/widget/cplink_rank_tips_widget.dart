import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/cplink/model/cplink_repo.dart';
import 'package:chat_room/src/cplink/widget/cplink_rank_dialog.dart';
import 'package:chat_room/src/protobuf/generated/cplink.pb.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';

class CpLinkRankTipsWidget extends StatefulWidget {
  final ChatRoomData room;
  const CpLinkRankTipsWidget({Key? key, required this.room}) : super(key: key);

  @override
  State<CpLinkRankTipsWidget> createState() => _CpLinkRankTipsWidgetState();
}

class _CpLinkRankTipsWidgetState extends State<CpLinkRankTipsWidget> {
  bool _isLoading = false;
  RespCplinkDefendPatRankIndex? _rankData;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _requestData();
    widget.room.addListener(RoomConstant.Event_Refresh, _handleMsg);
  }

  @override
  void dispose() {
    widget.room.removeListener(RoomConstant.Event_Refresh, _handleMsg);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading ||
        ((_rankData?.leftUser.name.isEmpty ?? true) &&
            (_rankData?.rightUser.name.isEmpty ?? true))) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {
        CpLinkRankDialog.show(context);
      },
      child: Container(
        height: 32,
        clipBehavior: Clip.none,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            PositionedDirectional(
              top: -6,
              start: 0,
              end: 0,
              bottom: 0,
              child: R.img(
                RoomAssets.chat_room$cplink_cplink_tips_bg_webp,
                height: 39,
                width: 60.dp,
                fit: BoxFit.fill,
              ),
            ),
            PositionedDirectional(
                top: 8,
                start: 4,
                end: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 28,
                      height: 20,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PositionedDirectional(
                            start: 0,
                            top: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xff8F55E0),
                                  borderRadius: BorderRadius.circular(8)),
                              child: CommonAvatar(
                                path: Util.getRemoteImgUrl(
                                    _rankData?.leftUser.icon ?? ''),
                                size: 15,
                                borderRadius: BorderRadius.circular(7.5),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            start: 12,
                            top: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xff8F55E0),
                                  borderRadius: BorderRadius.circular(8)),
                              child: CommonAvatar(
                                path: Util.getRemoteImgUrl(
                                    _rankData?.rightUser.icon ?? ''),
                                size: 15,
                                borderRadius: BorderRadius.circular(7.5),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            bottom: 0,
                            child: R.img(
                              RoomAssets.chat_room$cplink_cplink_tips_icon_webp,
                              width: 12,
                              height: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 5),
                      child: TextScroll(
                        "${_rankData?.leftUser.name ?? ''}与${_rankData?.rightUser.name ?? ''}${_rankData?.content ?? ''}",
                        mode: TextScrollMode.endless,
                        velocity:
                            const Velocity(pixelsPerSecond: Offset(10, 0)),
                        delayBefore: const Duration(milliseconds: 500),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 9, height: 1),
                      ),
                    ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void _requestData() async {
    _rankData = await CpLinkRepo.getCpLinkEnterData(widget.room.rid);
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  _handleMsg(String type, dynamic data) {
    if (type == RoomConstant.Event_Refresh) {
      _requestData();
    }
  }
}
