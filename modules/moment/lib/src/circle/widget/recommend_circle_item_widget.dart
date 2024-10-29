import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/circle/model/circle_join_resp.dart';
import 'package:moment/src/circle/page/circle_detail_screen.dart';

import '../../../k.dart';

typedef RefreshCallback = void Function();

/// 推荐圈子
class RecommendCircleItemWidget extends StatefulWidget {
  final RecommendCircle data;
  final RefreshCallback? callback;
  final bool showDivider;

  const RecommendCircleItemWidget(this.data, this.callback, this.showDivider,
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return RecommendItemState();
  }
}

class RecommendItemState extends State<RecommendCircleItemWidget> {
  final List<String> _heroTags = [];
  bool _requesting = false;

  @override
  void initState() {
    super.initState();
    if (widget.data.imageList.isNotEmpty) {
      int length = min(widget.data.imageList.length, 3);
      for (int i = 0; i < length; ++i) {
        _heroTags.add(
            '${i}_${DateTime.now().microsecondsSinceEpoch}_${widget.data.imageList[i].url}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imageList = [];
    if (widget.data.imageList.isNotEmpty) {
      int length = min(widget.data.imageList.length, 3);
      //左右20dp固定的，中间的大小和间距动态去算
      double ratio = (Util.width - 40) / (375 - 40);
      double imageSize = 109 * ratio;
      for (int i = 0; i < length; i++) {
        if (i != 0) {
          imageList.add(SizedBox(width: 4 * ratio));
        }
        Widget childWidget = ClipRRect(
          borderRadius: BorderRadius.circular(10 * ratio),
          child: Image.network(
            widget.data.imageList[i].cover375 ?? '',
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
        );
//        imageList.add(InkWell(
//          onTap: () => _onImageTaped(context, i),
//          child: tag != null && tag.isNotEmpty ? Hero(tag: tag, child: childWidget) : childWidget,
//        ));
        imageList.add(childWidget);
      }
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.showDivider)
          Container(
            height: 1,
            margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
            color: R.color.secondBgColor,
          ),
        InkWell(
          onTap: () {
            Tracker.instance.track(TrackEvent.net_recommend,
                properties: {'click': widget.data.name});
            CircleDetailScreen.openCircleDetailScreen(
              context,
              widget.data.id,
              widget.data.name,
              () {
                if (widget.callback != null) {
                  widget.callback!.call();
                }
              },
              'recommend',
            );
          },
          child: Container(
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 20, top: 16, bottom: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.5),
                      child: R.img(
                        'circle/ic_recommend_circle_name.svg',
                        width: 12,
                        height: 12,
                        package: ComponentManager.MANAGER_MOMENT,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      widget.data.name ?? '',
                      style: TextStyle(
                        fontFamily: Util.fontFamily,
                        fontSize: 17,
                        color: R.color.mainTextColor,
                        height: 1.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    _buildJoinButton(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      K.moment_joined_number(
                          [widget.data.joinedNumber.toString()]),
                      style: TextStyle(
                        fontSize: 11,
                        color: R.color.thirdTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    if (widget.data.avatarList.isNotEmpty)
                      UserListWidget(widget.data.avatarList),
                  ],
                ),
                if (imageList.isNotEmpty)
                  const SizedBox(
                    height: 12,
                  ),
                if (imageList.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: imageList,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildJoinButton() {
    return GestureDetector(
      onTap: () {
        if (_requesting) {
          return;
        }
        _changeJoinState();
      },
      child: Container(
        width: 50,
        height: 24,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
            colors: widget.data.joined
                ? R.color.darkGradientColors
                : R.color.mainBrandGradientColors,
          ),
        ),
        child: Text(
          widget.data.joined ? K.moment_circle_joined : K.moment_circle_join,
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }

  /// 点击加入或退出
  _changeJoinState() async {
    _requesting = true;
    DataRsp<CircleOpResult> response;
    if (widget.data.joined) {
      response = await Api.getQuitCircleResponse(widget.data.id);
    } else {
      response = await Api.getJoinCircleResponse(widget.data.id);
    }
    if (response.success == true && response.data?.result == 'success') {
      if (!widget.data.joined) {
        Tracker.instance.track(TrackEvent.net_recommend,
            properties: {'join': '${widget.data.name}'});
      }
      setState(() {
        widget.data.joined = !widget.data.joined;
      });
      _requesting = false;
      if (widget.callback != null) {
        widget.callback!.call();
      }
    } else {
      _requesting = false;
      String errorToast = K.moment_net_error;
      if (response.msg != null && response.msg!.isNotEmpty) {
        errorToast = response.msg!;
      }
      Fluttertoast.showToast(msg: errorToast);
    }
  }
}
