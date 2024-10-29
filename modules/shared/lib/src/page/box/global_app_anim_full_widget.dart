import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// app层的全屏动画播放
/// webp格式，播完需要回调通知
class GlobalAppAnimFullWidget extends StatefulWidget {
  final Map data;
  final VoidCallback? onComplete;

  const GlobalAppAnimFullWidget({Key? key, required this.data, this.onComplete})
      : super(key: key);

  @override
  _GlobalAppAnimFullWidgetState createState() =>
      _GlobalAppAnimFullWidgetState();
}

class _GlobalAppAnimFullWidgetState extends State<GlobalAppAnimFullWidget> {
  late Map _currentItem;
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    _currentItem = widget.data;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildIcons(List? data) {
    if (data == null || data.isEmpty) {
      return Container();
    }

    int maxLength = data.length;
    if (maxLength > 2) {
      maxLength = 2;
    }

    List<Widget> res = [];
    for (int i = 0; i < maxLength; i++) {
      Map item = data[i];
      res.add(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonAvatar(
              path: '${item['icon']}',
              shape: BoxShape.circle,
              size: 90 * Util.width / 375.0,
            ),
            Container(
              width: 90 * Util.width / 375.0,
              alignment: AlignmentDirectional.center,
              child: Text(
                '${item['name']}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
      if (i < maxLength - 1) {
        res.add(
          Container(
            width: 12.0,
          ),
        );
      }
    }
    if (res.isEmpty) {
      return Container();
    } else {
      return Container(
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: res,
        ),
      );
    }
  }

  Widget _buildBottom(Map? data) {
    if (data == null) {
      return Container();
    }
    List<Widget> res = [
      Container(),
    ];

    String? text1 = Util.parseStr(data['text1']);
    String? text2 = Util.parseStr(data['text2']);
    String? text3 = Util.parseStr(data['text3']);
    String? text4 = Util.parseStr(data['text4']);
    if (text1 != null && text1.isNotEmpty) {
      res.add(
        Row(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              width: 40.0,
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(
                      0.3,
                    ),
                    offset: const Offset(1, 1),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            Container(
              width: 12,
            ),
            Text(
              text1,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 21.0,
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(
                      0.3,
                    ),
                    offset: const Offset(1, 1),
                    blurRadius: 4,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 12,
            ),
            Container(
              width: 40.0,
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(
                      0.3,
                    ),
                    offset: const Offset(1, 1),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      );
    }
    if (text2 != null && text2.isNotEmpty) {
      res.add(
        Container(
          height: 4.0,
        ),
      );
      res.add(
        Text(
          text2,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
            color: Colors.white,
            shadows: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(
                  0.3,
                ),
                offset: const Offset(1, 1),
                blurRadius: 4,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    if (text3 != null && text3.isNotEmpty) {
      res.add(
        Container(
          height: 4.0,
        ),
      );
      res.add(
        Text(
          text3,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
            color: Colors.white,
            shadows: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(
                  0.3,
                ),
                offset: const Offset(1, 1),
                blurRadius: 4,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    if (text4 != null && text4.isNotEmpty) {
      res.add(
        Container(
          height: 4.0,
        ),
      );
      res.add(
        Text(
          text4,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
            color: Colors.white,
            shadows: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(
                  0.3,
                ),
                offset: const Offset(1, 1),
                blurRadius: 4,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (res.isEmpty) {
      return Container();
    } else {
      return Positioned(
        bottom: 60.0,
        child: Container(
          width: Util.width,
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: res,
          ),
        ),
      );
    }
  }

  Widget _buildFullScreenWidget(BuildContext context, Map data) {
    int startFrame = -1;
    int endFrame = -1;
    if (data['content'] != null) {
      startFrame = Util.parseInt(data['content']['startFrame']);
      endFrame = Util.parseInt(data['content']['endFrame']);
    }
    return IgnorePointer(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          MultiframeImage.network(
            '${data['img']}',
            'killer_activity',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            onFrameEmitted: (cur, count) {
              if (count == cur + 1) {
                Log.d('inAnimCompleter.complete');
              }
              if (cur == startFrame) {
                _showContent = true;
                setState(() {});
              }
              if (cur == endFrame) {
                _showContent = false;
                setState(() {});
              }
            },
            onComplete: () {
              if (widget.onComplete != null) {
                widget.onComplete!();
              }
            },
          ),
          if (_showContent) _buildIcons(data['icons']),
          if (_showContent) _buildBottom(data['content']),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFullScreenWidget(context, _currentItem);
  }
}
