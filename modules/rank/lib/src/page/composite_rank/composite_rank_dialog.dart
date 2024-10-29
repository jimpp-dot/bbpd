// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:intl/intl.dart';
import 'package:shared/K.dart' as CoreK;
import 'package:flutter/material.dart';
import 'package:rank/src/page/composite_rank/other_single_rank_list.dart';
import 'package:rank/src/page/composite_rank/ranking_list_new_page.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import '../../../../k.dart';

enum CompositeRankType {
  CompositeTypeMeili, //魅力
  CompositeTypeXindong, //心动
  CompositeTypeZhiyou, //挚友
  CompositeTypeZhiji, //知己
}

enum CompositeRankSubType {
  CompositeSubTypeD, //日榜
  CompositeSubTypeW, //周榜
  CompositeSubTypeM, //月榜
}

class CompositeRankDialog extends StatefulWidget {
  final int initTab;
  final int rid;
  final List<TabItem> tabList;
  final Map<String, List<String>>? rule;

  const CompositeRankDialog(
      {super.key,
      required this.initTab,
      required this.rid,
      required this.tabList,
      this.rule});

  @override
  State<CompositeRankDialog> createState() => _CompositeRankDialogState();

  static open(BuildContext context,
      {Key? key,
      required int initTab,
      required int rid,
      required List<TabItem> tabList,
      required Map<String, List<String>>? rule}) {
    return displayModalBottomSheet(
      maxHeightRatio: 618 / 812,
      context: context,
      builder: (BuildContext context) {
        final page = CompositeRankDialog(
            initTab: initTab, tabList: tabList, rid: rid, rule: rule);
        return page;
      },
    );
  }
}

class _CompositeRankDialogState extends State<CompositeRankDialog> {
  int rankLoop = 0; //本周期还是上周期还是某天(0本周期，1上周期,20221212某天)
  CompositeRankType rankType = CompositeRankType.CompositeTypeMeili;
  late TabItem meiliSubType;
  CompositeRankSubType rankSubType = CompositeRankSubType.CompositeSubTypeD;

  Map<CompositeRankType, GlobalKey> typePageKeyMap = {
    CompositeRankType.CompositeTypeMeili:
        GlobalKey() /*, CompositeRankType.CompositeTypeXindong: GlobalKey(), CompositeRankType.CompositeTypeZhiyou: GlobalKey(), CompositeRankType.CompositeTypeZhiji: GlobalKey()*/
  };

