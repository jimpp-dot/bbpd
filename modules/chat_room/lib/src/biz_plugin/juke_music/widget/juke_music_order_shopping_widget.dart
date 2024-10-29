import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/juke_music/page/juke_music_list_page.dart';
import 'package:chat_room/src/protobuf/generated/juke_music.pb.dart';
import 'package:flutter/material.dart';

class JukeMusicOrderShoppingWidget extends StatefulWidget {
  final JukeMusicOrderPageState? parentState;

  const JukeMusicOrderShoppingWidget({super.key, required this.parentState});

  @override
  State<StatefulWidget> createState() => JukeMusicOrderShoppingState();

  static Future<bool?> show(
      BuildContext context, JukeMusicOrderPageState parentState) async {
    return await displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1,
        builder: (context) {
          return JukeMusicOrderShoppingWidget(parentState: parentState);
        });
  }
}

class JukeMusicOrderShoppingState extends State<JukeMusicOrderShoppingWidget> {
  List<Song> get datas => widget.parentState?.selectedList ?? [];

  int get totalPrice => widget.parentState?.totalPrice ?? 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 400 + Util.iphoneXBottom,
        decoration: const BoxDecoration(
          color: Color(0xFF2C103F),
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        const SizedBox(height: 5),
        Expanded(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: datas.mapIndexed((i, e) => _buildSongItem(i, e)).toList(),
          ),
        ),
        const SizedBox(height: 5),
        _buildBottomShopping(),
      ],
    );
  }

  Widget _buildSongItem(int index, Song item) {
    return Slidable(
      direction: Axis.horizontal,
      closeOnScroll: true,
      endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.16,
          children: [
            CustomSlidableAction(
              backgroundColor: const Color(0xFFFF4267),
              autoClose: false,
              onPressed: (context) async {
                widget.parentState?.addSongToShopping(item);
                Slidable.of(context)?.close();
                refresh();
              },
              child: Container(
                child: R.img(
                  'ic_slide_delete.webp',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                  package: ComponentManager.MANAGER_MESSAGE,
                ),
              ),
            ),
          ]),
      child: Container(
        width: double.infinity,
        height: 52,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 52,
              alignment: AlignmentDirectional.center,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  R.img(RoomAssets.chat_room$jukemusic_bg_num_png,
                      width: 15, height: 24),
                  Text(
                    '${index + 1}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.songName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        K.room_juke_singer,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.4), fontSize: 12),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.singerName,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            _buildSongPrice(item),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildSongPrice(Song item) {
    int price = widget.parentState?.getSingerPrice(item.singerUid) ?? 0;
    if (price == 0) {
      return GradientBorder(
        borderGradient: const LinearGradient(
          colors: [Color(0xFFFF6EC3), Color(0xFFFFC3EC)],
        ),
        borderRadius: 9,
        borderWidth: 1,
        child: Container(
          width: 36,
          height: 16,
          margin: const EdgeInsets.all(1),
          alignment: AlignmentDirectional.center,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            gradient: LinearGradient(
              colors: [Color(0xFFFD3795), Color(0xFFFF95D9)],
            ),
          ),
          child: Text(
            K.free,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$price',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(width: 4),
        R.img(MoneyConfig.moneyIcon, width: 16, height: 16),
      ],
    );
  }

  Widget _buildBottomShopping() {
    return InkWell(
      onTap: () {
        Navigator.of(context).maybePop();
      },
      child: Container(
        width: double.infinity,
        height: 56 + Util.iphoneXBottom,
        color: const Color(0xFF2C103F),
        padding: EdgeInsetsDirectional.only(
            start: 16, end: 16, bottom: Util.iphoneXBottom),
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img('ic_room_juke_order_shopping.webp',
                width: 36,
                height: 36,
                package: ComponentManager.MANAGER_BASE_ROOM),
            const SizedBox(width: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$totalPrice',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(width: 4),
                    R.img(MoneyConfig.moneyIcon, width: 16, height: 16),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      K.room_juke_song_shoping_count(['${datas.length}']),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    R.img('ic_juke_arrow_up.webp',
                        width: 16,
                        height: 16,
                        package: ComponentManager.MANAGER_BASE_ROOM),
                  ],
                ),
              ],
            ),
            const Spacer(),
            _buildGoPay(),
          ],
        ),
      ),
    );
  }

  Widget _buildGoPay() {
    return InkWell(
      onTap: () {
        Navigator.of(context).maybePop(true);
      },
      child: Container(
        width: 68,
        height: 30,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.room_confirm,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
