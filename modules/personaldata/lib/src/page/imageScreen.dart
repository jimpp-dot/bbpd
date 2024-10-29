import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:moment/moment.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/api/api.dart' as PersonApk;
import 'package:personaldata/src/glory_center/widget/appreciator_tag_widget.dart';
import 'package:personaldata/src/match/model/match_bean.dart';
import 'package:personaldata/src/model/my_mate_bean.dart';
import 'package:personaldata/src/model/my_personal_data.dart';
import 'package:personaldata/src/model/title_role_bean.dart';
import 'package:personaldata/src/module/job.dart';
import 'package:personaldata/src/page/creditTip.dart';
import 'package:personaldata/src/widget/BottomBasicButton.dart';
import 'package:personaldata/src/widget/bottomTipsWidget.dart';
import 'package:personaldata/src/widget/info_page_widget.dart';
import 'package:personaldata/src/widget/love_cat_decorate_widget.dart';
import 'package:personaldata/src/widget/moment_list_widget.dart';
import 'package:personaldata/src/widget/title_role_widget.dart';
import 'package:provider/provider.dart' hide Selector;
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/assets.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/model/models.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/tag/image_room_tag.dart';

import '../glory_center/page/glory_center_screen.dart';
import '../images.dart';
import '../theme/personaldata_themes.dart';
import '../widget/zone_widget.dart';
import 'imageModify.dart';

/// 个人资料页
// ignore: must_be_immutable
class ImageScreen extends StatefulWidget {
  static bool showSkill = true; // 是否展示技能
  static bool showLiteGame = true; // 是否展示小游戏
  static bool showInterest = true; // 是否展示兴趣标签
  static bool showMoment = false; // 是否展示动态
  static bool showRoleTitle = false; //是否显示角色称号

  final int uid;
  final int rid; // 从房间进入个人页，可以传rid，用来显示游戏战绩等
  final bool fromMatch;
  final bool fromSayHiMatch; //打招呼匹配
  final bool fromNearby; //附近的人进入
  final String? initialTab; // 初始化tab位置
  PageRefer? refer;
  String? searchContent; // 搜索页进来的，关注需要上报搜索字符串

  ImageScreen({
    Key? key,
    required this.uid,
    this.rid = 0,
    this.fromMatch = false,
    this.fromSayHiMatch = false,
    this.refer,
    this.searchContent,
    this.fromNearby = false,
    this.initialTab,
  }) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();

  static Future show(BuildContext context, int uid,
      {int rid = 0,
      bool fromMatch = false,
      bool fromSayHiMatch = false,
      PageRefer? refer,
      String searchContent = '',
      bool fromNearby = false,
      String initialTab = ''}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ImageScreen(
        uid: uid,
        rid: rid,
        fromMatch: fromMatch,
        fromSayHiMatch: fromSayHiMatch,
        refer: PageRefer('UserPage', refer),
        searchContent: searchContent,
        fromNearby: fromNearby,
        initialTab: initialTab,
      ),
      settings: RouteSettings(name: '/image', arguments: {'uid': uid, 'rid': rid}),
    ));
  }
}

class _ImageScreenState extends State<ImageScreen> with TickerProviderStateMixin {
  Object? _error;
  bool _loading = true;
  bool _loadingDelaying = true; //视觉优化，启动loading后短时间内不显示转菊花
  Timer? _loadingDelayTimer;
  bool _loadingPhotos = true;
  int _sliderIndex = 0;
  bool _follow = false;
  bool _me = false;
  bool _isInTop = true;
  bool _isAlwaysTop = false;
  bool _showTips = false;

  // Map<String, dynamic> _marry;

  int _completenessValue = 0;

  final ScrollController _customScrollViewController = ScrollController();
  ExtendedTabController? _tabController;

  // ProfileBean _profileBean;
  HomeProfileData? _profileData;
  HomeProfileSyncData? _profileSyncData;
  MomentModel? _momentModel;

  late AnimationController _aniController;
  late Animation _ringSlideInHeightAni;
  late Animation _ringSlideOutHeightAni;
  double _ringWidth = 0;
  bool _scale = false;
  bool _hadSendMatch = false;
  List<CommonTagData> commonTags = [];

  /// 通用标签

  final String _businessCardUrl = '';

  bool _showDecorate = true;

  ImageStream? _imageStream;
  ImageStreamListener? _imageStreamListener;

