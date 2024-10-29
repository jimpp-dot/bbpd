import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personaldata/k.dart';

import 'model/pb/generated/slp_godcard.pb.dart';

class GameMasterEntranceCard extends StatefulWidget {
  final GodCardList data;
  final Function clickCard;
  final Function editGameCard;

  const GameMasterEntranceCard(this.data, this.clickCard, this.editGameCard,
      {Key? key})
      : super(key: key);

  @override
  State<GameMasterEntranceCard> createState() => _GameMasterEntranceCardState();
}

class _GameMasterEntranceCardState extends State<GameMasterEntranceCard> {
  @override
  Widget build(BuildContext context) {
    //个人游戏信息
    String gameInfo = '';
    for (var element in widget.data.gameSubCate) {
      gameInfo += '${element.value}・';
    }
    if (gameInfo.length > 1) {
      gameInfo = gameInfo.substring(0, gameInfo.length - 1);
    }

    return InkWell(
      onTap: () {
        Tracker.instance.track(TrackEvent.click, properties: {
          'click_page': 'god_card',
        });
        //跳转到主播卡片列表
        widget.clickCard();
      },
      child: Container(
        width: 180,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          color: Color(0x0F1D60DD),
        ),
        margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
        padding: const EdgeInsetsDirectional.only(start: 6),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                decoration: BoxDecoration(
                  color: R.color.thirdBgColor,
                ),
                child: CachedNetworkImage(
                  imageUrl: "${System.imageDomain}${widget.data.icon}",
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        alignment: AlignmentDirectional.bottomStart,
                        child: InkWell(
                          onTap: () {
                            Tracker.instance
                                .track(TrackEvent.click, properties: {
                              'click_page': 'god_card_copy',
                            });
                            Clipboard.setData(
                                ClipboardData(text: widget.data.gameId));
                            Toast.show(context, K.personaldata_gm_did_copy);
                          },
                          child: Row(
                            children: [
                              LimitedBox(
                                maxWidth: 100,
                                child: Text(
                                  widget.data.gameId,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: R.color.mainTextColor,
                                      fontSize: 13),
                                ),
                              ),
                              R.img(
                                'game_master/game_master_copy.webp',
                                width: 16,
                                height: 16,
                                package: ComponentManager.MANAGER_PERSONALDATA,
                              ),
                            ],
                          ),
                        ),
                      )),
                      //方标签的地方，目前不需要显示在这里了
                      // Container(
                      //   alignment: AlignmentDirectional.topEnd,
                      //   child: Container(
                      //     width: 30,
                      //     height: 18,
                      //     decoration: BoxDecoration(color: Colors.pink),
                      //   ),
                      // ),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            gameInfo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: R.colors.mainTextColor, fontSize: 11),
                          ),
                        ),
                      ),
                      // 编辑按钮不需要了
                      // Container(
                      //   child: Padding(
                      //     padding:
                      //         EdgeInsetsDirectional.only(end: 10, bottom: 10),
                      //     child: InkWell(
                      //       onTap: () {
                      //         widget.editGameCard();
                      //       },
                      //       child: Container(
                      //         width: 20,
                      //         height: 20,
                      //         decoration: BoxDecoration(color: Colors.pink),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameMasterEntranceAddCard extends StatelessWidget {
  final Function addGameCard;

  const GameMasterEntranceAddCard({Key? key, required this.addGameCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //跳转到添加主播卡页面
        addGameCard();
      },
      child: Container(
        constraints: const BoxConstraints(minWidth: 140),
        alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(
          color: const Color(0x0F1D60DD),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
          child: Row(
            children: [
              R.img(
                'game_master/game_master_card_add.webp',
                width: 40,
                height: 40,
                package: ComponentManager.MANAGER_PERSONALDATA,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                K.personaldata_gm_add_card,
                style: TextStyle(color: R.colors.mainTextColor, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameMasterEntranceEmptyCard extends StatelessWidget {
  final Function clickCard;
  const GameMasterEntranceEmptyCard(this.clickCard, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        clickCard();
      },
      child: Rext.themeCardContainer(
        width: 140,
        cornerRadius: 12,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Rext.autoStyleImg(
              'game_master/game_master_card_empty.webp',
              width: 140,
              height: 60,
              package: ComponentManager.MANAGER_PERSONALDATA,
              fit: BoxFit.cover,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                K.personaldata_gm_no_card,
                style: TextStyle(color: R.colors.mainTextColor, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
