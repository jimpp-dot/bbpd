import 'package:shared/shared.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';
import 'package:flutter/material.dart';

class SweetAlbumGiftNumMenu extends StatefulWidget {
  final SweetAlbumGiftItem gift;
  final List<SweetAlbumNumConfig> data;
  final int selectCount;
  final Offset offset; //箭头位置
  final Rect position;

  const SweetAlbumGiftNumMenu(
      this.gift, this.data, this.selectCount, this.position, this.offset,
      {super.key});

  @override
  _SweetAlbumGiftNumMenuState createState() => _SweetAlbumGiftNumMenuState();

  static Future show(
      BuildContext buildContext,
      SweetAlbumGiftItem gift,
      List<SweetAlbumNumConfig> data,
      int selectCount,
      Rect position,
      Offset offset) {
    return showDialog(
        context: buildContext,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (buildContext) {
          return SweetAlbumGiftNumMenu(
              gift, data, selectCount, position, offset);
        });
  }
}

class _SweetAlbumGiftNumMenuState extends State<SweetAlbumGiftNumMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<SweetAlbumNumConfig> _sortedList = [];
  late int _selectCount;
  int _oneKeyWakeNum = 0;

  bool get _oneKeyWake => _oneKeyWakeNum > 0;

  @override
  void initState() {
    super.initState();
    _sortedList.addAll(widget.data);
    _sortedList.sort((a, b) => b.num - a.num);
    _selectCount = widget.selectCount;
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(_controller);
    _animation.addStatusListener((status) {
      Log.d(status.toString());
      if (status == AnimationStatus.completed) {
      } else if (status == AnimationStatus.dismissed) {
        Navigator.of(context).pop();
      }
    });
    _controller.forward();
    _loadOneKeyWakeNum();
  }

  Future<void> _loadOneKeyWakeNum() async {
    IGiftManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    _oneKeyWakeNum = await manager.getOneKeyWakeNum(widget.gift.giftId);
    if (_oneKeyWakeNum > 0) {
      refresh();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = 105;
    int len = _oneKeyWake ? _sortedList.length + 1 : _sortedList.length;
    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {});
          _controller.reverse();
        }
      },
      child: Container(
        color: Colors.black.withOpacity(0.12),
        child: ScaleTransition(
          scale: _animation,
          alignment: Alignment(widget.position.left * 2 / Util.width - 1,
              widget.position.top * 2 / Util.height - 1),
          child: FadeTransition(
            opacity: _animation,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                PositionedDirectional(
                    bottom: Util.height - widget.position.top + 10,
                    start: widget.position.left -
                        (width - widget.position.width) / 2.0,
                    width: width,
                    height: 28.0 * len + 8,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        padding: const EdgeInsetsDirectional.all(4),
                        child: ListView.builder(
                          padding: EdgeInsetsDirectional.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: len,
                          itemBuilder: _buildItem,
                        ),
                      ),
                    )),
                PositionedDirectional(
                    bottom: Util.height - widget.position.top + 5,
                    start: widget.position.left -
                        (width - widget.position.width) / 2.0 +
                        54,
                    width: 12,
                    height: 5,
                    child: R.img('ic_down_arrow.png',
                        width: 12,
                        height: 5,
                        package: ComponentManager.MANAGER_GIFT))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    if (_oneKeyWake) {
      if (index == 0) {
        return _buildOneKeyWake();
      } else {
        index -= 1;
      }
    }

    int count = _sortedList[index].num;
    String title = _sortedList[index].desc;
    bool selected = false;
    if (_selectCount == count) {
      selected = true;
    }
    Color textColor = selected
        ? Colors.white.withOpacity(0.9)
        : Colors.black.withOpacity(0.5);
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(count);
        },
        child: Container(
          width: 97,
          height: 28,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: selected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(colors: [
                    Color(0xFF7D2EE6),
                    Color(0xFFFF6BB3),
                    Color(0xFFFFC4CF)
                  ]),
                )
              : null,
          child: Row(
            children: [
              NumText('$count',
                  style: TextStyle(
                      fontSize: 12,
                      color: textColor,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(title,
                  style: TextStyle(
                      fontSize: 12,
                      color: textColor,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOneKeyWake() {
    return Material(
      child: InkWell(
        onTap: () async {
          bool? result = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmDialog(
                title: R.string('one_key_awakening_confirm'),
                content: R.string('auto_awake_content_tips',
                    args: ['$_oneKeyWakeNum', widget.gift.giftName]),
              );
            },
          );
          if (result == true) {
            Navigator.of(context).pop(Pair(true, _oneKeyWakeNum));
          }
        },
        child: Container(
          width: 97,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xFFEBF1FF),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            R.string('one_key_awakening'),
            style:
                R.textStyle.regular12.copyWith(color: const Color(0xFF526EAD)),
          ),
        ),
      ),
    );
  }
}
