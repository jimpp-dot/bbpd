import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';

class UserLevelUpBean {
  final String title;
  final String imageURL;
  final double percent;
  final String subTitle;
  final String btnTitle;
  final String type;
  final int level;

  bool isShowing = false;

  OverlayEntry? entry;

  UserLevelUpBean({
    required this.title,
    required this.imageURL,
    required this.percent,
    required this.subTitle,
    required this.btnTitle,
    required this.type,
    required this.level,
  });

  bool isEqualTo(UserLevelUpBean theBean) {
    if (type != theBean.type) return false;
    if (title != theBean.title) return false;
    if (imageURL != theBean.imageURL) return false;
    if (percent != theBean.percent) return false;
    if (subTitle != theBean.subTitle) return false;
    if (btnTitle != theBean.btnTitle) return false;
    if (level != theBean.level) return false;

    return true;
  }

  @override
  String toString() {
    return {
      'type': type,
      'title': title,
      'imageUrl': imageURL,
      'percent': percent,
      'subTitle': subTitle,
      'btnTitle': btnTitle,
      'level': level,
    }.toString();
  }
}

class UserLevelUpDialog extends StatefulWidget {
  static final List<UserLevelUpBean> _overlayEntryList = [];
  static bool _lockDialog = false;

  final String title;
  final String imageURL;
  final double percent;
  final String subTitle;
  final String btnTitle;
  final String type;
  final BuildContext context;
  final int level;

  const UserLevelUpDialog({
    super.key,
    required this.context,
    required this.type,
    required this.title,
    required this.imageURL,
    required this.percent,
    required this.subTitle,
    required this.btnTitle,
    required this.level,
  });

  static UserLevelUpBean? _lastShowBean;

  static void clearLastBean() {
    _lastShowBean = null;
  }

  static Future show(
    BuildContext context, {
    required String type,
    required String title,
    required String imageURL,
    required double percent,
    required String subTitle,
    required String btnTitle,
    required int level,
  }) async {
    if (Util.appState != AppLifecycleState.resumed) return;
    var overlayState = Overlay.of(System.context);

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => UserLevelUpDialog(
        context: context,
        type: type,
        title: title,
        imageURL: imageURL,
        percent: percent,
        subTitle: subTitle,
        btnTitle: btnTitle,
        level: level,
      ),
    );
    UserLevelUpBean bean = UserLevelUpBean(
      type: type,
      title: title,
      btnTitle: btnTitle,
      imageURL: imageURL,
      percent: percent,
      subTitle: subTitle,
      level: level,
    );
    bean.entry = overlayEntry;

    /// 如果有上一次弹出的数据
    if (_lastShowBean != null) {
      Log.d('_lastShowBean value = ${_lastShowBean.toString()}');

      /// 先判断上一次展示的信息是否和当前的相同,则直接过滤
      if (_lastShowBean!.isEqualTo(bean)) {
        return;
      }

      if (_lastShowBean!.level >= bean.level) {
        /// 如果上一次展示的信息和当前将要展示的不同，但是当前要展示的level要小于上一次展示的level,则过滤
        if (_lastShowBean!.level > bean.level) {
          return;
        }

        /// 如果上一次的level == 当前level, 则比较 percent
        if (_lastShowBean!.percent >= bean.percent) {
          return;
        }
      }
    }

