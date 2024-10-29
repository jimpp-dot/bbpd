import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/collection_room_util.dart';
import 'package:personaldata/src/collection_room/widgets/collection_commodity_base_widget.dart';

/// 头像框收藏组件
class CollectionAvatarFrameWidget extends CollectionCommodityBaseWidget {
  final int? targetUid;
  final String type;

  const CollectionAvatarFrameWidget({
    Key? key,
    required ExhibitCommodityItem data,
    required this.type,
    VoidCallback? onTap,
    bool showLock = true,
    double size = 80,
    this.targetUid,
  }) : super(
          key: key,
          data: data,
          onTap: onTap,
          showLock: showLock,
          size: size,
        );

  @override
  Widget build(BuildContext context) {
    double avatarSize =
        type == CollectionRoomUtil.micRingTypeKey ? size * 0.625 : size * 0.9;

    return GestureDetector(
      onTap: super.onTap,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (type == CollectionRoomUtil.micRingTypeKey)
            ColorFiltered(
              colorFilter: isLock
                  ? greyscale
                  : const ColorFilter.mode(Colors.transparent, BlendMode.color),
              child: UserIconFrame(
                size: size,
                frameUrl: data.image,
              ),
            ),
          _AvatarWidget(
            size: avatarSize,
            uid: targetUid,
          ),
          if (isLock)
            PositionedDirectional(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(avatarSize)),
                child: Container(
                  width: avatarSize,
                  height: avatarSize,
                  color: const Color(0x80000000),
                ),
              ),
            ),
          if (type != CollectionRoomUtil.micRingTypeKey)
            ColorFiltered(
              colorFilter: isLock
                  ? greyscale
                  : const ColorFilter.mode(Colors.transparent, BlendMode.color),
              child: UserIconFrame(
                size: size,
                frameUrl: data.image,
              ),
            ),
          if (isLock)
            PositionedDirectional(
              width: 24,
              height: 24,
              child: R.img('collection_room/ic_lock.webp',
                  package: ComponentManager.MANAGER_PERSONALDATA,
                  cachedWidth: 24.px,
                  cachedHeight: 24.px),
            ),
        ],
      ),
    );
  }
}

class _AvatarWidget extends StatefulWidget {
  final int? uid;

  final double size;

  const _AvatarWidget({Key? key, this.uid, required this.size})
      : super(key: key);

  @override
  State<_AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<_AvatarWidget> {
  late int _uid;

  UserInfo? _userInfo;

  @override
  void initState() {
    super.initState();

    _uid = widget.uid ?? Session.uid;

    _loadUserImage();
  }

  _loadUserImage() async {
    UserInfo? info =
        await CachedNames.instance().get(_uid, ConversationType.Private);

    if (mounted) {
      setState(() {
        _userInfo = info;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_userInfo == null) {
      return SizedBox(
        width: widget.size,
        height: widget.size,
      );
    }

    return CommonAvatar(
      borderRadius: BorderRadiusDirectional.circular(widget.size),
      size: widget.size,
      path: _userInfo?.icon ?? '',
    );
  }
}
