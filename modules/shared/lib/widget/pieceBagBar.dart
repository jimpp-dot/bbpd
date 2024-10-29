import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class PieceBagBar extends StatefulWidget {
  final int? id;
  final Map? globalPiece;
  final int? rid;
  final VoidCallback? onCombine;

  const PieceBagBar({
    super.key,
    this.id,
    this.globalPiece,
    this.rid,
    this.onCombine,
  });

  bool get inRoom {
    return rid != null && rid! > 0;
  }

  @override
  State<StatefulWidget> createState() => PieceBabBarState();
}

class PieceBabBarState extends State<PieceBagBar> {
  int _selectNum = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 12.0,
        top: 12.0,
        bottom: 12.0,
      ),
      child: Column(
        children: <Widget>[
          _buildTipsBar(),
          _buildCombineBar(),
          _buildRecentGiftBar(),
        ],
      ),
    ));
  }

  Widget _buildCombineBar() {
    int maxNum = Util.parseInt(widget.globalPiece?['maxNum']);
    Log.d('DEBUG: selectNum: $_selectNum, maxNum: $maxNum');

    Color textColor =
        widget.inRoom ? const Color(0xFF65686C) : R.color.secondTextColor;

    List<Widget> res = [
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 5.0),
        child: Text(
          "选择数量",
          style: TextStyle(
            color: textColor,
            fontSize: 14.0,
          ),
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            _selectNum = max(1, _selectNum - 1);
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            width: 15.0,
            height: 15.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: textColor, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(2.0))),
            child: Text(
              "-",
              style: TextStyle(color: textColor, fontSize: 12.0),
            ),
          ),
        ),
      ),
      Text(
        _selectNum.toString(),
        style: TextStyle(color: textColor, fontSize: 12.0),
      ),
      InkWell(
        onTap: () {
          setState(() {
            _selectNum = min(maxNum, max(1, _selectNum + 1));
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            width: 15.0,
            height: 15.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: textColor, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(2.0))),
            child: Text(
              "+",
              style: TextStyle(color: textColor, fontSize: 12.0),
            ),
          ),
        ),
      ),
      Expanded(child: Container())
    ];

    if (maxNum > 0) {
      res.add(
        _renderButton('合成', () {
          pieceCombine(_selectNum);
        }),
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: 9),
      child: Row(
        children: res,
      ),
    );
  }

  Widget _buildTipsBar() {
    String? giftImgUrl = widget.globalPiece == null
        ? null
        : Util.parseStr(widget.globalPiece!['max_gift_image']);
    return Row(
      children: <Widget>[
        Text(
          "现在合成即有机会获得：",
          textScaleFactor: 1.0,
          style: TextStyle(
            fontSize: 15,
            color:
                widget.inRoom ? const Color(0xFFFEFEFE) : R.color.mainTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: CachedNetworkImage(
            imageUrl: "${System.imageDomain}$giftImgUrl",
            width: 30.0,
          ),
        ),
        Expanded(child: Container()),
        InkWell(
          onTap: () {
            String url = widget.globalPiece?['url'] ?? '';

            BaseWebviewScreen.show(context, url: url, title: '合成规则');
          },
          child: Text(
            "合成规则 > ",
            style: TextStyle(
                color: widget.inRoom
                    ? const Color(0xFF65686C)
                    : R.color.secondTextColor,
                fontSize: 13.0),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentGiftBar() {
    Map? recentGift;
    if (widget.globalPiece?['recent_gifts'] != null &&
        widget.globalPiece!['recent_gifts'] is List) {
      List gifts = widget.globalPiece!['recent_gifts'];
      if (gifts.isNotEmpty) recentGift = gifts[0];
    }
    if (recentGift == null || recentGift.isEmpty) return Container();

    String cImage = Util.notNullStr(recentGift['cimage']);
    String userIcon = Util.notNullStr(recentGift['icon']);
    String userName = Util.notNullStr(recentGift['name']);
    String diffTime = Util.notNullStr(recentGift['time_text']);

    Color textColor =
        widget.inRoom ? const Color(0xFF65686C) : R.color.secondTextColor;

    return Container(
      padding: const EdgeInsets.only(top: 9),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: "${System.imageDomain}$userIcon",
              suffix: '!head150',
              width: 30.0,
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 80),
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                userName,
                maxLines: 1,
                style: R.textStyle.caption.copyWith(color: textColor),
              ),
            ),
          ),
          Text('合成了字符，获得',
              maxLines: 1,
              style: R.textStyle.caption.copyWith(color: textColor)),
          CachedNetworkImage(
            imageUrl: "${System.imageDomain}$cImage",
            width: 30.0,
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          GestureDetector(
            onTap: () {
              IRankManager rankManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_RANK);
              rankManager.showRank(context, 'lucky');
            },
            child: Container(
              child: Text(
                '$diffTime | 手气榜 >',
                style: R.textStyle.caption.copyWith(color: textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderButton(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60.0,
        height: 28.0,
        decoration: const BoxDecoration(
          color: Color(0xFFFAA619),
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          textScaleFactor: 1.0,
          style: const TextStyle(
              color: Color(0xFFFFFFFF), fontSize: 12.0, height: 1.0),
        ),
      ),
    );
  }

  Future<void> pieceCombine(int num) async {
    try {
      await Xhr.postJson("${System.domain}match/exchange",
          {'id': widget.id.toString(), 'num': '$num', 'rid': '${widget.rid}'},
          throwOnError: true);

      if (widget.onCombine != null) widget.onCombine!();
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }
}
