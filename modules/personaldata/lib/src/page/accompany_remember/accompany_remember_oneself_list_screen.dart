import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';

import 'accompany_remember_multiple_medal_light_dialog.dart';
import 'model/pb/accompany_remember_api.dart';
import 'model/pb/generated/slp_imprint.pb.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// 陪伴记自己列表页面
typedef clickItemFun = void Function(UserImprintLight item);

class AccompanyRememberOneselfListScreen extends StatefulWidget {
  final int uid;

  const AccompanyRememberOneselfListScreen(this.uid, {Key? key})
      : super(key: key);

  static Future show(BuildContext context, int uid) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AccompanyRememberOneselfListScreen(uid),
        settings:
            const RouteSettings(name: '/AccompanyRememberOneselfListScreen'),
      ),
    );
  }

  @override
  State<AccompanyRememberOneselfListScreen> createState() =>
      _AccompanyRememberOneselfListScreenState();
}

class _AccompanyRememberOneselfListScreenState
    extends State<AccompanyRememberOneselfListScreen> {
  int segmentSelectedIndex = 0;

  final List<Widget> _pages = [];
  final GlobalKey<_AccompanyRememberPageViewState> _weeklyKey = GlobalKey();
  final GlobalKey<_AccompanyRememberPageViewState> _totalKey = GlobalKey();
  late PageController pageController;

  ImprintLightData? _data;
  List<UserImprintLight> sumList = [];

  bool _loading = true;
  String _err = '';

  @override
  void initState() {
    super.initState();

    void onClick(UserImprintLight item) {
      if (_data != null) {
        Tracker.instance.track(TrackEvent.accompany_click_item, properties: {
          'uid': widget.uid,
          'to_uid': Session.uid,
          'name_of_chapter': item.name,
          'unlock_the_level': item.level,
          'unlock_the_number': _data!.lightenNum,
          'speed_progress': item.score / item.levelScores.last
        });
      }
    }

    _pages.add(KeepAliveWrapper(
        child: AccompanyRememberPageView(
      key: _weeklyKey,
      isNeedLoadData: false,
      uid: widget.uid,
      weekOrSum: true,
      clickItem: onClick,
    )));
    _pages.add(KeepAliveWrapper(
        child: AccompanyRememberPageView(
      key: _totalKey,
      isNeedLoadData: true,
      uid: widget.uid,
      weekOrSum: false,
      clickItem: onClick,
    )));
    pageController = PageController(initialPage: 0, keepPage: true);

    _loadData();
  }

  void _loadData() async {
    _loading = true;
    _err = '';
    ResImprintLight resImprintLight =
        await AccompanyRememberApi.getAccompanyRememberRes(
            widget.uid, segmentSelectedIndex == 0);
    _loading = false;
    if (resImprintLight.success == true) {
      refresh(() {
        _data = resImprintLight.data;
      });
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (!mounted) return;
        _weeklyKey.currentState?.updateData(resImprintLight.data.list);
      });
    } else {
      _err = resImprintLight.msg;
      refresh();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        PositionedDirectional(
          top: 0,
          start: 0,
          end: 0,
          child: R.img(
            Assets.personaldata$accompany_remember_bg_header_webp,
            width: Util.width,
            height: 540.dp,
          ),
        ),
        PositionedDirectional(
            top: 0,
            bottom: 0,
            start: 0,
            end: 0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 282.dp + Util.statusHeight),
                R.img(
                  Assets.personaldata$accompany_remember_bg_middle_webp,
                  width: Util.width,
                  height: 72.dp,
                  fit: BoxFit.fill,
                ),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.white,
                      ),
                      PositionedDirectional(
                        top: -1.dp,
                        child: Container(
                          width: Util.width,
                          height: 2.dp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: BaseAppBar.custom(
            backColor: Colors.white,
            backgroundColor: Colors.transparent,
            statusBrightness: Brightness.dark,
            toolbarHeight: 44.dp,
            title: Text(
              K.personaldata_accompany_remember,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              UnconstrainedBox(
                child: GestureDetector(
                  onTap: () {
                    Tracker.instance.track(TrackEvent.accompany_click_help,
                        properties: {'uid': widget.uid, 'to_uid': Session.uid});

                    BaseWebviewScreen.show(context,
                        url: Util.getHelpUrlWithQStr('k110'),
                        extra: {'uid': widget.uid});
                  },
                  child: R.img(
                    Assets.personaldata$accompany_remember_ic_rule_webp,
                    package: ComponentManager.MANAGER_MESSAGE,
                    width: 32,
                    height: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          body: _renderBody(),
        ),
        if (_data != null) ...[
          PositionedDirectional(
            top: Util.statusHeight + 48.dp,
            end: 0,
            child: _renderLevel(_data!.level),
          ),
          if (_data!.level.level >= 1)
            PositionedDirectional(
              top: Util.statusHeight + 208.dp,
              end: 0,
              child: _renderSweetPhotoEntrance(_data!),
            ),
        ],
      ],
    );
  }

  Widget _renderBody() {
    if (_loading) {
      return const Loading();
    } else if (_err.isNotEmpty) {
      return ErrorData(error: _err, onTap: _loadData);
    } else if (_data == null) {
      return const EmptyWidget();
    } else {
      return _renderContent(_data!);
    }
  }

  Widget _renderContent(ImprintLightData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 56.dp),
        _renderUserRelation(data.user),
        SizedBox(height: 16.dp),
        Container(
          width: 180.dp,
          height: 26.dp,
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0x00FF227A),
            Color(0xB3FF227A),
            Color(0x00FF227A)
          ])),
          child: Text(
            K.personaldata_current_light_company(
                [(data.lightenNum).toString(), (data.totalNum).toString()]),
            style: TextStyle(
                color: Colors.white,
                fontSize: 12.dp,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 40.dp),
        _renderTab(),
        SizedBox(height: 20.dp),
        Expanded(
          child: PageView.builder(
            onPageChanged: _switchPage,
            controller: pageController,
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index];
            },
          ),
        ),
      ],
    );
  }

  Widget _renderTab() {
    Widget renderItem(bool selected, String textPath) {
      return Container(
        width: 94.dp,
        height: 32.dp,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          image: selected
              ? const DecorationImage(
                  image: AssetImage(
                      Assets.personaldata$accompany_remember_bg_tab_webp),
                  fit: BoxFit.fill)
              : null,
          borderRadius: BorderRadius.all(Radius.circular(16.dp)),
        ),
        child: R.img(textPath,
            width: 38.dp,
            height: 22.dp,
            color: selected ? null : Colors.black.withOpacity(0.32)),
      );
    }

    return Container(
      width: 94.dp * _pages.length,
      height: 32.dp,
      decoration: BoxDecoration(
        color: const Color(0x14000000),
        borderRadius: BorderRadius.all(Radius.circular(16.dp)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Tracker.instance.track(TrackEvent.accompany_click_list_tab,
                  properties: {'uid': widget.uid, 'to_uid': Session.uid});
              _switchPage(0);
            },
            child: renderItem(segmentSelectedIndex == 0,
                Assets.personaldata$accompany_remember_ic_text_week_webp),
          ),
          GestureDetector(
            onTap: () {
              Tracker.instance.track(TrackEvent.accompany_click_list_tab,
                  properties: {'uid': widget.uid, 'to_uid': Session.uid});

              _switchPage(1);
            },
            child: renderItem(segmentSelectedIndex == 1,
                Assets.personaldata$accompany_remember_ic_txt_total_webp),
          ),
        ],
      ),
    );
  }

  Widget _renderUserRelation(ImprintUserData user) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _renderUser(
                user.toIcon, user.toName, user.toUid, const Color(0xFF670E3C)),
            SizedBox(width: 8.dp),
            _renderUser(user.fromIcon, user.fromName, user.fromUid,
                const Color(0xFF391156)),
          ],
        ),
        PositionedDirectional(
            top: 31.dp,
            child: R.img(Assets.personaldata$accompany_remember_ic_heart_webp,
                width: 29.dp, height: 22.dp)),
      ],
    );
  }

  Widget _renderUser(String avatar, String name, int uid, Color textColor) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CommonAvatar(
              path: avatar,
              size: 72.dp,
              shape: BoxShape.circle,
              onTap: () {
                if (uid > 0) {
                  IPersonalDataManager personalDataManager = ComponentManager
                      .instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  personalDataManager.openImageScreen(context, uid);
                }
              },
            ),
            R.img(Assets.personaldata$accompany_remember_bg_avatar_webp,
                width: 84.dp, height: 84.dp),
          ],
        ),
        SizedBox(height: 2.dp),
        Container(
          width: 100.dp,
          height: 24.dp,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      Assets.personaldata$accompany_remember_bg_text_png),
                  fit: BoxFit.fill)),
          alignment: AlignmentDirectional.center,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              height: 1,
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.dp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderLevel(ImprintLevel level) {
    return Container(
      width: 152.dp,
      height: 54.dp,
      padding: EdgeInsetsDirectional.only(end: 12.dp, start: 12.dp),
      alignment: AlignmentDirectional.centerEnd,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                Assets.personaldata$accompany_remember_bg_level_webp),
            fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(Assets.personaldata$accompany_remember_ic_text_level_webp,
                  width: 60.dp, height: 20.dp),
              Text(
                'Lv.${level.level}',
                style: const TextStyle(
                    color: Color(0xFFFFFFAD),
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 4.dp, bottom: 4.dp),
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Container(
                  width: 124.dp,
                  height: 4.dp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.dp),
                    color: const Color(0xA3FFFFFF),
                  ),
                ),
                Container(
                  width: 124.dp * level.score / level.nextLevelScore,
                  height: 4.dp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.dp),
                    color: const Color(0xFFFFFFAD),
                  ),
                ),
              ],
            ),
          ),
          AutoSizeText(
            '${level.score}/${level.nextLevelScore} ${K.personaldata_next_score_difference_value}${level.nextLevelScore - level.score}',
            maxFontSize: 10,
            minFontSize: 6,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _renderSweetPhotoEntrance(ImprintLightData data) {
    return GestureDetector(
      onTap: () {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openSweetAlbum(context, data.user.fromUid,
            refer: 'companion_in');
      },
      child: Container(
        width: 76.dp,
        height: 28.dp,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  Assets.personaldata$accompany_remember_bg_sweet_photo_webp),
              fit: BoxFit.fill),
        ),
        child: R.img(
            Assets.personaldata$accompany_remember_ic_text_sweet_photo_png,
            width: 56.dp,
            height: 20.dp),
      ),
    );
  }

  void _switchPage(int index) {
    if (index == 0) {
      if (segmentSelectedIndex == 0) return;
      segmentSelectedIndex = 0;
      setState(() {});
      pageController.animateToPage(
        segmentSelectedIndex,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 200),
      );
    }
    if (index == 1) {
      if (segmentSelectedIndex == 1) return;
      segmentSelectedIndex = 1;
      setState(() {});
      pageController.animateToPage(
        segmentSelectedIndex,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 200),
      );
    }
  }
}

