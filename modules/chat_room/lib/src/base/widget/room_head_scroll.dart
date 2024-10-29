import 'dart:async';

import 'package:shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

/// 房间标题
class RoomHeadScroll extends StatefulWidget {
  final ChatRoomData room;
  final String? name;
  final String? nameShowed;
  final VoidCallback? onComplete;

  const RoomHeadScroll(
      {super.key,
      required this.room,
      this.onComplete,
      this.name,
      this.nameShowed});

  @override
  _RoomHeadScrollState createState() => _RoomHeadScrollState();
}

class _RoomHeadScrollState extends State<RoomHeadScroll> {
  int _timerCount = 0;
  Timer? _timer;
  ScrollController? _scrollController;
  ScrollController? _idScrollController;

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  void initTimer() {
    if (widget.nameShowed?.isNotEmpty == true &&
        widget.name?.isNotEmpty == true) {
      _timerCount = 0;
      if (_timer != null) {
        _timer!.cancel();
        _timer = null;
      }

      if (_scrollController != null) {
        if (mounted && _scrollController!.hasClients) {
          _scrollController!.animateTo(0.0,
              duration: const Duration(seconds: 1), curve: Curves.linear);
        }

        _scrollController!.dispose();
        _scrollController = null;
      }

      _scrollController = ScrollController();

      if (_idScrollController != null) {
        if (mounted && _idScrollController!.hasClients) {
          _idScrollController!.animateTo(0.0,
              duration: const Duration(seconds: 1), curve: Curves.linear);
        }

        _idScrollController!.dispose();
        _idScrollController = null;
      }
      _idScrollController = ScrollController();

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _timerCount++;
        // 2秒开始向左滚
        if (_timerCount == 3) {
          if (mounted &&
              _scrollController != null &&
              _scrollController!.hasClients) {
            _scrollController!.animateTo(
                _scrollController!.position.maxScrollExtent,
                duration: const Duration(seconds: 3),
                curve: Curves.linear);
          }

          if (mounted &&
              _idScrollController != null &&
              _idScrollController!.hasClients) {
            _idScrollController!.animateTo(
                _idScrollController!.position.maxScrollExtent,
                duration: const Duration(seconds: 3),
                curve: Curves.linear);
          }
        }

        if (_timerCount >= 15) {
          _timerCount = 0;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            if (mounted) {
              setState(() {});
            }
          });
        } else if (_timerCount == 7) {
          // 7秒往回滚
          if (mounted &&
              _scrollController != null &&
              _scrollController!.hasClients) {
            _scrollController!.animateTo(0.0,
                duration: const Duration(seconds: 3), curve: Curves.linear);
          }

          if (mounted &&
              _idScrollController != null &&
              _idScrollController!.hasClients) {
            _idScrollController!.animateTo(0.0,
                duration: const Duration(seconds: 3), curve: Curves.linear);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;

    if (_scrollController != null) {
      _scrollController!.dispose();
      _scrollController = null;
    }

    if (_idScrollController != null) {
      _idScrollController!.dispose();
      _idScrollController = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (widget.onComplete != null) {
            widget.onComplete!();
          }
        },
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _tapMsg();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 12,
            child: ListView.builder(
              itemCount: 1,
              controller: _scrollController,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return _buildSubContent();
              },
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          const SizedBox(height: 2),
          _buildRid(),
        ],
      ),
    );
  }

  Widget _buildRid() {
    int prettyRid = widget.room.prettyRid ?? 0;
    if (prettyRid > 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(BaseAssets.shared$ic_pretty_tag_webp, width: 11, height: 11),
          const SizedBox(width: 3),
          ColorfulNickName(
            isPrettyId: true,
            textBuild: (bool show, {Key? key, Paint? paint}) {
              return NumText(
                prettyRid.toString(),
                key: key,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    foreground: paint),
              );
            },
          ),
          const SizedBox(width: 5),
        ],
      );
    }

    return Flexible(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _idScrollController,
        child: NumText(
          'ID:${widget.room.rid}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: R.textStyle.regular10.copyWith(
              color: Colors.white.withOpacity(0.5), fontSize: 9, height: 1.2),
        ),
      ),
    );
  }

  Widget _buildSubContent() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text(
        widget.name ?? '',
        textAlign: TextAlign.center,
        style: R.textStyle.medium12.copyWith(color: Colors.white, height: 1),
      ),
    );
  }

  _tapMsg() {
    if (widget.onComplete != null) {
      widget.onComplete!();
    }
  }
}