  @override
  void initState() {
    super.initState();

    if (widget.initTab >= 0 && widget.initTab < widget.tabList.length) {
      meiliSubType = widget.tabList[widget.initTab];
    } else {
      meiliSubType = widget.tabList.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16), topEnd: Radius.circular(16)),
            gradient: LinearGradient(
                colors: [Color(0xFF9B60FE), Color(0xFF7C6AFE)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: ClipRRect(
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(16),
                      topEnd: Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl: 'static/banban/rank/rank_entertain_bg_top.webp',
                    fit: BoxFit.cover,
                  )),
            ),
            PositionedDirectional(
              top: 12,
              end: 20,
              child: GestureDetector(
                onTap: () {
                  if (rankType == CompositeRankType.CompositeTypeMeili) {
                    GlobalKey k =
                        typePageKeyMap[CompositeRankType.CompositeTypeMeili]!;
                    RankingListNewPageState state =
                        k.currentState as RankingListNewPageState;
                    state.onHelp();
                  } else {
                    BaseWebviewScreen.show(context,
                        url: Util.getHelpUrlWithQStr('k146'));
                  }
                },
                child: R.img(BaseAssets.ic_help_svg,
                    color: Colors.white.withOpacity(0.7),
                    width: 24,
                    height: 24,
                    package: ComponentManager.MANAGER_BASE_CORE),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: List.generate(1, (index) {
                      CompositeRankType type = [
                        CompositeRankType
                            .CompositeTypeMeili /*, CompositeRankType.CompositeTypeXindong, CompositeRankType.CompositeTypeZhiyou, CompositeRankType.CompositeTypeZhiji*/
                      ][index];
                      String title = [
                        K.rank_composite_type_meili /*, K.rank_composite_type_xindong, K.rank_composite_type_zhiyou, K.rank_composite_type_zhiji*/
                      ][index];
                      return Expanded(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            rankLoop = 0;
                            rankSubType =
                                CompositeRankSubType.CompositeSubTypeD;
                            rankType = type;
                          });
                        },
                        child: Stack(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  title,
                                  style: TextStyle(
                                      color: rankType == type
                                          ? Colors.white
                                          : const Color(0x99FFFFFF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )),
                            Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Visibility(
                                  visible: rankType == type,
                                  child: Container(
                                    width: 16,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(1.5)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ));
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            /*rankType == CompositeRankType.CompositeTypeMeili ? */ widget
                                .tabList.length /* : 3*/, (int index) {
                          bool selected = false;
                          String title = '';
                          if (rankType ==
                              CompositeRankType.CompositeTypeMeili) {
                            title = widget.tabList[index].label ?? '';
                            selected = meiliSubType == widget.tabList[index];
                          } else {
                            title = [
                              K.rank_day_text,
                              K.rank_week_text,
                              K.month_ranklist
                            ][index];
                            selected = rankSubType ==
                                [
                                  CompositeRankSubType.CompositeSubTypeD,
                                  CompositeRankSubType.CompositeSubTypeW,
                                  CompositeRankSubType.CompositeSubTypeM
                                ][index];
                          }
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (rankType ==
                                    CompositeRankType.CompositeTypeMeili) {
                                  //魅力榜 子榜切换
                                  rankLoop = 0;
                                  meiliSubType = widget.tabList[index];
                                  GlobalKey k = typePageKeyMap[rankType]!;
                                  RankingListNewPageState state =
                                      k.currentState as RankingListNewPageState;
                                  state.tabController?.animateTo(index);
                                } else {
                                  //其他榜单 子榜切换
                                  rankLoop = 0;
                                  rankSubType = [
                                    CompositeRankSubType.CompositeSubTypeD,
                                    CompositeRankSubType.CompositeSubTypeW,
                                    CompositeRankSubType.CompositeSubTypeM
                                  ][index];
                                  GlobalKey k = typePageKeyMap[rankType]!;
                                  OtherSingleRankTabListState state =
                                      k.currentState
                                          as OtherSingleRankTabListState;
                                  state.tabController!.animateTo(index);
                                }
                              });
                            },
                            child: Container(
                              width: 64,
                              height: 28,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: selected
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(14)),
                              child: Text(title,
                                  style: TextStyle(
                                      color: selected
                                          ? const Color(0xFF6738D0)
                                          : const Color(0x66FFFFFF),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                loopPicker(),
                Expanded(
                  child: rankView(rankType, (int index) {
                    //子榜切换
                    setState(() {
                      rankLoop = 0;
                      rankSubType = [
                        CompositeRankSubType.CompositeSubTypeD,
                        CompositeRankSubType.CompositeSubTypeW,
                        CompositeRankSubType.CompositeSubTypeM
                      ][index];
                    });
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget loopPicker() {
    if (rankSubType == CompositeRankSubType.CompositeSubTypeW ||
        rankSubType == CompositeRankSubType.CompositeSubTypeM) {
      return Container(
        alignment: AlignmentDirectional.bottomEnd,
        padding: const EdgeInsetsDirectional.only(start: 20, top: 8),
        child: Row(
          children: List.generate(2, (index) {
            bool selected = rankLoop == index;
            String unit = '周';
            if (rankSubType == CompositeRankSubType.CompositeSubTypeM) {
              unit = '月';
            }
            return Padding(
              padding: const EdgeInsetsDirectional.only(end: 1),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    rankLoop = index;
                  });
                },
                child: Container(
                  width: 72,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            const Color(0xFF958FFE)
                                .withOpacity(selected ? 1 : 0.5),
                            const Color(0xFF9CB5FF)
                                .withOpacity(selected ? 1 : 0.5)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: const BorderRadiusDirectional.only(
                          topStart: Radius.circular(10),
                          topEnd: Radius.circular(10))),
                  child: Text(
                    ['本$unit', '上$unit'][index],
                    style: TextStyle(
                        color: selected
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                        fontSize: 13),
                  ),
                ),
              ),
            );
          }),
        ),
      );
    } else if (rankType != CompositeRankType.CompositeTypeMeili) {
      NumberFormat f = NumberFormat('00');
      String dateStr = '';
      if (rankLoop == 0) {
        DateTime now = DateTime.now();
        dateStr = '${now.year}-${f.format(now.month)}-${f.format(now.day)}';
      } else if (rankLoop.toString().length == 8) {
        String t = rankLoop.toString();
        dateStr =
            '${t.substring(0, 4)}-${t.substring(4, 6)}-${t.substring(6, 8)}';
      }
      return Padding(
        padding: const EdgeInsets.only(top: 7, bottom: 9),
        child: GestureDetector(
          onTap: () {
            onDatePickerTaped();
          },
          child: Container(
            width: 96,
            height: 20,
            decoration: BoxDecoration(
                color: const Color(0xFF7032FF),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Text(
                  dateStr,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  size: 16,
                  color: Color(0x66FFFFFF),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget rankView(CompositeRankType type, Function(int index) rankeTypeChange) {
    GlobalKey k = typePageKeyMap[type]!;
    if (rankType == CompositeRankType.CompositeTypeMeili) {
      return RankingListNewPage(
        key: k,
        initTab: widget.initTab,
        tabList: widget.tabList,
        rid: widget.rid,
        rule: widget.rule,
        disappear: () {
          Navigator.of(context).pop();
        },
        rankeTypeChange: (index) {
          if (rankType == CompositeRankType.CompositeTypeMeili) {
            //魅力榜 子榜切换
            setState(() {
              rankLoop = 0;
              meiliSubType = widget.tabList[index];
            });
          }
        },
      );
    } else {
      int rType = 1;
      int prev = rankLoop;
      if (rankType == CompositeRankType.CompositeTypeXindong) {
        rType = 1;
      } else if (rankType == CompositeRankType.CompositeTypeZhiyou) {
        rType = 2;
      } else if (rankType == CompositeRankType.CompositeTypeZhiji) {
        rType = 3;
      }
      return Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF7032FF).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12)),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: OtherSingleRankTabList(
              rType,
              prev,
              rankeTypeChange,
              key: k,
            ),
          ),
        ],
      );
    }
  }

  onDatePickerTaped() async {
    DateTime now = DateTime.now();
    DateTime initialDate = now;
    if (rankLoop.toString().length == 8) {
      String t = rankLoop.toString();
      initialDate = DateTime(Util.parseInt(t.substring(0, 4)),
          Util.parseInt(t.substring(4, 6)), Util.parseInt(t.substring(6, 8)));
    }
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        backgroundColor: R.color.secondBgColor,
        cancel: Text(
          CoreK.K.cancel,
          style: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 17,
            fontFamily: Util.fontFamily,
            fontWeight: FontWeight.normal,
          ),
        ),
        confirm: Text(
          CoreK.K.sure,
          style: TextStyle(
            color: R.color.mainBrandColor,
            fontSize: 17,
            fontFamily: Util.fontFamily,
            fontWeight: FontWeight.normal,
          ),
        ),
        itemTextStyle: TextStyle(color: R.color.mainTextColor, fontSize: 15),
        itemHeight: 40,
      ),
      minDateTime: now.subtract(const Duration(days: 7)),
      maxDateTime: now,
      initialDateTime: initialDate,
      onConfirm: (DateTime dateTime, List<int> selectedIndex) async {
        NumberFormat f = NumberFormat('00');
        String birthday =
            '${dateTime.year}${f.format(dateTime.month)}${f.format(dateTime.day)}';
        setState(() {
          rankLoop = Util.parseInt(birthday);
        });
      },
    );
  }
}
