import 'dart:async';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter/services.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/src/api/healer_api.dart';
import 'package:personaldata/src/healer/healer_rank_page.dart';
import 'package:personaldata/src/healer/hearler_use_sheet.dart';
import 'package:personaldata/src/model/pb/generated/healer.pb.dart';

import '../../k.dart';

/// 聊愈师首页-聊愈师列表
class HealerMainPage extends StatefulWidget {
  const HealerMainPage({super.key});

  static Future launch(BuildContext context) async {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HealerMainPage();
    }));
  }

  @override
  State<HealerMainPage> createState() => _HealerMainPageState();
}

class _HealerMainPageState extends State<HealerMainPage>
    with RefreshAndLoadMoreListMixin<HealerMainPage, HealerUpCard> {
  bool _searchModel = false;
  String _searchWord = '';

  Timer? _cancelTimer;

  void _onQueryChanged(String text) {
    _cancelTimer?.cancel();
    _cancelTimer =
        Timer(Duration(milliseconds: text.isEmpty ? 0 : 800), () async {
      _searchWord = text;
      await source.refreshData();
      refresh();
    });
  }

  @override
  void dispose() {
    _cancelTimer?.cancel();
    super.dispose();
  }

  @override
  Future<RespModel<HealerUpCard>> loadData(int pageIndex, int lastId) async {
    ResHealerIndex resHealerIndex =
        await HealerApi.indexList(lastId, _searchWord);
    return RespModel(
      isSuccess: resHealerIndex.success,
      list: resHealerIndex.data.list,
      msg: resHealerIndex.msg,
      hasMore: resHealerIndex.data.more,
      lastId: resHealerIndex.data.cursor.toInt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF7493EC),
        body: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: 'static/healer/bg_healer_main_head.webp',
              width: Util.width,
              fit: BoxFit.fitWidth,
              cachedWidth: Util.width.px,
            ),
            SafeArea(
              bottom: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _searchModel ? _buildSearch() : _buildAppBar()),
                  Expanded(
                    child: buildList(
                      listPadding: EdgeInsetsDirectional.only(
                          top: 8, bottom: Util.bottomMargin),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 50,
            height: 44,
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: R.img(
                BaseAssets.shared$ic_titlebar_back_svg,
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            K.healer_title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              _searchModel = true;
            });
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 10, end: 16, top: 10, bottom: 10),
            child: R.img(
              BaseAssets.shared$ic_search_action_png,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 4, bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SearchBar(
              _onQueryChanged,
              showCancel: false,
              autoFocus: true,
              height: 36,
              hintText: K.personal_search,
              textStyle: TextStyle(color: R.color.mainTextColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _searchModel = false;
              });
              if (_searchWord.isNotEmpty) {
                _onQueryChanged('');
              }
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 14, end: 16),
              child: Text(
                K.cancel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildItem(int index, HealerUpCard item) {
    double width = Util.width - 16 * 2;
    return Container(
      width: width,
      height: 90,
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 8),
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xFFD5FDF4), Colors.white, Color(0xFFF4E0FF)]),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (item.rid > 0) {
                IRoomManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_BASE_ROOM);
                manager.openChatRoomScreenShow(context, item.rid,
                    refer: 'squ_recommend');
                return;
              }
              IPersonalDataManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              manager.openImageScreen(context, item.uid);
            },
            child: Stack(
              children: [
                CommonAvatar(
                  path: item.icon,
                  size: 74,
                  shape: BoxShape.circle,
                ),
                if (item.rid > 0)
                  PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: Colors.white, width: 1.5),
                        gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: RepaintBoundary(
                        child: R.img(BaseAssets.shared$living_small_webp,
                            width: 12, height: 12),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 2),
                    CachedNetworkImage(
                      imageUrl: item.levelIcon,
                      height: 19,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
                if (item.sign.isNotEmpty)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 6),
                    child: Text(
                      item.sign,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: R.color.tipsTextColor, fontSize: 12),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  HealerRankPage.launch(context, uid: item.uid);
                },
                child: Container(
                  padding: EdgeInsetsDirectional.only(bottom: 2.dp),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFFF5F7D)))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      R.img(Assets.personaldata$healer_ic_up_card_webp,
                          width: 21, height: 21),
                      const SizedBox(width: 2),
                      NumText(
                        '*${item.count}',
                        style: const TextStyle(
                            color: Color(0xFFFF5F7D),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              GestureDetector(
                  onTap: () {
                    HealerUseSheet.show(context, item.uid, item.name);
                  },
                  child: R.img(Assets.personaldata$healer_btn_up_ta_webp,
                      width: 63, height: 28)),
              const SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}
