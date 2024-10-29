import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

import 'package:shared/src/pbModel/generated/slp_pretty.pb.dart';

class PrettyIDSellPage extends StatefulWidget {
  const PrettyIDSellPage({super.key});

  @override
  State<PrettyIDSellPage> createState() => _PrettyIDSellPageState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PrettyIDSellPage(),
        settings: const RouteSettings(name: '/prettyIDSellPage'),
      ),
    );
  }
}

class _PrettyIDSellPageState extends State<PrettyIDSellPage> {
  bool loading = false;
  PrettySellItem? selectedItem;
  ResPrettySellList? data;
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  Future _loadData() async {
    setState(() {
      selectedItem = null;
      loading = true;
    });
    String url = '${System.domain}go/yy/pretty/list/';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      data = ResPrettySellList.fromBuffer(response.bodyBytes);
    } catch (e) {
      data = ResPrettySellList(message: e.toString(), success: false);
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    double side = 36;
    double margin = 12;
    double width = 146;
    int numPerRow =
        max(((Util.width - side * 2 + margin) / (width + margin)).ceil(), 2);
    width = (Util.width - side * 2 - margin * (numPerRow - 1)) / numPerRow;
    String noticeText = data == null ? '' : data!.data.noticeText;
    noticeText = noticeText.replaceAll('\\n', '\n');

    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicatorFactory.of(
            onRefresh: () async {
              _loadData();
            },
            child: Container(
              alignment: Alignment.topCenter,
              //0xFF502D28
              decoration: const BoxDecoration(color: Color(0xFF170F0C)),
              child: Stack(alignment: Alignment.topCenter, children: [
                R.img("pretty_id/pretty_id_header.webp",
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    fit: BoxFit.cover),
                SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 276 - 44,
                            ),
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    width: Util.width - 24,
                                    //Color(0x3E3326)
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF3E3326),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: const Color(0xFFF6CF97),
                                            width: 3)),
                                    child: Column(
                                      children: [
                                        //个人主页样式预览
                                        SizedBox(
                                          height: 229 + 34,
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(top: 34),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    R.img(
                                                        "pretty_id/pretty_id_line_left.webp",
                                                        package: ComponentManager
                                                            .MANAGER_BASE_ROOM,
                                                        height: 14),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 57,
                                                      child: Text(
                                                          K
                                                              .room_pretty_id_list_demo,
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xFFF9E5BC),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                    ),
                                                    R.img(
                                                        "pretty_id/pretty_id_line_right.webp",
                                                        package: ComponentManager
                                                            .MANAGER_BASE_ROOM,
                                                        height: 14),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: 80,
                                                    width: 223,
                                                    child: R.img(
                                                        "pretty_id/pretty_id_demo_card.webp",
                                                        package: ComponentManager
                                                            .MANAGER_BASE_ROOM,
                                                        width: 223,
                                                        height: 80)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    R.img(
                                                        "pretty_id/pretty_id_line_left.webp",
                                                        package: ComponentManager
                                                            .MANAGER_BASE_ROOM,
                                                        height: 14),
                                                    Container(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      height: 57,
                                                      child: Text(
                                                          K
                                                              .room_pretty_id_list_nums,
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xFFF9E5BC),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                    ),
                                                    R.img(
                                                        "pretty_id/pretty_id_line_right.webp",
                                                        package: ComponentManager
                                                            .MANAGER_BASE_ROOM,
                                                        height: 14),
                                                  ],
                                                ),
                                                Container(
                                                    height: 33,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      noticeText,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFFDDAF7A),
                                                        fontSize: 12,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16, bottom: 16),
                                            child: (data != null &&
                                                    data!.success &&
                                                    data!.data.prettyInfo
                                                        .isNotEmpty)
                                                ? Wrap(
                                                    runSpacing: margin,
                                                    spacing: margin,
                                                    children: List.generate(
                                                        data!.data.prettyInfo
                                                            .length, (index) {
                                                      PrettySellItem item =
                                                          data!.data.prettyInfo[
                                                              index];
                                                      return _buildItem(
                                                          width, item, () {
                                                        setState(() {
                                                          selectedItem = item;
                                                        });
                                                      });
                                                    }).toList(),
                                                  )
                                                : (loading
                                                    ? const Loading(
                                                        color:
                                                            Color(0xFFF9E5BC))
                                                    : (data!.success
                                                        ? const EmptyWidget(
                                                            textColor: Color(
                                                                0xFFDDAF7A))
                                                        : ErrorData(
                                                            error:
                                                                data!.message,
                                                            fontColor:
                                                                const Color(
                                                                    0xFFDDAF7A),
                                                            onTap:
                                                                _loadData)))),
                                      ],
                                    ),
                                  ),
                                ),
                                //池选靓号标题
                                GestureDetector(
                                  onTap: () async {
                                    BaseWebviewScreen.show(context,
                                        url: Util.parseHelpUrl(130));
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: 184,
                                      height: 44,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "packages/chat_room/assets/images/pretty_id/pretty_id_title.webp"),
                                              fit: BoxFit.cover)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            K.room_pretty_id_list_title,
                                            style: const TextStyle(
                                                color: Color(0xFF502D28),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          R.img(
                                              "pretty_id/pretty_id_buy_help.webp",
                                              package: ComponentManager
                                                  .MANAGER_BASE_ROOM,
                                              height: 14)
                                        ],
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(height: 136),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: Util.width,
                      height: 136,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "packages/chat_room/assets/images/pretty_id/pretty_id_bottom_shadow.webp"),
                              fit: BoxFit.fitWidth)),
                      child: GestureDetector(
                        onTap: () async {
                          SheetCallback? result = await _payManager
                              .showRechargeSheet(context, selectedItem!.price);
                          if (result == null ||
                              result.reason == SheetCloseReason.Active ||
                              result.value?.key == IPayManager.pTRecharge) {
                            return;
                          }
                          Map args = {
                            'money': selectedItem!.price,
                            'type': 'slp-consume',
                            'params': {
                              'consume_type': 'pretty_sell',
                              'id': selectedItem!.id
                            }
                          };
                          _payManager.pay(context,
                              key: 'gift',
                              type: 'available',
                              args: args, onPayed: () {
                            Tracker.instance.track(
                                TrackEvent.pretty_id_buy_success,
                                properties: {
                                  'lianghao_num': selectedItem!.prettyId,
                                  'purchase_lianghao_money':
                                      selectedItem!.price,
                                  'uid': Session.uid
                                });
                            Fluttertoast.showToast(
                                msg: K.room_pretty_id_buy_success);
                            _loadData();
                          }, onError: (bool isErrorCatch) {});
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 58, bottom: 14),
                          child: Center(
                            child: (data != null && selectedItem != null)
                                ? Container(
                                    width: 306,
                                    height: 64,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "packages/chat_room/assets/images/pretty_id/pretty_id_button_buy.webp"),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(K.room_fans_privilege_bag_buy,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                R.img(
                                                    "guessgame/guess_game_diamonds.webp",
                                                    package: ComponentManager
                                                        .MANAGER_BASE_ROOM,
                                                    height: 12),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                    selectedItem!.price
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12))
                                              ]),
                                        ]),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ),
                    ))
              ]),
            ),
          ),
          PositionedDirectional(
            start: 10,
            top: 40,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 36.0,
                height: 36.0,
                margin: const EdgeInsetsDirectional.only(start: 8.0, top: 2),
                alignment: Alignment.center,
                child: Center(
                  child: R.img(
                    "ic_titlebar_profile_back.svg",
                    width: 24,
                    height: 24,
                    color: Colors.white,
                    package: ComponentManager.MANAGER_PERSONALDATA,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
      double width, PrettySellItem item, GestureTapCallback ontap) {
    bool selected = selectedItem != null && selectedItem!.id == item.id;
    Border? border =
        selected ? Border.all(color: const Color(0xFFF9E5BC), width: 1) : null;
    return GestureDetector(
        onTap: ontap,
        child: Container(
          width: width,
          height: 44,
          //Alignment(0.5, 0.6), end: Alignment(-0.42, -0.52)
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment(0.3, -1),
                  end: Alignment(0.4, 1),
                  colors: [Color(0x1FFFD793), Color(0x00424242)]),
              borderRadius: BorderRadius.circular(4),
              border: border),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 20,
                    height: 20,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                            colors: [Color(0xFFF4D49C), Color(0xFFDBAF63)]),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(K.room_pretty_pretty,
                        style: const TextStyle(
                            color: Color(0xFF502D28),
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                const SizedBox(width: 12),
                Text(item.prettyId.toString(),
                    style: const TextStyle(
                        color: Color(0xFFDDAF7A),
                        fontSize: 14,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ));
  }
}

// 展示卡片
// class _PrettyIDSellCard extends StatefulWidget {
//   const _PrettyIDSellCard({ Key? key }) : super(key: key);

//   @override
//   State<_PrettyIDSellCard> createState() => __PrettyIDSellCardState();
// }

// class __PrettyIDSellCardState extends State<_PrettyIDSellCard> {
//   @override
//   Widget build(BuildContext context) {
//       return Container(
//       width: 223,
//       height: 80,
//       child: Center(
//         child: Stack(
//           children: [
//             R.img("pretty_id/pretty_id_header.webp", package: ComponentManager.MANAGER_BASE_ROOM, fit: BoxFit.cover),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Text('data'),
//                     Text('number'),
//                   ]
//                 ),
//                 Expanded(
//                   child: Padding(
//                       padding: EdgeInsetsDirectional.only(end: 7),
//                     )
//                   )
//               ]
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
