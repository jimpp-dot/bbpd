import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/model/pb/generated/act.pb.dart';
import 'package:profile/src/love_test/love_test_answer_page.dart';
import '../../../assets.dart';
import '../../../k.dart';

class LoveTestGuideView extends StatefulWidget {
  final List<MatchPerson> list;

  const LoveTestGuideView({super.key, required this.list});

  @override
  State<LoveTestGuideView> createState() => _LoveTestGuideViewState();
}

class _LoveTestGuideViewState extends State<LoveTestGuideView>
    with TickerProviderStateMixin {
  // 总共显示四个头像
  final int _avatarCount = 4;
  late AnimationController _animationController;

  final double bound = 0.04;

  double _firstY = -1.0; // 中上
  double _secondY = 0.6; // 左下
  double _thirdY = 1.0; // 中下
  double _forthY = 0.0; // 右中

  @override
  void initState() {
    super.initState();

    _calculateAvatarY(0);

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        lowerBound: -bound,
        upperBound: bound);
    _animationController.addListener(() {
      setState(() {
        _calculateAvatarY(_animationController.value);
      });
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: _buildBody()));
  }

  Widget _buildBody() {
    return Container(
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.profile$lovetest_love_test_bg_webp),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 100.dp),
          _buildDynamicView(),
          SizedBox(height: 26.dp),
          Text(K.profile_love_test_title,
              style:
                  TextStyle(fontSize: 26.dp, color: const Color(0xFF212121))),
          SizedBox(height: 8.dp),
          Container(
              height: 32.dp,
              padding: EdgeInsetsDirectional.only(
                  start: 40.dp, top: 5.dp, end: 40.dp, bottom: 5.dp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(19.0.dp)),
                  color: Colors.white),
              child: Text(_getNumStr(),
                  style: TextStyle(color: Colors.black, fontSize: 14.dp))),
          const Spacer(),
          _buildStartTestButton()
        ],
      ),
    );
  }

  Widget _buildDynamicView() {
    return Container(
      height: 242.dp,
      width: 262.dp,
      // padding: EdgeInsetsDirectional.all(20.dp),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.profile$lovetest_love_test_guide_icon_webp),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: _buildAvatars(),
      ),
    );
  }

  // 动图 View
  List<Widget> _buildAvatars() {
    List<Widget> avatars = [];
    for (int i = 0; i < _avatarCount && i < widget.list.length; i++) {
      var person = widget.list[i];
      var avatar = _buildAvatar(person);
      var pos = Alignment.center;
      if (i == 0) {
        pos = Alignment(-0.0, _firstY);
      } else if (i == 1) {
        pos = Alignment(-1.0, _secondY);
      } else if (i == 2) {
        pos = Alignment(0.0, _thirdY);
      } else {
        pos = Alignment(1.0, _forthY);
      }
      var align = Align(alignment: pos, child: avatar);
      avatars.add(align);
    }
    return avatars;
  }

  Widget _buildAvatar(MatchPerson person) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _onAvatarTapped(person.uid);
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            height: 50.dp,
            width: 50.dp,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25.0.dp)),
              border: Border.all(width: 2.dp, color: Colors.white),
            ),
            child: CommonAvatar(
                path: person.icon, size: 44.dp, shape: BoxShape.circle),
          ),
          PositionedDirectional(
              bottom: 0,
              child: Container(
                  padding: EdgeInsetsDirectional.only(
                      start: 4.dp, end: 4.dp, top: 0, bottom: 0),
                  decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(
                          colors: [Color(0xFFFFB600), Color(0xFFF95883)])),
                  child: Text(person.marks.first,
                      style: TextStyle(color: Colors.white, fontSize: 10.dp)))),
        ],
      ),
    );
  }

  // 底部测试按钮
  Widget _buildStartTestButton() {
    var margin = EdgeInsetsDirectional.only(
        bottom: 20.dp, top: 16.dp, start: 20.dp, end: 20.dp);
    return GestureDetector(
        onTap: _onStartTestButtonTapped,
        child: Container(
          height: 48.dp,
          margin: margin.add(EdgeInsets.only(bottom: Util.iphoneXBottom)),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFA4B8D), Color(0xFFFE7A7A)],
            ),
            borderRadius: BorderRadius.circular(24.dp),
          ),
          child: Align(
            child: Text(K.profile_love_test_start,
                style: TextStyle(
                    fontSize: 16.0.dp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ),
        ));
  }

  _onStartTestButtonTapped() {
    LoveTestAnswerPage.show(context);
    Tracker.instance.track(TrackEvent.love_personality_click, properties: {
      'type': "start_test",
    });
  }

  _onAvatarTapped(int uid) {
    var mgr = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    mgr.openImageScreen(context, uid);

    Tracker.instance.track(TrackEvent.love_personality_click, properties: {
      'type': "preset_gs",
    });
  }

  /// 测试人数为客户端根据时间戳生成的数字, 规则是截取 [] 区域内的数字，然后除以 9, 假设 second = 1659343084 => 165[934308]4 => 934308 / 9
  String _getNumStr() {
    var ms = DateTime.now().millisecondsSinceEpoch;
    var second = ms ~/ 1000;
    var secStr = second.toString();
    int endIndex = secStr.length - 1;
    int length = 6;
    int startIndex = secStr.length - length - 1;
    secStr = secStr.substring(startIndex, endIndex);
    var num = int.parse(secStr);
    num = num ~/ 9;
    var title = "$num ${K.profile_love_test_num}";
    return title;
  }

  void _calculateAvatarY(double value) {
    // 四个头像的原始位置
    const double firstStartY = -1.0; // 中上
    const double secondStartY = 0.6; // 左下
    const double thirdStartY = 1.0; // 中下
    const double forthStartY = 0.0; // 右中

    // 设计要求每个头像动画步调各异, 所以乘以一个移动系数
    _firstY = firstStartY + value * 1.1;
    _secondY = secondStartY + value * 1.2;
    _thirdY = thirdStartY + value * 0.8;
    _forthY = forthStartY + value * 1.2;
  }
}
