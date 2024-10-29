part of 'game_list_page.dart';

Widget _wrapContainer(Widget child, {double maxHeight = 350}) {
  return GestureDetector(
    onTap: () {},
    child: ClipRRect(
      borderRadius:
          const BorderRadiusDirectional.vertical(top: Radius.circular(16.0))
              .resolve(TextDirection.ltr),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: Container(
          clipBehavior: Clip.none,
          constraints: BoxConstraints(maxHeight: maxHeight),
          padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 12),
          color: const Color(0xB31C1C1E),
          child: child,
        ),
      ),
    ),
  );
}

typedef OnItemClick = void Function(GamePlayItem item);

Widget _buildItem(GamePlayItem item, OnItemClick onItemClick) {
  return Container(
    margin: const EdgeInsetsDirectional.only(top: 12),
    padding: const EdgeInsetsDirectional.only(
        start: 12, end: 12, top: 12, bottom: 12),
    alignment: AlignmentDirectional.centerStart,
    decoration: const BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onItemClick(item),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white.withOpacity(0.08),
            ),
            alignment: Alignment.center,
            child: R.img(Util.getImgUrl(item.icon), width: 29, height: 29),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Util.isStringEmpty(item.title)
                      ? K.room_edit_title
                      : item.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  Util.isStringEmpty(item.content)
                      ? K.room_edit_play_introduce
                      : item.content,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(
                RoomAssets.chat_room$crosspk_ic_hot_svg,
                width: 14,
                height: 14,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 4),
              Text(
                '${item.hot}',
                style: const TextStyle(color: Color(0x33FFFFFF), fontSize: 12),
              )
            ],
          ),
          const SizedBox(width: 16),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white54,
          )
        ],
      ),
    ),
  );
}

Widget _buildTitleBar(String title,
    {bool showBack = false, List<Widget>? actions}) {
  return BaseAppBar.custom(
    title: Text(
      title,
      style: const TextStyle(
          color: Color(0xFFF6F7F9), fontSize: 16, fontWeight: FontWeight.w500),
    ),
    backgroundColor: Colors.transparent,
    backColor: Colors.white,
    actions: actions,
    showBack: showBack,
  );
}
