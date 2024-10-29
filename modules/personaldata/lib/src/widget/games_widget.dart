import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/model/profile_model.dart';

/// 小游戏/语音约战
class SmallGamesWidget extends StatelessWidget {
  final int uid;
  final ProfileBean? data;

  const SmallGamesWidget({
    Key? key,
    this.data,
    this.uid = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container();
    }
    List<GameBean> games = data!.games!;

    if (games.isEmpty) {
      return Container();
    }

    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          color: R.color.dividerColor,
          height: 0.5,
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 18.0, top: 16.0, right: 16.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  R.string('voice_battle'),
                  style: R.textStyle.title.copyWith(fontSize: 15),
                ),
              ),
              Text(
                R.string('achieving_rate'),
                style: TextStyle(color: R.color.thirdTextColor, fontSize: 12.0),
              ),
              Container(
                width: 2.0,
              ),
              Text(
                "${data?.completeRate}%",
                style:
                    TextStyle(color: R.color.thirdBrightColor, fontSize: 12.0),
              ),
            ],
          ),
        ),
        Container(
          height: 100.0,
          margin: const EdgeInsets.only(bottom: 16.0),
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 21.0, right: 6.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              GameBean item = games.elementAt(index);
              return InkWell(
                onTap: () async {
                  if (Session.isLogined == false) {
                    ILoginManager loginManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_LOGIN);
                    loginManager.show(context);
                    return;
                  }
                  if (!(Session.uid == uid)) {
                    await Im.sendGameMessage(uid.toString(), item.id ?? '');
                    IChatManager chatManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_CHAT);
                    chatManager.openUserChatScreen(
                      context,
                      type: 'private',
                      targetId: uid,
                      title: '',
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.only(end: 10.0),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                        child: CachedNetworkImage(
                          width: 75.0,
                          height: 75.0,
                          imageUrl: item.gameIcon,
                          fit: BoxFit.cover,
                          fadeInDuration: const Duration(microseconds: 0),
                          fadeOutDuration: const Duration(microseconds: 0),
                        ),
                      ),
                      Container(
                        height: 25.0,
                        alignment: Alignment.center,
                        child: Text(
                          item.name ?? '',
                          style: TextStyle(color: R.color.mainTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: games.length,
          ),
        ),
//        Container(
//          color: R.color.dividerColor,
//          height: 0.5,
//        ),
      ],
    );
  }
}
