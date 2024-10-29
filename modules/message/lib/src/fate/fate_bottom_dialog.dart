import 'dart:convert';
import 'dart:math';

import 'package:shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;
import 'package:message/src/fate/fate_dialog_guide.dart';
import 'package:message/src/fate/fate_repo.dart';
import 'package:intl/intl.dart';
import 'package:message/src/fate/fate_single_selection.dart';
import '../model/pb/generated/slp_fate.pb.dart' as FateData;
import 'fate_card.dart';
import 'fate_empty_card.dart';
import 'package:shared/shared.dart';
import '../../k.dart';

/// 今日缘分弹窗
class FateBottomDialog extends StatefulWidget {
  const FateBottomDialog({super.key});

  @override
  FateBottomDialogState createState() {
    return FateBottomDialogState();
  }

  static Future<int?> show(BuildContext context) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      builder: (BuildContext context) {
        return const FateBottomDialog();
      },
    );
  }
}

enum DragType {
  None,
  Left,
  Right,
}

class FateBottomDialogState extends State<FateBottomDialog> {
  late double dialogHeight;

  /// 剩余次数
  int? leftCount;
  DragController dragController = DragController();
  int index = 0;

  ResHomeProfile? resHomeProfile;
  List<FateCardData>? datas;
  String? errorMsg;
  DragType dragType = DragType.None;

  FateData.FateCard? selfData;

  bool autoPlayAudio = false;

  int? rid;

  late int showTime;

  List<int> browserUid = [];
  //展示感兴趣按钮的引导
  final bool _needShowLikeGuide = false;

  final String hasShowCompleteCardKey = 'has_show_complete_card';

