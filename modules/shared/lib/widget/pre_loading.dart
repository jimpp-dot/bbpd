import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 首页加载数据，占位Widget
class PreLoading extends StatefulWidget {
  final Widget child;

  const PreLoading({super.key, required this.child});

  @override
  PreLoadingState createState() {
    return PreLoadingState();
  }
}

class PreLoadingState extends State<PreLoading> with TickerProviderStateMixin {
  late AnimationController _aniController;
  late Animation<Offset> _slideAni;

  @override
  void initState() {
    super.initState();
    _aniController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _slideAni = Tween(
            begin: const Offset(0, 0), end: Offset((Util.width + 145) / 145, 0))
        .animate(_aniController);
    _aniController.repeat();
  }

  @override
  void dispose() {
    _aniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Stack(
            children: [
              widget.child,
              PositionedDirectional(
                start: -145,
                child: AnimatedBuilder(
                  animation: _aniController,
                  builder: (BuildContext context, _) {
                    return SlideTransition(
                      position: _slideAni,
                      child: Container(
                        width: 145,
                        height: constraints.maxHeight,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: AlignmentDirectional.centerStart,
                            end: AlignmentDirectional.centerEnd,
                            colors: [
                              R.color.mainBgColor.withOpacity(0),
                              R.color.mainBgColor.withOpacity(0.6)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HomeFriendLoadingWidget extends StatelessWidget {
  const HomeFriendLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 20),
            width: Util.width - 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 20),
            width: Util.width - 40,
            height: 102,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 20),
            width: 111,
            height: 27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.5),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: Util.width,
            height: 56,
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.only(start: 20),
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemExtent: 102.0 + 8,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 102,
                  height: 56,
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: R.color.secondBgColor.withOpacity(1),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 20),
            width: 111,
            height: 27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.5),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 20),
            width: Util.width - 40,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 20),
            width: Util.width - 40,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 20),
            width: 111,
            height: 27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.5),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          SizedBox(
            width: Util.width,
            height: 132,
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.only(start: 20),
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemExtent: 104.0 + 8,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 104,
                  height: 132,
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: R.color.secondBgColor.withOpacity(1),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 20),
            width: Util.width - 40,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 20),
            width: Util.width - 40,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeNormalRoomLoadingWidget extends StatelessWidget {
  const HomeNormalRoomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      child: ListView.builder(
        padding: const EdgeInsetsDirectional.only(top: 5),
        physics: const NeverScrollableScrollPhysics(),
        itemExtent: 100.0 + 10,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: Util.width - 40,
            height: 100,
            margin: const EdgeInsetsDirectional.only(start: 20, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: R.color.secondBgColor.withOpacity(1),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: R.color.mainTextColor.withOpacity(0.04),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: R.color.mainTextColor.withOpacity(0.04),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 80,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: R.color.mainTextColor.withOpacity(0.04),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeGridRoomLoadingWidget extends StatelessWidget {
  HomeGridRoomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      child: GridView.count(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 5),
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio:
            ((Util.width - 40 - 16) / 2) / (105 + 4 + 16 + 4 + 16),
        children: getChildren(),
      ),
    );
  }

  final List<Widget> children = [];

  List<Widget> getChildren() {
    if (children.isNotEmpty) {
      return children;
    }

    for (int i = 0; i < 12; i++) {
      children.add(Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: (Util.width - 40 - 16) / 2,
            height: 105,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: 120,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: 80,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: R.color.secondBgColor.withOpacity(1),
            ),
          ),
        ],
      ));
    }

    return children;
  }
}

class HomeGrid2RoomLoadingWidget extends StatelessWidget {
  HomeGrid2RoomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      child: GridView.count(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 5),
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1,
        children: getChildren(),
      ),
    );
  }

  final List<Widget> children = [];

  List<Widget> getChildren() {
    if (children.isNotEmpty) {
      return children;
    }

    for (int i = 0; i < 12; i++) {
      children.add(Container(
        width: (Util.width - 40 - 8) / 2,
        height: (Util.width - 40 - 8) / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: R.color.secondBgColor.withOpacity(1),
        ),
      ));
    }

    return children;
  }
}

class MomentLoadingWidget extends StatelessWidget {
  const MomentLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemExtent: 174,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: Util.width - 40,
            height: 134,
            margin: const EdgeInsetsDirectional.only(
                start: 20, end: 20, top: 8, bottom: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: R.color.secondBgColor.withOpacity(1),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 178,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: R.color.secondBgColor.withOpacity(1),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 70,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: R.color.secondBgColor.withOpacity(1),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: Util.width - 40 - 52 - 8,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: R.color.secondBgColor.withOpacity(1),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: Util.width - 40 - 52 - 8,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: R.color.secondBgColor.withOpacity(1),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 163,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: R.color.secondBgColor.withOpacity(1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
