import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/create_party_beans.dart';
import 'package:chat_room/src/base/repo/room_create_repo.dart';
import 'package:flutter/material.dart';

import '../create_room/create_party_screen.dart';

class PartyListScreen extends StatefulWidget {
  /// 商业房创建关联个人房，该页面仅返回用户选择创建房间的type
  final bool onlySelectRoomType;

  const PartyListScreen({Key? key, this.onlySelectRoomType = false})
      : super(key: key);

  static Future<int?> show(BuildContext context, {String? refer}) {
    return displayModalBottomSheet(
        context: System.context,
        isBarrierDismissible: true,
        fullscreenDialog: false,
        disableTapDismissible: true,
        maxHeightRatio: 0.78,
        builder: (BuildContext context) {
          return const PartyListScreen();
        });
  }

  /// 仅返回用户所选房间type，不在此次调用里进行真正的创建房间
  static Future<String?> showPartyList(BuildContext context) {
    return displayModalBottomSheet(
        context: System.context,
        isBarrierDismissible: true,
        fullscreenDialog: false,
        disableTapDismissible: true,
        maxHeightRatio: 0.78,
        builder: (BuildContext context) {
          return const PartyListScreen(onlySelectRoomType: true);
        });
  }

  @override
  _PartyListScreenState createState() => _PartyListScreenState();
}

class _PartyListScreenState extends BaseScreenState<PartyListScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  List<PartyList>? _partyList;

  static const double gap = 16.0;

  static const int count = 2;

  static const double childAspectRatio = 2.89;

  final GlobalKey<NavigatorState> _naviKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      if (mounted) {
        showLicenseDialog();
      }
    });
    _loadData();
  }

  void _loadData() async {
    /// onlySelectRoomType需要过滤部分房型，比如海龟汤（创建流程没法跟创建小房邀请的流程结合）
    DataRsp<List<PartyList>> resp = await PartyCreateRepo.getPartyList(
        source: widget.onlySelectRoomType ? 'drainage' : '');
    if (resp.success == true) {
      _partyList = resp.data;
      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  showLicenseDialog() async {
    bool? createLicenseAgreed =
        'true' == Config.get('createLicenseAgreed', 'false');
    if (!createLicenseAgreed) {
      String url = Util.licenseUrl(LicenseType.CREATE_FLEET);
      createLicenseAgreed = await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return LicenseDialog(title: K.room_create_room_protocl, url: url);
          });

      if (createLicenseAgreed != null && createLicenseAgreed) {
        Config.set('createLicenseAgreed', 'true');
      } else {
        if (Navigator.of(context).canPop()) Navigator.of(context).pop();
      }
    }
  }

  _onTapItem(Party item) async {
    if (widget.onlySelectRoomType) {
      /// 仅选择需要创建的房间Type
      Navigator.pop(context, item.partyType);
      return;
    }

    int? rid = await _naviKey.currentState?.push(
      DisappearBottomRoute(
        builder: (context) => CreatePartyScreen(
            partyType: item.partyType,
            refer: 'party_list',
            openRoomScreen: true),
      ),
    );
    Log.d("StartPartyScreen rid = $rid");
    if (rid != null) {
      if (rid == -1) {
        Navigator.pop(context);
      } else {
        Navigator.pop(context, rid);
      }
    }
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(44),
      child: BaseAppBar.custom(
        leading: CloseButton(
          color: R.color.mainTextColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        showBack: false,
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    for (PartyList element in _partyList!) {
      if (Platform.isIOS) {
        element.list.removeWhere((element) => element.partyType == 'movie');
      }

      String? name = element.name;
      if (name.isEmpty) {
        name = R.string("room_create_${element.type}");
      }
      widgets.add(SliverPersistentHeader(
        delegate: _SectionHeaderDelegate(name),
        pinned: true,
      ));
      widgets.add(SliverGrid.count(
        mainAxisSpacing: gap,
        crossAxisSpacing: gap,
        crossAxisCount: count,
        childAspectRatio: childAspectRatio,
        // shrinkWrap: true,
        children: element.list
            .map((item) => _PartyItemWidget(
                  item: item,
                  onTap: () => _onTapItem(item),
                ))
            .toList(),
      ));
    }
    return widgets;
  }

  @override
  Widget buildContent() {
    return Container(
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(16), topEnd: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8.0),
            child: CloseButton(
              color: R.color.mainTextColor,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                PositionedDirectional(
                  top: -25,
                  start: 20,
                  child: R.img(
                    'create_step1.svg',
                    width: 133,
                    height: 117,
                    color: R.color.secondBgColor,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
                Container(
                  color: R.color.mainBgColor,
                  margin: const EdgeInsetsDirectional.only(top: 30),
                  padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        K.room_choose_party_type,
                        style: TextStyle(
                            fontSize: 24.0,
                            color: R.color.mainTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        K.room_invite_friend_title,
                        style: TextStyle(
                            fontSize: 14.0, color: R.color.mainTextColor),
                      ),
                      Expanded(
                        child: CustomScrollView(
                          slivers: <Widget>[
                            ..._buildList(),
                            const SliverToBoxAdapter(
                                child: SizedBox(height: 50)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _naviKey,
      onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
          builder: (BuildContext _) => buildStatusContent(),
          settings: settings),
    );
  }
}

class _PartyItemWidget extends StatelessWidget {
  final Party item;
  final VoidCallback? onTap;

  const _PartyItemWidget({Key? key, required this.item, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: R.color.secondBgColor),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      child: CachedNetworkImage(
                        imageUrl: Util.getRemoteImgUrl(item.abstractIcon),
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.display,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: R.color.mainTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                        if (item.tag.isNotEmpty)
                          Container(
                            margin: const EdgeInsetsDirectional.only(top: 2),
                            padding: const EdgeInsetsDirectional.only(
                                start: 3, end: 3, top: 1),
                            alignment: AlignmentDirectional.center,
                            height: 12,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: R.color.mainBrandColor,
                                  width: 0.2,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4))),
                            child: Text(
                              item.tag,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 9,
                                  color: R.color.mainBrandColor,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Offstage(
              offstage: item.cornerIcon.isEmpty,
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: CachedNetworkImage(
                  imageUrl: Util.getRemoteImgUrl(item.cornerIcon),
                  scale: 3.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final double height = 0;

  _SectionHeaderDelegate(this.title);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: R.color.mainBgColor,
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: TextStyle(fontSize: 14.0, color: R.color.secondTextColor),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
