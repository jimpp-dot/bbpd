import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/widget/vote_result.dart';

class VoteResultDialog extends StatefulWidget {
  final String id;
  final String rid;
  final List<RoomPosition> roomPosition;

  const VoteResultDialog(this.rid, this.id, this.roomPosition, {super.key});

  @override
  State createState() {
    return _VoteResultState();
  }
}

class _VoteResultState extends State<VoteResultDialog> {
  bool _loading = true;
  bool _success = false;
  List? liveList;
  Map<int, List<int>> votes = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    try {
      String url = "${System.domain}roomwolfv2/voteDetail";
      final Map<String, String> params = {"rid": widget.rid, 'id': widget.id};

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      _loading = false;
      Map? res = response.value();
      if (res != null || res['data'] != null) {
        liveList = res['data']['posUserDataMap'];
        List voteList = res['data']['newVoteResultPosMap'];
        for (var element in voteList) {
          if (element['key'] is! int) continue;
          votes[element['key']] = [];
          List? value = element['value'];
          if (value != null && value.isNotEmpty) {
            for (var vl in value) {
              votes[element['key']]!.add(vl);
            }
          }
        }
      }
      if (liveList != null && votes.isNotEmpty) {
        _success = true;
      }
      if (!mounted) {
        return;
      }
      setState(() {});
    } catch (e) {
      Log.d(e.toString());
      if (!mounted) {
        return;
      }
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: const Color(0x00000000),
        insetPadding: const EdgeInsets.only(left: 36, right: 36),
        child: Container(
            height: 448,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(R.imagePath("wolfv2/wolf_vote_result_bg.webp",
                  package: ComponentManager.MANAGER_WERE_WOLF)),
              fit: BoxFit.fill,
            )),
            child: _loading
                ? const Loading()
                : Column(
                    children: <Widget>[
                      Container(
                          height: 34,
                          alignment: AlignmentDirectional.centerEnd,
                          padding: const EdgeInsetsDirectional.only(end: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: R.img('wolfv2/wolf_replay_close_icon.webp',
                                width: 34,
                                height: 34,
                                package: ComponentManager.MANAGER_WERE_WOLF),
                          )),
                      const SizedBox(height: 28),
                      Expanded(
                          child: _success
                              ? SingleChildScrollView(
                                  child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 14, end: 14),
                                  child: VoteResultWidget(votes,
                                      livelist: liveList,
                                      bgColor: const Color(0xFFCCCAE5)),
                                ))
                              : const Center(
                                  child: ErrorData(
                                    error: "服务端数据异常",
                                  ),
                                ))
                    ],
                  )));
  }
}
