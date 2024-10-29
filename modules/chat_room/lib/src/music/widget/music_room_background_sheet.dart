import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/music/model/music_room_info.dart';
import 'package:chat_room/src/music/repo/music_room_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// 主题样式-背景设置列表
///
class MusicRoomBackgroundSheet extends StatefulWidget {
  final int rid;

  const MusicRoomBackgroundSheet({super.key, required this.rid});

  @override
  State<MusicRoomBackgroundSheet> createState() =>
      _MusicRoomBackgroundSheetState();
}

class _MusicRoomBackgroundSheetState extends State<MusicRoomBackgroundSheet> {
  MusicRoomThemeDataRepo? _musicThemes;

  @override
  void initState() {
    super.initState();
    _loadBackGroundList();
  }

  _loadBackGroundList() async {
    _musicThemes = await MusicRoomRepo.getRoomThemeList(widget.rid);
    _sortBg();
    refresh();
  }

  /// 排序 把当前使用的放在第0个位置
  _sortBg() {
    if (_musicThemes == null) return;
    for (int i = 0; i < (_musicThemes!.themes.length); i++) {
      Themes background = _musicThemes!.themes[i];
      if (_musicThemes!.current == background.type) {
        _musicThemes!.themes.removeAt(i);
        _musicThemes!.themes.insert(0, background);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double titleHeight = 57; //标题高度
    double itemWidth =
        MediaQuery.of(context).size.width * (108.0 / 375.0); //图片宽度
    double itemHeight = 4.0 / 3.0 * itemWidth; //图片高度
    double maxHeight =
        MediaQuery.of(context).size.width * 4.0 / 3.0; //包含标题的最大高度

    TextStyle currentUseStyle =
        const TextStyle(color: Colors.white, fontSize: 11); //当前使用 style
    return Container(
      height: maxHeight + Util.iphoneXBottom,
      margin: const EdgeInsets.only(bottom: 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(18.0), topEnd: Radius.circular(18.0)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: titleHeight,
            alignment: AlignmentDirectional.center,
            child: Text(
              K.music_room_theme,
              style: const TextStyle(
                color: Color(0xFF313131),
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (_musicThemes != null && _musicThemes!.themes.isNotEmpty)
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
                //EdgeInsets.only(left: 15,right: 15),
                scrollDirection: Axis.vertical,
                itemCount: _musicThemes!.themes.length,
                itemBuilder: (context, index) {
                  Themes background = _musicThemes!.themes[index];
                  bool isCurrentUse =
                      (_musicThemes!.current == background.type);
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          MusicRoomRepo.roomMusicSelectTheme(
                              widget.rid, background.type);
                          Navigator.of(context).pop();
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                        child: SizedBox(
                          width: itemWidth,
                          height: itemHeight,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            child: CachedNetworkImage(
                              imageUrl: System.imageDomain + background.url,
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
                      if (isCurrentUse)
                        PositionedDirectional(
                          start: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsetsDirectional.only(
                                start: 6, end: 6),
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadiusDirectional.only(
                                topStart: Radius.circular(10.0),
                                bottomEnd: Radius.circular(10.0),
                              ),
                              color: R.color.mainBrandColor,
                            ),
                            child: Container(
                              height: 20,
                              alignment: Alignment.center,
                              child:
                                  Text(K.current_use, style: currentUseStyle),
                            ),
                          ),
                        ),
                      if (!background.enable) //!
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
                                    package:
                                        ComponentManager.MANAGER_BASE_ROOM),
                                width: 16.0,
                                height: 16.0,
                              ),
                            ),
                          ),
                        ),
                      if (!background.enable) //!background.enable
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
                              child: Text(
                                background.message,
                                style: currentUseStyle,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
