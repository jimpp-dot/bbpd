import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/common_room_heartrace.pb.dart';
import '../model/heart_race_repo.dart';

/// 心跳竞速：关系选择弹窗
class HeartRaceSelectRelation extends StatefulWidget {
  final bool isReception;
  final int rid;
  final int index;
  final MicPair pair;
  const HeartRaceSelectRelation(
      {super.key,
      required this.isReception,
      required this.rid,
      required this.index,
      required this.pair});

  @override
  HeartRaceSelectRelationState createState() {
    return HeartRaceSelectRelationState();
  }

  static void show(
      {required BuildContext context,
      required bool isReception,
      required int rid,
      required int index,
      required MicPair pair}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HeartRaceSelectRelation(
          isReception: isReception,
          rid: rid,
          index: index,
          pair: pair,
        );
      },
    );
  }
}

class HeartRaceSelectRelationState extends State<HeartRaceSelectRelation> {
  double width = 335;
  double height = 416;

  HeartRelaionConfig? config;
  int selectId = -1;

  @override
  void initState() {
    super.initState();

    if (Util.width < 335 + 40) {
      width = Util.width - 40;
    }

    if (widget.isReception != true) {
      height = 361;
    }

    loadData();
  }

  void loadData() async {
    ResHeartRaceRelationConfig res =
        await HeartRaceRepo.relationConfig(widget.rid, widget.index);
    if (mounted) {
      if (res.success == true && res.hasConfig()) {
        setState(() {
          config = res.config;
        });
      } else if (Util.validStr(res.msg)) {
        Fluttertoast.showCenter(msg: res.msg);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(18),
          gradient: const LinearGradient(
              colors: [Color(0xFF4553FF), Color(0xFF9572FF)]),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(
                  'static/room/heart_race/heart_race_dialog_bg.webp'),
              width: width,
              height: width * 330 / 335,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text(
                  K.room_heart_race_select_relation,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildIconAndName(widget.pair.left),
                    const SizedBox(
                      width: 5,
                    ),
                    buildIconAndName(widget.pair.right),
                  ],
                ),
                if (config != null) ...[
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    K.room_heart_race_select_relation_tips(
                        ['${(config!.relationDuration / 86400).floor()}']),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFF8D3F2),
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    width: width,
                    height: 152,
                    child: buildRelations(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (widget.isReception) buildButton(),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconAndName(MicItem item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.white.withOpacity(0.2)),
          ),
          alignment: AlignmentDirectional.center,
          child: CommonAvatar(
            path: item.icon,
            shape: BoxShape.circle,
            size: 56,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 60,
          alignment: AlignmentDirectional.center,
          child: Text(
            item.name,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget buildRelations() {
    return GridView.builder(
      padding: const EdgeInsetsDirectional.only(
          top: 8, bottom: 10, start: 30, end: 30),
      itemCount: config!.relationList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 24,
        childAspectRatio: 150 / 40,
      ),
      itemBuilder: (BuildContext context, int index) {
        HeartRelationItem item = config!.relationList[index];
        return GestureDetector(
          onTap: () {
            if (widget.isReception) {
              refresh(() {
                selectId = item.id;
              });
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(17),
              color: selectId == item.id ? null : Colors.black.withOpacity(0.2),
              gradient: selectId == item.id
                  ? const LinearGradient(
                      colors: [Color(0xFFFF96F4), Color(0xFFFF61D6)],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                    )
                  : null,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              item.name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 130,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(24),
              color: const Color(0xFFF5F5F5),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.cancel,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xB2202020),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        GestureDetector(
          onTap: () {
            selectRelation(selectId);
          },
          child: Container(
            width: 130,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(24),
              gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.sure,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool selecting = false;
  void selectRelation(int id) async {
    if (selecting) {
      return;
    }
    selecting = true;
    NormalNull res = await HeartRaceRepo.chooseRelation(
        widget.rid, id, config?.relationDuration ?? 0, widget.index);
    if (!mounted) {
      return;
    }
    if (res.success == true) {
      Navigator.pop(context);
    } else if (Util.validStr(res.msg)) {
      Fluttertoast.showCenter(msg: res.msg);
    }
    selecting = false;
  }
}
