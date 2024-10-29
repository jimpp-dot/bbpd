import 'dart:math';
import 'package:shared/k.dart' as CommonK;
import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';

class SlpGiftNumSelectWidget extends StatefulWidget {
  final List<BbGiftPanelChooseNumConfig>? data;
  final int selectCount;
  final Offset offset; //箭头位置
  final BbGiftPanelGift? selectGift;
  final int? totalMoney;
  const SlpGiftNumSelectWidget(this.data, this.selectCount, this.offset,
      this.selectGift, this.totalMoney,
      {super.key});
  @override
  _SlpGiftNumSelectWidgetState createState() => _SlpGiftNumSelectWidgetState();
  static Future<List<int>?> show(BuildContext buildContext,
      List<BbGiftPanelChooseNumConfig>? data, int selectCount, Offset offset,
      {BbGiftPanelGift? selectGift, int? totalMoney}) {
    return showDialog(
        context: buildContext,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (buildContext) {
          return SlpGiftNumSelectWidget(
              data, selectCount, offset, selectGift, totalMoney);
        });
  }
}

class _SlpGiftNumSelectWidgetState extends State<SlpGiftNumSelectWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  int _selectCount = 0;
  @override
  void initState() {
    super.initState();
    _selectCount = widget.selectCount;
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(controller!)
      ..addListener(() {});

    animation!.addStatusListener((status) {
      Log.d(status.toString());
      if (status == AnimationStatus.completed) {
      } else if (status == AnimationStatus.dismissed) {
        Navigator.of(context).pop();
      }
    });
    controller!.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ratio = min(Util.ratio, 1);
    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {});
          controller?.reverse();
        }
      },
      child: Container(
        color: Colors.black.withOpacity(0.12),
        child: ScaleTransition(
          scale: animation!,
          alignment: Alignment(widget.offset.dx * 2 / Util.width - 1,
              widget.offset.dy * 2 / Util.height - 1),
          child: FadeTransition(
            opacity: animation!,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                PositionedDirectional(
                    bottom: Util.height - widget.offset.dy + 5,
                    end: 60 * (ratio - 1) + 16 * ratio,
                    width: 120,
                    height: 28.0 * (widget.data?.length ?? 0) + 8,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: ListView.builder(
                          padding: EdgeInsetsDirectional.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: widget.data?.length ?? 0,
                          itemBuilder: _buildItem,
                        ),
                      ),
                    )),
                PositionedDirectional(
                    bottom: Util.height - widget.offset.dy,
                    end: Util.width - widget.offset.dx - 5,
                    width: 12,
                    height: 5,
                    child: R.img(Assets.ic_down_arrow_png,
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
    if (widget.data?.isEmpty == true) return const SizedBox.shrink();

    /// 倒序
    int invertOrder = widget.data!.length - 1 - index;
    int count = widget.data![invertOrder].num;
    String title = widget.data![invertOrder].desc;
    bool selected = false;
    if (_selectCount == count) {
      selected = true;
    }
    bool isOneKeyAwake = title == K.one_key_awakening;
    return Material(
      child: InkWell(
        onTap: () async {
          if (isOneKeyAwake) {
            bool? result = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return ConfirmDialog(
                  title: K.one_key_awakening_confirm,
                  content: K.auto_awake_content_tips(
                      ['$count', (widget.selectGift?.name ?? '')]),
                  positiveButton: PositiveButton(text: CommonK.K.confirm),
                );
              },
            );
            if (result == true) {
              // 首位表示礼物个数，第二位表示为一键登录标识
              Navigator.of(context).pop([count, 0]);
            }
          } else {
            Navigator.of(context).pop([count]);
          }
        },
        child: Container(
          width: 112,
          height: 28,
          alignment: Alignment.center,
          decoration: selected
              ? BoxDecoration(
                  color: !isOneKeyAwake
                      ? R.color.mainBrandColor.withOpacity(0.16)
                      : null,
                  borderRadius:
                      !isOneKeyAwake ? BorderRadius.circular(8) : null,
                  border: !isOneKeyAwake
                      ? Border.all(color: R.color.mainBrandColor)
                      : null,
                  image: isOneKeyAwake
                      ? DecorationImage(
                          image: AssetImage(
                            R.imagePath(Assets.gift$click_to_awake_bg_webp),
                          ),
                          fit: BoxFit.fill,
                        )
                      : null,
                )
              : isOneKeyAwake
                  ? BoxDecoration(
                      image: DecorationImage(
                      image: AssetImage(
                        R.imagePath(Assets.gift$click_to_awake_bg_webp),
                      ),
                      fit: BoxFit.fill,
                    ))
                  : null,
          child: isOneKeyAwake
              ? Text(
                  title,
                  style: R.textStyle.regular12
                      .copyWith(color: const Color(0xFF526EAD)),
                )
              : Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 8),
                        child: Text(
                          '$count',
                          style: R.textStyle.medium12
                              .copyWith(color: const Color(0xFF313131)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        title,
                        style: R.textStyle.regular12.copyWith(
                            color: const Color(0xFF313131).withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
