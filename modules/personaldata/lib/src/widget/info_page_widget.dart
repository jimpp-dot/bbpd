import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart' hide RefreshCallback;
import 'package:personaldata/src/personal_util.dart';
import 'package:personaldata/src/widget/otherInfoWidget.dart';

import '../../k.dart';
import '../../personaldata.dart';
import '../page/accompany_remember/accompany_remember_manager.dart';
import 'interest_widget.dart';

/// 个人主页面-资料
class InfoPageWidget extends StatefulWidget {
  final HomeProfileData? profile;
  final HomeProfileSyncData? profileSyncData;
  final RefreshCallback reload;
  final VoidCallback? changeToMoment;
  final VoidCallback? toImageModifyScreen;

  const InfoPageWidget(
      {Key? key,
      this.profile,
      required this.reload,
      this.changeToMoment,
      this.toImageModifyScreen,
      this.profileSyncData})
      : super(key: key);

  @override
  _InfoPageWidgetState createState() => _InfoPageWidgetState();
}

class _InfoPageWidgetState extends State<InfoPageWidget>
    with AutomaticKeepAliveClientMixin<InfoPageWidget> {
  List<CirclePicItem>? _momentAlbumList;
  int _momentCount = 0;

  _loadData() {
    Api.getCirclePics(widget.profile?.base.uid ?? 0, 0).then((value) {
      if (value.success) {
        _momentAlbumList = value.data.list;
        _momentCount = value.data.total;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Widget _buildDetail() {
    double itemPadding = 8;

    List<Widget> widgets = [];
    widgets.add(Text(
      K.personal_info,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: R.colors.mainTextColor),
    ));
    widgets.add(SizedBox(
      height: itemPadding,
    ));

    TextStyle infoStyle = TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: R.colors.secondTextColor);

    //星座
    String astro =
        PersonalUtil.getConstellation(widget.profile?.base.birthday ?? '');
    if (astro.isNotEmpty) {
      widgets.add(SizedBox(
        height: itemPadding,
      ));
      widgets.add(Text(
        '${K.personaldata_constellation}$astro',
        style: infoStyle,
      ));
    }

    /* 暂时去掉职业的录入与显示
    //职业
    int job = Util.parseInt(widget.profile.base.job);
    if (job > 0) {
      widgets.add(SizedBox(
        height: itemPadding,
      ));

      widgets.add(Text(
        '${K.personaldata_job}${Job.getLabel(job)}',
        style: infoStyle,
      ));
    } else {
      if (Session.uid == widget.profile.base.uid) {
        widgets.add(SizedBox(
          height: itemPadding,
        ));

        widgets.add(GestureDetector(
          child: Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(text: K.personaldata_job, style: infoStyle),
                TextSpan(text: K.personal_write_job, style: TextStyle(fontFamily: Util.fontFamily, fontSize: 14, color: R.color.mainBrandColor))
              ])),
              SizedBox(
                width: 3,
              ),
              R.img('ic_profile_next.svg', color: R.color.mainBrandColor, width: 16, height: 16, package: ComponentManager.MANAGER_PERSONALDATA),
            ],
          ),
          onTap: () => widget.toImageModifyScreen(),
        ));
      }
    }
    */

    //签名
    if (Util.validStr(widget.profile?.base.sign)) {
      widgets.add(SizedBox(
        height: itemPadding,
      ));

      widgets.add(Text(
        '${K.personaldata_sign}${widget.profile?.base.sign}',
        style: infoStyle,
      ));
    } else {
      if (Session.uid == widget.profile?.base.uid) {
        widgets.add(SizedBox(
          height: itemPadding,
        ));

        widgets.add(GestureDetector(
          child: Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(text: K.personaldata_sign, style: infoStyle),
                TextSpan(
                    text: K.personal_write_sign,
                    style: TextStyle(
                        fontFamily: Util.fontFamily,
                        fontSize: 14,
                        color: R.colors.tagTextV2Color))
              ])),
              const SizedBox(
                width: 3,
              ),
              R.img('ic_profile_next.svg',
                  color: R.colors.tagTextV2Color,
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_PERSONALDATA),
            ],
          ),
          onTap: () {
            if (widget.toImageModifyScreen != null) {
              widget.toImageModifyScreen!();
            }
          },
        ));
      }
    }

    //家乡
    if (widget.profile?.card.hometownCity != null &&
        widget.profile!.card.hometownCity.isNotEmpty) {
      widgets.add(SizedBox(
        height: itemPadding,
      ));

      widgets.add(Text(
        '${K.personal_screen_hometown}${widget.profile?.card.hometownCity ?? ''}',
        style: infoStyle,
      ));
    } else {
      if (Session.uid == widget.profile?.base.uid) {
        widgets.add(SizedBox(
          height: itemPadding,
        ));

        widgets.add(GestureDetector(
          child: Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(text: K.personal_screen_hometown, style: infoStyle),
                TextSpan(
                    text: K.personal_write_home,
                    style: TextStyle(
                        fontFamily: Util.fontFamily,
                        fontSize: 14,
                        color: R.colors.tagTextV2Color))
              ])),
              const SizedBox(
                width: 3,
              ),
              R.img('ic_profile_next.svg',
                  color: R.colors.tagTextV2Color,
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_PERSONALDATA),
            ],
          ),
          onTap: () {
            if (widget.toImageModifyScreen != null) {
              widget.toImageModifyScreen!();
            }
          },
        ));
      }
    }

    //录音简介
    if (widget.profile?.hasCard() == true &&
        Util.validStr(widget.profile?.card.audio) &&
        Util.parseDouble(widget.profile?.card.duration) > 0) {
      widgets.add(SizedBox(
        height: itemPadding,
      ));

      widgets.add(Row(
        children: [
          Text(
            K.personal_brief_voice,
            style: infoStyle,
          ),
          SoundStadiumButton(
            audioUrl: widget.profile!.card.audio,
            duration: Util.parseInt(widget.profile!.card.duration),
            supportDark: true,
          ),
        ],
      ));
    } else {
      if (Session.uid == widget.profile?.base.uid) {
        widgets.add(SizedBox(
          height: itemPadding,
        ));

        widgets.add(GestureDetector(
          child: Row(
            children: [
              Text(
                K.personal_brief_voice,
                style: infoStyle,
              ),
              Container(
                height: 28,
                padding: const EdgeInsetsDirectional.only(start: 5, end: 10),
                decoration: BoxDecoration(
                  color: R.colors.mainBgColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(color: const Color(0x1AFFFFFF), width: 1),
                ),
                child: Row(
                  children: [
                    R.img(
                      'ic_soundplay.svg',
                      width: 20,
                      height: 20,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                      color: R.colors.tagTextV2Color,
                    ),
                    Text(
                      K.personal_write_voice,
                      style: TextStyle(
                        fontFamily: Util.fontFamily,
                        fontSize: 14,
                        color: R.colors.tagTextV2Color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            if (widget.toImageModifyScreen != null) {
              widget.toImageModifyScreen!();
            }
          },
        ));
      }
    }

    widgets.add(SizedBox(
      height: itemPadding * 2.5,
    ));
    widgets.add(Container(
      color: R.colors.dividerColor,
      height: 0.5,
    ));

    if (widgets.length == 4) {
      //无有效信息
      return const SizedBox.shrink();
    }

    return Container(
      padding:
          const EdgeInsetsDirectional.only(start: 16.0, end: 16.0, top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  bool get isSelf {
    return Session.uid == widget.profile?.base.uid;
  }

  Widget _buildInterestWidget(bool aboutMe) {
    if (aboutMe) {
      if (isSelf) {
        return InterestWidget(
            uid: widget.profile?.base.uid ?? 0,
            profileBean: widget.profile,
            aboutMe: aboutMe,
            toImageModifyScreen: () {
              if (widget.toImageModifyScreen != null) {
                widget.toImageModifyScreen!();
              }
            });
      } else {
        if (Util.validList(widget.profile?.tag.tags)) {
          return InterestWidget(
              uid: widget.profile?.base.uid ?? 0,
              profileBean: widget.profile,
              aboutMe: aboutMe);
        }
        return Container();
      }
    } else {
      if (isSelf) {
        return InterestWidget(
            uid: widget.profile?.base.uid ?? 0,
            profileBean: widget.profile,
            aboutMe: aboutMe,
            toImageModifyScreen: () {
              if (widget.toImageModifyScreen != null) {
                widget.toImageModifyScreen!();
              }
            });
      } else {
        if (Util.validList(widget.profile?.tag.friendTags)) {
          return InterestWidget(
              uid: widget.profile?.base.uid ?? 0,
              profileBean: widget.profile,
              aboutMe: aboutMe);
        }
        return Container();
      }
    }
  }

  /// 音色标签
  Widget _buildVoiceTagsWidget() {
    if (widget.profile == null || widget.profile!.voiceTag.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding:
          const EdgeInsetsDirectional.only(start: 16.0, end: 16.0, top: 16.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(K.personal_info_voice_tag,
                style: TextStyle(
                    fontSize: 14,
                    color: R.colors.mainTextColor,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 64,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext c, int i) {
                    HomeProfileVoiceTag? model = widget.profile?.voiceTag[i];
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: model?.icon ?? '',
                          width: 88,
                          height: 32,
                          cachedWidth: 264,
                          cachedHeight: 96,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 33),
                          child: SizedBox(
                              width: 55,
                              child: Text(
                                model?.name ?? '',
                                style: const TextStyle(
                                    fontSize: 13, color: Color(0xFFFFFFFF)),
                                overflow: TextOverflow.ellipsis,
                              )),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext c, int i) => const SizedBox(
                        width: 8,
                      ),
                  itemCount: widget.profile?.voiceTag.length ?? 0),
            ),
            Container(
              color: R.colors.dividerColor,
              height: 0.5,
            )
          ]),
    );
  }

  // 明星加V标签 status:身份
  _buildStarVerifyWidget(int starVerifyTag, String starVerifyDesc) {
    if (!(widget.profile?.base.hasStarVerifyTag() == true &&
        (widget.profile?.base.starVerifyTag == 1 ||
            widget.profile?.base.starVerifyTag == 2 ||
            widget.profile?.base.starVerifyTag == 3) &&
        widget.profile?.base.hasStarVerifyDesc() == true &&
        widget.profile?.base.starVerifyDesc.isNotEmpty == true)) {
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              UserStarVerifyWidget(
                padding: const EdgeInsetsDirectional.only(end: 2),
                starVerifyTag: starVerifyTag,
              ),
              Text(
                starVerifyDesc,
                style: TextStyle(
                  fontSize: 14,
                  color: R.colors.mainTextColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0),
          color: R.colors.dividerColor,
          height: 0.5,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicatorFactory.of(
        child: CustomScrollView(
          key: const PageStorageKey<String>(ImageScreenTabType.info),
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                // 明星加V标签
                // ...[
                //   // 陪伴记
                //   if (widget.profileSyncData != null && widget.profileSyncData!.hasImprint())
                //     AccompanyRememberManager.getAccompanyRememberItemToIndividualInfoCard(
                //         widget.profile?.base.uid ?? 0, widget.profileSyncData!.imprint),
                // ].where((element) => element != null),

                GiftWallWidget(
                  gifts: widget.profile?.gift,
                  giftWall: widget.profile?.giftWall,
                  uid: widget.profile?.base.uid ?? 0,
                  giftChange: widget.reload,
                ),

                // 动态预览
                if (_momentAlbumList != null &&
                    _momentAlbumList!.isNotEmpty &&
                    _momentCount > 0) ...[
                  MomentPreviewWidget(
                    photos: _momentAlbumList,
                    onPressed: widget.changeToMoment,
                    momentCount: _momentCount,
                    start: 16,
                    end: 16,
                    padding: const EdgeInsetsDirectional.only(
                        top: 12, bottom: 8, end: 16),
                  ),
                ],
                ...[
                  // 关于我
                  _buildInterestWidget(true),
                  // 希望认识
                  _buildInterestWidget(false),
                  Divider(
                    color: R.colors.dividerColor,
                    height: 0.5,
                    indent: 16,
                    endIndent: 16,
                  ),
                  // 音色卡
                  _buildVoiceTagsWidget(),
                  // 明星加V标签
                  _buildStarVerifyWidget(
                      widget.profile?.base.starVerifyTag ?? 0,
                      widget.profile?.base.starVerifyDesc ?? ''),
                  // 个人信息
                  _buildDetail(),
                ].where((element) => element != null),

                // 其他信息
                OtherInfoWidget(
                  profileBean: widget.profile,
                ),
                const SizedBox(height: 32),
              ]),
            )
          ],
        ),
        onRefresh: widget.reload);
  }

  @override
  bool get wantKeepAlive => true;
}
