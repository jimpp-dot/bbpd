import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as CoreK;
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';
import 'package:gift/slp_src/gift_api.dart';
import 'package:gift/slp_src/model/pb/slp_gift_extension.dart';
import 'package:gift/slp_src/tag_gift/slp_tag_gift_rank_screen.dart';
import 'package:gift/slp_src/tag_gift/slp_tag_gift_send_bar.dart';

import '../../assets.dart';

/// 印象标签礼物
///
class RoomTagGiftScreen extends StatefulWidget {
  final List<RoomPosition> userPositions;
  final BbGiftPanelData? panelData;
  final BbGiftPanelGift gift;
  final Function(SpecialGiftSendInfo? sendInfo) sendInfoDidChange;
  final Function(List<int> tagsId) send;

  const RoomTagGiftScreen(this.userPositions, this.panelData, this.gift,
      this.sendInfoDidChange, this.send,
      {Key? key})
      : super(key: key);

  @override
  State<RoomTagGiftScreen> createState() => _RoomTagGiftScreenState();

  static Future show(
    BuildContext context,
    List<RoomPosition> userPositions,
    BbGiftPanelData? panelData,
    BbGiftPanelGift gift,
    Function(SpecialGiftSendInfo? sendInfo) sendInfoDidChange,
    Function(List<int> tagsId) send,
  ) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RoomTagGiftScreen(
            userPositions, panelData, gift, sendInfoDidChange, send),
        settings: const RouteSettings(name: '/roomTagGiftScreen'),
      ),
    );
  }
}

class _RoomTagGiftScreenState extends State<RoomTagGiftScreen> {
  SpecialGiftSendInfo sendInfo = SpecialGiftSendInfo();

  int tagNum = 1;
  int selectGiftNum = 1;
  ResGiftImpressionDetail? data;
  List<GiftImpressionTagGift>? tags;
  List<GiftImpressionUserStat>? peopleTags;
  List<GiftImpressionTagGift> selectedTags = [];

  List<int> get tagsId =>
      List.generate(selectedTags.length, (index) => selectedTags[index].tagId)
          .toList();

  int get selectedUid => sendInfo.selectUserId.first;

  @override
  void initState() {
    super.initState();
    sendInfo.selectUserId = [widget.userPositions.first.uid];
    sendInfo.giftNum = selectGiftNum * selectedTags.length;
    sendInfo.totalNum = sendInfo.giftNum;
    widget.sendInfoDidChange(sendInfo);
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    widget.sendInfoDidChange(null);
  }

