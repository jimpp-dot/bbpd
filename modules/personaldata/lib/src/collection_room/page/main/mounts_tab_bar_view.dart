import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/page/main/widgets/mounts_grid_widget.dart';
import '../../collection_room_util.dart';
import '../../model/collection_room_main_view_model.dart';
import 'package:provider/provider.dart' hide Selector;

/// 座驾
class MountsTabBarView extends StatefulWidget {
  const MountsTabBarView({Key? key}) : super(key: key);

  @override
  State<MountsTabBarView> createState() => _MountsTabBarViewState();
}

class _MountsTabBarViewState extends State<MountsTabBarView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final levelList = context
        .select<CollectionRoomMainViewModel, List<ExhibitIndexData>?>((value) =>
            value.getCollectionLevelList(CollectionRoomUtil.mountsTypeKey));
    if (levelList == null) return const SizedBox.shrink();
    if (levelList.isEmpty) {
      return const Center(
        child: EmptyWidget(textColor: Colors.white),
      );
    }

    List<Widget> children = [];
    for (int i = 0; i < levelList.length; i++) {
      final data = levelList[i];
      if (data.gradeCommodity.isNotEmpty) {
        children.add(MountsGridWidget(data: data));
      }
    }

    return ListView.separated(
      padding: EdgeInsets.only(
          top: 30, bottom: MediaQuery.of(context).padding.bottom),
      itemBuilder: (context, index) {
        return children[index];
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 40,
      ),
      shrinkWrap: true,
      itemCount: children.length,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
