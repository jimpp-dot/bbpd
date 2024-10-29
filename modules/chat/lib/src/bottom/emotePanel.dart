import 'package:chat/k.dart';
import 'package:chat/src/bottom/emote.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared/shared.dart';

import 'customImage.dart';
import 'emote/emote_repo.dart';
import 'emote/pb/generated/emotion.pb.dart';

typedef OnEmoteClick = Function(EmoteItem config);

/// emote 表情面板
///
class EmotePanel extends StatefulWidget {
  final OnEmoteClick onEmoteClick;

  const EmotePanel({super.key, required this.onEmoteClick});

  @override
  State<EmotePanel> createState() => _State();
}

class _EmoteTab {
  final String key;
  final double maxWidth;
  final int index;
  List<EmoteItem> data;

  _EmoteTab({required this.key, required this.maxWidth, required this.data, required this.index});

  setData(List<EmoteItem> value) {
    data = value;
  }
}

class _State extends State<EmotePanel> {
  late PageController _pageController;
  late List<_EmoteTab> _tabs;
  final List<EmoteItem> _res = customEmotes.sublist(0, customEmotes.length);
  int _page = 0;

  static const double panelPaddingHorizontal = 10.0;
  double panelCrossAxisSpacing = 8.0;
  double tabSpace = 0;

  TabController? _tabController;

  ResEmojiConfig? _config;

  int leftSeconds = 0;

