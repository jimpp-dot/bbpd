import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';

class IntimacyListScreen extends StatefulWidget {
  final int uid;
  final bool isTab;

  const IntimacyListScreen({Key? key, this.uid = 0, this.isTab = false})
      : super(key: key);

  static void show(BuildContext context, int uid) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => IntimacyListScreen(
        uid: uid,
      ),
      settings: const RouteSettings(name: '/intimacylist'),
    ));
  }

  @override
  IntimacyListState createState() {
    return IntimacyListState();
  }
}

class IntimacyListState extends State<IntimacyListScreen>
    with AutomaticKeepAliveClientMixin {
  List? _intimacyList;
  String myRank = '0';
  int myDegree = 0;

  bool _loading = true;

  // 是否在榜单中展示自己
  bool _hideIntimacy = false;

  // 是否展示隐身Switch widget(自己榜单不展示/不在排行榜且没设置hide不展示)
  bool _canShowHideSwitch = true;

  @override
  void initState() {
    super.initState();
    load();

    eventCenter.addListener('Gift.SendSuccess', _onSendGift);
  }

  @override
  void dispose() {
    super.dispose();

    eventCenter.removeListener("Gift.SendSuccess", _onSendGift);
  }

  @override
  bool get wantKeepAlive => true;

  load() async {
    try {
      XhrResponse response = await Xhr.getJson(
          "${System.domain}intimate/topList/?version=7&uid=${widget.uid}",
          throwOnError: true);

      Map res = response.value();
      if (res['success'] == true) {
        Map data = res['data'];
        if (data['isBlocked'] == true) {
          // 被对方拉黑，不展示亲密度榜单
          if (mounted) {
            if (data['msg'] != null) {
              Fluttertoast.showToast(
                  msg: data['msg'], gravity: ToastGravity.CENTER);
            }
            Navigator.of(context).pop();
          }
          return;
        }

        _intimacyList = data['list'];
        myRank = data['mineRank']['ranking'];
        myDegree = Util.parseInt(data['mineRank']['degree']);
        _hideIntimacy = Util.parseInt(data['mineRank']['state']) == 1;

        if (Session.uid == widget.uid) {
          // 自己的榜单不展示hide Switch
          _canShowHideSwitch = false;
        } else if (_hideIntimacy) {
          // 设置了不在榜单展示，需要展示hide switch
          _canShowHideSwitch = true;
        } else {
          // 如果不在榜单不展示
          _canShowHideSwitch = false;
          for (int i = 0; i < (_intimacyList?.length ?? 0); i++) {
            if (_intimacyList?[i]['suid'] == '${Session.uid}') {
              // 在榜单才展示
              _canShowHideSwitch = true;
              break;
            }
          }
        }
      }

      if (!mounted) return;
      setState(() {
        _loading = false;
      });
    } catch (e) {
      Log.d(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.isTab == true) {
      return _buildBody();
    }
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(R.string('intimacy_list'),
            style: Theme.of(context).textTheme.titleLarge),
        actions: <Widget>[
          InkWell(
            onTap: () {
              var url = Util.getHelpUrlWithQStr('k28');
              BaseWebviewScreen.show(context, url: url);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(end: 16, start: 16),
              alignment: Alignment.center,
              child: R.img('titlebar/ic_titlebar_question.svg',
                  width: 24,
                  height: 24,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
        child: Loading(),
      );
    }

    return Container(
      child: showRankListByKey(intimateKey)
          ? Column(
              children: <Widget>[
                _buildIntimacyList(),
                _buildBottomSendGiftLayout(),
              ],
            )
          : Center(
              child: Text(
                K.personaldata_no_more_data,
                style: TextStyle(fontSize: 13, color: Colors.grey[400]),
              ),
            ),
    );
  }

  Widget _buildIntimacyList() {
    if (_intimacyList == null || _intimacyList!.isEmpty) {
      if (_canShowHideSwitch) {
        // 需要展示Switch控件
        return Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: EmptyWidget(
                  desc: K.personaldata_intimacy_no_data,
                ),
              ),
              renderHideIntimacy(-1),
            ],
          ),
        );
      } else {
        return Expanded(
          child: EmptyWidget(
            desc: K.personaldata_intimacy_no_data,
          ),
        );
      }
    }

    int count = max(_intimacyList?.length ?? 0, 3);
    if (_canShowHideSwitch) {
      count++;
    }

    return Expanded(
      child: RefreshIndicatorFactory.of(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 200,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width - 32,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ListView.builder(
                  itemCount: count,
                  addAutomaticKeepAlives: false,
                  padding: const EdgeInsets.all(0.0),
                  itemBuilder: (BuildContext context, int index) {
                    return _renderListAndTop(index);
                  },
                ),
              ),
            ],
          ),
          onRefresh: () async {
            await load();
          }),
    );
  }

  Widget _renderListAndTop(int index) {
    if (index == 0) {
      return SizedBox(
        width: 400,
        height: 259,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PositionedDirectional(
              top: 0,
              start: 0,
              end: 0,
              child: _renderTopThree(),
            ),
            if ((_intimacyList?.length ?? 0) > 3)
              SizedBox(
                height: 79,
                child: _renderItem(3),
              )
          ],
        ),
      );
    } else if (index == 3 || index == 2 || index == 1) {
      if (index == _intimacyList?.length && _canShowHideSwitch) {
        return renderHideIntimacy(index);
      }
      return Container();
    } else if (index == _intimacyList?.length) {
      return renderHideIntimacy(index);
    } else {
      return _renderItem(index);
    }
  }

  Widget _renderTopThree() {
    if (_intimacyList?.isEmpty == true) return Container();

    return SizedBox(
      height: 259,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
          R.img('intimacy_heart_bg.png',
              package: ComponentManager.MANAGER_PERSONALDATA,
              height: 288,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill),
          _renderTopThreeItem(0),
          if ((_intimacyList?.length ?? 0) >= 2)
            PositionedDirectional(
              top: 48,
              start: 14,
              child: _renderTopThreeItem(1),
            ),
          if ((_intimacyList?.length ?? 0) >= 3)
            PositionedDirectional(
              top: 48,
              end: 14,
              child: _renderTopThreeItem(2),
            ),
        ],
      ),
    );
  }

  _renderTopThreeItem(int index) {
    String stageBg;
    Color degreeBgColor;
    String crownImg;
    if (index == 0) {
      stageBg = 'intimacy_top_1.png';
      degreeBgColor = const Color(0xFFFF93B5);
      crownImg = 'intimacy_crown1.svg';
    } else if (index == 1) {
      stageBg = 'intimacy_top_2.png';
      degreeBgColor = const Color(0xFFFFB8B8);
      crownImg = 'intimacy_crown2.svg';
    } else {
      stageBg = 'intimacy_top_3.png';
      degreeBgColor = const Color(0xFFFFC097);
      crownImg = 'intimacy_crown3.svg';
    }

    return SizedBox(
      width: 112,
      height: 194,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: index == 0 ? 53 : 45,
            child: R.img(
              stageBg,
              package: ComponentManager.MANAGER_PERSONALDATA,
              fit: BoxFit.contain,
              height: 180,
              width: 122,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 28),
            child: Column(
              children: <Widget>[
                Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        IPersonalDataManager manager = ComponentManager.instance
                            .getManager(ComponentManager.MANAGER_PERSONALDATA);
                        manager.openImageScreen(context,
                            Util.parseInt(_intimacyList?[index]['suid']),
                            refer: const PageRefer('IntimacyListScreen'));
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32.0)),
                        child: CachedNetworkImage(
                          imageUrl: _intimacyList?[index]['icon'],
                          width: 64.0,
                          height: 64.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  _intimacyList?[index]['name'] ?? '',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
                ),
                if (showRankScoreByKey(intimateKey))
                  Container(
                      decoration: BoxDecoration(
                        color: degreeBgColor,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      alignment: Alignment.center,
                      width: 81,
                      child: Text(
                        "${K.intimacy} ${formatIntimacyDegree(Util.parseInt(_intimacyList?[index]['degree']))}",
                        textAlign: TextAlign.center,
                        style: R.textStyle.subCaption
                            .copyWith(color: Colors.white),
                      )),
              ],
            ),
          ),
          if (showRankByKey(intimateKey))
            Positioned(
              top: 18,
              child: R.img(
                crownImg,
                package: ComponentManager.MANAGER_PERSONALDATA,
              ),
            )
        ],
      ),
    );
  }

  String formatIntimacyDegree(int degree) {
    if (degree >= 10000) {
      return '${(degree / 10000).toStringAsFixed(1)}${R.string('ten_thousand')}';
    } else {
      return degree.toString();
    }
  }

  Widget _renderItem(int index) {
    Color bgColor;
    if (index <= 3) {
      bgColor = Colors.transparent;
    } else if (index % 2 == 0) {
      bgColor = const Color(0xFFFFECF2);
    } else {
      bgColor = const Color(0xFFFFF3F6);
    }
    Map config = _intimacyList?.elementAt(index);
    return InkWell(
      onTap: () {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(context, Util.parseInt(config['suid']),
            refer: const PageRefer('IntimacyListScreen'));
      },
      child: Container(
        color: bgColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (showRankByKey(intimateKey))
              Container(
                alignment: AlignmentDirectional.centerStart,
                margin: const EdgeInsets.only(left: 14),
                child: Text(
                  "${index + 1}",
                  style:
                      TextStyle(color: R.color.secondTextColor, fontSize: 13),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 14.0, right: 12.0, top: 10.0, bottom: 10.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    child: CachedNetworkImage(
                      imageUrl: config['icon'] ?? '',
                      width: 48.0,
                      height: 48.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                config['name'] ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
              ),
            ),
            if (showRankScoreByKey(intimateKey))
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 18.0),
                child: Text(
                  "${K.intimacy} ${formatIntimacyDegree(Util.parseInt(_intimacyList?[index]['degree']))}",
                  textScaleFactor: 1.0,
                  style:
                      const TextStyle(color: Color(0xFFFF4A82), fontSize: 13),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSendGiftLayout() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            left: 18.0, right: 16.0, bottom: Util.iphoneXBottom),
        child: Session.uid == widget.uid
            ? Container()
            : Row(
                children: <Widget>[
                  if (showRankByKey(intimateKey))
                    Text(
                      myRank,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      child: CachedNetworkImage(
                        imageUrl: "${System.imageDomain}${Session.icon}",
                        suffix: '!head150',
                        width: 48.0,
                        height: 48.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(Session.name, style: R.textStyle.subhead),
                        Row(
                          children: <Widget>[
                            Text(
                              K.intimacy_with_user,
                              style: R.textStyle.caption,
                            ),
                            if (showRankScoreByKey(intimateKey))
                              Text(
                                ' ${formatIntimacyDegree(myDegree)}',
                                style: R.textStyle.caption
                                    .copyWith(color: const Color(0xFFFF4A82)),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      IGiftManager giftManager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_GIFT);
                      giftManager.showPrivateGiftPanel(context,
                          uid: widget.uid);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        R.string('personal_send_gift'),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget renderHideIntimacy(int index) {
    Color bgColor;
    if (index == -1) {
      bgColor = R.color.mainBgColor;
    } else if (index % 2 == 0) {
      bgColor = const Color(0xFFFFECF2);
    } else {
      bgColor = const Color(0xFFFFF3F6);
    }

    return SizedBox(
      height: 50.0,
      child: Container(
        padding: const EdgeInsets.only(left: 15.0),
        color: bgColor,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                R.string('hide_in_this_ranklist'),
                style: TextStyle(color: R.color.secondTextColor),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 15.0),
              child: Switch(
                  inactiveTrackColor: R.color.switchInActiveColor,
                  value: _hideIntimacy,
                  onChanged: (bool checked) async {
                    setState(() {
                      _hideIntimacy = checked;
                    });

                    await Xhr.postJson("${System.domain}intimate/hideDegree", {
                      'tuid': widget.uid.toString(),
                      'type': checked ? 'hide' : 'display'
                    });
                    load();
                  }),
            )
          ],
        ),
      ),
    );
  }

  _onSendGift(String type, dynamic data) {
    load();
  }
}