  _loadData() async {
    data = await GiftApi.getcTagGiftsInfo(
        widget.gift.id, sendInfo.selectUserId.first);
    if (data != null && data!.success) {
      tags = data!.data.tags;
      peopleTags = data!.data.userStat;
      selectedTags = tags!.isNotEmpty ? [tags!.first] : [];
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    const double side = 12;
    const double innerSide = 24;
    const double margin = 0;
    const int numPerRow = 3;
    double width =
        (Util.width - side * 2 - innerSide * 2 - margin * 2) / numPerRow;

    if (data == null)
      return _buildBody(const Loading(color: Color(0xFF035E77)));
    if (!data!.success)
      return _buildBody(
          ErrorData(error: data!.msg, fontColor: const Color(0xFF035E77)));
    if (tags == null || tags!.isEmpty) return _buildBody(const EmptyWidget());

    return _buildBody(
      RefreshIndicatorFactory.of(
        onRefresh: () => _loadData(),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  //用户头像
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: SizedBox(
                        height: 100,
                        child: ListView.separated(
                          padding: const EdgeInsetsDirectional.only(
                              start: side, end: side),
                          itemBuilder: (context, index) {
                            RoomPosition item = widget.userPositions[index];
                            return _buildAvatarItem(item);
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(width: 8),
                          itemCount: widget.userPositions.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ),
                  //可选标签
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 8, bottom: 24, start: side, end: side),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: const Color(0x4DFFFFFF), width: 1),
                          gradient: const LinearGradient(
                            begin: Alignment(1, 1),
                            end: Alignment(-1, -1),
                            colors: [Color(0xFF0339C5), Color(0xFF797BFF)],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                R.img(Assets.tag_gift_tag_gift_title_bg_webp,
                                    package: ComponentManager.MANAGER_GIFT,
                                    width: 165,
                                    height: 38),
                                Text(
                                  K.tag_gift_send_tag,
                                  style: const TextStyle(
                                      color: Color(0xFFF3F1FF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 12, start: 7, end: 7, bottom: 24),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: const Alignment(0, -1),
                                    end: const Alignment(0, 0.5),
                                    colors: [
                                      const Color(0xFFF1EFFF).withAlpha(204),
                                      const Color(0xFFFFFFFF).withAlpha(204)
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 18, start: 15, end: 15, bottom: 18),
                                  child: Wrap(
                                    children: [
                                      Wrap(
                                        runSpacing: margin,
                                        spacing: margin,
                                        children: List.generate(tags!.length,
                                            (index) {
                                          GiftImpressionTagGift item =
                                              tags![index];
                                          return _buildTag(item, width);
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // //对方获得的标签
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 10.0, start: side, end: side),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: const Color(0x4DFFFFFF), width: 1),
                          gradient: const LinearGradient(
                            begin: Alignment(1, 1),
                            end: Alignment(-1, -1),
                            colors: [Color(0xFF0339C5), Color(0xFF797BFF)],
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              margin:
                                  const EdgeInsetsDirectional.only(start: 13),
                              alignment: AlignmentDirectional.bottomStart,
                              child: R.img(
                                Assets.tag_gift_tag_gift_card_start_webp,
                                package: ComponentManager.MANAGER_GIFT,
                                width: 17,
                                height: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: innerSide, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    K.tag_gift_his_tag,
                                    style: const TextStyle(
                                        color: Color(0xFFF3F1FF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      RoomTagGiftRankScreen.show(
                                          context, tags!.first.tagId);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          CoreK.K.base_msg_source_rank,
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withAlpha(128),
                                              fontSize: 13),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Wrap(
                              runSpacing: margin,
                              spacing: margin,
                              children: List.generate(6, (index) {
                                GiftImpressionUserStat? item =
                                    index < peopleTags!.length
                                        ? peopleTags![index]
                                        : null;
                                return _buildPeoplesTag(item, width);
                              }).toList(),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  end: innerSide, bottom: 30, top: 3),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  Text(
                                    data!.data.latestTagName.isNotEmpty
                                        ? K.tag_gift_newest_tag(
                                            [(data!.data.latestTagName)])
                                        : '',
                                    style: TextStyle(
                                        color: Colors.white.withAlpha(128),
                                        fontSize: 13),
                                  ),
                                  const SizedBox(width: 10),
                                  R.img(Assets.tag_gift_tag_gift_card_end_webp,
                                      package: ComponentManager.MANAGER_GIFT,
                                      width: 17,
                                      height: 14),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 34),
              child: RoomTagGiftSendBar(
                  widget.panelData?.chooseNumConfig, widget.panelData,
                  (int selectGiftNum) {
                this.selectGiftNum = selectGiftNum;
                sendInfo.giftNum = selectGiftNum * selectedTags.length;
                sendInfo.totalNum = sendInfo.giftNum;
                widget.sendInfoDidChange(sendInfo);
              }, () {
                if (tagsId.isNotEmpty) {
                  widget.send(tagsId);
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody(Widget body) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBar.custom(
        statusBrightness: Brightness.dark,
        title: Text(
          K.tag_gift_tag_style,
          style: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        backColor: Colors.white,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              BaseWebviewScreen.show(context, url: Util.parseHelpUrl(133));
            },
            icon: const Icon(Icons.help_outline, color: Colors.white),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 1),
              colors: [Color(0xFF2B3CF6), Color(0xFF000B7B)]),
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

  Widget _buildAvatarItem(RoomPosition position) {
    bool selected = position.uid == selectedUid;

    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {
            sendInfo.selectUserId = [position.uid];
          });
          _loadData();
        }
      },
      child: Container(
        height: 100,
        decoration: selected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x80FFFFFF), width: 1),
                gradient: const LinearGradient(
                  begin: Alignment(1, 1),
                  end: Alignment(-1, -1),
                  colors: [Color(0xFF6CDFF4), Color(0xFFF0FFFE)],
                ),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: const Color(0x80FFFFFF).withAlpha(30), width: 1),
                gradient: LinearGradient(
                  begin: const Alignment(1, 1),
                  end: const Alignment(-1, -1),
                  colors: [
                    const Color(0xFF6CDFF4).withAlpha(76),
                    const Color(0xFFF0FFFE).withAlpha(76)
                  ],
                ),
              ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 18, end: 18, top: 12, bottom: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: CommonAvatar(
                      path: position.icon,
                      size: 48,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 80),
                  child: Text(
                    position.name,
                    style: const TextStyle(
                        color: Color(0xFF182E9A),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
              ],
            ),
            Visibility(
              visible: selected,
              child: const PositionedDirectional(
                bottom: -10,
                start: 0,
                end: 0,
                child: Center(
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFF4056C1),
                    size: 34,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTag(GiftImpressionTagGift item, double width) {
    GiftImpressionTagNaming naming = item.naming;
    bool selected = selectedTags.contains(item);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedTags.contains(item)) {
            if (selectedTags.length > 1) {
              selectedTags.remove(item);
            }
          } else {
            selectedTags.add(item);
          }
        });
        sendInfo.giftNum = selectGiftNum * selectedTags.length;
        sendInfo.totalNum = sendInfo.giftNum;
        widget.sendInfoDidChange(sendInfo);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            alignment: Alignment.center,
            width: width,
            height: 84,
            decoration: selected
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFF74DDFF), width: 2),
                  )
                : BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 2),
                  ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: width - 8,
                  height: 38,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: "${System.imageDomain}${item.tagBg}",
                        cachedWidth: Util.parseInt(width - 8),
                        cachedHeight: 38,
                      ),
                      Text(
                        item.tagName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.gift.price.toString(),
                        style: TextStyle(
                            color: R.color.mainTextColor, fontSize: 13)),
                    const SizedBox(
                      width: 2,
                    ),
                    R.img(BaseAssets.ic_diamond_webp,
                        package: ComponentManager.MANAGER_BASE_CORE,
                        width: 18,
                        height: 18),
                  ],
                )
              ],
            ),
          ),
          //冠名部分
          Visibility(
            visible: naming.userName.isNotEmpty,
            child: PositionedDirectional(
              top: -6,
              start: 0,
              height: 24,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonAvatar(
                      path: naming.userIcon,
                      size: 24,
                      shape: BoxShape.circle,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 4, end: 4),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: width - 2 - 8 - 24),
                        child: Text(
                          naming.userName,
                          style: TextStyle(
                            color: R.color.unionRankText1,
                            fontSize: 9,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPeoplesTag(GiftImpressionUserStat? item, double width) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: width,
          height: 80, //38+6+16+12+8
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 12),
                child: SizedBox(
                  width: width - 8,
                  height: 38,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      item != null
                          ? CachedNetworkImage(
                              imageUrl: "${System.imageDomain}${item.tagBg}",
                              cachedWidth: Util.parseInt(width - 8),
                              cachedHeight: 38,
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(25),
                                  borderRadius: BorderRadius.circular(19)),
                            ),
                      item != null
                          ? Text(
                              item.tagName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            )
                          : Text(
                              K.tag_gift_wants_be_taged,
                              style: TextStyle(
                                  color: Colors.white.withAlpha(76),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item != null
                    ? K.tag_gift_be_sended_times(['${item.incomeNum}'])
                    : '',
                style:
                    TextStyle(color: Colors.white.withAlpha(204), fontSize: 11),
              ),
            ],
          ),
        ),
        //冠名部分
        if (item != null && item.topSenderIcon.isNotEmpty)
          PositionedDirectional(
            top: 0,
            end: 0,
            height: 22,
            width: 22,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: CommonAvatar(
                path: item.topSenderIcon,
                size: 20,
                shape: BoxShape.circle,
              ),
            ),
          )
      ],
    );
  }
}
