import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/slp_src/gift_api.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

/// 印象排行榜
///
class RoomTagGiftRankScreen extends StatefulWidget {
  final int tagId;

  const RoomTagGiftRankScreen(this.tagId, {Key? key}) : super(key: key);

  @override
  State<RoomTagGiftRankScreen> createState() => _RoomTagGiftRankScreenState();

  static Future show(BuildContext context, int tagId) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RoomTagGiftRankScreen(tagId),
        settings: const RouteSettings(name: '/roomTagGiftRankScreen'),
      ),
    );
  }
}

class _RoomTagGiftRankScreenState extends State<RoomTagGiftRankScreen>
    with TickerProviderStateMixin {
  GiftImpressionTag? selectedTag;

  ResGiftImpressionRank? data;
  List<GiftImpressionTag>? tags;
  List<GiftImpressionRank>? rankList;

  static const double rowHeight = 76;
  static const double side = 16;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    data = await GiftApi.getcTagGiftRank(
        selectedTag == null ? widget.tagId : selectedTag!.tagId);
    if (data != null && data!.success) {
      tags = data!.data.tags;
      selectedTag ??= tags!.first;
      rankList = data!.data.list;
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) return root(const Loading(color: Color(0xFF035E77)));
    if (!data!.success)
      return root(
          ErrorData(error: data!.msg, fontColor: const Color(0xFF035E77)));
    if (tags!.isEmpty) return root(const EmptyWidget());

    return root(
      RefreshIndicatorFactory.of(
        onRefresh: () => _loadData(),
        child: Column(
          children: [
            _buildTabBar(),
            const SizedBox(height: 20),
            Expanded(
              child: rankList!.isNotEmpty
                  ? Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: side, end: side, bottom: 34),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment(0, -1),
                          end: Alignment(1, -0.4),
                          colors: [Color(0xFFF1EFFF), Color(0xFFFFFFFF)],
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: rankList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          GiftImpressionRank item = rankList![index];
                          return _buildRankItem(item);
                        },
                      ),
                    )
                  : const Center(child: EmptyWidget()),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsetsDirectional.only(start: side, end: side),
        itemBuilder: (context, index) {
          GiftImpressionTag item = tags![index];
          return _buildTagItem(item);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 8),
        itemCount: tags!.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget root(Widget body) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBar.custom(
        backColor: Colors.white,
        statusBrightness: Brightness.dark,
        title: Text(
          K.tag_gift_rank_title,
          style: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              BaseWebviewScreen.show(context, url: Util.parseHelpUrl(133));
            },
            icon: const Icon(
              Icons.help_outline,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: [Color(0xFF2B3CF6), Color(0xFF000B7B)],
          ),
        ),
        child: Stack(
          children: [
            R.img(Assets.tag_gift_tag_gift_header_bg_webp,
                package: ComponentManager.MANAGER_GIFT, width: Util.width),
            SafeArea(bottom: false, child: body),
          ],
        ),
      ),
    );
  }

  Widget _buildTagItem(GiftImpressionTag item) {
    bool selected = selectedTag == item;

    return GestureDetector(
      onTap: () {
        if (selectedTag != item) {
          setState(() {
            selectedTag = item;
          });
          _loadData();
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: selected
            ? BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(1, 1),
                  end: const Alignment(-1, -1),
                  colors: [
                    const Color(0xFF6CDFF4).withAlpha(255),
                    const Color(0xFFF0FFFE).withAlpha(255)
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              )
            : BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(1, 1),
                  end: const Alignment(-1, -1),
                  colors: [
                    const Color(0xFF6CDFF4).withAlpha(76),
                    const Color(0xFFF0FFFE).withAlpha(76)
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
          child: Text(
            item.tagName,
            style: TextStyle(
              color:
                  selected ? const Color(0xFF182E9A) : const Color(0xFFA9B8FF),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRankItem(GiftImpressionRank item) {
    double dividerHeight = 1 / Util.devicePixelRatio;
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Column(
        children: [
          SizedBox(
            height: rowHeight - dividerHeight,
            child: Row(
              children: [
                Text(
                  item.rank.toString(),
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF182E9A),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 16),
                CommonAvatar(
                  path: item.userIcon,
                  size: 46,
                  shape: BoxShape.circle,
                ),
                const SizedBox(width: 8),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 2),
                    child: Text(
                      item.userName,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF182E9A),
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Text(
                  K.tag_gift_taged_times(['${item.score}']),
                  style: TextStyle(
                      color: R.color.mainTextColor.withAlpha(178),
                      fontSize: 13),
                )
              ],
            ),
          ),
          Divider(
            height: dividerHeight,
            color: const Color(0xFFD5EBBE),
          )
        ],
      ),
    );
  }
}