///---------------------------------------------///
class AccompanyRememberPageView extends StatefulWidget {
  final bool isNeedLoadData;
  final int uid;
  final bool weekOrSum;
  final clickItemFun clickItem;

  const AccompanyRememberPageView(
      {Key? key,
      this.isNeedLoadData = true,
      required this.uid,
      required this.weekOrSum,
      required this.clickItem})
      : super(key: key);

  @override
  State<AccompanyRememberPageView> createState() =>
      _AccompanyRememberPageViewState();
}

class _AccompanyRememberPageViewState extends State<AccompanyRememberPageView> {
  List<UserImprintLight> list = [];

  void updateData(List<UserImprintLight> data) {
    if (data.isNotEmpty) {
      setState(() {
        list = data;
      });
    }
  }

  void _loadData() async {
    ResImprintLight resImprintLight =
        await AccompanyRememberApi.getAccompanyRememberRes(
            widget.uid, widget.weekOrSum);
    if (resImprintLight.success == true) {
      refresh(() {
        list = resImprintLight.data.list;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.isNeedLoadData) {
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 11.dp,
        crossAxisSpacing: 11.dp,
        childAspectRatio: 107 / 131,
        crossAxisCount: 3,
      ),
      itemBuilder: _buildItemWidget,
    );
  }

  Widget _buildItemWidget(BuildContext context, int index) {
    UserImprintLight item = list[index];
    return InkWell(
      onTap: () {
        widget.clickItem(item);

        if (item.images.isNotEmpty == true) {
          AccompanyRememberMultipleMedalLightDialog.show(context, item);
        }
      },
      child: GradientBorder(
        borderGradient: const LinearGradient(
            colors: [Color(0xFFFFFFED), Color(0xFFFFF1D6)],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd),
        borderWidth: 1.dp,
        borderRadius: 16.dp,
        child: Padding(
          padding: EdgeInsets.all(1.dp),
          child: Container(
            width: 105.dp,
            height: 129.dp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.dp),
              gradient: const LinearGradient(
                  colors: [
                    Color(0xFFEAEAFF),
                    Color(0xFFFFF1F4),
                    Color(0xFFFFFFE9)
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8.dp),
                item.lighten == 1 &&
                        item.hasLevel() &&
                        item.level != 0 &&
                        item.images.isNotEmpty == true &&
                        item.level <= item.images.length
                    ? CachedNetworkImage(
                        imageUrl: Util.getRemoteImgUrl(
                          item.images[item.level - 1],
                        ),
                        width: 90.dp,
                        height: 90.dp,
                        fit: BoxFit.contain,
                      )
                    : SizedBox(
                        width: 90.dp,
                        height: 90.dp,
                        child: R.img(
                          Assets.personaldata$accompany_remember_ic_lock_webp,
                          package: ComponentManager.MANAGER_PERSONALDATA,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                Text(
                  item.name,
                  style:
                      const TextStyle(color: Color(0xE6000000), fontSize: 12),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
