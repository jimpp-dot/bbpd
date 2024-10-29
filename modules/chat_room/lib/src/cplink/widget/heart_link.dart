import 'dart:math';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:flutter/material.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';

import '../../../chat_room.dart';

class HeartLinkWidget extends StatefulWidget {
  final ChatRoomData room;
  final double circleSize;
  final List<Offset> offsets;
  final List<RoomPosition> positionList;
  final List<int>? linkValues;

  const HeartLinkWidget(
      {Key? key,
      required this.room,
      required this.circleSize,
      required this.offsets,
      required this.positionList,
      this.linkValues})
      : super(key: key);

  @override
  _HeartLinkWidgetState createState() => _HeartLinkWidgetState();
}

class _HeartLinkWidgetState extends State<HeartLinkWidget> {
  @override
  void initState() {
    super.initState();
    widget.room.addListener(RoomConstant.Event_Message, _onMessageChanged);
  }

  @override
  void dispose() {
    widget.room.removeListener(RoomConstant.Event_Message, _onMessageChanged);
    super.dispose();
  }

  Map<int, List<int>> _tempLinkIndices = <int, List<int>>{};
  int _tempLinkLevel = 0;

  void _onMessageChanged(String type, dynamic data) {
    if (data is! MessageContent) return;
    MessageContent message = data;
    //非心动连线阶段，不处理打赏消息
    if (widget.linkValues == null &&
        ((widget.room.config?.configExpendData as CpLinkConfigData?)?.state !=
            CpLinkState.heart)) {
      return;
    }
    Map<int, List<int>> linkIndices = <int, List<int>>{};
    int linkLevel = 0;

    //收到打赏消息切非助力打赏，显示短暂连线
    if (message.type == MessageType.Package && message.extra != null) {
      Map extra = message.extra ?? {};

      if (extra.containsKey('gift') &&
          extra['gift'] != null &&
          !Util.parseBool(extra['is_cplink_aid'], false)) {
        int fromUid = Util.parseInt(extra['uid']);
        List<int> toUids = Util.parseIntList(extra['uids']);
        Log.d(
            'Receive package msg, fromUid:$fromUid, toUids: [${toUids.join(',')}]');

        int fromIndex = widget.positionList.indexWhere((_) => _.uid == fromUid);

        if (fromIndex < 0) return;
        for (var _ in toUids) {
          int toIndex = widget.positionList.indexWhere((rp) => rp.uid == _);

          //打赏和被打赏的人都在麦位上且不在同一边，显示短暂连线
          if (toIndex >= 0 && toIndex != fromIndex) {
            int key = min(fromIndex, toIndex);
            if (linkIndices[key] == null) {
              linkIndices[key] = <int>[];
            }
            int value = max(fromIndex, toIndex);

            if (key < 3 && value >= 3)
              linkIndices[key]?.add(max(fromIndex, toIndex));
          }
        }

        linkLevel = Util.parseInt(extra['gift']['cplink_gift_lev']);
      }
    }

    Log.d(
        'Receive package msg, update _tempLinkIndices with data: ${linkIndices.entries.map((_) => '${_.key} : [${_.value.join(',')}]').join(', ')}');
    if (linkIndices.isNotEmpty) {
      setState(() {
        _tempLinkIndices = linkIndices;
        _tempLinkLevel = linkLevel;
      });
    }
  }

  Widget _buildTempLinks() {
    if (_tempLinkIndices.isEmpty) return const SizedBox();

    //非心动连线阶段，不显示短暂连线
    if (widget.linkValues == null &&
        (widget.room.config?.configExpendData as CpLinkConfigData?)?.state !=
            CpLinkState.heart) {
      return const SizedBox();
    }

    return TempLinkWidget(
        indices: _tempLinkIndices,
        linkLevel: _tempLinkLevel,
        onComplete: () {
          if (_tempLinkIndices.isNotEmpty) {
            _tempLinkIndices.clear();
            _tempLinkLevel = 0;
            if (mounted) setState(() {});
          }
        });
  }

  String _formatValue(int value) {
    if (value >= 10000) {
      return '${((value / 10000.0) * 100).floorToDouble() / 100}w'; // 向下取整
    } else {
      return '$value';
    }
  }

  List<Widget> _buildLink() {
    int maxValue = 0;
    int secondValue = 0;
    int thirdValue = 0;
    List<Widget> widgets = [];
    if (Util.validList(widget.linkValues)) {
      maxValue = widget.linkValues![0];
      if (widget.linkValues!.length > 1) {
        secondValue = widget.linkValues![1];
      }
      if (widget.linkValues!.length > 2) {
        thirdValue = widget.linkValues![2];
      }
    } else {
      CpLinkConfigData? cpLinkConfigData =
          widget.room.config?.configExpendData as CpLinkConfigData?;

      if (cpLinkConfigData?.heartValue.isEmpty ?? true)
        return [const SizedBox()];

      maxValue = cpLinkConfigData!.heartValue[0];
      secondValue = cpLinkConfigData.heartValue.length < 2
          ? 0
          : cpLinkConfigData.heartValue[1];
      thirdValue = cpLinkConfigData.heartValue.length < 3
          ? 0
          : cpLinkConfigData.heartValue[2];
    }

    if (maxValue > 0) {
      widgets.add(
        Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            R.img('cplink/cplink_link_big.png',
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: widget.circleSize),
            Text(
              _formatValue(maxValue),
              style: const TextStyle(color: Color(0xFFFEFEFE), fontSize: 14),
            ),
          ],
        )),
      );
    }

    if (secondValue > 0) {
      widgets.add(
        PositionedDirectional(
            top: 0,
            start: widget.circleSize / 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                R.img('cplink/cplink_link_small.png',
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    width: widget.circleSize / 2),
                Text(
                  _formatValue(secondValue),
                  style: const TextStyle(color: Color(0xFFFEFEFE), fontSize: 9),
                ),
              ],
            )),
      );
    }

    if (thirdValue > 0) {
      widgets.add(
        PositionedDirectional(
            bottom: 0,
            start: widget.circleSize / 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                R.img('cplink/cplink_link_small.png',
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    width: widget.circleSize / 2),
                Text(
                  _formatValue(thirdValue),
                  style: const TextStyle(color: Color(0xFFFEFEFE), fontSize: 9),
                ),
              ],
            )),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.circleSize,
      height: widget.circleSize,
      child: Stack(
        children: [
          ..._buildLink(),
          _buildTempLinks(),
        ],
      ),
    );
  }
}

class TempLinkWidget extends StatelessWidget {
  final Map<int, List<int>> indices;
  final int linkLevel;
  final VoidCallback? onComplete;

  const TempLinkWidget({
    Key? key,
    required this.indices,
    this.linkLevel = 0,
    required this.onComplete,
  }) : super(key: key);

  void _onComplete(int from, int to) {
    if (onComplete != null) onComplete!();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[];
    String dirIndex = '';
    if (linkLevel > 0) {
      dirIndex = '1';
    }
    indices.forEach((key, value) {
      for (var _ in value) {
        widgets.add(MultiframeImage.network(
          Util.getImgUrl(
              'cplink/heart_link_animation$dirIndex/${key + 1}-${_ + 1}.webp',
              package: ComponentManager.MANAGER_BASE_ROOM),
          'heart_link_animation$dirIndex',
          onComplete: () => _onComplete(key + 1, _ + 1),
        ));
      }
    });

    return Stack(
      children: widgets,
    );
  }
}
