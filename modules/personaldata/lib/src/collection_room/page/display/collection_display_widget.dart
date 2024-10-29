import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/collection_room_api.dart';
import 'package:personaldata/src/collection_room/collection_room_util.dart';
import 'package:personaldata/src/collection_room/page/display/widgets/collection_display_item.dart';
import 'package:personaldata/src/collection_room/widgets/collection_get_dialog.dart';

/// 收藏展示组件
class CollectionDisplayWidget extends StatefulWidget {
  final int targetUid;

  final List<ExhibitCommodityItem>? commodityItems;

  const CollectionDisplayWidget(
      {Key? key, required this.targetUid, this.commodityItems})
      : super(key: key);

  @override
  State<CollectionDisplayWidget> createState() =>
      _CollectionDisplayWidgetState();
}

class _CollectionDisplayWidgetState extends State<CollectionDisplayWidget> {
  late List<ExhibitCommodityItem> _commodityItems;

  @override
  void initState() {
    eventCenter.addListeners(
        [CollectionRoomUtil.messageDisplayItemsDidChange], _handImMsg);

    _commodityItems = widget.commodityItems ?? [];

    super.initState();
  }

  @override
  void dispose() {
    Log.d('CollectionDisplayWidget dispose');
    eventCenter.removeListeners(
        [CollectionRoomUtil.messageDisplayItemsDidChange], _handImMsg);
    super.dispose();
  }

  /// 对外展示的收藏品发生变化
  _handImMsg(String name, Object? dataObj) {
    Log.d('CollectionDisplayWidget 收到event消息: $name , data =$dataObj');

    if (name == CollectionRoomUtil.messageDisplayItemsDidChange) {
      Log.d('对外展示的收藏品发生变化');

      /// 对外展示的收藏品发生变化
      _loadData();
    }
  }

  /// 拉取新的收藏展示数据
  _loadData() async {
    final res = await CollectionRoomApi.requestGetDisplayCollections();
    if (res.success) {
      if (mounted) {
        setState(() {
          _commodityItems = res.data;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 335 / 120,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const _BackgroundWidget(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: _buildBody(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    List<ExhibitCommodityItem> inputItems = _commodityItems;
    const int minSize = 3;

    /// 最少展示3个
    int itemSize = inputItems.length > minSize ? inputItems.length : minSize;

    List<Widget> children = [];
    for (int i = 0; i < itemSize; i++) {
      ExhibitCommodityItem? data;
      bool isMe = Session.uid == widget.targetUid;
      if (i < inputItems.length) {
        data = inputItems[i];
      }
      children.add(
        AspectRatio(
          aspectRatio: 1,
          child: CollectionDisplayItem(
            isMe: isMe,
            data: data,
            onTap: () {
              if (data == null && isMe) {
                /// 跳转收藏室页面
                IPersonalDataManager personalManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalManager.showCollectionRoomPage(context,
                    targetUid: widget.targetUid);
              } else {
                if (data != null) {
                  /// 详情弹出框
                  CollectionGetDialog.show(System.context,
                      data: data, targetUid: widget.targetUid);
                }
              }
            },
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) =>
          Container(constraints: const BoxConstraints(maxWidth: 12)),
      itemCount: children.length,
    );
  }
}

class _BackgroundWidget extends StatelessWidget {
  const _BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF9569FF),
                Color(0xFF6C3AFF),
              ],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
            borderRadius: BorderRadiusDirectional.all(Radius.circular(16)),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: GradientBorder(
              borderWidth: 2,
              borderRadius: 16,
              borderGradient: const LinearGradient(
                colors: [
                  Color(0x80FF72C9),
                  Color(0x00FFFFFF),
                ],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
              child: null,
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          width: 68,
          height: 4,
          child: R.img('collection_room/display_bg_bottom.png',
              package: ComponentManager.MANAGER_PERSONALDATA,
              cachedWidth: 68.px,
              cachedHeight: 4.px),
        ),
        PositionedDirectional(
          start: 8,
          bottom: 8,
          width: 8,
          height: 46,
          child: R.img('collection_room/display_bg_left.png',
              package: ComponentManager.MANAGER_PERSONALDATA,
              cachedWidth: 8.px,
              cachedHeight: 46.px),
        ),
        PositionedDirectional(
          end: 8,
          bottom: 8,
          width: 8,
          height: 46,
          child: R.img('collection_room/display_bg_right.png',
              package: ComponentManager.MANAGER_PERSONALDATA,
              cachedWidth: 8.px,
              cachedHeight: 46.px),
        ),
        PositionedDirectional(
          top: 0,
          width: 216,
          height: 20,
          child: R.img('collection_room/display_bg_top.webp',
              package: ComponentManager.MANAGER_PERSONALDATA,
              cachedWidth: 216.px,
              cachedHeight: 20.px),
        ),
        PositionedDirectional(
          start: 8,
          top: 16,
          child: _point(),
        ),
        PositionedDirectional(
          end: 8,
          top: 16,
          child: _point(),
        ),
      ],
    );
  }

  Widget _point() {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: Color(0xFF4C25C8),
        borderRadius: BorderRadiusDirectional.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 0,
            color: Color(0x80000000),
          ),
        ],
      ),
    );
  }
}
