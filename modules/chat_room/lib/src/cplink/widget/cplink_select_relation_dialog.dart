import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/cplink/model/cplink_repo.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';
import '../model/cplink_model.dart';

class CpLinkSelectRelationDialogWidget extends StatefulWidget {
  final ChatRoomData room;

  const CpLinkSelectRelationDialogWidget({Key? key, required this.room})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CpLinkSelectRelationDialogState();

  static Future<int?> show(BuildContext context, ChatRoomData room) {
    return showDialog(
        context: context,
        builder: (context) => CpLinkSelectRelationDialogWidget(room: room));
  }
}

class _CpLinkSelectRelationDialogState
    extends State<CpLinkSelectRelationDialogWidget> {
  Relationship? selectedItem;

  RelationshipDataV2? relationData;

  bool loading = true;
  bool error = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    loading = true;
    error = false;
    DataRsp<RelationshipDataV2>? data =
        await CpLinkRepo.relationListV2(widget.room.realRid);
    loading = false;
    if (data != null && data.success == true) {
      relationData = data.data;
    } else {
      error = true;
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    double height = (loading || error) ? 200 : 340;
    return Dialog(
      child: Container(
        width: 336,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            _buildBody(),
            if (!loading && !error)
              PositionedDirectional(
                top: 0,
                end: 0,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    size: 24,
                    color: R.color.thirdTextColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsetsDirectional.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.room_cplink_v2_select_relation,
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(child: _buildContent()),
          const SizedBox(height: 12),
          _buildBtn(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (loading) {
      return const Center(child: Loading());
    }
    if (error) {
      return Center(
        child: Text(
          K.room_cplink_select_relation_error,
          style: const TextStyle(
            color: Color(0x99202020),
            fontSize: 16,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    String content = '';
    if ((selectedItem?.defendDays?.curDefendDays ?? 0) > 0) {
      content = K.room_cplink_relation_sill_high(
          ['${selectedItem?.defendDays?.curDefendDays}']);
      if ((selectedItem?.defendDays?.nextDefendDays ?? 0) > 0) {
        content += ('，${K.room_cplink_relation_sill_middle([
              '${selectedItem?.defendDays?.nextDefendDays}',
              '${selectedItem?.defendDays?.nextScore}'
            ])}');
      }
    } else if ((selectedItem?.defendDays?.nextDefendDays ?? 0) > 0) {
      content = K.room_cplink_relation_sill_low([
        '${selectedItem?.defendDays?.nextDefendDays}',
        '${selectedItem?.defendDays?.nextDefendDays}',
        '${selectedItem?.defendDays?.nextScore}'
      ]);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          content,
          style: TextStyle(
            color: R.color.mainTextColor.withOpacity(0.7),
            fontSize: 13,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 15),
        _buildGridView(),
        const Spacer(),
        Text(
          K.room_cplink_relation_next_tip,
          style: TextStyle(
            color: R.color.mainTextColor.withOpacity(0.6),
            fontSize: 11,
          ),
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return SizedBox(
      height: 125,
      child: GridView.builder(
        itemCount: relationData?.relationships.length ?? 0,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 24,
            mainAxisSpacing: 12,
            childAspectRatio: 150 / 40),
        itemBuilder: (context, index) {
          Relationship item = relationData!.relationships[index];
          return _buildItem(item);
        },
      ),
    );
  }

  Widget _buildItem(Relationship item) {
    bool selected = ((selectedItem?.id ?? -1) == item.id);
    return InkWell(
      onTap: () {
        if (item.lightStatus == false) {
          Fluttertoast.showCenter(
            msg: K.room_cplink_relation_light_money(
              ['${item.lightMoney}'],
            ),
          );
          return;
        }
        selectedItem = item;
        refresh();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            colors: selected
                ? R.color.mainBrandGradientColors
                : [const Color(0x0F000000), const Color(0x0F000000)],
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          item.name ?? '',
          style: TextStyle(
            color: selected ? Colors.white : R.color.mainTextColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBtn() {
    if (loading || error) {
      return InkWell(
        onTap: () {
          Navigator.of(context).pop(0);
        },
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            gradient: LinearGradient(
              colors: R.color.mainBrandGradientColors,
            ),
          ),
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            K.room_cplink_relation_select_early_finish,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop(0);
          },
          child: Container(
            width: 110,
            height: 48,
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              color: Color(0xFFF5F5F5),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.room_cplink_relation_select_early_finish,
              style: const TextStyle(
                color: Color(0xB3202020),
                fontSize: 15,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if ((selectedItem?.id ?? -1) > 0) {
              Navigator.of(context).pop(selectedItem?.id);
            } else {
              Fluttertoast.showCenter(msg: K.room_cplink_relation_unselect_tip);
            }
          },
          child: Container(
            width: 110,
            height: 48,
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: LinearGradient(
                colors: R.color.mainBrandGradientColors,
              ),
            ),
            foregroundDecoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: ((selectedItem?.id ?? -1) > 0)
                  ? Colors.transparent
                  : Colors.white.withOpacity(0.5),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.room_cplink_relation_select_next,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
