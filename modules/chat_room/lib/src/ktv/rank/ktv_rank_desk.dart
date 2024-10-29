import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/protobuf/generated/common_rank_pk.pb.dart';
import 'package:flutter/material.dart';

typedef OnLayout = void Function(double height);

class KtvRankDeskWidget extends StatefulWidget {
  final int rank;
  final double desk1Height;
  final BorderRadiusGeometry? borderRadius;
  final KtvPkRankData data;
  final OnLayout onLayout;
  final Widget scoreWidget;
  final GestureTapCallback? onTapSupport;

  const KtvRankDeskWidget({
    Key? key,
    required this.rank,
    required this.desk1Height,
    this.borderRadius,
    required this.data,
    required this.scoreWidget,
    required this.onLayout,
    this.onTapSupport,
  }) : super(key: key);

  @override
  _KtvRankDeskWidgetState createState() => _KtvRankDeskWidgetState();
}

class _KtvRankDeskWidgetState extends State<KtvRankDeskWidget> {
  GlobalKey rank2DeskKey = GlobalKey();

  double _rank2DeskHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      if (rank2DeskKey.currentContext == null || !mounted) return;
      RenderBox deskBox =
          rank2DeskKey.currentContext!.findRenderObject() as RenderBox;
      double deskHeight = deskBox.size.height;
      if (deskHeight > 0) {
        _rank2DeskHeight = deskHeight;
        widget.onLayout(_rank2DeskHeight);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildDesk(
        widget.rank, widget.desk1Height, widget.borderRadius, widget.data);
  }

  Container _buildDesk(int rank, double desk1Height,
      BorderRadiusGeometry? borderRadius, KtvPkRankData data) {
    return Container(
      key: rank == 2 ? rank2DeskKey : null,
      height: desk1Height,
      padding: EdgeInsetsDirectional.only(
          top: rank == 1 ? 14 : 10, start: 10, end: 10, bottom: 10),
      width: Util.width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          image: AssetImage(R.imagePath('ktv/ktv_pk_rank_desk$rank.png',
              package: ComponentManager.MANAGER_BASE_ROOM)),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Text(
            data.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          widget.scoreWidget,
          const SizedBox(height: 6),
          InkWell(
            onTap: widget.onTapSupport,
            child: Container(
              width: 66,
              height: 28,
              decoration: const ShapeDecoration(
                  shape: StadiumBorder(), color: Colors.white),
              child: Center(
                child: Text(
                  K.room_talent_support,
                  style: const TextStyle(
                      color: Color(0xFF3D17BE),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
