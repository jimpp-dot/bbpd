import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/collection_room_util.dart';
import 'package:personaldata/src/collection_room/model/avatar_frame_list_view_model.dart';
import 'package:personaldata/src/collection_room/widgets/collection_avatar_frame_widget.dart';
import 'package:personaldata/src/collection_room/widgets/collection_other_commodity_widget.dart';
import 'package:personaldata/src/collection_room/widgets/collection_get_dialog.dart';
import 'package:personaldata/src/collection_room/widgets/collection_list_box.dart';
import 'package:personaldata/src/collection_room/widgets/expand_more_button.dart';
import 'package:personaldata/src/collection_room/widgets/show_out_button.dart';
import 'package:provider/provider.dart' hide Selector;

class AvatarFrameGridWidget extends StatefulWidget {
  final ExhibitIndexData data;

  const AvatarFrameGridWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<AvatarFrameGridWidget> createState() => _AvatarFrameGridWidgetState();
}

class _AvatarFrameGridWidgetState extends State<AvatarFrameGridWidget> {
  late AvatarFrameListViewModel _viewModel;

  @override
  void dispose() {
    _viewModel.dispose();
    Log.d('AvatarFrameGridWidget dispose()');
    super.dispose();
  }

  @override
  void initState() {
    _viewModel = AvatarFrameListViewModel(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String type = Util.isNullOrEmpty(widget.data.gradeCommodity.first.type)
        ? CollectionRoomUtil.avatarFrameTypeKey
        : widget.data.gradeCommodity.first.type;

    return ChangeNotifierProvider.value(
      value: _viewModel,
      builder: (context, child) {
        final itemList = context.select<AvatarFrameListViewModel,
            List<ExhibitCommodityItem>>((value) => value.allItems);
        final showMaxCount = context.select<AvatarFrameListViewModel, int>(
            (value) => value.currentShowMaxCount);

        var realShowCount = itemList.length;
        if (realShowCount > showMaxCount) {
          realShowCount = showMaxCount;
        }
        Log.d('====== _AvatarFrameGridWidgetState build=======');
        return CollectionListBox(
          levelIcon: widget.data.gradeIcon,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 268,
            ),
            padding: const EdgeInsets.only(top: 72, left: 28, right: 28),
            child: Column(
              children: [
                Consumer<AvatarFrameListViewModel>(
                    builder: (ctx, viewModel, child) {
                  List<ExhibitCommodityItem> list = viewModel.allItems;
                  return GridView.builder(
                    padding: const EdgeInsets.only(bottom: 30, top: 6),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: type.isAvatarFrameType ? 20 : 0,
                      childAspectRatio:
                          type.isAvatarFrameType ? 80 / 144 : 80 / 132,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = list[index];
                      return _AvatarFrameGridItem(
                        data: data,
                        key: ValueKey(data.cid),
                      );
                    },
                    itemCount: realShowCount,
                  );
                }),
                _buildExpandMoreButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildExpandMoreButton(BuildContext context) {
    bool hasMore = context
        .select<AvatarFrameListViewModel, bool>((value) => value.hasMore);

    return Container(
      width: 96,
      height: 30,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: (R.img('collection_room/box_bottom_btn_bg2.webp',
                  package: ComponentManager.MANAGER_PERSONALDATA) as Image)
              .image,
        ),
      ),
      child: ExpandMoreButton(
        hasMore: hasMore,
        onTap: () {
          if (hasMore) {
            /// 展开更多
            _viewModel.actionForExpandMoreData();
          } else {
            /// 展开收起
            _viewModel.actionForPackUpData();
          }
        },
      ),
    );
  }
}

class _AvatarFrameGridItem extends StatelessWidget {
  final ExhibitCommodityItem data;

  const _AvatarFrameGridItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAvatarFrame(),
        const SizedBox(
          height: 4,
        ),
        Text(
          data.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              R.textStyle.medium12.copyWith(fontSize: 11, color: Colors.white),
        ),
        const SizedBox(
          height: 6,
        ),
        ShowOutButton(
          onTap: () {
            /// 点击对外展示或取消展示
            context
                .read<AvatarFrameListViewModel>()
                .actionForShowOutOrNot(data);
          },
          isEnable: !data.lock.toPbBool(),
          hasShowed: data.pinned.toPbBool(),
        ),
      ],
    );
  }

  Widget _buildAvatarFrame() {
    if (data.type == CollectionRoomUtil.avatarFrameTypeKey ||
        data.type == CollectionRoomUtil.micRingTypeKey) {
      return CollectionAvatarFrameWidget(
        data: data,
        onTap: _onAvatarFrameTap,
        type: data.type,
      );
    } else {
      return CollectionOtherCommodityWidget(
        data: data,
        onTap: _onAvatarFrameTap,
      );
    }
  }

  _onAvatarFrameTap() {
    CollectionGetDialog.show(System.context, data: data);
  }
}

const ColorFilter greyscale = ColorFilter.matrix(<double>[
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);
