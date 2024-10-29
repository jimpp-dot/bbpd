import 'dart:convert';
import 'dart:math';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/guess_gift/guess_gift_rank_page.dart';
import 'package:chat_room/src/guess_gift/model/guess_gift_repo.dart';
import 'package:chat_room/src/protobuf/generated/guess_gift.pb.dart';
import 'package:flutter/material.dart';

class GuessGiftBoxCli {
  final String orientation; // 方向
  final int maxGiftNum; // 单个礼物最大数
  final int maxGiftKind; // 最多几种礼物

  final Map<String, int> _giftsNum = {};

  Map<String, int> get giftsNum => _giftsNum;

  GuessGiftBoxCli(this.orientation, this.maxGiftNum, this.maxGiftKind);

  void plus(String giftId) {
    if (_giftsNum.containsKey(giftId)) {
      int num = (_giftsNum[giftId] ?? 0) + 1;
      if (num <= maxGiftNum) {
        _giftsNum[giftId] = num;
      } else {
        Fluttertoast.showToast(msg: K.room_guess_gift_plus_tip_1);
      }
    } else {
      if (_giftsNum.length < maxGiftKind) {
        _giftsNum[giftId] = 1;
      } else {
        Fluttertoast.showToast(
            msg: K.room_guess_gift_plus_tip_2(['$maxGiftKind']));
      }
    }
  }

  void minus(String giftId) {
    if (_giftsNum.containsKey(giftId)) {
      int num = (_giftsNum[giftId] ?? 0) - 1;
      if (num > 0) {
        _giftsNum[giftId] = num;
      } else {
        _giftsNum.remove(giftId);
      }
    }
  }

  int getSelectedNum(String giftId) {
    return giftsNum[giftId] ?? 0;
  }
}

/// 礼物猜猜乐玩法 - 送礼
class GuessGiftPage extends StatefulWidget {
  final ChatRoomData room;

