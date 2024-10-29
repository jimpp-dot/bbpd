import 'package:chat_room/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/background_list.pb.dart';

///
/// 主题样式-背景设置列表
///
class BackgroundSheet extends StatefulWidget {
  final int rid;
  final String? title;

  const BackgroundSheet({Key? key, required this.rid, this.title})
      : super(key: key);

  @override
  _BackgroundSheetState createState() => _BackgroundSheetState();
}

class _BackgroundSheetState extends State<BackgroundSheet> {
  ResBackgroundList? _roomBg;

  @override
  void initState() {
    super.initState();
    _loadBackGroundList();
  }

  _loadBackGroundList() async {
    _roomBg = await RoomRepository.getRoomBgList(widget.rid);
    // Log.d('_loadBackGroundList:$_roomBg');
    _sortBg();
    if (mounted) setState(() {});
  }

  /// 排序 把当前使用的放在第0个位置
  _sortBg() {
    if (_roomBg == null) return;
    for (int i = 0; i < _roomBg!.bglist.list.length; i++) {
      Bglist background = _roomBg!.bglist.list[i];
      if (_roomBg!.bglist.current == background.url) {
        if (_roomBg!.bglist.current != _roomBg!.bglist.list[0].url) {
          _roomBg!.bglist.list.removeAt(i);
          _roomBg!.bglist.list.insert(1, background);
        }
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight =
        MediaQuery.of(context).size.width * 4.0 / 3.0; //包含标题的最大高度

    return Container(
      height: maxHeight + Util.iphoneXBottom,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(18.0), topEnd: Radius.circular(18.0)),
      ),
      child: Column(
        children: [
          Container(
            height: 57,
            alignment: AlignmentDirectional.center,
            child: Text(
              widget.title ?? K.room_background,
              style: const TextStyle(
                  color: Color(0xFF313131),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          if (_roomBg != null)
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: EdgeInsetsDirectional.only(
                    start: 15, end: 15, bottom: 10 + Util.iphoneXBottom),
                scrollDirection: Axis.vertical,
                itemCount: _roomBg!.bglist.list.length,
                itemBuilder: (context, index) {
                  Bglist background = _roomBg!.bglist.list[index];
                  bool isCurrentUse =
                      (_roomBg!.bglist.current == background.url);
                  bool isDefault = index == 0;
                  return _BgItem(background,
                      isCurrentUse: isCurrentUse, isDefault: isDefault);
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _BgItem extends StatelessWidget {
  final Bglist background;
  final bool isCurrentUse;
  final bool isDefault;

  const _BgItem(this.background,
      {this.isCurrentUse = false, this.isDefault = false});

  @override
  Widget build(BuildContext context) {
    TextStyle currentUseStyle =
        const TextStyle(color: Colors.black, fontSize: 10); //当前使用 style
    TextStyle defaultStyle =
        const TextStyle(color: Colors.black, fontSize: 10); //当前使用 style
    double itemWidth =
        MediaQuery.of(context).size.width * (108.0 / 375.0); //图片宽度
    double itemHeight = 4.0 / 3.0 * itemWidth; //图片高度
    bool showUse = isCurrentUse && !isDefault;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            if (background.enable) {
              Navigator.of(context).pop(background.type);
            }
          },
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          child: SizedBox(
            width: itemWidth,
            height: itemHeight,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: CachedNetworkImage(
                imageUrl: background.url,
                width: itemWidth,
                height: itemHeight,
                fit: BoxFit.cover,
                placeholder: const CupertinoActivityIndicator(),
                fadeInDuration: const Duration(microseconds: 0),
                fadeOutDuration: const Duration(microseconds: 0),
              ),
            ),
          ),
        ),
        if (isDefault || showUse)
          PositionedDirectional(
            start: 3,
            top: 3,
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
              height: 16,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: isDefault ? Colors.white : R.color.mainBrandColor,
              ),
              child: Container(
                height: 16,
                alignment: Alignment.center,
                child: Text(
                  isDefault ? K.room_default : K.current_use,
                  style: isDefault ? defaultStyle : currentUseStyle,
                ),
              ),
            ),
          ),
        if (!background.enable)
          PositionedDirectional(
            start: 0,
            top: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(10.0),
                  bottomEnd: Radius.circular(10.0),
                ),
                color: const Color(0xFF000000).withOpacity(0.3),
              ),
              child: Center(
                child: Image.asset(
                  R.imagePath("ic_background_lock.png",
                      package: ComponentManager.MANAGER_BASE_ROOM),
                  width: 16.0,
                  height: 16.0,
                ),
              ),
            ),
          ),
        if (!background.enable)
          PositionedDirectional(
            bottom: 0,
            start: 0,
            child: Container(
              width: itemWidth,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(10.0),
                  bottomEnd: Radius.circular(10.0),
                ),
                color: const Color(0xFF000000).withOpacity(0.3),
              ),
              child: Container(
                alignment: Alignment.center,
                width: itemWidth,
                child: Text(background.message, style: currentUseStyle),
              ),
            ),
          ),
      ],
    );
  }
}
