import 'dart:math';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';
import 'package:gift/slp_src/gift_api.dart';
import 'package:gift/slp_src/model/pb/slp_gift_extension.dart';
import 'package:gift/slp_src/tag_gift_v2/slp_tag_gift_num_select_widget.dart';
import '../../assets.dart';

/// 印象标签礼物V2
class RoomTagGiftV2Screen extends StatefulWidget {
  const RoomTagGiftV2Screen({Key? key}) : super(key: key);

  @override
  State<RoomTagGiftV2Screen> createState() => _RoomTagGiftV2ScreenState();

  static Future show(
    BuildContext context,
  ) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 1.0,
      builder: (context) {
        return const RoomTagGiftV2Screen();
      },
      settings: const RouteSettings(name: '/roomTagGiftV2Screen'),
    );
  }
}

class _RoomTagGiftV2ScreenState extends State<RoomTagGiftV2Screen> {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  SpecialGiftSendInfo sendInfo = SpecialGiftSendInfo();

  List<RoomPosition> _userPositions = [];
  int _selectGiftNum = 1;

  ResGiftImpressionDetail? _impressionDetailData;
  List<GiftImpressionTagGift>? _impressionTags;
  List<GiftImpressionUserStat>? _peopleTags;
  List<GiftImpressionTagGift> _selectedTags = [];

  int get selectedUid => sendInfo.selectUserId.first;

  bool _isLoading = false;

