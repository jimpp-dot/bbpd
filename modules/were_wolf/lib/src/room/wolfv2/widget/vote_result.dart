import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../../k.dart';

class VoteResultWidget extends StatelessWidget {
  final Map<int, List<int>>? votes;
  final List? livelist;
  final bool showAvatar;
  final Color bgColor;

  const VoteResultWidget(this.votes,
      {super.key,
      this.showAvatar = true,
      this.livelist,
      this.bgColor = const Color(0xFFCCCAE5)});

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];
    if (votes != null) {
      int i = 0;
      votes!.forEach((int key, List<int> value) {
        if (showAvatar) {
          res.add(renderVoterItemWidget(key, value));
          if (i < votes!.length - 1) {
            res.add(const SizedBox(height: 8));
          }
        } else {
          res.add(renderVoterNoAvatarItemWidget(key, value));
          if (i < votes!.length - 1) {
            res.add(const SizedBox(height: 10));
          }
        }
        i++;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: res,
    );
  }

  Widget renderVoterNoAvatarItemWidget(int key, List<int>? value) {
    List<Widget> res = [];
    if (value != null && value.isNotEmpty) {
      if (key == -1) {
        res.add(Text(
          K.wolf_give_up_vote_no_avatar,
          style: const TextStyle(
            color: Color(0xFFF8B32D),
            fontSize: 12,
          ),
        ));
      } else {
        res.add(Text(
          '【${key + 1}】',
          style: const TextStyle(
            color: Color(0xFFF8B32D),
            fontSize: 12,
          ),
        ));
      }

      res.add(R.img("wolf_notice_vote_left.svg",
          width: 16, height: 8, package: ComponentManager.MANAGER_WERE_WOLF));
      List<Widget> widgets = [];
      for (var vl in value) {
        widgets.add(Text(
          '【${vl + 1}】',
          style: const TextStyle(
            color: Color(0xFFF8B32D),
            fontSize: 12,
          ),
        ));
      }

      res.add(Expanded(
          child: Wrap(
        runSpacing: 10.0,
        children: widgets,
      )));
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: res,
    );
  }

  Widget renderVoterItemWidget(int key, List<int>? value) {
    List<Widget> res = [];
    if (value != null && value.isNotEmpty) {
      if (key == -1) {
        res.add(Container(
          width: 55.0,
          height: 64,
          alignment: AlignmentDirectional.centerEnd,
          child: Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.5),
                color: const Color(0xFF6E58C4),
              ),
              alignment: Alignment.center,
              child: Text(K.wolf_give_up_vote,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600))),
        ));
      } else {
        res.add(Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 7),
            child: renderVoterItemCircleWidget(key)));
      }
      res.add(const SizedBox(width: 5));
      res.add(Container(
          width: 9,
          height: 64,
          alignment: Alignment.center,
          child: R.img("wolfv2/voter_item_forward_left.svg",
              width: 9,
              height: 15,
              package: ComponentManager.MANAGER_WERE_WOLF)));
      res.add(const SizedBox(width: 5));
      List<Widget> widgets = [];
      for (var vl in value) {
        widgets.add(renderVoterItemCircleWidget(vl));
      }
      res.add(Expanded(
          child: Container(
              padding: const EdgeInsetsDirectional.only(
                  top: 8, bottom: 8, start: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: bgColor,
              ),
              child: Wrap(
                runSpacing: 8.0,
                spacing: 12.0,
                children: widgets,
              ))));
    }
    if (res.isNotEmpty) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: res,
      );
    } else {
      return Container(
        width: 1.0,
      );
    }
  }

  Widget renderVoterItemCircleWidget(int position) {
    if (livelist == null || position >= livelist!.length) {
      return Container();
    }
    Map? data = livelist![position];
    if (data == null) {
      return Container();
    }
    int uid = Util.parseInt(data['uid']);
    String icon = data['icon'];
    return SizedBox(
      width: 48.0,
      height: 48.0,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Session.uid == uid
                    ? const Color(0xFFFFCF71)
                    : const Color(0xFFA295DF),
              ),
            ),
            child: CommonAvatar(
              path: icon,
              size: 44,
              shape: BoxShape.circle,
            ),
          ),
          PositionedDirectional(
              start: -7,
              bottom: 0,
              child: Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(R.imagePath(
                      Session.uid == uid
                          ? "wolfv2/user_icon/wolf_position_self_bg.webp"
                          : "wolfv2/user_icon/wolf_position_bg.webp",
                      package: ComponentManager.MANAGER_WERE_WOLF)),
                  fit: BoxFit.fill,
                )),
                child: Text(
                  Session.uid == uid ? K.wolf_self_position : "${position + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
