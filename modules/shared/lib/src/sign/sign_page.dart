import 'package:shared/shared.dart';
import 'package:shared/src/sign/sign_api.dart';
import 'package:shared/src/sign/sign_dialog.dart';
import 'package:flutter/material.dart';

import '../../K.dart';
import '../../assets.dart';
import '../pbModel/generated/checkin.pb.dart';

class SignPage extends StatefulWidget {
  final PAGESTYLE pageStyle;
  final CheckInHomeRsp_Data bean;

  const SignPage({Key? key, required this.pageStyle, required this.bean})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SignPageState();
}

class SignPageState extends State<SignPage> {
  static const String _tag = "SignPageState";
  bool hasSignedToday = false;
  int _currIndex = 0; //当前签到天数
  final double _borderWidth = 2.dp;
  final double _spacing = 6.dp;
  final double _paddingHor = 16.dp;
  bool isRookie = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    isRookie = widget.pageStyle == PAGESTYLE.ROOKIE;
    hasSignedToday = widget.bean.checkInToday;
    for (int i = 0; i < widget.bean.rewardList.length; i++) {
      if (widget.bean.rewardList[i].state == false) {
        _currIndex = i;
        break;
      }
    }
    if (hasSignedToday && _currIndex > 0) {
      _currIndex--;
    }
  }

  @override
  void didUpdateWidget(SignPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pageStyle != widget.pageStyle) {
      _init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsetsDirectional.only(
              start: _paddingHor,
              end: _paddingHor,
              bottom: 30.dp,
              top:
                  widget.pageStyle == PAGESTYLE.FORWARD_ONLY ? 120.dp : 100.dp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: _buildRewardList()),
              const SizedBox(height: 5),
              _buildBtn(context)
            ],
          ),
        ));
  }

  Widget _buildRewardList() {
    List<Widget> list = [];
    for (int i = 0; i < widget.bean.rewardList.length; i++) {
      CheckInRewardItem item = widget.bean.rewardList[i];
      Widget child = (i == widget.bean.rewardList.length - 1)
          ? _buildRewardItemSeventh(item, i)
          : _buildRewardItemNormal(item, i);
      if (i == _currIndex) {
        list.add(borderedWidget(child));
      } else {
        list.add(child);
      }
    }
    return Wrap(
      spacing: _spacing,
      runSpacing: _spacing,
      alignment: WrapAlignment.spaceBetween,
      children: list,
    );
  }

  Widget _buildBtn(BuildContext context) {
    return SizedBox(
        width: Util.width,
        height: 52.dp,
        child: GestureDetector(
          child: Container(
              height: 52.dp,
              width: 197.5.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(hasSignedToday
                          ? BaseAssets.shared$sign_btn_sign_disabled_webp
                          : isRookie
                              ? BaseAssets.shared$sign_btn_sign_new_webp
                              : BaseAssets.shared$sign_btn_sign_forward_webp))),
              child: Text(
                  (!isRookie && widget.bean.leftSeconds <= 0)
                      ? K.sign_btn_buy
                      : hasSignedToday
                          ? K.sign_done
                          : K.sign_btn_new,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.dp,
                      fontWeight: FontWeight.w900))),
          onTap: () async {
            if (!isRookie && widget.bean.leftSeconds <= 0) {
              Navigator.pop(context);
              BaseWebviewScreen.show(context, url: widget.bean.normalUrl);
            } else if (hasSignedToday) {
              Fluttertoast.showCenter(msg: K.sign_tips);
            } else {
              CheckInRsp rsp = await SignApi.signIn(isRookie ? 0 : 1);
              if (rsp.success) {
                await showDialog(
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.7),
                    context: context,
                    routeSettings: const RouteSettings(name: 'SignTipsDialog'),
                    builder: (BuildContext context) {
                      return _buildConfirmDialog(
                          context, widget.bean.rewardList[_currIndex]);
                    });
                hasSignedToday = true;
                refresh();
                Log.d(tag: _tag, "sign in succeed");
              } else {
                Fluttertoast.showCenter(msg: rsp.msg);
                Log.d(tag: _tag, "sign in failed,${rsp.msg}");
              }
            }
          },
        ));
  }

  Widget borderedWidget(Widget child) {
    return GradientBorder(
        borderGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isRookie
              ? [const Color(0xFFF9599F), const Color(0xFFFFE876)]
              : [const Color(0xFF7B57F5), const Color(0xFFFD93DC)],
        ),
        borderRadius: 15.dp,
        borderWidth: _borderWidth,
        child: child);
  }

  Widget _buildRewardItemNormal(CheckInRewardItem item, int index) {
    bool signed = (item.state == true);
    double itemWidth = (Util.width - 2 * _paddingHor - 2 * _spacing) / 3 - 1.dp;
    Log.d('icon:${Util.getRemoteImgUrl(item.icon)}');
    return Container(
      height: (index == _currIndex) ? 120.dp - 2 * _borderWidth : 120.dp,
      width: (index == _currIndex) ? itemWidth - 2 * _borderWidth : itemWidth,
      margin: (index == _currIndex)
          ? EdgeInsetsDirectional.all(_borderWidth)
          : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12.dp),
        color: (index == _currIndex)
            ? isRookie
                ? const Color(0xFFFCF4FF)
                : const Color(0xFFFCF4FF)
            : isRookie
                ? const Color(0xFFFCF4FF)
                : const Color(0xFFFCF4FF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12.dp),
          Text(
            K.sign_day(["${index + 1}"]),
            style: TextStyle(
                color: signed ? Colors.black.withOpacity(0.25) : Colors.black,
                fontSize: 12.dp,
                fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            flex: 1,
            child: Opacity(
                opacity: signed ? 0.5 : 1.0,
                child: R.img(Util.getRemoteImgUrl(item.icon),
                    width: 49.dp, height: 49.dp, fit: BoxFit.contain)),
          ),
          Text("${item.name}*${item.num}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: signed ? Colors.black.withOpacity(0.5) : Colors.black,
                  fontSize: 12.dp,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 16.dp),
        ],
      ),
    );
  }

  ///第七天奖励
  Widget _buildRewardItemSeventh(CheckInRewardItem item, int index) {
    if (widget.bean.rewardList.length <= index) {
      return const SizedBox.shrink();
    }
    bool signed = (item.state == true);
    return Container(
        height: (index == _currIndex) ? 120.dp - 2 * _borderWidth : 120.dp,
        margin: (index == _currIndex)
            ? EdgeInsetsDirectional.all(_borderWidth)
            : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12.dp),
          gradient: LinearGradient(
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              colors: isRookie
                  ? [const Color(0xFFFCF4FF), const Color(0xFFFCF4FF)]
                  : [
                      const Color(0xFFCDC7FF),
                      const Color(0xFFF6D1FF),
                      const Color(0xFFCDC7FF)
                    ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  K.sign_day(["${index + 1}"]),
                  style: TextStyle(
                      color:
                          signed ? Colors.black : Colors.black.withOpacity(0.5),
                      fontSize: 12.dp,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.dp),
                Text("${item.name}*${item.num}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: signed
                            ? Colors.black
                            : Colors.black.withOpacity(0.5),
                        fontSize: 12.dp,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(width: 60.dp),
            Opacity(
                opacity: signed ? 1.0 : 0.5,
                child: R.img(Util.getRemoteImgUrl(item.icon),
                    width: 110.dp, height: 110.dp, fit: BoxFit.contain)),
          ],
        ));
  }

  /// 确认弹窗
  Widget _buildConfirmDialog(BuildContext context, CheckInRewardItem reward) {
    return Container(
        margin: EdgeInsetsDirectional.only(start: 42.dp, end: 42.dp),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: EdgeInsetsDirectional.only(
                top: 25.dp, bottom: 22.dp, start: 2.dp, end: 2.dp),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFFCBDB), width: 1.dp),
                borderRadius: BorderRadius.circular(21.dp),
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: isRookie
                        ? [const Color(0xFFFFF0F4), const Color(0xFFFFEAF5)]
                        : [const Color(0xFFFFF0F4), const Color(0xFFFFEAF5)])),
            height: 313.dp,
            width: 280.dp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                R.img(
                    isRookie
                        ? BaseAssets.shared$sign_sign_succeed_tips_webp
                        : BaseAssets.shared$sign_sign_succeed_tips_forward_webp,
                    height: 19.dp),
                _buildRewardItem(reward),
                _buildConfirmBtn(context),
              ],
            ),
          ),
          SizedBox(
            height: 30.dp,
          ),
          GestureDetector(
            child: R.img(BaseAssets.shared$ic_close_with_circle_border_svg,
                width: 48.dp),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ]));
  }

  Widget _buildRewardItem(CheckInRewardItem item) {
    return Container(
      height: 146.dp,
      width: 120.dp,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12.dp),
        color: isRookie ? const Color(0xFFFFE7E7) : const Color(0xFFFFE7E7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12.dp),
          R.img(Util.getRemoteImgUrl(item.icon),
              width: 70.dp, height: 70.dp, fit: BoxFit.contain),
          Expanded(
            flex: 1,
            child: Text("${item.name}*${item.num}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.dp,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 20.dp),
        ],
      ),
    );
  }

  Widget _buildConfirmBtn(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            height: 52.dp,
            width: 201.dp,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(isRookie
                        ? BaseAssets.shared$sign_btn_sign_new_webp
                        : BaseAssets.shared$sign_btn_sign_forward_webp))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('立即收下',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.dp,
                        fontWeight: FontWeight.w900)),
              ],
            )));
  }
}