  final GlobalKey _selectNumKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    _userPositions = giftManager.getGiftUsers(ChatRoomData.getInstance())
        as List<RoomPosition>;
    if (_userPositions.isNotEmpty) {
      sendInfo.selectUserId = [_userPositions.first.uid];
      _requestData();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _requestData() async {
    if (_isLoading) return;
    _isLoading = true;
    _impressionDetailData =
        await GiftApi.getImpressionTagGiftsInfo(sendInfo.selectUserId.first);
    // debugPrint(_impressionDetailData.toString());
    if (_impressionDetailData != null && _impressionDetailData!.success) {
      _impressionTags = _impressionDetailData!.data.tags;
      _peopleTags = _impressionDetailData!.data.userStat;
      //屏蔽默认选中
      // _selectedTags = (_impressionTags?.isNotEmpty ?? false) ? [_impressionTags!.first] : [];
      _selectedTags = [];
    }
    _isLoading = false;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return _buildBody(const Loading(color: Color(0xFF035E77)));
    if (!(_impressionDetailData?.success ?? false)) {
      return _buildBody(ErrorData(
          error: _impressionDetailData?.msg ?? '',
          fontColor: const Color(0xFF035E77)));
    }
    if (_impressionTags == null || _impressionTags!.isEmpty)
      return _buildBody(const EmptyWidget());

    return _buildBody(
      Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      //可选标签
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 16, top: 16, bottom: 12),
                          child: Text(K.tag_gift_send_tag,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      SliverPadding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 16, end: 16),
                          sliver: _buildImpressionTagsWidget()),

                      //对方获得的标签
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 16, top: 28, bottom: 12),
                          child: Text(K.tag_gift_his_tag,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      SliverPadding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 16, end: 16),
                          sliver: _buildUserTagsWidget()),
                    ],
                  ),
                ),
                _sendButtonWidget(),
              ],
            ),
          ),
          PositionedDirectional(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xff3D2B98),
                    const Color(0xff3D2B98).withOpacity(0)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                width: Util.width,
                height: 12,
              )),
          PositionedDirectional(
              bottom: Util.bottomMargin + 64,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xff190F4A).withOpacity(0),
                    const Color(0xff190F4A)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                width: Util.width,
                height: 12,
              )),
        ],
      ),
    );
  }

  Widget _buildBody(Widget body) {
    return Stack(
      children: [
        R.img(
          Assets.gift$tag_gift_bg_webp,
          width: Util.width,
          fit: BoxFit.fitWidth,
        ),
        Positioned.fill(
            child: Column(
          children: [
            _buildTopWidget(),
            _buildUserWidget(),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: body),
          ],
        )),
      ],
    );
  }

  Widget _buildTopWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              IRankManager rankManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_RANK);
              rankManager.showRank(context, 'impress_tag');
            },
            child: R.img(
              Assets.gift$tag_gift_icon_webp,
              width: 70,
              fit: BoxFit.fitWidth,
            ),
          ),
          R.img(
            Assets.gift$tag_gift_title_webp,
            width: 70,
            fit: BoxFit.fitWidth,
          ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            width: 70,
            height: 24,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                BaseWebviewScreen.show(context, url: Util.parseHelpUrl(133));
              },
              icon: const Icon(
                Icons.help_outline,
                color: Colors.white,
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }

  ///麦上用户
  Widget _buildUserWidget() {
    return Container(
      height: 60,
      width: Util.width - 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.dp),
        border: Border.all(color: Colors.white.withOpacity(0.6), width: 0.5),
        gradient: const LinearGradient(
          colors: [Color(0xff9C9CFF), Color(0xff5F49CC)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          padding: const EdgeInsetsDirectional.all(0),
          itemCount: _userPositions.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            RoomPosition item = _userPositions[index];
            return _buildAvatarItem(item);
          },
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
          _requestData();
        }
      },
      child: SizedBox(
        height: 35,
        width: 44,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PositionedDirectional(
              top: 3,
              bottom: 0,
              end: 0,
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: selected ? const Color(0xff30009F) : Colors.white,
                      width: selected ? 1.5 : 1),
                ),
                child: CommonAvatar(
                  path: position.icon,
                  size: 32,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Visibility(
              visible: selected,
              child: PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: R.img(
                    Assets.gift$tag_gift_user_select_webp,
                    width: 15,
                    height: 15,
                  )),
            )
          ],
        ),
      ),
    );
  }

  ///标签礼物
  Widget _buildImpressionTagsWidget() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //Grid按两列显示
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 109 / 94,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          GiftImpressionTagGift item = _impressionTags![index];
          GiftImpressionTagNaming naming = item.naming;
          bool selected = _selectedTags.contains(item);
          double width = (Util.width - 48) / 3;
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_selectedTags.contains(item)) {
                  if (_selectedTags.isNotEmpty) {
                    _selectedTags.remove(item);
                  }
                } else {
                  _selectedTags.add(item);
                }
              });
            },
            child: Stack(
              children: [
                R.img(
                  selected
                      ? Assets.gift$tag_gift_select_png
                      : Assets.gift$tag_gift_unselect_webp,
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
                Positioned.fill(
                    child: Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(minHeight: 41),
                      padding: const EdgeInsetsDirectional.only(
                          start: 2, top: 2, end: 2),
                      child: CachedNetworkImage(
                        imageUrl: Util.getRemoteImgUrl(item.tagBg),
                        width: width - 4,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(MoneyConfig.moneyIcon,
                            width: 10.0, height: 10.0),
                        const SizedBox(
                          width: 2,
                        ),
                        NumText(item.price.toString(),
                            style: TextStyle(
                                color: selected
                                    ? const Color(0xff3E35DC)
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(6),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          R.img(
                            naming.userName.isNotEmpty
                                ? Assets.gift$tag_gift_name_title_webp
                                : Assets.gift$tag_gift_name_title_no_webp,
                            width: width,
                            fit: BoxFit.fitWidth,
                          ),
                          naming.userName.isNotEmpty
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text('${K.gift_impress_tag_show_name}:',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600)),
                                    CommonAvatar(
                                      path: naming.userIcon,
                                      size: 12,
                                      shape: BoxShape.circle,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Flexible(
                                      child: Text(naming.userName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                  ],
                                )
                              : Text(K.gift_no_impress_tag,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          );
        },
        childCount: _impressionTags?.length,
      ),
    );
  }

  ///用户标签
  Widget _buildUserTagsWidget() {
    double width = (Util.width - 48) / 3;
    double height = width * 60 / 109;
    int count = (max(_peopleTags?.length ?? 0, 6) / 3).ceil();
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsetsDirectional.only(top: 8, bottom: 10),
        height: count * (height + 8) + 18,
        width: Util.width - 16,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff9C9CFF), Color(0xff5F49CC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: BeveledRectangleBorder(
            side: BorderSide(width: 0.5, color: Colors.white.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              offset: const Offset(0, 0.5),
              blurRadius: 6,
              color: Colors.white.withOpacity(0.5),
              blurStyle: BlurStyle.solid,
            )
          ],
        ),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //Grid按两列显示
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 109 / 60,
            ),
            itemBuilder: (context, index) {
              GiftImpressionUserStat? item;
              if (index < (_peopleTags?.length ?? 0)) {
                item = _peopleTags![index];
              }
              return Column(
                children: [
                  Container(
                    width: width,
                    height: width * 41 / 105,
                    alignment: Alignment.center,
                    padding: const EdgeInsetsDirectional.only(
                        start: 2, top: 2, end: 2),
                    child: item != null
                        ? CachedNetworkImage(
                            imageUrl: Util.getRemoteImgUrl(item.tagBg),
                            fit: BoxFit.fitWidth,
                            width: width - 4,
                          )
                        : Container(
                            width: 82,
                            height: 26,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.16),
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                  ),
                  Text(
                    item != null
                        ? K.tag_gift_be_sended_times(['${item.incomeNum}'])
                        : K.tag_gift_wants_be_taged,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 12),
                  ),
                ],
              );
            },
            itemCount: max(_peopleTags?.length ?? 0, 6)),
      ),
    );
  }

  ///赠送按钮
  Widget _sendButtonWidget() {
    return Container(
      width: Util.width,
      height: Util.bottomMargin + 64,
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.only(bottom: Util.bottomMargin),
      child: _selectedTags.isNotEmpty
          ? SizedBox(
              height: 64,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  R.img(
                    Assets.gift$tag_gift_send_bg_webp,
                    height: 44,
                    fit: BoxFit.fitHeight,
                  ),
                  PositionedDirectional(
                    end: 0,
                    child: GestureDetector(
                      onTap: () {
                        _sendGiftTags();
                      },
                      child: R.img(
                        Assets.gift$tag_gift_send_webp,
                        height: 64,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    start: 0,
                    child: GestureDetector(
                      onTap: () {
                        _switchNum();
                      },
                      behavior: HitTestBehavior.translucent,
                      child: SizedBox(
                        key: _selectNumKey,
                        width: 60,
                        height: 44,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NumText(
                              "$_selectGiftNum",
                              style: const TextStyle(
                                color: Color(0xffFCDD7E),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            R.img(
                              Assets.gift$tag_gift_send_down_arrow_webp,
                              width: 12,
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : R.img(
              Assets.gift$tag_gift_send_webp,
              height: 64,
              fit: BoxFit.fitHeight,
            ),
    );
  }

  void _switchNum() async {
    final renderObj = _selectNumKey.currentContext?.findRenderObject();
    if (renderObj != null && renderObj is RenderBox) {
      final renderBox = renderObj;
      final offset = renderBox.localToGlobal(Offset.zero);
      final rect = Rect.fromLTWH(
          offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);

      if (_impressionDetailData != null) {
        SlpTagGiftNumSelectWidget.show(
                context,
                _impressionDetailData!.chooseNumConfig,
                _selectGiftNum,
                rect,
                offset)
            .then((value) {
          if (Util.parseInt(value) > 0) {
            if (mounted) {
              setState(() {
                _selectGiftNum = value ?? 1;
              });
            }
          }
        });
      }
    }
  }

  DialogLoadingController? _loading;
  Future<void> _sendGiftTags() async {
    int allPrice = _calculatePrice(_selectedTags);

    /// 先判断是否余额不足
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result =
        await payManager.showRechargeSheet(System.context, allPrice);
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    /// 按gift id区分，有几个gift id就调用几次pay方法
    Map<int, List<GiftImpressionTagGift>?> selectedTagMap = {};
    for (GiftImpressionTagGift gift in _selectedTags) {
      List<GiftImpressionTagGift>? tags = selectedTagMap[gift.giftId];
      tags ??= [];
      tags.add(gift);
      selectedTagMap[gift.giftId] = tags;
    }

    if (selectedTagMap.keys.isNotEmpty) {
      _loading = DialogLoadingController();
      _loading?.show(
          context: context,
          message: R.string('string_loading'),
          barrierDismissible: true);
      _cyclePay(selectedTagMap, result.value?.key);
    }
  }

  void _cyclePay(
      Map<int, List<GiftImpressionTagGift>?> selectedTagMap, String? type) {
    if (selectedTagMap.keys.isNotEmpty) {
      int giftId = selectedTagMap.keys.first;
      _pay(giftId, selectedTagMap[giftId], type, finishCallback: () {
        selectedTagMap.remove(giftId);
        _cyclePay(selectedTagMap, type);
      });
    } else {
      _loading?.close();
    }
  }

  void _pay(int giftId, List<GiftImpressionTagGift>? tags, String? type,
      {VoidCallback? finishCallback}) async {
    {
      if (tags == null || tags.isEmpty) return;

      List<int> tagsId =
          List.generate(tags.length, (index) => tags[index].tagId).toList();

      Map params = {
        'rid': ChatRoomData.getInstance()?.rid,
        'uids': selectedUid.toString(),
        'positions': _getSelectPosition().join(','),
        'position': _getMyPosition(),
        'giftId': giftId,
        'giftNum': tags.length * _selectGiftNum,
        'price': tags.first.price,
        'version': 2,
        'num': tags.length * _selectGiftNum,
        'show_pac_man_guide':
            Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
        'refer': '${ChatRoomData.getInstance()?.refer}:room',
        'gift_type': 'normal',
        'star': 0,
        'all_mic': 0,
        'impress_ids': tagsId.join(',')

        /// 打开礼物面板本身的refer
      };

      _payManager.pay(
        context,
        key: 'gift',
        type: type ?? '',
        refer: 'gift',
        args: {
          'money': _calculatePrice(tags),
          'type': 'package',
          'params': params
        },
        showLoading: false,
        onPayed: () {
          if (finishCallback != null) {
            finishCallback();
          }
        },
        onError: (bool isErrorCatch) {
          if (finishCallback != null) {
            finishCallback();
          }
        },
      );
    }
  }

  int _calculatePrice(List<GiftImpressionTagGift> tags) {
    int price = 0;
    for (GiftImpressionTagGift gift in tags) {
      price = price + gift.price;
    }
    price = price * _selectGiftNum;
    return price;
  }

  List<int> _getSelectPosition() {
    List<int> positions = [];
    for (int i = 0; i < _userPositions.length; ++i) {
      RoomPosition p = _userPositions[i];
      if (selectedUid == p.uid) {
        positions.add(p.position);
        break;
      }
    }
    return positions;
  }

  int _getMyPosition() {
    int myPosition = -1;
    ChatRoomData.getInstance()?.positions.forEach((RoomPosition position) {
      int uid = position.uid;
      if (uid > 0 && uid == Session.uid) {
        myPosition = position.position;
      }
    });
    return myPosition;
  }
}
