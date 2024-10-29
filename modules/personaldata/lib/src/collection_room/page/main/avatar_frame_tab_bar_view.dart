import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/collection_room_util.dart';
import 'package:personaldata/src/collection_room/model/collection_room_main_view_model.dart';
import 'package:personaldata/src/collection_room/page/main/widgets/avatar_frame_grid_widget.dart';
import 'package:shared/shared.dart';
import 'package:provider/provider.dart' hide Selector;

/// 头像框列表
class AvatarFrameTabBarView extends StatefulWidget {
  final String type;

  const AvatarFrameTabBarView(
      {Key? key, this.type = CollectionRoomUtil.avatarFrameTypeKey})
      : super(key: key);

  @override
  State<AvatarFrameTabBarView> createState() => _AvatarFrameTabBarViewState();
}

class _AvatarFrameTabBarViewState extends State<AvatarFrameTabBarView>
    with AutomaticKeepAliveClientMixin {
  @override
  void dispose() {
    Log.d('AvatarFrameTabBarView dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    List<ExhibitIndexData>? levelList =
        context.select<CollectionRoomMainViewModel, List<ExhibitIndexData>?>(
            (value) => value.getCollectionLevelList(widget.type));
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
        children
            .add(AvatarFrameGridWidget(key: ValueKey(data.grade), data: data));
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