  final IRoomManager _roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);

  @override
  void initState() {
    super.initState();
    _me = Session.uid == widget.uid;

    Map<String, dynamic> properties = {
      'target_uid': widget.uid,
      'myself': _me,
    };

    if (widget.searchContent != null && widget.searchContent!.isNotEmpty) {
      properties['search_content'] = widget.searchContent;
    }
    Tracker.instance.track(TrackEvent.view_user_homepage, properties: properties);

    _momentModel = context.read<MomentModel>();
    _customScrollViewController.addListener(_onScroll);
    eventCenter.addListener(EventConstant.EventPageChanged, _onPageChanged);

    _load();

    if (_me) {
      _loadInfo();
    }

    _reportVisit();

    _initAnimation();

    eventCenter.addListener(EventConstant.EventMarryDataChanged, refreshByEvent);
    eventCenter.addListener(EventConstant.EventAchieveWallDataChanged, refreshByEvent);
    eventCenter.addListener(EventConstant.EventCpHouseDataChanged, refreshByEvent);
    eventCenter.addListener(EventConstant.EventProfileBadgeDataChanged, refreshByEvent);
  }

  void _onPageChanged(String type, dynamic data) {
    String curName = appNavigatorObserver.getLast();
    if (curName == '/image') {
      if (mounted && !_showDecorate) {
        _showDecorate = true;
        setState(() {});
      }
    } else {
      if (mounted && _showDecorate) {
        _showDecorate = false;
        setState(() {});
      }
    }
  }

  //用于计算资料完整度
  _loadInfo() async {
    try {
      if (Job.needInit()) {
        await Job.init();
      }

      DataRsp<MyPersonalData> rsp = await PersonApk.Api.getMyPersonalData();
      if (rsp.success == true) {
        _completenessValue = rsp.data?.calculateCompleteness() ?? 0;
        if (mounted) {
          setState(() {});
        }
      }
    } catch (e) {
      Log.d(e.toString());
    }
  }

  _initAnimation() {
    _aniController = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
    );

    _ringSlideInHeightAni = Tween(
      begin: 0.0,
      end: 126.0,
    ).animate(
      CurvedAnimation(
        parent: _aniController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
    _ringSlideOutHeightAni = Tween(
      begin: 126.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _aniController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );
    _aniController.addListener(() {
      if (_scale) {
        setState(() {
          _ringWidth = _ringSlideInHeightAni.value;
        });
      } else {
        setState(() {
          _ringWidth = _ringSlideOutHeightAni.value;
        });
      }
    });
  }

  @override
  void dispose() {
    Log.d("ImageScreen dispose");
    if (_imageStreamListener != null) {
      _imageStream?.removeListener(_imageStreamListener!);
    }
    _aniController.dispose();
    _customScrollViewController.removeListener(_onScroll);
    _customScrollViewController.dispose();
    eventCenter.removeListener(EventConstant.EventMarryDataChanged, refreshByEvent);
    eventCenter.removeListener(EventConstant.EventAchieveWallDataChanged, refreshByEvent);
    eventCenter.removeListener(EventConstant.EventCpHouseDataChanged, refreshByEvent);
    eventCenter.removeListener(EventConstant.EventProfileBadgeDataChanged, refreshByEvent);
    eventCenter.removeListener(EventConstant.EventPageChanged, _onPageChanged);
    super.dispose();
  }

  void refreshByEvent(String type, dynamic data) async {
    _reload();
  }

  Future<Object?> _load() async {
    try {
      _restartLoadingDelayTimer();
      if (Job.needInit()) {
        await Job.init();
      }

      ResHomeProfile resHomeProfile = await BuffApi.getHomeProfileData(widget.uid, widget.rid, searchContent: widget.searchContent);
      if (resHomeProfile.success) {
        // Log.d('resHomeProfile:' +resHomeProfile.data.toString());
        _profileData = resHomeProfile.data;

        _follow = (_profileData?.base.followRelation == 1 || _profileData?.base.followRelation == 2);
        // if(_follow) {
        //   _loadOnline([this.widget.uid.toString()]);
        // }

        if (!Util.validList(_profileData?.base.photos)) {
          _isInTop = false;
          _isAlwaysTop = true;
        }
        await checkCommonTagData();
        await _loadSyncData();
      } else {
        _error = resHomeProfile.msg ?? K.server_error;
      }
      _loading = false;
      _loadingDelaying = false;
      _loadingPhotos = false;
    } catch (e) {
      Log.d(e.toString());
      _loading = false;
      _loadingDelaying = false;
      _error = e;
    }
    refresh();
    return null;
  }

  _loadSyncData() async {
    ResHomeSyncProfile resHomeSyncProfile = await BuffApi.getHomeProfileSyncData(widget.uid, widget.rid);
    if (resHomeSyncProfile.success && resHomeSyncProfile.hasData()) {
      _profileSyncData = resHomeSyncProfile.data;
      _profileData?.syncProfileData(resHomeSyncProfile.data);
      _follow = (_profileData?.base.followRelation == 1 || _profileData?.base.followRelation == 2);
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<void> checkCommonTagData() async {
    commonTags.clear(); // 需要先清除
    /// 个人页标签List
    if (_profileData?.base.tags != null && _profileData!.base.tags.isNotEmpty) {
      for (int i = 0; i < _profileData!.base.tags.length; i++) {
        String tagString = _profileData!.base.tags[i];
        if (!Util.validStr(tagString)) {
          continue;
        }
        List<String> data = tagString.split(',');
        if (data.isEmpty) {
          continue;
        }

        int tagId = Util.parseInt(data[0], 0);
        if (tagId == 0) {
          continue;
        }
        String label = data.length > 1 ? data[1] : '';
        CommonTagData? tagData = await TagDataUtil.getCommonTagData(tagId, label);
        if (tagData != null) {
          commonTags.add(tagData);
        }
      }
    }
  }

  Future<void> _reload() async {
    _load();
  }

  Future<void> _onRefresh() async {
    if (_error != null) {
      _load();
    } else {
      _loadSyncData();
    }
  }

  /// 上报访问记录
  _reportVisit() async {
    if (widget.uid != Session.uid) {
      String url = '${System.domain}go/yy/guest/record?uid=${widget.uid}';
      Xhr.get(url, pb: true);
    }
  }

  Widget _renderForbidden(int code, int role) {
    Map<int, String> res = {
      1: K.account_statue_checking,
      2: K.account_statue_banned_speak,
      3: K.account_statue_banned_speak,
      1000: K.account_statue_pause,
    };
    String message =
        (role < 2 && code != 1) ? K.account_status_reason : (res.containsKey(code) ? res[code] : K.account_statue_banned) ?? '';
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          R.img(
            'bb_null.webp',
            package: ComponentManager.MANAGER_BASE_CORE,
            width: 180,
            height: 180,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              message,
              style: TextStyle(color: R.colors.mainTextColor, fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }

  void _scrollToMomentTab() {
    if (ImageScreen.showMoment) {
      for (int i = 0; i < tab.length; i++) {
        TabItem tabItem = tab[i];
        if (tabItem.type == ImageScreenTabType.moment) {
          PulseLog.instance.event('click_event', properties: {
            'click_tag': 'personal_scroll_to_moment_tab_${widget.uid}',
          });
          _tabController!.index = i;
          return;
        }
      }
    }
  }

  //关注按钮
  Widget _buildAttentionBtn() {
    bool isTop = _isInTop;
    if (_isAlwaysTop) {
      isTop = false;
    }
    if (_follow || _me || Util.parseBool(widget.fromNearby) || widget.fromMatch) {
      return Container();
    }
    if (isTop) {
      return GestureDetector(
        onTap: _onFollow,
        child: Container(
            width: 59,
            height: 29,
            margin: const EdgeInsetsDirectional.only(top: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: R.colors.translateGradientColors),
              border: Border.all(width: 1, color: const Color(0xFF9EFF4E)),
              borderRadius: BorderRadius.circular(29 / 2),
            ),
            alignment: AlignmentDirectional.center,
            child: Center(
              child: Text(
                K.attention,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            )),
      );
    } else {
      return Container(
        alignment: AlignmentDirectional.center,
        child: GestureDetector(
          onTap: _onFollow,
          child: Container(
            width: 50,
            height: 28,
            margin: const EdgeInsetsDirectional.only(end: 4),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: R.colors.mainBrandGradientColors,
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                ),
                borderRadius: const BorderRadiusDirectional.all(Radius.circular(18))),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.attention,
              style: TextStyle(color: R.colors.brightTextColor, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }
  }

  //展示图片区域
  Widget _buildSlipper() {
    double bottomMargin = 16;
    List<Widget> widgets = [];
    List<String> res = _profileData?.base.photos ?? [];
    if (res.isEmpty || _loading == true) {
      return Container(
        height: MediaQuery.of(context).size.width,
      );
    }
    if (_loadingPhotos == true && _sliderIndex < res.length) {
      return SizedBox(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        child: CachedNetworkImage(
          imageUrl: "${System.imageDomain}${res.elementAt(_sliderIndex)}!cover750",
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 0),
          fadeOutDuration: const Duration(milliseconds: 0),
          placeholder: const CircularProgressIndicator(),
        ),
      );
    }
    Log.d('res.length:${res.length}');

    if (res.length == 1) {
      String imageUrl = "${System.imageDomain}${res.elementAt(0)}!cover750";
      imageUrl = Util.recombineUrl(imageUrl);
      Image image = Image.network(
        imageUrl,
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        errorBuilder: (
          BuildContext? context,
          Object? error,
          StackTrace? stackTrace,
        ) {
          return const SizedBox.shrink();
        },
      );
      Completer<ui.Image> completer = Completer<ui.Image>();

      if (_imageStreamListener != null) {
        _imageStream?.removeListener(_imageStreamListener!);
      }
      _imageStream = image.image.resolve(const ImageConfiguration());
      _imageStreamListener = ImageStreamListener((ImageInfo image, bool synchronousCall) {
        if (!completer.isCompleted) {
          completer.complete(image.image);
        }
      });
      _imageStream?.addListener(_imageStreamListener!);

      widgets = [
        PositionedDirectional(
          start: 0.0,
          top: 0.0,
          end: 0.0,
          bottom: 0.0,
          child: Container(
            child: image,
          ),
        ),
        PositionedDirectional(
          start: 0.0,
          top: 0.0,
          end: 0.0,
          bottom: 0.0,
          child: FutureBuilder<ui.Image>(
            future: completer.future,
            builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
              if (snapshot.hasData && snapshot.data != null && ((snapshot.data?.width ?? 0) < 200 && (snapshot.data?.height ?? 0) < 200)) {
                return Stack(
                  children: <Widget>[
                    PositionedDirectional(
                      start: 0.0,
                      top: 0.0,
                      end: 0.0,
                      bottom: 0.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        color: const Color(0x99000000),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ];
    } else if (res.length >= 2) {
      _preCache("${System.imageDomain}${res[1]}!cover750");
      widgets = [
        Swiper(
          key: ValueKey(res.length),
          itemBuilder: (BuildContext context, int index) {
            String imageUrl = "${System.imageDomain}${res.elementAt(index)}!cover750";
            imageUrl = Util.recombineUrl(imageUrl);
            return Image.network(
              imageUrl,
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              errorBuilder: (
                BuildContext? context,
                Object? error,
                StackTrace? stackTrace,
              ) {
                return const SizedBox.shrink();
              },
            );
          },
          itemCount: res.length,
          index: min(_sliderIndex, res.length - 1),
          pagination: res.length > 1
              ? SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsetsDirectional.only(start: 3.5, end: 5.0, bottom: 23.5),
                  builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.white,
                    color: Colors.white.withOpacity(0.4),
                    size: 7.0,
                    activeSize: 7.0,
                  ),
                )
              : null,
          autoplay: res.length > 1,
          loop: res.length > 1,
          autoplayDelay: 3000,
          autoplayDisableOnInteraction: true,
          onIndexChanged: (int index) {
            _sliderIndex = index;
            int i = (index + 1) % res.length;
            _preCache("${System.imageDomain}${res[i]}!cover750");
          },
        ),
      ];
    }

    //顶部渐变
    widgets.add(PositionedDirectional(
        start: 0,
        top: 0,
        end: 0,
        height: 88,
        child: IgnorePointer(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [Color(0x80202020), Color(0x00202020)],
            )),
          ),
        )));

    //底部渐变
    widgets.add(PositionedDirectional(
      start: 0,
      end: 0,
      bottom: 0,
      height: 180,
      child: IgnorePointer(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomStart,
            colors: [Color(0x00000000), Color(0x66000000)],
          )),
        ),
      ),
    ));

    //单身尾戒
    if (_profileData?.hasMarry() == true && _profileData?.marry.hasSingle() == true) {
      widgets.add(PositionedDirectional(start: 16, bottom: bottomMargin + (_showBirthdayRemind ? 155 : 92), child: _buildRing()));
    }

    // 生日提醒
    if (_showBirthdayRemind) {
      widgets.add(PositionedDirectional(
        start: 16,
        bottom: bottomMargin + 92,
        child: _roomManager.getProfileBirthdayEntryWidget(uid: widget.uid, rankTopName: _profileData?.birthday.rankTopName ?? ''),
      ));
    }

    // //昵称
    // widgets.add(
    //   PositionedDirectional(
    //     start: 16,
    //     end: 120,
    //     bottom: bottomMargin + 58,
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         ConstrainedBox(
    //           constraints: BoxConstraints(maxWidth: Util.width - 136 - 36),
    //           child: IgnorePointer(
    //             child: Text(
    //               _profileData?.displayName ?? '',
    //               maxLines: 1,
    //               overflow: TextOverflow.ellipsis,
    //               style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(width: 5),
    //         UserSexAndAgeWidget(
    //           sex: Util.parseInt(_profileData?.base.sex),
    //           age: Util.parseInt(_profileData?.base.age),
    //           width: 31,
    //           height: 14,
    //         ),
    //         if (!Util.isStringEmpty(_profileData?.base.holdHandIcon)) // 我的好哥哥
    //           Padding(
    //             padding: const EdgeInsetsDirectional.only(start: 5),
    //             child: R.img(Util.getRemoteImgUrl(_profileData?.base.holdHandIcon), height: 22),
    //           )
    //       ],
    //     ),
    //   ),
    // );
    //
    // //ID
    // widgets.add(PositionedDirectional(
    //     start: 16,
    //     bottom: bottomMargin + 12,
    //     child: Container(
    //       alignment: AlignmentDirectional.centerStart,
    //       width: Util.width - 50,
    //       height: 54,
    //       child: Row(
    //         children: [
    //           // 个人页面靓ID展示
    //           (_profileData?.base.prettyUid ?? 0) > 0
    //               ? Padding(
    //                   padding: const EdgeInsetsDirectional.only(end: 5),
    //                   child: Container(
    //                     height: 16,
    //                     padding: const EdgeInsetsDirectional.only(end: 6),
    //                     alignment: Alignment.center,
    //                     decoration: const BoxDecoration(
    //                       color: Color(0x33FFFFFF),
    //                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //                     ),
    //                     child: Row(
    //                       children: [
    //                         R.img(
    //                           BaseAssets.shared$bb_pretty_id_webp,
    //                           width: 16,
    //                           height: 16,
    //                           package: ComponentManager.MANAGER_BASE_CORE,
    //                           fit: BoxFit.fitHeight,
    //                         ),
    //                         const SizedBox(width: 4),
    //                         ColorfulNickName(
    //                           isPrettyId: true,
    //                           textBuild: (bool show, {Key? key, Paint? paint}) {
    //                             return NumText(
    //                               (_profileData?.base.prettyUid ?? 0).toString(),
    //                               key: key,
    //                               softWrap: true,
    //                               maxLines: 1,
    //                               overflow: TextOverflow.ellipsis,
    //                               textAlign: TextAlign.start,
    //                               style: const TextStyle(
    //                                 color: Color(0xFFFD7B08),
    //                                 fontSize: 13,
    //                                 height: 1.1,
    //                                 fontWeight: FontWeight.w500,
    //                               ),
    //                             );
    //                           },
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               : IDWidget(
    //                   imagePath: 'icon_personal_id.svg',
    //                   width: 16,
    //                   height: 16,
    //                   onTap: () {
    //                     PulseLog.instance.event('click_event', properties: {
    //                       'click_tag': 'personal_id_copy_${widget.uid}',
    //                     });
    //                     Clipboard.setData(ClipboardData(text: widget.uid.toString()));
    //                     Fluttertoast.showToast(msg: K.personaldata_id_copied);
    //                   },
    //                   needShadows: false,
    //                   uid: widget.uid,
    //                   fontSize: 15,
    //                   fontColor: Colors.white,
    //                   fontWeight: FontWeight.w500,
    //                 ),
    //           if (_showRecordSoundBrief)
    //             Padding(
    //               padding: const EdgeInsetsDirectional.only(start: 12),
    //               child: PersonalHomePageSoundButton(
    //                 audioUrl: _profileData?.card.audio ?? '',
    //                 duration: Util.parseInt(_profileData?.card.duration),
    //                 toImageModifyScreen: _toImageModifyScreen,
    //               ),
    //             ),
    //         ],
    //       ),
    //     )));

    //守护
    Widget childWidget;

    if (Util.validStr(_profileData?.marry.relation.img)) {
      widgets.add(_buildMarryLoveValue());
      childWidget = Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CommonAvatar(
            path: _profileData?.marry.relation.img,
            size: 52,
            shape: BoxShape.circle,
          ),
          R.img('marry/profile_marry_head.png', width: 64, height: 64, package: ComponentManager.MANAGER_PERSONALDATA),
        ],
      );
    } else if (Util.validList(_profileData?.defendList)) {
      childWidget = Container(
        width: 64,
        height: 64,
        alignment: AlignmentDirectional.center,
        child: DefendRelationHeader(
          defendRelationModel: DefendRelationModel.fromBuffModel(_profileData!.defendList.first),
          showBorderIcon: true,
          iconSize: 56,
        ),
      );
    } else if (_profileData?.hasAccompanyFirst() == true) {
      childWidget = Container(
        width: 64,
        height: 64,
        alignment: AlignmentDirectional.center,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CommonAvatar(
              path: _profileData?.accompanyFirst.icon,
              size: 52,
              shape: BoxShape.circle,
            ),
            R.img('icon_accompany_rank.png', package: ComponentManager.MANAGER_PERSONALDATA, width: 64, height: 64),
          ],
        ),
      );
    } else {
      double windsMargin = _me ? 2 : 0;
      childWidget = Container(
        width: 64,
        height: 64,
        alignment: AlignmentDirectional.center,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const SizedBox(
              width: 64,
              height: 64,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 4),
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 4),
              child: R.img(
                'icon_add.svg',
                width: 14,
                height: 14,
                fit: BoxFit.cover,
                color: Colors.white,
                package: ComponentManager.MANAGER_PERSONALDATA,
              ),
            ),
            PositionedDirectional(
              start: windsMargin,
              bottom: 0,
              child: R.img(
                'icon_wings_left.svg',
                width: 32,
                height: 22,
                fit: BoxFit.cover,
                package: ComponentManager.MANAGER_PERSONALDATA,
              ),
            ),
            PositionedDirectional(
              end: windsMargin,
              bottom: 0,
              child: R.img(
                'icon_wings_right.png',
                width: 32,
                height: 22,
                fit: BoxFit.cover,
                package: ComponentManager.MANAGER_PERSONALDATA,
              ),
            ),
            PositionedDirectional(
              bottom: 3,
              child: Container(
                padding: const EdgeInsetsDirectional.fromSTEB(7, 1, 7, 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF8D8D), Color(0xFFFF6CD2)],
                  ),
                ),
                child: Text(
                  K.personal_defend_she([(_me ? '' : (_profileData?.base.sex == 2 ? BaseK.K.common_she : BaseK.K.common_he))]),
                  style: R.textStyle.regular10.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
    //TODO 守护Icon

    // widgets.add(PositionedDirectional(
    //     bottom: bottomMargin + 12,
    //     end: 12,
    //     child: GestureDetector(
    //       onTap: () async {
    //         IRankManager rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
    //         rankManager.showCompanionRankPage(context, widget.uid, 'personalInfo').then((value) {
    //           if (value == true) {
    //             _reload();
    //           }
    //         });
    //       },
    //       child: childWidget,
    //     )));

    return SizedBox(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: widgets,
      ),
    );
  }

  Widget _buildMarryLoveValue() {
    return PositionedDirectional(
        end: 0,
        bottom: 96,
        child: Container(
          height: 38,
          padding: const EdgeInsetsDirectional.only(start: 4, end: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(19.0),
              bottomStart: Radius.circular(19.0),
            ),
            color: Colors.black.withOpacity(0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              R.img(
                'marry/my_mate_lover_index.webp',
                package: ComponentManager.MANAGER_PERSONALDATA,
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 6,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    Util.numberToKString(Util.parseInt(_profileData?.marry.relation.degree)),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      fontFamily: Util.numFontFamily,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    K.marry_love_index,
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget _buildRing() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PositionedDirectional(
          start: 19,
          child: Container(
            height: 38,
            width: _ringWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.imagePath('single_ring_bg.webp', package: ComponentManager.MANAGER_PERSONALDATA)),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsetsDirectional.only(start: 27),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_profileData?.marry.single.cName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 11, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 4,
                ),
                Text(K.marry_ring_descrip,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: const Color(0xFFFFFFFF).withOpacity(0.6), fontSize: 10, height: 1)),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _scale = !_scale;
              _aniController.reset();
              _aniController.forward();
            });
          },
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: AlignmentDirectional.topEnd,
                  end: AlignmentDirectional.bottomStart,
                  colors: [Color(0xFFFFA0EB), Color(0xFFBEC6FF), Color(0xFF5FCFFF)]),
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(19)),
            ),
            alignment: Alignment.center,
            child: !Util.validStr(_profileData?.marry.single.img)
                ? Container()
                : CachedNetworkImage(
                    imageUrl: System.imageDomain + _profileData!.marry.single.img,
                    fit: BoxFit.fill,
                    width: 30.0,
                    height: 30.0,
                  ),
          ),
        )
      ],
    );
  }

  _onSendMomentTaped() async {
    if (!Session.isLogined) {
      ILoginManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return;
    }

    if (Utility.isNeedVerify(_profileData?.base.needVerify, _profileData?.base.needVerifyNew)) {
      // 发布动态前需要做认证
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool suc = await loginManager.openAuthDialog(context,
          type: _profileData?.base.needVerify ?? 0, newType: _profileData?.base.needVerifyNew ?? 0, refer: '${widget.refer}:send_moment');

      if (suc == true) {
      } else {
        return;
      }
    }

    IMomentManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    Moment? moment = await manager.openMomentPublishScreen(context, showPlaySelect: false, from: 'userpage');
    if (moment != null) {
      _momentModel?.notify();
    }
  }

  double _footerBottomPadding() {
    if (Util.iphoneXBottom > 0) {
      return Util.iphoneXBottom - 8;
    }
    return 0;
  }

  void _toImageModifyScreen() async {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'personal_image_modify_${widget.uid}',
    });
    await ImageModifyScreen.showImageModifyScreen(context, callBack: (completeness) {
      _completenessValue = completeness;
    });
    _reload();
  }

  Widget _buildSendMoment() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        PulseLog.instance.event('click_event', properties: {
          'click_tag': 'personal_send_moment_${widget.uid}',
        });
        _onSendMomentTaped();
      },
      child: SizedBox(
        width: 176,
        height: 88,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              width: 144,
              height: 56,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(colors: R.dColor.darkGradientColors),
                ),
              ),
            ),
            // Rext.autoStyleImg('ic_home_send_moment.webp',
            //     width: 180, height: 88, package: ComponentManager.MANAGER_MOMENT, fit: BoxFit.fill),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // R.img(
                //   'ic_topic_send_moment.webp',
                //   width: 21,
                //   height: 21,
                //   color: Colors.white,
                //   package: ComponentManager.MANAGER_MOMENT,
                // ),
                // const SizedBox(width: 4),
                Text(
                  K.personaldata_send_moment,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderFooter() {
    List<Widget> widgets = [];
    IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
    if (_me) {
      // 修改资料
      widgets.add(
        BottomBasicButton(
          width: 144,
          icon: 'btn_profile_edit.svg',
          label: K.personal_edit_data,
          subLabel: '（${K.personal_data_completeness}$_completenessValue%）',
          onClick: () {
            _toImageModifyScreen();
          },
          borderWith: 1.5,
          borderColor: R.colors.mainBrandColor,
          iconColor: R.colors.mainBrandColor,
          labelColor: R.colors.mainBrandColor,
          subLabelColor: R.colors.mainBrandColor,
          bgColor: Colors.transparent,
        ),
      );
      if (ImageScreen.showMoment) widgets.add(const SizedBox(width: 19));
      //发布动态
      if (ImageScreen.showMoment) {
        widgets.add(_buildSendMoment());
      }
    } else if (Util.parseBool(widget.fromNearby)) {
    } else {
      widgets.add(const SizedBox(width: 16));

      /// TODO：快乐星球App审核屏蔽
      if (_profileData?.room != null && Util.parseInt(_profileData?.room.rid) > 0 && !Util.isSleeplessPlanetVerify) {
        widgets.add(Expanded(
          flex: 3,
          child: ImageRoomTag(
            height: 56,
            iconSize: 36,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            textStyle: TextStyle(color: R.colors.brightTextColor, fontSize: 15, fontWeight: FontWeight.w500),
            roomId: Util.parseInt(_profileData?.room.rid),
            roomIcon: "${System.imageDomain}${_profileData?.room.icon ?? ''}!head150",
            roomName: K.personal_in_room,
            refer: widget.refer.toString(),
            uid: widget.uid,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF202020).withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2.0,
                offset: const Offset(0, 2),
              )
            ],
          ),
        ));
        widgets.add(const SizedBox(width: 8));
      }

      if (widget.fromMatch) {
        // 匹配
        widgets.add(Expanded(
          flex: 2,
          child: BottomBasicButton(
            icon: 'match/match_hi.webp',
            label: K.personal_match,
            labelColor: Colors.white,
            gradientBgColors: const [
              Color(0xFFFF80F6),
              Color(0xFFAC9BFF),
              Color(0xFF41C5FF),
            ],
            onClick: () async {
              PulseLog.instance.event('click_event', properties: {
                'click_tag': 'personal_from_match_${widget.uid}',
              });
              if (_hadSendMatch) {
                Fluttertoast.showToast(msg: K.personal_match_send_again);
              } else {
                BaseResponse response = await MatchRepository.fastMatchUser(['${widget.uid}']);
                if (response.success == true) {
                  _hadSendMatch = true;
                  Fluttertoast.showToast(msg: K.personal_match_send_success);
                }
              }
            },
          ),
        ));
      } else if (widget.fromSayHiMatch) {
        // 打招呼匹配
        widgets.add(Expanded(
          flex: 2,
          child: BottomBasicButton(
            icon: 'match/match_hi.webp',
            label: K.personal_match,
            labelColor: Colors.white,
            gradientBgColors: const [Color(0xFFFE62A5), Color(0xFFFFC96A)],
            onClick: () async {
              PulseLog.instance.event('click_event', properties: {
                'click_tag': 'personal_from_say_hi_match_${widget.uid}',
              });
              if (_hadSendMatch) {
                Fluttertoast.showToast(msg: K.personal_match_send_again);
              } else {
                try {
                  String url = '${System.domain}party/match/batchsend';
                  XhrResponse response = await Xhr.postJson(url, {'touids': '${widget.uid}'}, throwOnError: false);

                  if (response.error != null) {
                    Fluttertoast.showToast(msg: response.error.toString());
                    return;
                  }

                  Map res = response.response as Map;
                  if (!(res['success'] ?? false)) {
                    Fluttertoast.showToast(msg: res['msg']);
                    return;
                  }

                  _hadSendMatch = true;
                  Fluttertoast.showToast(msg: K.personal_match_send_success);
                } catch (e) {
                  Fluttertoast.showToast(msg: e.toString());
                }
              }
            },
          ),
        ));
      } else {
        // 聊天
        widgets.add(Expanded(
          flex: 2,
          child: BottomBasicButton(
            icon: 'icon_info_chat.svg',
            label: K.chat,
            onClick: () {
              PulseLog.instance.event('click_event', properties: {
                'click_tag': 'personal_user_chat_${widget.uid}',
              });
              if (Session.isLogined == false) {
                ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
                loginManager.show(context);
                return;
              }
              IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
              chatManager.openUserChatScreen(context,
                  type: 'private', targetId: widget.uid, title: _profileData?.displayName ?? '', refer: '${widget.refer ?? 'UserPage'}');
            },
            labelColor: Colors.black,
            gradientBgColors: R.colors.darkGradientColors,
            iconColor: Colors.black,
          ),
        ));
      }
      widgets.add(const SizedBox(width: 16));
    }

    return Container(
        color: R.colors.mainBgColor,
        child: Container(
          height: 88 + _footerBottomPadding(),
          padding: EdgeInsets.only(bottom: _footerBottomPadding()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets,
          ),
        ));
  }

  final Map<String, bool> _preCached = {};

  _preCache(String url) async {
    url = Util.recombineUrl(url);
    if (_preCached.containsKey(url)) return;
    _preCached[url] = true;
    CachedImageManager.preCache(context, url);
  }

  _onFollow() async {
    if (Session.isLogined == false) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    NormalNull response;
    if (_follow) {
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'personal_unfollow_${widget.uid}',
      });
      response = await BaseRequestManager.unFollow(widget.uid.toString());
    } else {
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'personal_follow_${widget.uid}',
      });
      response = await BaseRequestManager.onFollow(
        widget.uid.toString(),
        refer: '${widget.refer ?? 'UserPage'}',
        searchContent: widget.searchContent ?? '',
      );
    }
    if (!mounted) return;
    if (response.success) {
      _follow = !_follow;
      refresh();
//      this._reload();
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  _onMenu(SheetItem value) async {
    if (value.key == 'follow' || value.key == 'unfollow') {
      _onFollow();
    } else if (value.key == 'block') {
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'personal_block_dialog_${widget.uid}',
      });
      bool r = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(
              title: K.add_to_blacklist,
              content: K.notice_add_to_blacklist,
            );
          });
      if (r == true) {
        PulseLog.instance.event('click_event', properties: {
          'click_tag': 'personal_block_${widget.uid}',
        });
        _blockAction(true);
      }
    } else if (value.key == 'unblock') {
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'personal_unblock_${widget.uid}',
      });
      _blockAction(false);
    } else if (value.key == 'share') {
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'personal_share_${widget.uid}',
      });
      _onShare();
    } else if (value.key == 'report') {
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'personal_report_${widget.uid}',
      });
      IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
      manager.openReportScreen(context, uid: widget.uid, reportType: ReportType.User);
    } else if (value.key == 'mark') {
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'personal_mark_${widget.uid}',
      });
      _markName();
    } else if (value.key == 'business_card') {
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'personal_business_card_${widget.uid}',
      });
      BaseWebviewScreen.show(context, url: _businessCardUrl);
    }
  }

  _markName() async {
    int index = FormScreen.config(
      title: K.please_input_remark_name,
      tip: (Util.validStr(_profileData?.base.name)) ? K.nick_name + _profileData!.base.name : '',
      value: _profileData?.base.markName ?? '',
      allowEmpty: true,
      keyboardType: TextInputType.text,
    );
    String? value = await FormScreen.openFormScreen(context, index);
    if (value != null && mounted) {
      try {
        await Xhr.postJson(
          '${System.domain}account/mark',
          {
            'target': widget.uid.toString(),
            'name': value,
          },
          throwOnError: true,
        );
        if (mounted) {
          CachedNames.instance().remove(widget.uid);
          _reload();
          Toast.showCenter(context, K.remark_name_set_success);
        }
      } catch (e) {
        if (mounted) Toast.showCenter(context, e.toString());
      }
    }
  }

  void _onShare() async {
    ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.share(context, widget.uid);
  }

  _blockAction(bool block) async {
    BaseResponse response = await BaseRequestManager.blockAction(widget.uid.toString(), block);
    if (response.success == true) {
      Fluttertoast.showToast(msg: K.operate_completed);
    } else {
      Fluttertoast.showToast(msg: response.msg);
    }
  }

  _displayMenu() async {
    if (Session.isLogined == false) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'personal_action_more_${widget.uid}',
    });
    List<SheetItem> res = [];
    if (_me) {
      // 自己主页只有分享
      res.add(SheetItem(K.share, "share"));
    } else {
      bool isBlock = await MyMateRepository.isInBlock(widget.uid);

      if (!Util.isStringEmpty(_businessCardUrl)) {
        //查看名片
        res.add(SheetItem(K.personal_view_business_card, 'business_card'));
      }
      if (_follow) {
        String markName = _profileData?.base.markName ?? '';
        String showMarkName = markName.isNotEmpty ? "${K.remark_name}：$markName" : K.set_remark_name;
        // 备注名
        res.add(SheetItem(showMarkName, 'mark'));
      }
      res.add(SheetItem(K.report, "report"));
      if (_follow) {
        res.add(SheetItem(K.cancel_attention, "unfollow"));
      } else {
        res.add(SheetItem(K.attention, "follow"));
      }
      if (isBlock) {
        res.add(SheetItem(K.leave_the_blacklist, "unblock"));
      } else {
        res.add(SheetItem(K.add_to_blacklist, "block"));
      }
      res.add(SheetItem(K.share, "share"));
    }

    SheetCallback result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
            title: "${_profileData?.base.name ?? ''}(${_profileData?.base.uid ?? 0})",
            data: res,
          );
        });
    if (result.reason == SheetCloseReason.Active) {
      return;
    }
    _onMenu(result.value!);
  }

  Widget _renderWait() {
    Widget? bodyWidget;
    int deleted = 0;
    if (_loading) {
      if (_loadingDelaying) {
        bodyWidget = Container(
          color: R.colors.homeBgColor,
        );
      } else {
        bodyWidget = Container(
          color: R.colors.homeBgColor,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    } else if (_error != null) {
      bodyWidget = ErrorData(
        error: _error.toString(),
        fontColor: R.colors.mainTextColor,
        onTap: () {
          PulseLog.instance.event('click_event', properties: {
            'click_tag': 'personal_error_retry_${widget.uid}',
          });
          setState(() {
            _loading = true;
            _restartLoadingDelayTimer();
          });
          _reload();
        },
      );
    } else if (_me == false) {
      deleted = Util.parseInt(_profileData?.base.deleted);
      int role = Util.parseInt(_profileData?.base.role);
      if (deleted > 0) {
        bodyWidget = _renderForbidden(deleted, role);
      }
    } else {
      bodyWidget = Container();
    }
    return Scaffold(
        backgroundColor: R.colors.homeBgColor,
        appBar: _follow == true && deleted > 0
            ? BaseAppBar.custom(
                showBack: true,
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () async {
                        PulseLog.instance.event('click_event', properties: {
                          'click_tag': 'personal_action_more_${widget.uid}',
                        });
                        SheetCallback result = await displayModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return RadioBottomSheet(
                                title: "${_profileData?.base.name ?? ''}(${_profileData?.base.uid ?? 0})",
                                data: [SheetItem(K.cancel_attention, "unfollow")],
                              );
                            });
                        if (result.reason == SheetCloseReason.Active) {
                          return;
                        }
                        _onMenu(result.value!);
                      })
                ],
              )
            : BaseAppBar(
                '',
                backgroundColor: R.colors.homeBgColor,
                backColor: R.colors.mainTextColor,
              ),
        body: bodyWidget);
  }

  void _restartLoadingDelayTimer() {
    _loadingDelaying = true;
    _loadingDelayTimer?.cancel();
    _loadingDelayTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _loadingDelaying = false;
        });
      }
    });
  }

  _onScroll() {
    if (!_customScrollViewController.hasClients) return;
    double max = MediaQuery.of(context).size.width - kToolbarHeight;
    if (_isInTop == true && _customScrollViewController.offset >= max) {
      setState(() {
        _isInTop = false;
      });
    } else if (_isInTop == false && _customScrollViewController.offset < max) {
      setState(() {
        _isInTop = true;
      });
    }

    if (_customScrollViewController.position.maxScrollExtent == _customScrollViewController.offset) {
      _showBottomTipsIfNeed();
    }
    setState(() {});
  }

  void _showBottomTipsIfNeed() {
    Log.d('_showBottomTipsIfNeed');
    if (_tabController!.index != 0) return;
    if (!(_profileData?.hasRoom() == true)) return;
    if (_showTips) return;
    if (_me) return;
    if (Util.parseBool(widget.fromNearby)) return;
    int today = Utility.getToday() ~/ Utility.Day;
    String key = 'showBottom$today';
    String result = Config.get(key);
  }

  _scrollToTop() {
    if (!_customScrollViewController.hasClients) return;
    _customScrollViewController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  bool get showSkill {
    return Session.showSkill &&
        !Util.isVerify &&
        ImageScreen.showSkill == true &&
        (_profileData?.god.servicePause ?? 0) <= 0 &&
        Util.validList(_profileData?.skill);
  }

  bool get showBaseInfo {
    return Util.parseInt(_profileData?.base.sex) > 0 ||
        Util.parseInt(_profileData?.base.popularityLevel) > 0 ||
        Util.parseInt(_profileData?.base.vipLevel) > 0 ||
        Util.parseInt(_profileData?.base.title) > 0 ||
        showSkill;
  }

  /// 是否展示我/TA的荣誉中心
  bool get _showGloryCenter {
    return (widget.uid == Session.uid) || (widget.uid != Session.uid && Util.parseBool(_profileData?.generalSettings.showGlory));
  }

  /// 是否显示录制声音简介
  bool get _showRecordSoundBrief {
    return (widget.uid == Session.uid) || (widget.uid != Session.uid && Util.validStr(_profileData?.card.audio));
  }

  /// 是否显示生日提醒
  bool get _showBirthdayRemind {
    return Util.parseInt(_profileData?.birthday.isBirthday) == 1;
  }

  List<TabItem> get tab {
    List<TabItem> tabs = <TabItem>[
      TabItem(ImageScreenTabType.info, K.personaldata_about_me),
      // TabItem(ImageScreenTabType.zone, K.personaldata_zone),
      if (ImageScreen.showMoment) TabItem(ImageScreenTabType.moment, K.moment),
      if (showSkill) TabItem(ImageScreenTabType.skill, K.personaldata_skill),
    ];
    return tabs;
  }

  int _getInitTabIndex(String? type) {
    int index = tab.indexWhere((element) => element.type == type);
    return index >= 0 ? index : 0;
  }

  Widget _buildTab() {
    return Container(
      height: 44,
      margin: const EdgeInsetsDirectional.only(top: 12),
      alignment: AlignmentDirectional.center,
      child: Row(children: [
        Expanded(
          child: CommonTabBar(
            tabs: tab.map((e) => Tab(child: Text(e.label ?? ''))).toList(),
            isScrollable: true,
            controller: _tabController,
            labelColor: R.colors.mainTextColor,
            unselectedLabelColor: R.colors.secondTextColor,
            labelStyle: TextStyle(color: R.colors.mainTextColor, fontSize: 18, fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(color: R.colors.secondTextColor, fontSize: 14),
            indicator: const BoxDecoration(),
            marginStart: 6,
            marginEnd: 6,
            labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            tabItemAlign: const Alignment(0, 0.2),
          ),
        ),
      ]),
    );
  }

  List<Widget> generalTagList(bool front) {
    List<Widget> widgets = [];

    if (commonTags.isNotEmpty) {
      Log.d(tag: "generalTag", "total length:${commonTags.length}");
      for (int i = 0; i < commonTags.length; i++) {
        if (front && commonTags[i].location == 0) {
          Log.d(tag: "generalTag", "add to front:${commonTags[i].toString()}");
          widgets.add(CommonTagWidget(
            data: commonTags[i],
            inProfilePage: true,
            needMarginEnd: false,
          ));
        } else if (!front && commonTags[i].location == 1) {
          Log.d(tag: "generalTag", "add to end:${commonTags[i].toString()}");
          widgets.add(CommonTagWidget(
            data: commonTags[i],
            inProfilePage: true,
            needMarginEnd: false,
          ));
        }
      }
    }
    return widgets;
  }

  Widget _buildBasic() {
    List<String> hisongInfo = [];
    Decoration fixSepLineDecoration = BoxDecoration(
        color: R.colors.homeBgColor,
        //边框
        border: Border.all(
          width: 0,
          color: R.colors.homeBgColor,
        ));

    if (!Util.isNullOrEmpty(_profileData?.card.education)) {
      hisongInfo.add(_profileData!.card.education);
    }
    if (!Util.isNullOrEmpty(_profileData?.card.industry)) {
      hisongInfo.add(_profileData!.card.industry);
    }
    if ((_profileData?.card.height ?? 0) > 0) {
      hisongInfo.add('${_profileData!.card.height}cm');
    }

    bool isTop = _isInTop;
    if (_isAlwaysTop) {
      isTop = false;
    }
    List<Widget> widgets = [];

    //昵称
    widgets.add(
      Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, top: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Util.width - 136 - 36),
              child: IgnorePointer(
                child: Text(
                  _profileData?.displayName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(width: 5),
            UserSexAndAgeWidget(
              sex: Util.parseInt(_profileData?.base.sex),
              age: Util.parseInt(_profileData?.base.age),
              width: 105 / 3,
              height: 48 / 3,
              bgImg: Util.parseInt(_profileData?.base.sex) == 1
                  ? Assets.personaldata$ic_sex_age_man_png_png
                  : Assets.personaldata$ic_sex_age_png,
            ),
            if (!Util.isStringEmpty(_profileData?.base.holdHandIcon)) // 我的好哥哥
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: R.img(Util.getRemoteImgUrl(_profileData?.base.holdHandIcon), height: 22),
              )
          ],
        ),
      ),
    );

    //ID
    widgets.add(Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, top: 0),
        child: Container(
          alignment: AlignmentDirectional.centerStart,
          width: Util.width - 50,
          child: Row(
            children: [
              // 个人页面靓ID展示
              (_profileData?.base.prettyUid ?? 0) > 0
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(end: 5),
                      child: Container(
                        height: 16,
                        padding: const EdgeInsetsDirectional.only(end: 6),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0x33FFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Row(
                          children: [
                            R.img(
                              BaseAssets.shared$bb_pretty_id_webp,
                              width: 16,
                              height: 16,
                              package: ComponentManager.MANAGER_BASE_CORE,
                              fit: BoxFit.fitHeight,
                            ),
                            const SizedBox(width: 4),
                            ColorfulNickName(
                              isPrettyId: true,
                              textBuild: (bool show, {Key? key, Paint? paint}) {
                                return NumText(
                                  (_profileData?.base.prettyUid ?? 0).toString(),
                                  key: key,
                                  softWrap: true,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Color(0xFFFD7B08),
                                    fontSize: 13,
                                    height: 1.1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : IDWidget(
                      imagePath: 'icon_personal_id.svg',
                      width: 16,
                      height: 16,
                      iDFontColor: const Color(0xFF9F9F9F),
                      onTap: () {
                        PulseLog.instance.event('click_event', properties: {
                          'click_tag': 'personal_id_copy_${widget.uid}',
                        });
                        Clipboard.setData(ClipboardData(text: widget.uid.toString()));
                        Fluttertoast.showToast(msg: K.personaldata_id_copied);
                      },
                      needShadows: false,
                      uid: widget.uid,
                      fontSize: 12,
                      iDFontSize: 12,
                      fontColor: const Color(0xFF9F9F9F),
                      fontWeight: FontWeight.w500,
                    ),
              if (_showRecordSoundBrief)
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12),
                  child: PersonalHomePageSoundButton(
                    audioUrl: _profileData?.card.audio ?? '',
                    duration: Util.parseInt(_profileData?.card.duration),
                    toImageModifyScreen: _toImageModifyScreen,
                  ),
                ),
            ],
          ),
        )));

    widgets.add(
      Container(
        decoration: fixSepLineDecoration,
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 学历 行业 身高
                if (hisongInfo.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.generate(hisongInfo.length, (index) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              hisongInfo[index],
                              style: const TextStyle(fontSize: 13, color: Colors.white),
                            ),
                            Visibility(
                              visible: index != hisongInfo.length,
                              child: Container(
                                margin: const EdgeInsets.only(left: 3, right: 3),
                                width: 1,
                                height: 12,
                                color: Colors.white.withOpacity(0.2),
                              ),
                            )
                          ],
                        );
                      }).toList()
                    ],
                  ),
                // 在线 在线时间 粉丝数 IP归属地
                if ((_profileData?.getOnlineMessage() ?? '').isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(_profileData!.getOnlineMessage(), style: TextStyle(fontSize: 11.0, color: R.colors.secondTextColor)),
                ],

                // if (showBaseInfo) _buildUserVipAndTitle(),
                if (showBaseInfo | (_profileData?.getOnlineMessage() ?? '').isNotEmpty) const SizedBox(height: 20),
              ],
            ),
            const Spacer(),
            // 关注按钮
            if (isTop && !widget.fromSayHiMatch) _buildAttentionBtn()
          ],
        ),
      ),
    );

    // // 运营活动勋章
    // if (_showGloryCenter) {
    //   widgets.add(Container(
    //     decoration: fixSepLineDecoration,
    //     padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
    //     child: _buildActivityBadgeWidget(),
    //   ));
    // }

    // 角色标记
    if (Util.validList(_profileData?.mark)) {
      widgets.add(Container(height: 8.dp, decoration: fixSepLineDecoration));
      int i = 0;

      for (HomeProfileMark map in _profileData!.mark) {
        if (i < 3) {
          i++;
          widgets.add(Container(
            decoration: fixSepLineDecoration,
            padding: const EdgeInsetsDirectional.only(start: 16, top: 8, bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(imageUrl: Util.parseIcon(map.icon), width: 16, height: 16),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    map.text,
                    style: TextStyle(color: R.colors.secondTextColor, fontSize: 14, fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ));
        }
      }
      widgets.add(Container(height: 8.dp, decoration: fixSepLineDecoration));
      widgets.add(Container(
        decoration: fixSepLineDecoration,
        child: Divider(
          height: 0.5,
          color: PersonaldataR.colors.dividerColor,
          indent: 16,
          endIndent: 16,
        ),
      ));
    }

    // 角色称号
    if (ImageScreen.showRoleTitle ?? false) {
      if (Util.validList(_profileData?.juTitles)) {
        List<TitleRoleItemBean> titles = _profileData!.juTitles.map((e) => TitleRoleItemBean.fromBuffModel(e)).toList();

        widgets.add(TitleRoleWidget(items: titles));
        widgets.add(Container(
          color: R.colors.homeBgColor,
          child: Divider(
            height: 0.5,
            color: PersonaldataR.colors.dividerColor,
            indent: 16,
            endIndent: 16,
          ),
        ));
      }
    }
    return SliverList(
      delegate: SliverChildListDelegate(widgets),
    );
  }

  /// 运营活动勋章
  Widget _buildActivityBadgeWidget() {
    bool isCanShowAlarmLabel = ChatUtil.isCanShowAlarmLabel(_profileData?.base.littleAlarm ?? '');
    List<Widget> tags = [];
    // 通用标签
    tags.addAll(generalTagList(true));
    // 性别年龄标签
    //_tags.add(UserSexAndAgeWidget(sex: _profileData.base.sex, age: _profileData.base.age, width: 31, height: 14),);
    // 人气等级标签
    if ((_profileData?.base.popularityLevel ?? 0) > 0) {
      tags.add(
        UserPopularity(popularityLevel: _profileData!.base.popularityLevel),
      );
    }
    // VIP等级标签
    if ((_profileData?.base.vipLevel ?? 0) > 0) {
      tags.add(
        UserVipWidget(
          vip: _profileData!.base.vipLevel,
        ),
      );
    }
    // KA神壕标签
    if (_profileData?.base.kaWhiteIcon == true) {
      tags.add(
        const KaTagWidget(),
      );
    }
    // 爵位标签
    if (!NobilityUtil.titleIsInvalid(_profileData?.base.title ?? 0)) {
      tags.add(
        UserNobilityWidget(
          titleNew: _profileData!.base.title,
        ),
      );
    }
    // 小闹钟标签
    if (isCanShowAlarmLabel) {
      tags.add(
        TextLabelWidget.smallAlarmLabel(_profileData?.base.littleAlarm),
      );
    }
    // 明星歌手标签
    if ((_profileData?.base.starSinger ?? 0) > 0 && (_profileData?.base.starSinger ?? 0) <= 7) {
      tags.add(
        UserStarSingerWidget(
          level: _profileData!.base.starSinger,
          height: 26,
        ),
      );
    }
    // 明星用户加V标签（黄V/红V）
    if (_profileData?.base.starVerifyTag == 1 || _profileData?.base.starVerifyTag == 2 || _profileData?.base.starVerifyTag == 3) {
      tags.add(
        UserStarVerifyWidget(starVerifyTag: _profileData!.base.starVerifyTag),
      );
    }
    // 七夕勋章标签
    if (_profileData?.base.hasSevenLoveTag() == true && _profileData!.base.sevenLoveTag > 0 && _profileData!.base.sevenLoveTag <= 3) {
      tags.add(SevenLoveWidget(rank: _profileData!.base.sevenLoveTag));
    }
    // 通用标签
    tags.addAll(generalTagList(false));
    // 主播信用等级标签
    if (showSkill) {
      tags.add(
        InkWell(
          onTap: () {
            displayModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 112 + Util.iphoneXBottom,
                        decoration: BoxDecoration(
                          color: R.color.mainBgColor,
                          borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(10.0),
                            topEnd: Radius.circular(10.0),
                          ),
                        ),
                        padding: const EdgeInsets.only(top: 18.0),
                        child: CreditTip(
                          uid: widget.uid,
                        ),
                      ));
                });
          },
          child: Container(
            width: 20,
            height: 19,
            alignment: AlignmentDirectional.centerStart,
            child: Images.img('credit/credit_${max(0, _profileData?.god.creditGodLevel ?? 0)}.png', width: 20),
          ),
        ),
      );
    }

    // 普通勋章 badgeIcons已废弃
    // if (Util.validList(_profileData?.base?.badgeIcons)) {
    //   _tags.addAll(_profileData?.base?.badgeIcons?.take(4)?.map((e) => ActivityBadgeWidget(icon: e))?.toList());
    // }

    // 勋章标签 118:礼物之王 / 119:礼物之星
    if (Util.validList(_profileData?.base.badges)) {
      for (HomeProfileBadgeItem item in _profileData!.base.badges) {
        if (Util.validStr(item.additionName) && Util.validStr(item.icon)) {
          if (item.giftBadgeType == 3) {
            tags.add(AppreciatorTagWidget(icon: item.icon, label: item.additionName));
          } else {
            tags.add(GiftKingOrStarWithGiftNameTag(
              name: item.additionName,
              icon: item.icon,
              color: Colors.white,
              //item.badgeId == 119 ? const Color(0xFFf8cf62) : Colors.white,
              width: 67,
              height: 26,
              fontSize: 8,
              shadowColor: item.badgeId == 119 ? const Color(0xffDD0020) : null,
              awakeGift: item.awakeGift,
            ));
          }
        } else if (Util.validStr(item.icon)) {
          tags.add(ActivityBadgeWidget(icon: item.icon));
        }
      }
    }

    return _showGloryCenter == false
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () {
              if (!_showGloryCenter) return;
              GloryCenterScreen.show(context, widget.uid);
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      Assets.acBadgeBg,
                    ),
                    fit: BoxFit.fitWidth),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  // if (!Util.validList(tags)) ...[
                  //   R.img('profile_glory_center_entry_star.webp', width: 22, height: 22, package: ComponentManager.MANAGER_PERSONALDATA),
                  //   const SizedBox(width: 4)
                  // ],
                  Image.asset(
                    Assets.acBadgeIcon,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text('荣誉中心', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                  // Expanded(
                  //     child: Util.validList(tags)
                  //         ? Wrap(
                  //             alignment: WrapAlignment.start,
                  //             spacing: 4.0,
                  //             crossAxisAlignment: WrapCrossAlignment.center,
                  //             children: tags,
                  //           )
                  //         : Text(
                  //             widget.uid == Session.uid ? K.personaldata_my_badge_center : K.personaldata_ta_badge_center,
                  //             style: TextStyle(color: R.colors.mainTextColor, fontSize: 14),
                  //           )),
                  Expanded(child: Container()),
                  if (_showGloryCenter)
                    R.img(
                      'ic_next.svg',
                      width: 16,
                      height: 16,
                      color: R.colors.thirdTextColor,
                      package: ComponentManager.MANAGER_PROFILE,
                    ),
                ],
              ),
            ),
          );
  }

  Widget _buildTabContent(TabItem item) {
    Widget? contentWidget;
    if (item.type == ImageScreenTabType.info) {
      contentWidget = InfoPageWidget(
          profile: _profileData,
          reload: _onRefresh,
          changeToMoment: _scrollToMomentTab,
          toImageModifyScreen: _toImageModifyScreen,
          profileSyncData: _profileSyncData);
    } else if (item.type == ImageScreenTabType.zone) {
      contentWidget =
          ZoneWidget(uid: _profileData?.base.uid ?? 0, profile: _profileData, profileSync: _profileSyncData, reload: _onRefresh);
    } else if (item.type == ImageScreenTabType.moment) {
      contentWidget = MomentListWidget(uid: _profileData?.base.uid ?? 0);
    }
    return NestedScrollViewInnerScrollPositionKeyWidget(Key(item.type ?? ''), contentWidget ?? const SizedBox.shrink());
  }

  /// 渲染主页面
  Widget _buildBody(bool isTop) {
    if (_tabController == null || _tabController!.length != tab.length) {
      _tabController = ExtendedTabController(initialIndex: _getInitTabIndex(widget.initialTab), length: tab.length, vsync: this);
    }

    return CommonNestedScrollView(
      controller: _customScrollViewController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          _buildAppBar(context, isTop),
          _buildBasic(),
        ];
      },
      body: Container(
        decoration: BoxDecoration(
            color: R.colors.homeBgColor,
            // Fix两个容器之间出现的分割线
            border: Border.all(
              width: 0,
              color: R.colors.homeBgColor,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTab(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: tab.map((tabItem) => _buildTabContent(tabItem)).toList(),
              ),
            ),
          ],
        ),
      ),
      innerScrollPositionKeyBuilder: () {
        return Key(tab[_tabController!.index].type ?? '');
      },
      pinnedHeaderSliverHeightBuilder: () => MediaQuery.of(context).padding.top + kToolbarHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    int deleted = 0;
    if (_me == false && _profileData != null) {
      deleted = Util.parseInt(_profileData?.base.deleted);
    }
    if (_loading == true || _error != null || deleted > 0) {
      return _renderWait();
    }

    bool isTop = _isInTop;
    if (_isAlwaysTop) {
      isTop = false;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: _buildBody(isTop),
              ),
              _renderFooter()
            ],
          ),
          PositionedDirectional(
            bottom: 88 + _footerBottomPadding(),
            height: 68,
            start: 0,
            end: 0,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomStart,
                        colors: [R.colors.homeBgColor.withOpacity(0), R.colors.homeBgColor.withOpacity(1)])),
              ),
            ),
          ),
          if (_completenessValue < 60 && _me)
            PositionedDirectional(
                start: ((Util.width - 48) / 5 * 3 - 164) / 2 + 20,
                bottom: 72 + _footerBottomPadding(),
                child: BottomTipsWidget(
                  _profileData?.base.sex ?? 0,
                  msg: K.personal_completeness_bubble,
                  callback: () {
                    if (mounted) {
                      setState(() {});
                    }
                  },
                )),
          if (_showTips)
            PositionedDirectional(
                start: ((Util.width - 48) / 5 * 3 - 164) / 2 + 20,
                bottom: 72 + _footerBottomPadding(),
                child: BottomTipsWidget(
                  _profileData?.base.sex ?? 0,
                  callback: () {
                    _showTips = false;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                )),
          if (_profileData?.hasDecorate() == true &&
              (((_profileData?.decorate.giftId ?? 0) > 0 && (_profileData?.decorate.vapSize ?? 0) > 0) ||
                  _profileData?.decorate.image.isNotEmpty == true) &&
              _showDecorate)
            PositionedDirectional(
              top: 0,
              start: 0,
              end: 0,
              bottom: 0,
              child: Stack(
                children: [
                  if (_profileData?.decorate.showType == 1) ...LoveCatDecorateWidget.iconList(_profileData!.decorate.imageText),
                  DecorateDisplayWidget(
                    effect: Decorate(_profileData?.decorate.giftId ?? 0, _profileData?.decorate.vapSize ?? 0,
                        image: _profileData?.decorate.image),
                    onError: () {
                      Log.d('DecorateDisplayWidgetonError');
                    },
                    onComplete: () {
                      Log.d('DecorateDisplayWidgetonComplete');
                    },
                  ),
                  if (_profileData?.decorate.showType == 1) ...LoveCatDecorateWidget.nameList(_profileData!.decorate.imageText),
                ],
              ),
            ),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context, bool isTop) {
    bool isTop = _isInTop;
    if (_isAlwaysTop) {
      isTop = false;
    }
    return SliverAppBar(
      backgroundColor: R.colors.homeBgColor,
      automaticallyImplyLeading: false,
      systemOverlayStyle: isTop || darkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      iconTheme: isTop ? Theme.of(context).iconTheme.copyWith(color: R.colors.mainBgColor) : Theme.of(context).iconTheme,
      elevation: 0.0,
      title: GestureDetector(
        onDoubleTap: _scrollToTop,
        child: Container(
            alignment: Alignment.center,
            child: isTop
                ? Text(
                    '',
                    style: TextStyle(color: R.colors.mainTextColor),
                  )
                : LimitedBox(
                    maxWidth: 200,
                    child: Text(
                      _profileData?.displayName ?? '',
                      style: TextStyle(color: R.colors.mainTextColor),
                      overflow: TextOverflow.ellipsis,
                    ))),
      ),
      expandedHeight: MediaQuery.of(context).size.width,
      pinned: true,
      floating: false,
      snap: false,
      leading: IconButton(
          padding: const EdgeInsets.all(0.0),
          icon: Container(
            width: 36.0,
            height: 36.0,
            margin: const EdgeInsetsDirectional.only(start: 8.0, top: 2),
            alignment: Alignment.center,
            child: Center(
              child: R.img(
                "ic_titlebar_profile_back.svg",
                width: 24,
                height: 24,
                color: isTop ? Colors.white : R.colors.mainTextColor,
                package: ComponentManager.MANAGER_PERSONALDATA,
              ),
            ),
          ),
          onPressed: () {
            PulseLog.instance.event('click_event', properties: {
              'click_tag': 'personal_back_${widget.uid}',
            });
            Navigator.pop(context);
          }),
      actions: _buildActions(isTop),
      flexibleSpace: FlexibleSpaceBar(
        background: _buildSlipper(),
      ),
      bottom: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Container(
          height: 23.0,
          alignment: Alignment.bottomCenter,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              PositionedDirectional(
                start: 0.0,
                end: 0.0,
                bottom: -1.0,
                height: 16.0,
                child: Container(
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: R.colors.homeBgColor,
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(16.0),
                      topEnd: Radius.circular(16.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildActions(bool isTop) {
    List<Widget> actions = [];

    if (!isTop && !widget.fromSayHiMatch) actions.add(_buildAttentionBtn());
    if (!_me) {
      actions.add(IconButton(
        padding: const EdgeInsets.all(0.0),
        icon: Container(
          margin: const EdgeInsetsDirectional.only(end: 12, top: 2),
          width: 36.0,
          height: 36.0,
          child: Center(
            child: Icon(
              Icons.more_horiz,
              color: isTop ? Colors.white : R.colors.mainTextColor,
            ),
          ),
        ),
        onPressed: _displayMenu,
      ));
    }

    return actions;
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSizeWidget child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
