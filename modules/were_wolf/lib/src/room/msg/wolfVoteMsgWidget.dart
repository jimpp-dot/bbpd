import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///狼人杀 投票结果消息 显示
class WolfVoteMsgWidget extends StatelessWidget {
  final Map<int, List<int>>? votes;
  final List<int>? loser;

  const WolfVoteMsgWidget({super.key, this.votes, this.loser});

  String getLoserStr() {
    String str = '';
    if (loser != null) {
      for (int i = 0; i < loser!.length; i++) {
        str = str + loser![i].toString();
        if (i != (loser!.length - 1)) {
          str = '$str,';
        }
      }
    }
    return str;
  }

  Widget renderVoterItemCircleWidget(String value) {
    return Container(
      width: 18.0,
      height: 18.0,
      decoration: const BoxDecoration(
        color: Color(0xFF7068D3),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        value,
        style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 12.0,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget renderVoterItemWidget(int key, List<int>? value) {
    List<Widget> res = [];
    if (value != null && value.isNotEmpty) {
      if (key == -1) {
        res.add(SizedBox(
          width: 28.0,
          child: Text(
            R.string('discard'),
            style: const TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 14.0,
            ),
          ),
        ));
      } else {
        res.add(const SizedBox(width: 5.0));
        res.add(renderVoterItemCircleWidget('$key'));
        res.add(const SizedBox(width: 5.0));
      }
      res.add(Padding(
        padding: const EdgeInsets.only(left: 9.0, right: 4.0),
        child: R.img("voter_item_forward_left.png",
            width: 12.0,
            height: 7.0,
            package: ComponentManager.MANAGER_WERE_WOLF),
      ));
      for (var vl in value) {
        res.add(const SizedBox(width: 10.0));
        res.add(renderVoterItemCircleWidget('$vl'));
      }
    }
    if (res.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: res,
      );
    } else {
      return const SizedBox(width: 1.0);
    }
  }

  Widget renderVoterWidget() {
    List<Widget> res = [];
    if (votes != null) {
      int i = 0;
      votes!.forEach((int key, List<int> value) {
        res.add(renderVoterItemWidget(key, value));
        if (i < votes!.length - 1) {
          res.add(const SizedBox(height: 10.0, width: 1.0));
        }
        i++;
      });
    }
    if (res.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: res,
      );
    } else {
      return const SizedBox(width: 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    String ls = getLoserStr();
    return Container(
      padding: const EdgeInsets.only(
          left: 6.0 - 6.0,
          right: 10.0 - 6.0,
          top: 6.0 - 2.5,
          bottom: 6.0 - 2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '${R.string('room_vote_result')}：',
            style: const TextStyle(color: Color(0xFF9B9B9B), fontSize: 14.0),
          ),
          (votes != null && votes!.isNotEmpty)
              ? const SizedBox(height: 8.0, width: 1.0)
              : const SizedBox(width: 1.0),
          renderVoterWidget(),
          (ls.isNotEmpty)
              ? const SizedBox(height: 10.0, width: 1.0)
              : const SizedBox(width: 1.0),
          (ls.isNotEmpty)
              ? Text(
                  R.string('room_num_player_out', args: [ls]),
                  style:
                      const TextStyle(color: Color(0xFF9B9B9B), fontSize: 14.0),
                )
              : const SizedBox(width: 1.0),
        ],
      ),
    );
  }
}