  // 今日缘分-引导2 - 是否已经显示过引导2
  bool _hasShowGuide2 = false;
  // 今日缘分-引导2 - 是否需要显示引导2
  bool get showFateGuide2 {
    if (_hasShowGuide2) {
      return false;
    }
    _hasShowGuide2 =
        Config.getBool('has_show_fate_config2_${Session.uid}', false);
    if (_hasShowGuide2) {
      return false;
    } else {
      _hasShowGuide2 = true;
      Config.setBool('has_show_fate_config2_${Session.uid}', true);
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    double height = 670 + Util.iphoneXBottom;
    dialogHeight = Util.height > height ? height : Util.height;

    showTime = DateTime.now().secondsSinceEpoch;

    bool hasShowGuide =
        Config.getBool('has_show_fate_config_${Session.uid}', false);
    if (hasShowGuide != true) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        FateDialogGuide.show(context,
            marginTop: Util.height - dialogHeight + 74 + 250 - 36);
      });
      Config.setBool('has_show_fate_config_${Session.uid}', true);
    }

    loadData();
  }

  @override
  void dispose() {
    int time = DateTime.now().secondsSinceEpoch;
    if (Util.validList(browserUid)) {
      Session.setBrowseFateUids(browserUid);
    }
    Tracker.instance.track(TrackEvent.luck_exposure, properties: {
      'view': '${time - showTime}',
      'without': leftCount == 0 ? 'blank' : 'service',
    });
    super.dispose();
  }

  int get cardLength {
    return datas?.length ?? 0;
  }

  double get cardHeight {
    return dialogHeight - 74 - 96 - Util.iphoneXBottom;
  }

  void loadData() async {
    FateData.ResFateMatch res = await FateRepo.getFateMatch();

    if (!mounted) {
      return;
    }

    if (res.success == false && Util.validStr(res.msg)) {
      errorMsg = res.msg;
    } else {
      datas = [];
      autoPlayAudio = res.data.autoPlayAudio;
      for (FateData.FateCard card in res.data.cards) {
        datas?.add(FateCardData(data: card, cardType: CardType.Normal));
      }

      selfData = res.data.myCard;

      leftCount = cardLength;

      rid = res.data.rid;

      if ((datas?.length ?? 0) > 2) {
        List<CardType> completeCards = getCompleteCards();
        if (Util.validList(completeCards)) {
          /// 产品修改需求：每日随机出现一次
          // if (datas!.length > 20 && completeCards.length >= 3 && !Util.is7DayNewNormalUser) {
          //   /// 7日内注册非GS用户，不用插第20张
          //   insertCompleteCard(20, completeCards[2]);
          // }
          // if (datas!.length > 10  && completeCards.length >= 2) {
          //   insertCompleteCard(10, completeCards[1]);
          // }
          int today =
              DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()))
                      .millisecondsSinceEpoch ~/
                  1000;
          bool hasShowCompleteCard =
              Config.getBool('$hasShowCompleteCardKey$today', false);
          if (hasShowCompleteCard == false) {
            if (datas!.length > 2 && completeCards.isNotEmpty) {
              insertCompleteCard(2, completeCards[0]);
            }
          }
        }
      }
    }

    refresh();
  }

  /// 清理多余的额外信息资料卡
  void clearExtInfoCards() {
    if (datas == null || datas!.isEmpty) {
      return;
    }

    CardType extInfoType = checkExtInfoType();
    if (extInfoType == CardType.extInfoHeight) {
      //还没有填写，没有多余的
      return;
    } else if (extInfoType == CardType.Normal) {
      //额外资料已全部填写
      datas!
          .removeWhere((element) => element.cardType == CardType.extInfoHeight);
      datas!.removeWhere(
          (element) => element.cardType == CardType.extInfoIndustry);
      datas!.removeWhere(
          (element) => element.cardType == CardType.extInfoEducation);
    } else {
      for (var i = 0; i < datas!.length; i++) {
        FateCardData element = datas![i];
        if (extInfoType == CardType.extInfoIndustry) {
          if (element.cardType == CardType.extInfoHeight) {
            datas!.remove(element);
            insertCompleteCard(i, CardType.extInfoIndustry);
          }
        } else if (extInfoType == CardType.extInfoEducation) {
          if (element.cardType == CardType.extInfoHeight ||
              element.cardType == CardType.extInfoIndustry) {
            datas!.remove(element);
            insertCompleteCard(i, CardType.extInfoEducation);
          }
        }
      }
    }

    refresh();
  }

  /// 插入完善资料卡片
  void insertCompleteCard(int i, CardType type) {
    if (datas != null && datas!.length > i) {
      List<String> tags = selfData!.tags;
      tags.addAll(selfData!.friendTags);
      datas?.insert(
          i,
          FateCardData(
              data: FateData.FateCard(
                photos: selfData?.photos ?? [],
                name: selfData?.name,
                uid: selfData?.uid ?? 0,
                age: selfData?.age,
                sex: selfData?.sex,
                onlineStatus: selfData?.onlineStatus,
                onlineDatelineDiff: selfData?.onlineDatelineDiff,
                distance: selfData?.distance,
                audio: selfData?.audio,
                duration: selfData?.duration,
                tags: tags,
                match: 0,
              ),
              cardType: type,
              setDragLeft: () {
                if ([
                  CardType.extInfoHeight,
                  CardType.extInfoIndustry,
                  CardType.extInfoEducation
                ].contains(type)) {
                  if (!mounted) {
                    return;
                  }
                  index = index + 1;
                  setDragType(DragType.None);
                  clearExtInfoCards();
                }
              }));
    }
  }

  /// 随机获取需要完善的卡片类型
  List<CardType> getCompleteCards() {
    List<CardType> cards = [];
    if (selfData != null && Util.parseInt(selfData!.uid) > 0) {
      int index = Random().nextInt(CardType.values.length);
      for (int i = index; i < index + 4; i++) {
        int j = i % CardType.values.length;
        if (j == 1 && !Util.validList(selfData?.tags)) {
          /// 关于我标签
          cards.add(CardType.Tag1);
        } else if (j == 2 && !Util.validList(selfData?.friendTags)) {
          /// 希望认识标签
          cards.add(CardType.Tag2);
        } else if (j == 3 &&
            (!Util.validList(selfData?.photos) ||
                selfData!.photos.length < 2)) {
          /// 相册
          cards.add(CardType.Photo);
        } else if (j == 4 &&
            (!Util.validStr(selfData?.duration) ||
                !Util.validStr(selfData?.audio))) {
          /// 语音签名
          cards.add(CardType.Audio);
        }
      }
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// do nothing
      },
      child: Container(
        width: Util.width,
        height: dialogHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                Util.getRemoteImgUrl('static/message/fate_bg.webp')),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 23,
                ),
                R.img(
                  'ic_fate_dialog_title.webp',
                  width: 96,
                  height: 25,
                  package: ComponentManager.MANAGER_MESSAGE,
                ),
                const SizedBox(
                  height: 16,
                ),
                if (Util.validStr(errorMsg))
                  Container(
                    width: Util.width,
                    height: dialogHeight - 74 - 96 - Util.iphoneXBottom,
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      '$errorMsg',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (datas == null && !Util.validStr(errorMsg))
                  SizedBox(
                    width: Util.width,
                    height: dialogHeight - 74 - 96 - Util.iphoneXBottom,
                    child: const Loading(),
                  ),
                if (datas != null && !Util.validStr(errorMsg)) ...[
                  buildCards(),
                  buildButtons(),
                ],
              ],
            ),
            PositionedDirectional(
              end: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.maybePop(context, leftCount);
                  Tracker.instance.track(TrackEvent.luck_click, properties: {
                    'page': 'close',
                  });
                },
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 18,
                    bottom: 18,
                    start: 18,
                    end: 18,
                  ),
                  child: R.img(
                    'ic_close.svg',
                    width: 30,
                    height: 30,
                    color: Colors.white,
                    package: ComponentManager.MANAGER_MESSAGE,
                  ),
                ),
              ),
            ),
            if (_needShowLikeGuide) buildLikeGuide(),
          ],
        ),
      ),
    );
  }

  Widget buildCards() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
      width: Util.width - 32,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        color: index >= cardLength ? Colors.white : null,
      ),
      child: index < cardLength
          ? DragLike(
              allowDrag: _canTrag(),
              dragController: dragController,
              secondChild: buildDragSecondChild(),
              screenWidth: Util.width,
              outValue: 0.8,
              dragSpeed: 1000,
              // duration: Duration(milliseconds: 800),
              onOutComplete: (String? type) {},
              onScaleComplete: () {
                if (mounted) {
                  setState(() {
                    if (datas![index].cardType == CardType.Normal) {
                      if (dragType == DragType.Right) {
                        /// 发送今日缘分消息
                        MessageContent content = MessageContent(
                            MessageType.Info,
                            SendUser(Session.uid.toString(), Session.name,
                                Session.icon));
                        content.content = K.msg_fate_msg_content;
                        Map<String, String> extra = {'type': 'fate_tips'};
                        content.extra = json.encode(extra);
                        Im.sendMessage(ConversationType.Private,
                            datas![index].uid.toString(), content);
                      }
                      FateRepo.fateLike(datas![index].uid,
                          dragType == DragType.Right ? 1 : 0);

                      Tracker.instance
                          .track(TrackEvent.luck_enter, properties: {
                        'to_uid': datas![index].uid,
                        'photograph': datas![index].photos.length,
                        'voice': Util.validStr(datas![index].audio) ? '1' : '0',
                        'label': '${datas![index].tags.length}',
                        'like': dragType == DragType.Right ? 1 : 0,
                        'mate_grade': datas![index].match,
                      });
                      browserUid.add(datas![index].uid);
                    } else {
                      if (dragType == DragType.Right) {
                        /// 立即完善，页面跳转
                        goComplete(datas![index].cardType);
                        Tracker.instance
                            .track(TrackEvent.luck_click, properties: {
                          'page': 'lose',
                        });
                      }
                      int today = DateTime.parse(DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()))
                              .millisecondsSinceEpoch ~/
                          1000;
                      Config.setBool('$hasShowCompleteCardKey$today', true);
                    }
                    if (datas![index].cardType == CardType.Normal) {
                      leftCount = leftCount! - 1;
                    }
                    index = index + 1;
                    setDragType(DragType.None);
                  });
                }
              },
              onChangeDragDistance: (Map value) {
                if (mounted) {
                  if (value['distance'] < 0 && dragType != DragType.Left) {
                    setDragType(DragType.Left);
                  } else if (value['distance'] > 0 &&
                      dragType != DragType.Right) {
                    setDragType(DragType.Right);
                  }
                }
              },
              onRunBackComplete: () {
                setDragType(DragType.None);
              },
              onPointerUp: () {},
              onCancel: () {},
              child: buildDragChild(),
            )
          : const FateEmptyCard(),
    );
  }

  bool _canTrag() {
    FateCardData? card = datas?[index];
    if (card != null &&
        ![
          CardType.extInfoHeight,
          CardType.extInfoIndustry,
          CardType.extInfoEducation
        ].contains(card.cardType)) {
      return true;
    }
    return false;
  }

  bool _checkShowGuide2() {
    if (showFateGuide2) {
      _showDialogGuide2();
      return true;
    }
    return false;
  }

  Future _showDialogGuide2() async {
    int? result = await FateDialogGuide2.show(context,
        marginTop: Util.height - dialogHeight + 74 + 250 - 36);
    if (result != null && result == 1) {
      if (!Util.isCollectionEmpty(datas)) {
        IChatManager chatManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
        chatManager.openUserChatScreen(Constant.context,
            type: 'private',
            targetId: datas![index].uid,
            title: datas![index].name);
      }
    }
  }

  void goComplete(CardType type) {
    if (type == CardType.Tag1) {
      /// 个人标签
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.openTagSetPage(true, true);
    } else if (type == CardType.Tag2) {
      /// 交友标签
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.openTagSetPage(true, false);
    } else if (type == CardType.Audio) {
      /// 语音签名
      IPersonalDataManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      manager.openAudioRecord(
        context,
        type: AudioRecordType.editAudio,
      );
    } else if (type == CardType.Photo) {
      /// 图片
      IPersonalDataManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      manager.openImageModifyScreen(context);
    }
  }

  int getLeftNumIndex(int index) {
    int leftNum = 0;
    for (int i = index; i < datas!.length; i++) {
      if (datas![i].cardType == CardType.Normal) {
        leftNum++;
      }
    }

    return leftNum;
  }

  int getTotalNum() {
    int totalNum = 0;
    for (int i = 0; i < datas!.length; i++) {
      if (datas![i].cardType == CardType.Normal) {
        totalNum++;
      }
    }

    return totalNum;
  }

  int get showUid {
    if (autoPlayAudio == true &&
        index != 0 &&
        datas![index].cardType == CardType.Normal) {
      /// 后台下发需要自动播放/非首个/非完善资料卡片，
      return datas![index].uid;
    }
    return 0;
  }

  Widget buildDragChild() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        FateCard(
          data: datas![index],
          height: dialogHeight - 74 - 96 - Util.iphoneXBottom,
          leftNum: getLeftNumIndex(index),
          showUid: showUid,
          totalNum: getTotalNum(),
        ),
        if (dragType != DragType.None &&
            datas![index].cardType == CardType.Normal)
          PositionedDirectional(
            top: 34,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              alignment: AlignmentDirectional.center,
              child: R.img(
                dragType == DragType.Right
                    ? BaseAssets.login_ic_follow_and_say_hi_svg
                    : BaseAssets.shared$login_ic_ignore_gs_png,
                width: 26,
                height: 26,
                color:
                    dragType == DragType.Right ? const Color(0xFFFF639F) : null,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
            ),
          ),
      ],
    );
  }

  Widget buildDragSecondChild() {
    if (index == cardLength - 1) {
      return const SizedBox.shrink();
    }
    return FateCard(
      data: datas![index + 1],
      height: dialogHeight - 74 - 96 - Util.iphoneXBottom,
      leftNum: getLeftNumIndex(index + 1),
      showUid: showUid,
      totalNum: getTotalNum(),
    );
  }

  void setDragType(DragType type) {
    if (mounted && dragType != type) {
      setState(() {
        dragType = type;
      });
    }
  }

  Widget buildButtons() {
    return Container(
      width: Util.width,
      height: 96,
      padding: const EdgeInsetsDirectional.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (index < cardLength) ...buildNormalOptions(),
          if (index >= cardLength) buildEmptyOption(),
        ],
      ),
    );
  }

  Widget buildEmptyOption() {
    return GestureDetector(
      onTap: () {
        Navigator.maybePop(context, leftCount);

        Tracker.instance.track(TrackEvent.luck_click, properties: {
          'page': 'jump',
        });

        /// 跳转房间
        if (Util.parseInt(rid) > 0) {
          IRoomManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          manager.openChatRoomScreenShow(context, rid!, refer: 'fate_dialog');
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 240,
        height: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(34),
          color: Colors.white,
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.msg_fate_empty_button,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF313131),
            height: 1.1,
          ),
        ),
      ),
    );
  }

  List<Widget> buildNormalOptions() {
    IPersonalDataManager pManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);

    if (datas![index].cardType == CardType.Normal) {
      return [
        GestureDetector(
          onTap: () {
            /// 不喜欢
            dragController.toLeft(completeTag: 'dont_like');
            setDragType(DragType.Left);
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: 68,
            height: 68,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            alignment: AlignmentDirectional.center,
            child: R.img(
              BaseAssets.shared$login_ic_ignore_gs_png,
              width: 26,
              height: 26,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            /// 喜欢
            if (_checkShowGuide2()) {
              return;
            }
            dragController.toRight(completeTag: 'like');
            setDragType(DragType.Right);
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: 68,
            height: 68,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            alignment: AlignmentDirectional.center,
            child: R.img(
              BaseAssets.login_ic_follow_and_say_hi_svg,
              width: 26,
              height: 26,
              color: const Color(0xFFFF639F),
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        ),
      ];
    } else if (datas![index].cardType == CardType.extInfoHeight) {
      return [
        GestureDetector(
          onTap: () async {
            int height = datas![index].value;
            NormalNull res =
                await pManager.editSingleInfo({'height': height.toString()});
            if (res.success) {
              Fluttertoast.showToast(msg: K.msg_set_success);
              if (resHomeProfile!.data.card.isFrozen) {
                HomeProfileCard placeholderCard = HomeProfileCard();
                placeholderCard.height = height;
                resHomeProfile!.data.card = placeholderCard;
              } else {
                resHomeProfile!.data.card.height = height;
              }
              datas!.removeAt(index);
              insertCompleteCard(index, CardType.extInfoIndustry);
              refresh();
            } else if (!Util.isNullOrEmpty(res.msg)) {
              Fluttertoast.showToast(msg: res.msg);
            }
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: Util.width - 40,
            height: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(34),
              color: Colors.white,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.message_fate_confirm_step1,
              style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainBrandColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ];
    } else if (datas![index].cardType == CardType.extInfoIndustry) {
      double width = (Util.width - 40 - 30) / 2.0;
      return [
        GestureDetector(
          onTap: () {
            setState(() {
              datas!.removeAt(index);
              insertCompleteCard(index, CardType.extInfoHeight);
            });
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: width,
            height: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(34),
              color: Colors.white,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.message_fate_pre_step,
              style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainBrandColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            SingleSelectionItem item = datas![index].value;
            NormalNull res =
                await pManager.editSingleInfo({'industry': item.id.toString()});
            if (res.success) {
              Fluttertoast.showToast(msg: K.msg_set_success);
              if (resHomeProfile!.data.card.isFrozen) {
                HomeProfileCard placeholderCard = HomeProfileCard();
                placeholderCard.industry = item.name;
                resHomeProfile!.data.card = placeholderCard;
              } else {
                resHomeProfile!.data.card.industry = item.name;
              }
              datas!.removeAt(index);
              insertCompleteCard(index, CardType.extInfoEducation);
              refresh();
            } else if (!Util.isNullOrEmpty(res.msg)) {
              Fluttertoast.showToast(msg: res.msg);
            }
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: width,
            height: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(34),
              color: Colors.white,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.message_fate_confirm_step2,
              style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainBrandColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ];
    } else if (datas![index].cardType == CardType.extInfoEducation) {
      double width = (Util.width - 40 - 30) / 2.0;
      return [
        GestureDetector(
          onTap: () {
            setState(() {
              datas!.removeAt(index);
              insertCompleteCard(index, CardType.extInfoIndustry);
            });
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: width,
            height: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(34),
              color: Colors.white,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.message_fate_pre_step,
              style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainBrandColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            SingleSelectionItem item = datas![index].value;
            NormalNull res = await pManager
                .editSingleInfo({'education': item.id.toString()});
            if (res.success) {
              Fluttertoast.showToast(msg: K.msg_set_success);
              if (resHomeProfile!.data.card.isFrozen) {
                HomeProfileCard placeholderCard = HomeProfileCard();
                placeholderCard.education = item.name;
                resHomeProfile!.data.card = placeholderCard;
              } else {
                resHomeProfile!.data.card.education = item.name;
              }
              index = index + 1;
              dragType = DragType.None;
              clearExtInfoCards();
            } else if (!Util.isNullOrEmpty(res.msg)) {
              Fluttertoast.showToast(msg: res.msg);
            }
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: width,
            height: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(34),
              color: Colors.white,
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.message_fate_confirm_step3,
              style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainBrandColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ];
    }

    return [
      GestureDetector(
        onTap: () {
          /// 下次再说
          dragController.toLeft(completeTag: 'dont_like');
          setDragType(DragType.Left);
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: 118,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(34),
            color: Colors.white,
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            K.msg_next_time,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF313131),
              height: 1.1,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          /// 立即完成
          dragController.toRight(completeTag: 'like');
          setDragType(DragType.Right);
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: 118,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(34),
            color: Colors.white,
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            K.msg_complete,
            style: TextStyle(
              fontSize: 16,
              color: R.color.mainBrandColor,
              height: 1.1,
            ),
          ),
        ),
      ),
    ];
  }

  Widget buildLikeGuide() {
    bool showLikeButton = datas != null &&
        index < cardLength &&
        datas![index].cardType == CardType.Normal;
    if (!_needShowLikeGuide || !showLikeButton) {
      return const SizedBox.shrink();
    }

    double top = cardHeight + 20;
    double spacingHorizontal = (Util.width - 68 * 2) / 3;
    double start = spacingHorizontal * 2 + 1.5 * 68 - 65;
    return PositionedDirectional(
      top: top,
      start: start,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 14,
              bottom: 14,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors)),
            child: Text(
              K.msg_fate_like_guide,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          Transform.rotate(
            angle: pi,
            child: R.img('home/ic_newer_home_guide_arrow_up.webp',
                width: 18, height: 9),
          ),
        ],
      ),
    );
  }

  CardType checkExtInfoType() {
    if (resHomeProfile == null || !resHomeProfile!.success) {
      return CardType.Normal;
    }

    if (resHomeProfile!.data.card.height <= 0) {
      return CardType.extInfoHeight;
    } else if (resHomeProfile!.data.card.industry.isEmpty) {
      return CardType.extInfoIndustry;
    } else if (resHomeProfile!.data.card.education.isEmpty) {
      return CardType.extInfoEducation;
    }

    return CardType.Normal;
  }
}