  const GuessGiftPage({Key? key, required this.room}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GuessGiftState();

  static Future show(BuildContext context, dynamic room) {
    return displayModalBottomSheet(
        context: context,
        disableTapDismissible: true,
        maxHeightRatio: 1.0,
        builder: (context) {
          return GuessGiftPage(room: room);
        });
  }
}

class _GuessGiftState extends State<GuessGiftPage>
    with BaseScreenStateMixin, SingleTickerProviderStateMixin {
  Throttle throttle = Throttle();

  GuessGiftPreferences? _data;
  GuessGiftPreferences get data => _data ?? GuessGiftPreferences();

  final Map<String, GuessGiftBoxGiftItem> _giftsMap = {};

  int _selectedUid = 0;
  int _selectedGiftIndex = -1;
  int _selectedBoxIndex = 1;

  final List<GuessGiftBoxCli> _giftBoxs = [];
  List<RoomPosition> positions = [];

  late ScrollController _giftController;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = TweenSequence<double>([
      //这是一个动画序列，weight表示权重
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.0, end: 0.0)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 1),
      TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: 1.0)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 1),
    ]).animate(animationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reset();
      }
    });
    _giftController = ScrollController();

    positions.addAll(widget.room.positions
        .where((e) => (e.uid > 0 && e.uid != Session.uid))
        .toList());
    _loadData();
  }

  @override
  void dispose() {
    throttle.dispose();
    _giftController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  Future _loadData() async {
    ApiGuessGiftPreferencesResponse resp =
        await GuessGiftRepo.getGuessGiftPreferences(widget.room.rid);
    if (resp.success) {
      _data = resp.data;

      _giftsMap.clear();
      for (var e in data.settings.gifts) {
        _giftsMap[e.giftId.toString()] = e;
      }

      _giftBoxs.clear();
      _giftBoxs.add(GuessGiftBoxCli(
          K.room_base_left,
          data.settings.config.maxGiftNum,
          data.settings.config.maxGiftCategories));
      _giftBoxs.add(GuessGiftBoxCli(
          K.room_base_middle,
          data.settings.config.maxGiftNum,
          data.settings.config.maxGiftCategories));
      _giftBoxs.add(GuessGiftBoxCli(
          K.room_base_right,
          data.settings.config.maxGiftNum,
          data.settings.config.maxGiftCategories));

      setScreenReady();
    } else {
      setScreenError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Container(
        width: double.infinity,
        height: Util.height * 0.75,
        alignment: AlignmentDirectional.topCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.imagePath(
                'guess_gift/ic_guess_gift_page_bg.webp',
                package: ComponentManager.MANAGER_BASE_ROOM)),
            fit: BoxFit.cover,
            alignment: AlignmentDirectional.topCenter,
          ),
        ),
        child: SafeArea(child: buildStatusContent()),
      ),
    );
  }

  @override
  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTitle(),
        Expanded(child: _buildBody()),
        const SizedBox(height: 4),
        _buildBtn(),
        const SizedBox(height: 4),
        Text(K.room_guess_gift_desc_1,
            style: const TextStyle(color: Color(0xFF8C45FD), fontSize: 10)),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          if (data.topOne.rank > 0) ...[
            _buildTopOne(),
            const SizedBox(height: 4),
          ],
          const SizedBox(height: 4),
          FadeTransition(
            opacity: animation,
            child: _buildGiftsWidget(),
          ),
          _buildBoxsWidget(),
          const SizedBox(height: 8),
          _buildMicUsersWidget(),
        ],
      ),
    );
  }

  Widget _buildMicUsersWidget() {
    if (Util.isCollectionEmpty(positions)) {
      return const SizedBox.shrink();
    }
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.2),
      ),
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      alignment: AlignmentDirectional.center,
      // padding: EdgeInsetsDirectional.only(top: 14, bottom: 14),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _buildPositionItem(positions[index], index);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
        itemCount: positions.length,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
      ),
    );
  }

  Widget _buildPositionItem(RoomPosition position, int index) {
    bool start = index == 0;
    bool end = index == data.settings.gifts.length - 1;

    bool selected = _selectedUid == position.uid;
    return Container(
      margin: EdgeInsetsDirectional.only(
          start: start ? 12 : 0, end: end ? 12 : 0, top: 14, bottom: 14),
      child: _buildAvatar(position.icon, 32, () {
        _selectedUid = position.uid;
        refresh();
      },
          showBorder: selected,
          showSelected: selected,
          borderColor: const Color(0xFFF448B3),
          borderWidth: 1),
    );
  }

  Widget _buildBoxsWidget() {
    List<Widget> boxsWidget =
        _giftBoxs.mapIndexed((i, e) => _buildBoxItem(i, e)).toList();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: boxsWidget
            .expand((_) =>
                (_ == boxsWidget.last) ? [_] : [_, const SizedBox(width: 10)])
            .toList(),
      ),
    );
  }

  Widget _buildBoxItem(
    int index,
    GuessGiftBoxCli box,
  ) {
    bool selected = _selectedBoxIndex == index;
    bool tacitTag = _isTacitTag(index);
    int totalPrice = _boxTotalPrice(box);

    double width = (Util.width - 16 * 2 - 10 * 2) / 3;
    double ratio = width / 108;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          throttle.call(() {
            if (_selectedBoxIndex != index) {
              _selectedBoxIndex = index;
              _selectedGiftIndex = -1;
              _giftController.animateTo(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
              refresh();
              animationController.forward();
            }
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            selected
                ? R.img('guess_gift/ic_guess_gift_arrow.webp',
                    width: 12,
                    height: 7,
                    package: ComponentManager.MANAGER_BASE_ROOM)
                : const SizedBox(height: 7),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              height: 130 * ratio,
              decoration: selected
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [
                          Color(0xFFFFE2FC),
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Color(0xFFFFE2FC)
                        ],
                      ),
                    )
                  : null,
              foregroundDecoration: selected
                  ? BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFDC92FF), width: 1),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    )
                  : null,
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 2),
                  Container(
                    width: 20 * ratio,
                    height: 20 * ratio,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(R.imagePath(
                            'guess_gift/ic_guess_gift_box_orientation_bg.webp',
                            package: ComponentManager.MANAGER_BASE_ROOM)),
                      ),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Text(box.orientation,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w500)),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              R.img(
                                totalPrice == 0
                                    ? 'guess_gift/ic_guess_gift_box_empty.webp'
                                    : 'guess_gift/ic_guess_gift_box.webp',
                                width: 76 * ratio * (selected ? 1 : 0.8),
                                height: 80 * ratio * (selected ? 1 : 0.8),
                                package: ComponentManager.MANAGER_BASE_ROOM,
                              ),
                              if (tacitTag)
                                PositionedDirectional(
                                  top: 0,
                                  end: 3 * (selected ? 1 : 0.8),
                                  child: R.img(
                                    'guess_gift/ic_guess_gift_box_tag.webp',
                                    width: 14 * ratio * (selected ? 1 : 0.8),
                                    height: 27 * ratio * (selected ? 1 : 0.8),
                                    package: ComponentManager.MANAGER_BASE_ROOM,
                                  ),
                                ),
                            ],
                          ),
                          if (!selected) ...[
                            SizedBox(height: 2 * ratio),
                            R.img(
                              'guess_gift/ic_guess_gift_box_dish.webp',
                              width: 54 * ratio,
                              height: 12 * ratio,
                              package: ComponentManager.MANAGER_BASE_ROOM,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  _buildPrice(totalPrice),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGiftsWidget() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      alignment: AlignmentDirectional.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            child: Text(
              K.room_guess_gift_desc_2,
              style: const TextStyle(color: Color(0xFF8C45FD), fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 110,
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _giftController,
              itemCount: data.settings.gifts.length,
              itemBuilder: (context, index) {
                return _buildGiftItem(data.settings.gifts[index], index);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 6);
              },
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildGiftItem(GuessGiftBoxGiftItem item, int index) {
    GuessGiftBoxCli box = _giftBoxs[_selectedBoxIndex];
    int selectedNum = box.getSelectedNum(item.giftId.toString());

    bool start = index == 0;
    bool end = index == data.settings.gifts.length - 1;
    bool selected = index == _selectedGiftIndex;
    String giftIcon =
        !Util.isStringEmpty(item.url) ? item.url : Util.giftImgUrl(item.giftId);
    return GestureDetector(
      onTap: () {
        if (_selectedGiftIndex != index) {
          _selectedGiftIndex = index;
          refresh();
        }
      },
      child: Stack(
        children: [
          Container(
            width: 80,
            height: double.infinity,
            margin: EdgeInsetsDirectional.only(
                start: start ? 10 : 0, end: end ? 10 : 0),
            decoration: BoxDecoration(
              color: const Color(0x1ADF77FF),
              borderRadius: BorderRadius.circular(8),
            ),
            foregroundDecoration: selected
                ? BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xFFAE49FF), width: 1),
                  )
                : null,
            alignment: AlignmentDirectional.topCenter,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(imageUrl: giftIcon, width: 60, height: 60),
                const SizedBox(height: 2),
                Text(item.name,
                    style:
                        const TextStyle(color: Color(0xFF42177A), fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: selected
                        ? _buildGiftItemNumOpt(item)
                        : _buildPrice(item.price),
                  ),
                ),
              ],
            ),
          ),
          if (item.numInBag > 0)
            PositionedDirectional(
              start: start ? 10 : 0,
              top: 0,
              child: Container(
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(8),
                      bottomEnd: Radius.circular(6)),
                  color: const Color(0xFFDF77FF).withOpacity(0.3),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: AlignmentDirectional.center,
                child: Text(K.room_guess_gift_bag_num(['${item.numInBag}']),
                    style:
                        const TextStyle(color: Color(0xFF42177A), fontSize: 9)),
              ),
            ),
          if (selectedNum > 0)
            PositionedDirectional(
              end: end ? 10 : 0,
              top: 0,
              child: Container(
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(6),
                      topEnd: Radius.circular(8)),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFEC6080).withOpacity(0.8),
                    const Color(0xFFFE7A33).withOpacity(0.8)
                  ]),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: AlignmentDirectional.center,
                child: Text('$selectedNum',
                    style: const TextStyle(color: Colors.white, fontSize: 9)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildGiftItemNumOpt(GuessGiftBoxGiftItem item) {
    GuessGiftBoxCli box = _giftBoxs[_selectedBoxIndex];
    int selectedNum = box.getSelectedNum(item.giftId.toString());

    return Container(
        width: double.infinity,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white, width: 1),
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                box.minus(item.giftId.toString());
                refresh();
              },
              child: Container(
                width: 20,
                height: 20,
                alignment: AlignmentDirectional.center,
                child: const Icon(Icons.remove,
                    size: 14, color: Color(0xFF49107F)),
              ),
            ),
            Container(
              width: 1,
              height: double.infinity,
              color: Colors.white,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 20,
                alignment: AlignmentDirectional.center,
                child: Text('$selectedNum',
                    style:
                        TextStyle(color: R.color.mainTextColor, fontSize: 12)),
              ),
            ),
            Container(
              width: 1,
              height: double.infinity,
              color: Colors.white,
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                box.plus(item.giftId.toString());
                refresh();
              },
              child: Container(
                width: 20,
                height: 20,
                alignment: AlignmentDirectional.center,
                child:
                    const Icon(Icons.add, size: 14, color: Color(0xFF49107F)),
              ),
            ),
          ],
        ));
  }

  Widget _buildPrice(int price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(MoneyConfig.moneyIcon, width: 12, height: 12),
        const SizedBox(width: 2),
        Text('$price',
            style: const TextStyle(color: Color(0xB36E2CE4), fontSize: 11)),
      ],
    );
  }

  Widget _buildTopOne() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          height: 72,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(R.imagePath(
                  'guess_gift/ic_guess_gift_top_bg.webp',
                  package: ComponentManager.MANAGER_BASE_ROOM)),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            color: Colors.transparent,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildAvatar(data.topOne.user1.icon, 48,
                        () => _onTapUserScreen(data.topOne.user1.uid),
                        showBorder: true,
                        borderColor: const Color(0xFFFAD961),
                        borderWidth: 2),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        data.topOne.user1.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              R.img('guess_gift/ic_guess_gift_top_icon.webp',
                  width: 57,
                  height: 48,
                  package: ComponentManager.MANAGER_BASE_ROOM),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        data.topOne.user2.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const SizedBox(width: 4),
                    _buildAvatar(data.topOne.user2.icon, 48,
                        () => _onTapUserScreen(data.topOne.user2.uid),
                        showBorder: true,
                        borderColor: const Color(0xFFFAD961),
                        borderWidth: 2),
                  ],
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(String url, double size, VoidCallback callback,
      {bool showBorder = false,
      bool showSelected = false,
      Color borderColor = Colors.transparent,
      double borderWidth = 0}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: callback,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size,
            height: size,
            foregroundDecoration: showBorder
                ? ShapeDecoration(
                    shape: StadiumBorder(
                        side:
                            BorderSide(color: borderColor, width: borderWidth)),
                    color: Colors.transparent,
                  )
                : null,
            child: CommonAvatar(path: url, size: size, shape: BoxShape.circle),
          ),
          if (showSelected)
            PositionedDirectional(
              top: -3,
              end: -3,
              child: Container(
                width: 14,
                height: 14,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [Color(0xFFFA7EDA), Color(0xFFF448B3)],
                  ),
                ),
                alignment: AlignmentDirectional.center,
                child: const Icon(Icons.done, size: 10, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBtn() {
    return InkWell(
      onTap: _checkBtn,
      child: Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xFFFFF5D8),
              Color(0xFFE694FF),
              Color(0xFFC554F9),
              Color(0xFFB057FF),
              Color(0xFFA589FF),
              Color(0xFFB9B3FC),
              Color(0xFFB2FFF9)
            ],
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(K.room_guess_gift_btn_send,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500)),
            const SizedBox(width: 4),
            Text('(${K.room_guess_gift_btn_pay_price(['$_realityPrice'])})',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          R.img('guess_gift/ic_guess_gift_title.webp',
              width: 109,
              height: 30,
              package: ComponentManager.MANAGER_BASE_ROOM),
          PositionedDirectional(
            start: 16,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGuessGiftRank(),
              ],
            ),
          ),
          PositionedDirectional(
            end: 16,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGuessGiftHelp(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuessGiftHelp() {
    return InkWell(
      onTap: () {
        BaseWebviewScreen.show(context, url: Util.getHelpUrlWithQStr('k147'));
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: R.img(
          'ic_help.svg',
          width: 24,
          height: 24,
          color: Colors.white.withOpacity(0.5),
          package: ComponentManager.MANAGER_BASE_CORE,
        ),
      ),
    );
  }

  Widget _buildGuessGiftRank() {
    return InkWell(
      onTap: () {
        GuessGiftRankPage.show(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          height: 22,
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: Colors.white.withOpacity(0.2),
          ),
          foregroundDecoration: ShapeDecoration(
            shape: StadiumBorder(
                side:
                    BorderSide(color: Colors.white.withOpacity(0.4), width: 1)),
            color: Colors.transparent,
          ),
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsetsDirectional.only(start: 8, end: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(K.room_pub_home_rank_title,
                  style: const TextStyle(color: Colors.white, fontSize: 13)),
              R.img('ic_next_small.svg',
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ],
          ),
        ),
      ),
    );
  }

  /// 检查默契标签 - 唯一最大价值
  bool _isTacitTag(int index) {
    List<int> prices = _giftBoxs.map((e) => _boxTotalPrice(e)).toList();
    int maxPrice = prices.reduce(max);
    if (maxPrice > 0) {
      int firstIndex = prices.indexOf(maxPrice);
      int lastIndex = prices.lastIndexOf(maxPrice);
      return (firstIndex == lastIndex) && prices.indexOf(maxPrice) == index;
    }
    return false;
  }

  /// 是否存在唯一最大价格
  bool _checkOnlyMaxPrice() {
    List<int> prices = _giftBoxs.map((e) => _boxTotalPrice(e)).toList();
    int maxPrice = prices.reduce(max);
    if (maxPrice > 0) {
      int firstIndex = prices.indexOf(maxPrice);
      int lastIndex = prices.lastIndexOf(maxPrice);
      return (firstIndex == lastIndex);
    }
    return false;
  }

  /// 是否存在唯一最小价格 >0
  bool _checkOnlyMinPrice() {
    List<int> prices = _giftBoxs.map((e) => _boxTotalPrice(e)).toList();
    int minPrice = prices.reduce(min);
    return minPrice > 0;
  }

  /// 单个盒子 价格
  int _boxTotalPrice(GuessGiftBoxCli box) {
    int totalPrice = 0;
    box.giftsNum.forEach((key, value) {
      int itemPrice = _giftsMap[key]?.price ?? 0;
      totalPrice += itemPrice * value;
    });
    return totalPrice;
  }

  /// 实际总价
  int get _realityPrice {
    Map<String, int> sumGiftsNum = {};
    for (var box in _giftBoxs) {
      box.giftsNum.forEach((key, value) {
        if (sumGiftsNum.containsKey(key)) {
          sumGiftsNum[key] = (sumGiftsNum[key] ?? 0) + value;
        } else {
          sumGiftsNum[key] = value;
        }
      });
    }
    int realityPrice = 0;
    sumGiftsNum.forEach((key, value) {
      int itemPrice = _giftsMap[key]?.price ?? 0;
      int numInBag = _giftsMap[key]?.numInBag ?? 0;
      realityPrice += itemPrice * max(value - numInBag, 0);
    });
    return realityPrice;
  }

  void _onTapUserScreen(int uid) {
    if (uid > 0 && Session.uid != uid) {
      IPersonalDataManager personalDataManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      personalDataManager.openImageScreen(context, uid);
    }
  }

  Future _checkBtn() async {
    if (_selectedUid <= 0) {
      Fluttertoast.showToast(msg: K.room_guess_gift_send_tip_1);
      return;
    }
    if (!_checkOnlyMinPrice()) {
      Fluttertoast.showToast(msg: K.room_guess_gift_send_tip_2);
      return;
    }
    if (!_checkOnlyMaxPrice()) {
      Fluttertoast.showToast(msg: K.room_guess_gift_send_tip_3);
      return;
    }

    List<List<Map<String, dynamic>>> paramsMap = [];
    for (var e in _giftBoxs) {
      List<Map<String, dynamic>> boxParam = [];
      e.giftsNum.forEach((key, value) {
        GuessGiftBoxGiftItem? item = _giftsMap[key];
        boxParam.add({'gid': item?.giftId, 'cid': item?.cid, 'num': value});
      });
      paramsMap.add(boxParam);
    }
    String params = json.encode({'boxes': paramsMap});
    debugPrint("GuessGiftPage params:$params");
    NormalNull resp = await GuessGiftRepo.orderGuessGift(
        widget.room.realRid, _selectedUid, _realityPrice, params);
    if (resp.success) {
      Fluttertoast.showToast(msg: K.room_guess_gift_send_tip_4);
      //钱有变化，全局通知
      eventCenter.emit(EventConstant.EventUserMoneyChange);
      Navigator.of(context).pop();
    } else {
      Fluttertoast.showToast(msg: resp.msg);
    }
  }
}