    int sameTypeIndex =
        _overlayEntryList.indexWhere((element) => element.isEqualTo(bean));
    if (sameTypeIndex == -1) {
      _overlayEntryList.add(bean);
    } else {
      /// 接收到完全相同的消息，直接丢弃，而不是重新展示
      if (_overlayEntryList[sameTypeIndex].isShowing) {
        return;
      } else {
        /// 如果同样的消息没有显示，则进行替换
        _overlayEntryList[sameTypeIndex] = bean;
      }
    }
    if (_overlayEntryList.length == 1) {
      _showOverlay();
    }
  }

  static void _removeOverlay() {
    if (_overlayEntryList.isNotEmpty) {
      UserLevelUpBean model = _overlayEntryList.removeAt(0);
      OverlayEntry? entry = model.entry;
      entry?.remove();
      model.isShowing = false;
      entry = null;
    }
  }

  static _popOverlay() {
    _removeOverlay();
    _showOverlay();
  }

  static _showOverlay() {
    if (Util.appState != AppLifecycleState.resumed) return;
    var overlayState = Overlay.of(System.context);

    if (_overlayEntryList.isNotEmpty && _lockDialog == false) {
      UserLevelUpBean firstEntry = _overlayEntryList[0];
      OverlayEntry? entry = firstEntry.entry;
      if (!firstEntry.isShowing && entry != null) {
        overlayState.insert(entry);
        firstEntry.isShowing = true;
        _lastShowBean = firstEntry;
      }
    }
  }

  static setLockDialog(bool lockDialog) {
    _lockDialog = lockDialog;
    if (lockDialog == false && _overlayEntryList.isNotEmpty) {
      _showOverlay();
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _UserLevelUpDialogState();
  }
}