  @override
  initState() {
    super.initState();
    _tabs = [
      _EmoteTab(key: 'kb_emoji', maxWidth: 44.0, index: 0, data: emotes),
      // _EmoteTab(key: 'kb_emoji_favorite', maxWidth: (Util.width) / 5, index: 1, data: []),
      // _EmoteTab(key: 'kb_magic', maxWidth: 64.0, index: 2, data: magicEmotes),
    ];

    // if (!Util.isLocale) {
    //   ///海外版不需要 yellow 和 gift 表情包
    //   _tabs.add(_EmoteTab(key: 'kb_emoji_yellow', maxWidth: 64.0, index: 3, data: yellowEmotes));
    //   _tabs.add(_EmoteTab(key: 'kb_emote_gif', maxWidth: 64.0, index: 4, data: gifEmotes));
    // }

    _pageController = PageController();
    // _addAction();

    int crossAxisCount = ((Util.width - 2 * panelPaddingHorizontal) / (44 + panelCrossAxisSpacing)).ceil();
    double usableCrossAxisExtent = (Util.width - 2 * panelPaddingHorizontal) - panelCrossAxisSpacing * (crossAxisCount - 1);
    double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    if (childCrossAxisExtent + panelCrossAxisSpacing > 44) {
      tabSpace = childCrossAxisExtent + panelCrossAxisSpacing - 44;
    }

    _load();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _load() async {
    _config = await EmoteRepo.getEmotionConfig();

    refresh();
  }

  _addAction() {
    _res.add(
      EmoteItem(
        key: 'add',
        name: K.add,
        width: 100,
        height: 100,
        source: 'assets/images/emote/add.png',
      ),
    );
    _res.add(
      EmoteItem(
        key: 'edit',
        name: K.modify,
        width: 100,
        height: 100,
        source: 'assets/images/emote/edit.png',
      ),
    );
  }

  Widget _renderEmoteItem(EmoteItem item) {
    if (item.key == 'add') {
      return Padding(
        padding: const EdgeInsets.all(6.0),
        child: ImageUpload(
          uploadUrl: '${System.domain}upload/image',
          postFields: const {'hook': 'editEmote'},
          source: ImageSource.gallery,
          onComplete: (String name, int width, int height, Map origin) {
            if (mounted) {
              _exits = false;
              _loadCustomEmote();
              return true;
            }
            return false;
          },
          child: Image.asset(
            item.source,
            package: 'chat',
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () async {
          if (item.key == 'edit') {
            bool? r = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const CustomImageScreen();
                },
                settings: const RouteSettings(name: '/customImageScreen'),
              ),
            );
            if (r != null && r == true && mounted) {
              _exits = false;
              _loadCustomEmote();
            }
          } else {
            widget.onEmoteClick(item);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Center(
            child: item.key == 'custom'
                ? CachedNetworkImage(
                    imageUrl: '${System.imageDomain}${item.source}?x-oss-process=image/resize,h_200',
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 100.0,
                  )
                : R.img(
                    item.source,
                    package: ComponentManager.MANAGER_CHAT,
                  ),
          ),
        ),
      );
    }
  }

  static String emoteImgUrl(String key) {
    return '${System.imageDomain}static/emote_mid/static/$key.webp';
  }

  Widget _renderEmote(_EmoteTab config) {
    List<EmoteItem> data = [];

    if (_config?.data.emojiTabList != null && _config!.data.emojiTabList.isNotEmpty) {
      EmojiTab tab = _config!.data.emojiTabList.first;
      data = tab.list
          .map((e) => EmoteItem(
                key: e.key,
                source: emoteImgUrl(e.key),
                width: 36,
                height: 36,
                remote: emoteImgUrl(e.key),
                emoteType: 'remote',
              ))
          .toList();
    }

    // List<EmoteItem> data = config.key == 'kb_emoji_favorite' ? _res : config.data;

    return SizedBox(
      height: 220.0,
      child: GridView.extent(
          primary: false,
          shrinkWrap: true,
          maxCrossAxisExtent: config.maxWidth,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.symmetric(horizontal: panelPaddingHorizontal, vertical: 7.0),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: panelCrossAxisSpacing,
          children: data.map((EmoteItem item) {
            return _renderEmoteItem(item);
          }).toList()),
    );
  }

  Widget _renderBody() {
    return PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _page = page;
          });
          if (_page == 1) {
            _loadCustomEmote();
          }
        },
        children: _tabs.map((_EmoteTab config) {
          return _renderEmote(config);
        }).toList());
  }

  set page(int value) {
    _pageController.animateTo(MediaQuery.of(context).size.width * value, duration: const Duration(milliseconds: 250), curve: Curves.linear);
    setState(() {
      _page = value;
    });
    if (_page == 1) {
      _loadCustomEmote();
    }
  }

  bool _exits = false;

  _loadCustomEmote() async {
    if (_exits == true) return;
    _exits = true;
    try {
      XhrResponse response = await Xhr.getJson('${System.domain}account/getusercustomemote', throwOnError: true);
      Map res = response.value();
      List data = res['data'];
      if (mounted == false) return;
      setState(() {
        if (_res.length > 3) _res.removeRange(3, _res.length);
        for (var value in data) {
          Map config = value;
          _res.add(
            EmoteItem(
              key: 'custom',
              name: K.chat_custom_photo,
              width: 100,
              height: 100,
              source: config['icon'],
            ),
          );
        }
        _addAction();
      });
    } catch (e) {
      _exits = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: _renderBody(),
          ),
          Ink(
            height: 56,
            padding: const EdgeInsetsDirectional.only(start: 10, top: 6, bottom: 6),
            decoration: BoxDecoration(
              color: darkMode ? const Color(0xFF060721) : const Color(0xFFF0F0FF),
              border: Border(
                top: BorderSide(width: 0.5, color: R.colors.dividerColor),
              ),
            ),
            child: Row(
              children: _tabs.map((_EmoteTab config) {
                return GestureDetector(
                  onTap: () {
                    // page = config.index;
                  },
                  child: Container(
                    width: 44,
                    height: 44,
                    margin: EdgeInsetsDirectional.only(end: tabSpace),
                    decoration: BoxDecoration(
                      color: _page == config.index ? R.colors.secondBgColor : R.colors.mainBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: R.img(
                      'emote/${config.key}.png',
                      width: 44.0,
                      height: 44.0,
                      package: ComponentManager.MANAGER_CHAT,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
