import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/talent/talent_constants.dart';

class TalentStarAwardAniWidget extends StatefulWidget {
  final String imageUrl;
  final Size size;
  final VoidCallback? onEnd;

  const TalentStarAwardAniWidget({
    super.key,
    required this.imageUrl,
    required this.size,
    this.onEnd,
  });

  @override
  _TalentStarAwardAniWidgetState createState() =>
      _TalentStarAwardAniWidgetState();
}

class _TalentStarAwardAniWidgetState extends State<TalentStarAwardAniWidget>
    with SingleTickerProviderStateMixin {
  bool _firstBuild = true;

  @override
  Widget build(BuildContext context) {
    Log.d(
        tag: TAG,
        'build star award ani..._firstBuild=$_firstBuild,img=${widget.imageUrl}');
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: Stack(
        children: [
          AnimatedPositioned(
            left: 0,
            bottom: _firstBuild ? 5 : (widget.size.height - 37),
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeOutExpo,
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              width: 35,
              height: 29,
              loadComplete: () {
                Future.delayed(const Duration(milliseconds: 100)).then((value) {
                  if (mounted) {
                    setState(() {
                      _firstBuild = false;
                    });
                  }
                });
              },
            ),
            onEnd: () {
              if (mounted) widget.onEnd?.call();
            },
          )
        ],
      ),
    );
  }
}
