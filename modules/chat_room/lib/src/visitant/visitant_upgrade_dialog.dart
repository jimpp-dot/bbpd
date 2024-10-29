import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';
import 'model/visitant_model.dart';

/// 房间有人开通贵宾，或者贵宾等级升级时弹窗
class VisitantUpgradeDialog extends StatefulWidget {
  final VisitantUpgradeMsg msg;

  const VisitantUpgradeDialog({super.key, required this.msg});

  static void show(BuildContext context, VisitantUpgradeMsg msg) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return VisitantUpgradeDialog(msg: msg);
        });
  }

  @override
  State<VisitantUpgradeDialog> createState() => _VisitantUpgradeDialogState();
}

class _VisitantUpgradeDialogState extends State<VisitantUpgradeDialog> {
  final double _containerWidth = Util.width - 64;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), _pop);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void _pop() {
    if (mounted && Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: _containerWidth,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            PositionedDirectional(
              top: -66,
              child: Container(
                width: _containerWidth - 60,
                height: (_containerWidth - 60) * 0.51,
                padding: const EdgeInsetsDirectional.only(top: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        RoomAssets.chat_room$room_visitant_up_dialog_head_png),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            _buildMainContent(),
            PositionedDirectional(
                top: -35,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    R.img(RoomAssets.chat_room$room_visitant_up_diamond_webp,
                        width: 128, height: 71),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFFFF5E8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: GradientBorder(
        borderGradient: const LinearGradient(
            colors: [Color(0xFFFFD667), Color(0xFFB46618)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderWidth: 2,
        borderRadius: 16,
        child: SizedBox(
          width: _containerWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 45),
              Text(widget.msg.message,
                  style: const TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 17),
              Container(
                width: _containerWidth - 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color(0xFF313131).withOpacity(0.1),
                      width: 0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    CommonAvatar(
                        path: widget.msg.icon,
                        shape: BoxShape.circle,
                        size: 54),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _getUserTags(),
                    ),
                    const SizedBox(height: 18)
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getUserTags() {
    List<Widget> tagList = [];

    if (widget.msg.titleNew > 0) {
      tagList.add(UserNobilityWidget(
        titleNew: widget.msg.titleNew,
      ));
    }

    if (widget.msg.vipLevel > 0) {
      if (tagList.isNotEmpty) {
        tagList.add(const SizedBox(width: 4));
      }

      tagList.add(UserVipWidget(vip: widget.msg.vipLevel));
    }

    if (widget.msg.levelNew > 0) {
      if (tagList.isNotEmpty) {
        tagList.add(const SizedBox(width: 4));
      }

      tagList.add(RoomVisitantWidget(visitant: widget.msg.levelNew));
    }

    if (!Util.isStringEmpty(widget.msg.name)) {
      if (tagList.isNotEmpty) {
        tagList.add(const SizedBox(width: 4));
      }

      tagList.add(Flexible(
        child: Text(
          widget.msg.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Color(0xFF313131),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ));
    }

    return tagList;
  }
}
