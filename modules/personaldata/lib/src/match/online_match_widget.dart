import 'dart:io';
import 'dart:math';
import 'package:android_intent_plus/android_intent.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/match/match_animation_button.dart';
import 'package:personaldata/src/match/match_flip_header.dart';
import 'package:personaldata/src/match/match_tips_widget.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../k.dart';
import 'match_filter_conditon_widget.dart';
import 'match_user_list_page.dart';
import 'model/match_bean.dart';

class OnlineMatchPage extends StatefulWidget {
  const OnlineMatchPage({super.key});

  @override
  _OnlineMatchPageState createState() => _OnlineMatchPageState();
}

class _OnlineMatchPageState extends State<OnlineMatchPage> {
  MatchAnimationContent? _matchAnimationContent;
  int _unReadMsgCount = 0;
  int _likeCount = 0;
  final GlobalKey<MatchAnimationContentState> _matchContentKey =
      GlobalKey<MatchAnimationContentState>();
  @override
  void initState() {
    super.initState();
    _loadDataMessageInfo();
    _matchAnimationContent = MatchAnimationContent(
      key: _matchContentKey,
      callback: (number) {},
    );
  }

  _loadDataMessageInfo() async {
    MatchSimpleInfoResponse response =
        await MatchRepository.getMatchSimpleInfo();
    if (response.success == true && mounted) {
      setState(() {
        _unReadMsgCount = response.count ?? 0;
        _likeCount = response.likeNum ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return SizedBox(
      width: Util.width,
      child: Column(
        children: [
          SizedBox(
            height: Util.statusHeight,
          ),
          _buildHeader(),
          SizedBox(
            height: 70 * Util.ratio,
          ),
          _matchAnimationContent ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        top: 8,
      ),
      width: Util.width,
      child: Row(
        children: [
          _buildReturnButton(),
          const Text(
            '在线速配',
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          _buildListButton(),
          const SizedBox(
            width: 20,
          ),
          _buildFilterButton(),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  _buildReturnButton() {
    return IconButton(
        padding: const EdgeInsets.all(0.0),
        icon: Container(
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
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        });
  }

  _buildListButton() {
    return GestureDetector(
      onTap: () {
        _onTapPushMatchList();
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(
                start: 12, end: 12, top: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: const Color(0xFFFFFFFF).withOpacity(0.14),
            ),
            child: Row(
              children: [
                R.img(
                  'match/match_like_count.webp',
                  package: ComponentManager.MANAGER_PERSONALDATA,
                  width: 16,
                  height: 16,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  '$_likeCount',
                  style:
                      const TextStyle(fontSize: 12, color: Color(0xFFFF0059)),
                ),
                Text(
                  '人喜欢你',
                  style: TextStyle(
                      fontSize: 12, color: Colors.white.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            end: -6,
            top: -4,
            child: RedDot(
              num: _unReadMsgCount,
              showBorder: false,
            ),
          )
        ],
      ),
    );
  }

  _buildFilterButton() {
    return GestureDetector(
      onTap: () => _onTapMatchCondition(),
      child: Container(
        width: 32,
        height: 32,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: const Color(0xFFFFFFFF).withOpacity(0.14),
        ),
        child: R.img(
          'match/match_condition_filter.webp',
          package: ComponentManager.MANAGER_PERSONALDATA,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _onTapPushMatchList() async {
    if (mounted) {
      setState(() {
        _unReadMsgCount = 0;
        Im.clearMessagesUnreadStatus(
            'private', ChatUtil.matchFriendsId.toString());
      });
    }
    MatchUserListPage.show(context);
  }

  _onTapMatchCondition() {
    MatchFilterConditionWidget.show(context, callback: () {
      _matchContentKey.currentState?.loadDataMatch();
    });
  }
}

class FastMatchWidget extends StatefulWidget {
  const FastMatchWidget({
    Key? key,
  }) : super(key: key);
  static show(
    BuildContext context,
  ) async {
    await displayModalBottomSheet(
        maxHeightRatio: 1,
        context: context,
        isBarrierDismissible: false,
        builder: (BuildContext context) {
          return const FastMatchWidget();
        });
  }

  @override
  _FastMatchWidgetState createState() => _FastMatchWidgetState();
}

class _FastMatchWidgetState extends State<FastMatchWidget> {
  MatchAnimationContent? _matchAnimationContent;
  int _unReadMsgCount = 0;
  @override
  void initState() {
    super.initState();
    _loadDataMessageInfo();
    _matchAnimationContent = MatchAnimationContent(
      needBg: false,
      callback: (number) {},
    );
  }

  _loadDataMessageInfo() async {
    MatchSimpleInfoResponse response =
        await MatchRepository.getMatchSimpleInfo();
    if (response.success == true && (response.count ?? 0) > 0 && mounted) {
      setState(() {
        _unReadMsgCount = response.count!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(16),
              topEnd: Radius.circular(16),
            ).resolve(Directionality.of(context)),
            child: Stack(
              children: [
                Positioned.fill(
                    child: R.img('match/match_fast_pop_bg.webp',
                        fit: BoxFit.fill,
                        package: ComponentManager.MANAGER_PERSONALDATA)),
                Column(
                  children: [
                    _buildHeader(),
                    SizedBox(
                      height: 92 * Util.ratio - 50,
                    ),
                    _matchAnimationContent ?? const SizedBox.shrink(),
                    SizedBox(
                      height: 75 * Util.ratio,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        top: 8,
      ),
      width: Util.width,
      child: Row(
        children: [
          _buildCloseButton(),
          const Spacer(),
          _buildListButton(),
        ],
      ),
    );
  }

  _buildCloseButton() {
    return IconButton(
      padding: const EdgeInsetsDirectional.only(
        start: 10.0,
        end: 10.0,
        top: 8.0,
        bottom: 8.0,
      ),
      icon: R.img(
        'match/match_dialog_close.webp',
        package: ComponentManager.MANAGER_PERSONALDATA,
        width: 28,
        height: 28,
        fit: BoxFit.cover,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  _buildListButton() {
    return Stack(
      children: [
        IconButton(
          padding: const EdgeInsetsDirectional.only(
            start: 10.0,
            end: 10.0,
            top: 8.0,
            bottom: 8.0,
          ),
          icon: R.img(
            'match/match_list_enter.svg',
            package: ComponentManager.MANAGER_PERSONALDATA,
            width: 28,
            height: 28,
            fit: BoxFit.cover,
          ),
          onPressed: () => _onTapPushMatchList(),
        ),
        PositionedDirectional(
            start: 22,
            top: 8,
            child: IgnorePointer(
                child: RedDot(
              num: _unReadMsgCount,
              showBorder: false,
            )))
      ],
    );
  }

  _onTapPushMatchList() async {
    if (mounted) {
      setState(() {
        _unReadMsgCount = 0;
      });
    }
    MatchUserListPage.show(context);
  }
}

typedef NumberCallback = void Function(String number);

class MatchAnimationContent extends StatefulWidget {
  final NumberCallback? callback;
  final bool needBg;
  const MatchAnimationContent({Key? key, this.callback, this.needBg = true})
      : super(key: key);

  @override
  MatchAnimationContentState createState() => MatchAnimationContentState();
}

class MatchAnimationContentState extends State<MatchAnimationContent>
    with TickerProviderStateMixin {
  final GlobalKey<MatchAnimationButtonState> _matchButtonState =
      GlobalKey<MatchAnimationButtonState>();
  MatchAnimationButton? _matchAnimationButton;
  final List<GlobalKey<FlipHeaderState>> _flipKeys = [];
  final List<FlipHeader> _flipHeaders = [];
  final List<GlobalKey<MachHeaderMoveAniState>> _moveKeys = [];
  final List<MachHeaderMoveAni> _moveHeaders = [];
  late AnimationController _dotController; //小圆点飞出
  List<Color> dotColors = [
    const Color(0xFFFFED4F),
    const Color(0xFF90E2FF),
    const Color(0xFFFFBE7D),
    const Color(0xFF9DFF82),
    const Color(0xFFFF88CF),
    const Color(0xFFFFA2A2),
  ];
  bool _isExpand = false;
  double _longitude = 0;
  double _latitude = 0;
  RecommendUserListResponse? _response;
  bool _isRequest = false;
  int _residueNum = 0;

  bool get hasLocation {
    return _longitude != 0.0 && _latitude != 0.0;
  }

  @override
  void initState() {
    super.initState();
    _initLocation();
    _matchAnimationButton = MatchAnimationButton(
      key: _matchButtonState,
      size: MatchConstant.matchSize * Util.ratio,
    );
    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        if (_dotController.isCompleted) {
          _dotController.reset();
        }
      });
    loadDataMatch();
    eventCenter.addListener('click_match_guide_button', _clickMatchGuideButton);
  }

  _clickMatchGuideButton(String type, dynamic value) {
    _clickMatchButton();
  }

  _initUserData() {
    for (int i = 0; i < MatchConstant.userCount; i++) {
      GlobalKey<FlipHeaderState> flipKey = GlobalKey<FlipHeaderState>();
      GlobalKey<MachHeaderMoveAniState> moveKey =
          GlobalKey<MachHeaderMoveAniState>();
      _flipKeys.add(flipKey);
      _moveKeys.add(moveKey);
      FlipHeader flipHeader = FlipHeader(
        key: flipKey,
        index: i,
        item: itemDataOfIndex(i),
      );
      _flipHeaders.add(flipHeader);
      _moveHeaders.add(MachHeaderMoveAni(
        key: moveKey,
        index: i,
        flipHeader: flipHeader,
      ));
    }
  }

  _initLocation() {
    _longitude = Util.parseDouble(Config.get('location.longitude'));
    _latitude = Util.parseDouble(Config.get('location.latitude'));
  }

  loadDataMatch() async {
    if (_isRequest) return;
    _isRequest = true;
    int matchSex =
        Config.getInt('match.condition.sex', Session.sex == 1 ? 2 : 1);
    RecommendUserListResponse response =
        await MatchRepository.getRecommendMatchUsers(sex: matchSex);
    if (response.success == true && (response.items?.length ?? 0) > 0) {
      _response = response;
      if (!_isExpand) {
        //第一次初始化数据
        _initUserData();
        if (mounted) {
          setState(() {});
        }
        await Future.delayed(const Duration(milliseconds: 100));
        await _startExpandAnimate();
        _isExpand = true;
        _residueNum = Util.parseInt(_response?.residueNum);
        _matchButtonState.currentState?.changeResidueNumber(_residueNum);
        if (widget.callback != null) {
          widget.callback!('$_residueNum');
        }
      } else {
        _startFlipAnimate();
      }
      _resetSelectedItems();
    } else {
      Fluttertoast.showToast(msg: K.personal_match_no_data);
    }
    _isRequest = false;
  }

  void _clickMatchButton() async {
    _matchButtonState.currentState?.startMatchAni();
    bool result = await _sendMatchRequest();
    if ((_response != null && int.parse(_response?.residueNum ?? '') == 0) ||
        !result) {
      return;
    }
    loadDataMatch();
  }

  _startFlipAnimate() {
    for (int index = 0; index < MatchConstant.userCount; index++) {
      GlobalKey<FlipHeaderState> item = _flipKeys[index];
      if (item.currentState != null && item.currentState!.canChangeImage()) {
        item.currentState!.changeHeaderImage(itemDataOfIndex(index));
      }
    }
  }

  _startExpandAnimate() async {
    for (int index = 0; index < MatchConstant.userCount; index++) {
      GlobalKey<MachHeaderMoveAniState> moveItem = _moveKeys[index];
      await Future.delayed(Duration(milliseconds: index * 10));
      if (moveItem.currentState != null && moveItem.currentState!.canStart()) {
        moveItem.currentState!.startAnimate();
      }
    }
  }

  Future<bool> _sendMatchRequest() async {
    List<String> items = _getSelectedItems();
    if (items.isEmpty && _response == null) {
      return false;
    }
    _dotController.reset();
    _dotController.forward();
    BaseResponse response =
        await MatchRepository.fastMatchUser(items, isFastMatch: true);
    if (response.success == true) {
      MatchTips.show();
      _residueNum--;
      _matchButtonState.currentState?.changeResidueNumber(_residueNum);
      if (widget.callback != null) {
        widget.callback!('$_residueNum');
      }
      return true;
    } else {
      if (response.msg != null && response.msg != '') {
        Fluttertoast.showToast(msg: response.msg);
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!hasLocation) {
      return _buildLocationRequired();
    }
    return SizedBox(
      width: Util.width,
      height: Util.width,
      child: _buildBody(),
    );
  }

  _buildBody() {
    return Center(
      child: AnimatedBuilder(
        animation: _dotController,
        builder: (BuildContext? context, Widget? child) {
          return _buildAniContent();
        },
      ),
    );
  }

  _buildAniContent() {
    List<Widget> stackWidgets = [];
    if (_response != null && (_response?.items?.length ?? 0) > 0) {
      for (int i = 0; i < MatchConstant.userCount; i++) {
        stackWidgets.add(_moveHeaders[i]);
        stackWidgets.add(_buildDot(dotColors[i], i));
      }
    }

    stackWidgets.add(
      Center(
        child: GestureDetector(
          onTap: _clickMatchButton,
          child: _matchAnimationButton,
        ),
      ),
    );
    return SizedBox(
      width: Util.width,
      height: Util.width,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          if (widget.needBg)
            PositionedDirectional(
                start: -MatchConstant.deltaWidth,
                top: -MatchConstant.deltaWidth,
                width: MatchConstant.R * 2,
                height: MatchConstant.R * 2,
                child: R.img('match/match_fast_bg.webp',
                    fit: BoxFit.fill,
                    package: ComponentManager.MANAGER_PERSONALDATA)),
          PositionedDirectional(
              start: -MatchConstant.deltaWidth,
              top: -MatchConstant.deltaWidth,
              width: MatchConstant.R * 2,
              height: MatchConstant.R * 2,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: stackWidgets,
              ))
        ],
      ),
    );
  }

  Widget _buildLocationRequired() {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 45,
              bottom: 16,
            ),
            child: R.img(
              'nearby/nearby_location.webp',
              width: 200,
              height: 200,
              package: ComponentManager.MANAGER_PERSONALDATA,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 42),
            child: Text(
              K.need_location_authorization_first,
              style: TextStyle(
                color: R.color.secondTextColor,
              ),
            ),
          ),
          InkWell(
            onTap: _openSettings,
            borderRadius: BorderRadius.circular(27),
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors)),
              width: 200,
              height: 48,
              child: Center(
                child: Text(
                  K.authority_location,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _openSettings() async {
    ServiceStatus serviceStatus =
        await Permission.locationWhenInUse.serviceStatus;
    if (serviceStatus == ServiceStatus.enabled) {
      openAppSettings();
    } else {
      if (Platform.isAndroid) {
        AndroidIntent intent = const AndroidIntent(
          action: 'action_location_source_settings',
        );
        await intent.launch();
      } else {
        openAppSettings();
      }
    }
  }

  _buildDot(Color color, int index) {
    Animation<Offset> position = Tween<Offset>(
      begin: MatchConstant.getPoint(index, isHeader: false),
      end: MatchConstant.getPoint(index, isStart: false, isHeader: false),
    ).animate(
      CurvedAnimation(
        parent: _dotController,
        curve: const Interval(0, 1.0, curve: Curves.easeOut),
      ),
    );

    return PositionedDirectional(
        start: position.value.dx,
        top: position.value.dy,
        child: Container(
          width: MatchConstant.dotR * 2,
          height: MatchConstant.dotR * 2,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ));
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  _getSelectedItems() {
    List<String> userIds = [];
    for (var element in _flipHeaders) {
      if ((element.selected) && element.item?.uid != null) {
        userIds.add(element.item!.uid!);
      }
    }
    return userIds;
  }

  _resetSelectedItems() {
    for (var element in _flipHeaders) {
      element.selected = true;
    }
  }

  RecommendUserItem itemDataOfIndex(int index) {
    RecommendUserItem item;
    if (_response?.items != null && index < (_response!.items?.length ?? 0)) {
      item = _response!.items![index];
    } else {
      item = RecommendUserItem(noData: true);
    }
    return item;
  }
}

class MachHeaderMoveAni extends StatefulWidget {
  final int index;
  final FlipHeader? flipHeader;

  const MachHeaderMoveAni({Key? key, this.index = 0, this.flipHeader})
      : super(key: key);

  @override
  MachHeaderMoveAniState createState() => MachHeaderMoveAniState();
}

class MachHeaderMoveAniState extends State<MachHeaderMoveAni>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _position;
  late AnimationController _opController;
  late Animation<double> _opAnimate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addListener(() {});
    _position = Tween<Offset>(
      begin: MatchConstant.getPoint(widget.index),
      end: MatchConstant.getPoint(widget.index, isStart: false),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0, curve: Curves.easeOutBack),
    ));
    _opController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..addListener(() {});
    _opAnimate = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _opController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return PositionedDirectional(
          start: _position.value.dx,
          top: _position.value.dy,
          width: MatchConstant.headerR * 2,
          height: MatchConstant.headerR * 2,
          child: AnimatedBuilder(
            animation: _opController,
            builder: (context, child) {
              return FadeTransition(
                  opacity: _opAnimate, child: widget.flipHeader);
            },
          ),
        );
      },
    );
  }

  bool canStart() {
    return !_controller.isAnimating;
  }

  startAnimate() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
      _opController.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _opController.dispose();
    super.dispose();
  }
}

class MatchConstant {
  //展示区域为Util.width 绘制区域要大40
  static double deltaWidth = 20;
  static double R = Util.width / 2 + deltaWidth;
  static const double headerR = 65;
  static const double dotR = 6;
  static const double matchSize = 120;
  static const double innerR = 150;
  static int userCount = 6;

  static Offset getPoint(int index,
      {bool isStart = true, bool isHeader = true}) {
    double angle = 2 * pi - (index * 2 * pi / userCount);
    double currentR = (isHeader ? headerR : dotR);
    double startDx = (R - headerR) * sin(angle);
    double startDy = (R - headerR) * cos(angle);
    if (isStart) {
      return Offset(R - currentR, R - currentR);
    } else {
      return Offset(R - startDx - currentR, R - startDy - currentR);
    }
  }
}