class _UserLevelUpDialogState extends State<UserLevelUpDialog>
    with SingleTickerProviderStateMixin {
  double _turns = 0;

  late final AnimationController _alphaController;
  bool _percentAnimating = false;
  bool _imageAnimating = false;
  double _subTitleBottom = 0;

  final Map<String, MyLevelTab> _myLevelTabMap = {
    'title': MyLevelTab.Title,
    'vip': MyLevelTab.Vip,
    'popularity': MyLevelTab.Popularity,
  };

  MyLevelTab get tabType {
    final type = widget.type;
    final initialTab = _myLevelTabMap[type] ?? MyLevelTab.Popularity;
    return initialTab;
  }

  String get scene {
    switch (tabType) {
      case MyLevelTab.Popularity:
        return '3';
      case MyLevelTab.Vip:
        return '2';
      case MyLevelTab.Title:
        return '1';
      default:
        return '3';
    }
  }

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.pop_show, properties: {
      'scene': scene,
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _turns = 1.0;
        _subTitleBottom = 10;
      });
    });
    const alphaDuration = Duration(milliseconds: 300);
    _alphaController = AnimationController(
      duration: alphaDuration,
      vsync: this,
    );
    _alphaController.forward(from: 0.0);

    Future.delayed(alphaDuration, () {
      if (!mounted) return;
      setState(() {
        _percentAnimating = true;
      });
    });
  }

  _onDismiss() async {
    UserLevelUpDialog._popOverlay();

    Tracker.instance.track(TrackEvent.pop_close, properties: {
      'scene': scene,
    });
  }

  /// 跳转我的等级
  _onMyLevelTaped() async {
    IVipManager vipManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    Tracker.instance.track(TrackEvent.mine_page, properties: {
      'mine_page_click': 'levels',
    });
    if (!Session.isLogined) {
      loginManager.show(context);
      return;
    }
    final type = widget.type;
    final initialTab = _myLevelTabMap[type] ?? MyLevelTab.Popularity;
    _onDismiss();
    vipManager.showMyLevelScreen(context, initialTab: initialTab);
  }

  _startImageAnimate() {
    _imageAnimating = true;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onDismiss,
        child: FadeTransition(
          opacity: _alphaController.drive(CurveTween(curve: Curves.easeOut)),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.6),
            child: Stack(children: [
              _buildHeader(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0.197 * Util.height),
                  _buildCenter(),
                  const SizedBox(height: 9),
                  _buildBtnTitle(widget.btnTitle),
                  const SizedBox(height: 20),
                  _buildCloseBtn(),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Util.width,
          height: Util.width * 501.0 / 375.0,
          child: R.img(
            Util.getImgUrl('user_level_up_header.png',
                package: ComponentManager.MANAGER_BASE_ROOM),
            width: 18.0,
            height: 18.0,
          ),
        )
      ],
    );
  }

  Widget _buildCenter() {
    final double centerWidth = 290 * Util.ratio;
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          width: Util.width,
          height: centerWidth,
          child: AnimatedContainer(
            alignment: Alignment.center,
            width: _imageAnimating ? Util.width : 0,
            height: _imageAnimating ? centerWidth : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
            child: TurnBox(
              turns: _turns,
              repeat: true,
              speed: 10000,
              child: R.img(
                Util.getImgUrl('user_level_up_center.png',
                    package: ComponentManager.MANAGER_BASE_ROOM),
              ),
            ),
          ),
        ),
        Positioned.fill(
            child: Center(
          child: _buildImage(widget.imageURL),
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 44 * Util.ratio),
            _buildTitle(widget.title),
            SizedBox(height: 162 * Util.ratio),
            if (widget.percent > 0) _buildPercent(widget.percent),
            if (widget.percent > 0) SizedBox(height: 2 * Util.ratio),
            if (widget.subTitle.isNotEmpty)
              SizedBox(
                height: 30,
                width: double.infinity,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                      bottom: _subTitleBottom,
                      child: Container(
                        width: Util.width,
                        alignment: Alignment.center,
                        child: _buildSubTitle(widget.subTitle),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildImage(String imageURL) {
    return AnimatedContainer(
      width: _imageAnimating ? 180 * Util.ratio : 0,
      height: _imageAnimating ? 180 * Util.ratio : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
      child: CachedNetworkImage(
        imageUrl: imageURL,
        loadComplete: () async {
          /// 异步执行，防止出现setState冲突
          await Future.delayed(const Duration(milliseconds: 300));
          _startImageAnimate();
        },
      ),
    );
  }

  Widget _buildPercent(double percent) {
    const double percentHeight = 8;
    final double percentWidth = 0.51 * Util.width;
    return Center(
      child: Stack(
        children: [
          Container(
            width: percentWidth,
            height: percentHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          AnimatedContainer(
            height: percentHeight,
            width: _percentAnimating ? percentWidth * percent : 0,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFFFFc516), Color(0xFFFFE100)]),
              borderRadius: BorderRadius.circular(4),
            ),
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
          ),
        ],
      ),
    );
  }

  Widget _buildSubTitle(String subTitle) {
    return Text(
      subTitle,
      style: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 13,
      ),
    );
  }

  Widget _buildBtnTitle(String btnTitle) {
    return GradientButton(
      btnTitle,
      onTap: _onMyLevelTaped,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      textStyle: const TextStyle(
          color: Color(0xFF613113), fontWeight: FontWeight.bold, fontSize: 14),
      colors: const [Color(0xFFDEBA76), Color(0xFFFFF2B5)],
      height: 48,
      width: 160,
    );
  }

  Widget _buildCloseBtn() {
    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: R.img(
        RoomAssets.chat_room$ic_close_svg,
        color: Colors.white,
        width: 40.0,
        height: 40.0,
      ),
    );
  }
}

class TurnBox extends StatefulWidget {
  final double turns;
  final int speed;
  final Widget child;
  final Curve curves;
  final bool repeat;

  const TurnBox({
    super.key,
    required this.child,
    this.turns = 0.0, //旋转的“圈”数,一圈为360度，如0.25圈即90度
    this.speed = 200, //过渡动画执行的总时长
    this.repeat = false,
    this.curves = Curves.linear,
  });

  @override
  _TurnBoxState createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //旋转角度发生变化时执行过渡动画
    if (oldWidget.turns != widget.turns) {
      animateRotate(oldWidget.turns, widget.turns);
    }
  }

  void animateRotate(double fromValue, double toValue) {
    _controller
        .animateTo(
      toValue,
      duration: Duration(milliseconds: widget.speed),
      curve: widget.curves,
    )
        .whenComplete(
      () {
        if (widget.repeat) {
          _controller.value = fromValue;
          animateRotate(fromValue, toValue);
        }
      },
    );
  }
}
