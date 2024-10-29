import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  final ListItem? item;
  final ValueChanged<ListItem?>? onFollowClick;
  final ValueChanged<ListItem?>? onChatClick;
  final bool follow; //取值为item中的follow和操作产生的关注结果

  const FollowButton(
      {Key? key,
      this.item,
      this.onFollowClick,
      this.onChatClick,
      this.follow = false})
      : super(key: key);

  @override
  FollowButtonState createState() => FollowButtonState();
}

class FollowButtonState extends State<FollowButton>
    with TickerProviderStateMixin {
  String? icon;
  bool isFollow = false;

  AnimationController? controller; //动画控制器
  double top = 0;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.FollowUid, _onFollowInOtherPage);
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _init();
  }

  @override
  void didUpdateWidget(FollowButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item?.uid != widget.item?.uid ||
        oldWidget.follow != widget.item?.follow) {
      _init();
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    controller = null;
  }

  //点击按钮 开始动画
  bool isAnim = false;
  _offsetAnim() {
    if (isAnim) {
      return;
    }
    isAnim = true;
    Animation<double> animation =
        Tween(begin: 0.0, end: 50.0).animate(controller!);
    animation.addListener(() {
      setState(() {
        top = animation.value;
      });
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnim = false;
          isFollow = true;
          top = 0;
        });
      } else if (status == AnimationStatus.dismissed) {}
    });
    controller?.reset();
    controller?.forward();
  }

  void performTap() {
    if (!isFollow) {
      if (!Session.isLogined) {
        ILoginManager loginManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_LOGIN);
        loginManager.show(context);
        return;
      }
      if (widget.onFollowClick != null) {
        widget.onFollowClick!(widget.item);
      }
      //1.做动画
      _offsetAnim();
    } else {
      if (widget.onChatClick != null) {
        widget.onChatClick!(widget.item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isFollow) {
      icon = "home/icon_chat.svg";
    } else {
      if (isAnim) {
        icon = "home/ic_followed.svg";
      } else {
        icon = "home/icon_follow.svg";
      }
    }

    return GestureDetector(
      onTap: performTap,
      child: SizedBox(
          width: 24.0,
          height: 24.0,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: -top,
                child: Container(
                    child: R.img(icon,
                        width: 24,
                        height: 24,
                        package: ComponentManager.MANAGER_BASE_CORE)),
              ),
            ],
          )),
    );
  }

  void _init() {
    isFollow = widget.follow;
    isAnim = false;
  }

  _onFollowInOtherPage(String type, dynamic data) {
    Map map = data as Map;
    if (map['uid'] != null && map['follow'] != null) {
      int uid = Util.parseInt(map['uid']);
      bool follow = Util.parseBool(map['follow']);
      if (uid == widget.item?.uid && follow != isFollow) {
        isFollow = follow;
        _refresh();
      }
    }
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }
}
