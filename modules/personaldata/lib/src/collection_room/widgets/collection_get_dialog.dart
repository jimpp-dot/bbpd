import 'package:shared/shared.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:personaldata/src/collection_room/collection_room_util.dart';
import 'package:personaldata/src/collection_room/widgets/collection_avatar_frame_widget.dart';
import 'package:personaldata/src/collection_room/widgets/collection_mounts_widget.dart';
import 'package:personaldata/K.dart';
import 'package:personaldata/src/collection_room/widgets/collection_other_commodity_widget.dart';

/// 收藏品获取条件弹窗
class CollectionGetDialog extends StatelessWidget {
  final ExhibitCommodityItem data;

  final int targetUid;

  const CollectionGetDialog(
      {Key? key, required this.data, required this.targetUid})
      : super(key: key);

  static OverlayEntry? _mountsDisplayOverlayEntry;

  static Future show(BuildContext context,
      {required ExhibitCommodityItem data, int? targetUid}) async {
    _clearMountsPlayOverlay();

    /// 座驾需要播放一次动画效果
    if (data.type.isMountsType) {
      final overlayState = Overlay.of(System.context);
      _mountsDisplayOverlayEntry = OverlayEntry(builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _clearMountsPlayOverlay,
          child: Container(
            color: Colors.black38,
            width: Util.width,
            height: Util.height,
            child: IgnorePointer(
              child: DecorateDisplayWidget(
                effect: Decorate(data.giftId, data.vapSize),
                repeat: false,
                onError: _clearMountsPlayOverlay,
                onComplete: _clearMountsPlayOverlay,
              ),
            ),
          ),
        );
      });
      overlayState.insert(_mountsDisplayOverlayEntry!);
    }

    await showDialog(
        context: context,
        builder: (context) {
          return CollectionGetDialog(
            data: data,
            targetUid: targetUid ?? Session.uid,
          );
        },
        useSafeArea: false);

    _clearMountsPlayOverlay();
  }

  static _clearMountsPlayOverlay() {
    _mountsDisplayOverlayEntry?.remove();
    _mountsDisplayOverlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    double width = Util.width - 64;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: width / (312 / 279),
          constraints: const BoxConstraints(
            minHeight: 279,
          ),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.all(Radius.circular(16))),
          child: Column(
            children: [
              _buildCloseBtn(context),
              _buildTitle,
              _buildBody,

              /// 物品名称
              _commodityName,

              /// 解锁日期/解锁条件
              _getTimeOrUnlockConditionLabel,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCloseBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Spacer(),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 32,
            height: 32,
            alignment: AlignmentDirectional.center,
            child: R.img('collection_room/ic_close_small.webp',
                package: ComponentManager.MANAGER_PERSONALDATA,
                width: 16,
                height: 16),
          ),
        ),
      ],
    );
  }

  Widget get _buildTitle {
    return SizedBox(
      height: 25,
      child: Text(
        K.personal_cr_get_condition,
        style: R.textStyle.medium18.copyWith(
          color: R.color.mainTextColor,
        ),
      ),
    );
  }

  Widget get _buildBody {
    return AspectRatio(
      aspectRatio: 264 / 128,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(12)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF3B1593),
                  Color(0xFF9A51F8),
                ],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            alignment: AlignmentDirectional.center,
            child: _commodityWidget,
          ),

          /// 等级标签
          _levelIcon,

          /// 仅X人拥有
          _descWidget,
        ],
      ),
    );
  }

  Widget get _levelIcon {
    return PositionedDirectional(
      top: 24,
      start: 32,
      child: CachedNetworkImage(
        imageUrl: Util.parseIcon(data.gradeIcon),
        width: 40,
        height: 20,
      ),
    );
  }

  Widget get _descWidget {
    String desc = data.desc;

    if (desc.isEmpty) return const SizedBox.shrink();

    return PositionedDirectional(
      end: 24,
      top: 16,
      child: Container(
        height: 24,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(8), topEnd: Radius.circular(12)),
          color: Color(0x99000000),
        ),
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          desc,
          style: R.textStyle.medium12
              .copyWith(fontSize: 12, color: const Color(0xFFFCA252)),
        ),
      ),
    );
  }

  Widget get _commodityWidget {
    Log.d('data.type = ${data.type}');
    if (data.type.isMountsType) {
      /// 座驾
      return CollectionMountsWidget(
        size: 120,
        data: data,
        showPlay: false,
      );
    } else if (data.type.isAvatarFrameType) {
      /// 头像框
      return CollectionAvatarFrameWidget(
        size: 96,
        data: data,
        targetUid: targetUid,
        type: data.type,
      );
    } else {
      if (data.type == CollectionRoomUtil.micRingTypeKey) {
        /// 光圈
        return CollectionAvatarFrameWidget(
          size: 96,
          data: data,
          targetUid: targetUid,
          type: data.type,
        );
      } else {
        return CollectionOtherCommodityWidget(
          /// 其他
          size: data.type == CollectionRoomUtil.bubbleTypeKey ? 120 : 200,
          data: data,
          targetUid: targetUid,
        );
      }
    }
    return Container();
  }

  Widget get _commodityName {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 12),
      child: SizedBox(
        height: 22,
        child: Text(
          data.name,
          style: R.textStyle.medium16.copyWith(color: R.color.mainTextColor),
        ),
      ),
    );
  }

  Widget get _getTimeOrUnlockConditionLabel {
    String? label;
    if (data.lock.toPbBool()) {
      label = data.condition;
    } else {
      if (data.getTime > 0) {
        label =
            "${DateUtils.format(data.getTime * 1000, 'yyyy.MM.dd')} ${K.personal_cr_dissappear_after}";
      }
    }

    if (Util.isNullOrEmpty(label)) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 2),
      child: SizedBox(
        height: 18,
        child: Text(
          label ?? '',
          style: R.textStyle.medium12
              .copyWith(fontSize: 13, color: R.color.secondTextColor),
        ),
      ),
    );
  }
}
