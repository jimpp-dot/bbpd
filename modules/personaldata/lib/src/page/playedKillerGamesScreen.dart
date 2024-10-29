import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

/// 已玩过剧本
class PlayedKillerGamesScreen extends StatefulWidget {
  final int uid;

  const PlayedKillerGamesScreen({Key? key, required this.uid})
      : super(key: key);

  static Future openPlayedKillerGamesScreen(BuildContext context, int uid,
      {Key? key}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return PlayedKillerGamesScreen(
          uid: uid,
        );
      },
      settings: const RouteSettings(name: '/playedKillerGamesScreen'),
    ));
  }

  @override
  _PlayedKillerGamesScreenState createState() {
    return _PlayedKillerGamesScreenState();
  }
}

class _PlayedKillerGamesScreenState extends State<PlayedKillerGamesScreen> {
  PlayProfileBean? _playProfileBean;
  bool _isSuper = false; //是否超级账号(可查看封禁本)
  List<PlayJuListItem>? _playJuLists;
  bool _loading = false;
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _load() async {
    _loading = true;

    String url = '${System.domain}juben/userInfo';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'cuid': '${widget.uid}',
        },
        throwOnError: true,
      );

      _loading = false;

      if (!mounted) return;

      if (response.error != null) {
        Fluttertoast.toastException(
            exp: response.error, gravity: ToastGravity.CENTER);
        return;
      }

      Map res = response.response as Map;
      if (res['success'] == true) {
        Map data = res['data'];

        Map profile = data['profile'];
        _playProfileBean = PlayProfileBean.fromJson(profile);

        List juList = data['juList'];
        if (juList.isNotEmpty) {
          _playJuLists = [];
          for (var item in juList) {
            if (item != null) {
              PlayJuListItem playJuListItem = PlayJuListItem.fromJson(item);
              _playJuLists?.add(playJuListItem);
            }
          }
        }
        _isSuper = Util.parseBool(data['isSuper'], false);

        setState(() {});
      }
    } catch (e) {
      Log.d("_load e = ${e.toString()}");
    }
  }

  Future _onRefresh() async {
    _load();
  }

  Widget _buildHeader() {
    if (_playProfileBean != null) {
      List<String> vales = [
        K.juben_record_total(['${_playProfileBean?.total}']),
        K.juben_record_level(['${_playProfileBean?.level}']),
        K.juben_record_score(['${_playProfileBean?.score}']),
        K.juben_record_wakeoff(['${_playProfileBean?.run}']),
        K.juben_record_inrate(
            ['${((_playProfileBean?.winRate ?? 0) * 100).toInt()}%']),
      ];

      List<Widget> res = [];
      for (var item in vales) {
        res.add(
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsetsDirectional.only(end: 8.0),
            child: Container(
              height: 24.0,
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: R.color.secondBgColor,
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
              alignment: Alignment.center,
              child: Text(
                item,
                style:
                    TextStyle(color: R.color.secondTextColor, fontSize: 14.0),
              ),
            ),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsets.only(
              top: 24.0,
              bottom: 20.0,
            ),
            child: Text(
              K.juben_record,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 14.0,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 24.0,
//            margin: EdgeInsets.only(left: 16.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: res,
            ),
          ),
          Container(
            height: 24.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildRow(
      int skip, int count, double width, double height, double spacingWidth) {
    int i = 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _playJuLists?.skip(skip).take(count).map((PlayJuListItem item) {
            i++;

            Widget widget = Container(
              width: width,
              height: height,
//          color: Colors.red,
              margin:
                  EdgeInsetsDirectional.only(end: i < count ? spacingWidth : 0),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      color: R.color.thirdBgColor,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: CachedNetworkImage(
                      imageUrl: item.icon,
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      width: width,
                      height: 32.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(8.0),
                          bottomEnd: Radius.circular(8.0),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0x99000000)
                                .withOpacity(0.95)
                                .withOpacity(0),
                            const Color(0x99000000)
                                .withOpacity(0.95)
                                .withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  if (item.deleted == 1)
                    PositionedDirectional(
                      top: 0.0,
                      end: 0.0,
                      child: IgnorePointer(
                        child: R.img(
                          'ic_script_delete.webp',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                ],
              ),
            );
            return widget;
          }).toList(growable: false) ??
          [],
    );
  }

  Widget _renderContent() {
    List<Widget> res = [];

    res.add(
      Container(
        color: R.color.dividerColor,
        height: 0.5,
      ),
    );

    res.add(
      Container(
        alignment: AlignmentDirectional.centerStart,
//        color: Colors.red,
        padding: const EdgeInsets.only(
          top: 24.0,
          bottom: 20.0,
        ),
        child: Text(
          K.juben_played,
          textScaleFactor: 1.0,
          style: TextStyle(
            fontSize: 14.0,
            color: R.color.mainTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

//    _playJuLists = null;
    if (_playJuLists != null && (_playJuLists?.length ?? 0) > 0) {
      int step = 3;
      double itemWidth = 103.0;
      double itemHeight = 103.0;

      double spacingWidth =
          (MediaQuery.of(context).size.width - step * itemWidth - 32.0) /
              (step - 1);

      int len = _playJuLists?.length ?? 0;
      for (int i = 0; i < len; i += step) {
        res.add(_buildRow(i, step, itemWidth, itemHeight, spacingWidth));
        res.add(Container(
          height: 16.0,
        ));
      }
    } else {
      res.add(
        Container(
          alignment: Alignment.center,
          child: Text(
            K.juben_no_played,
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 14.0,
              color: R.color.secondTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return Column(
      children: res,
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return RefreshIndicatorFactory.of(
      key: _key,
      onRefresh: _onRefresh,
      child: ListView(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        children: <Widget>[
          _buildHeader(),
          _renderContent(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: GestureDetector(
//          onDoubleTap: _scrollToTop,
          child: Text(
            K.juben_name,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }
}

class PlayProfileBean {
  int total;
  int level;
  int score;
  int run;
  double winRate;

  PlayProfileBean.fromJson(Map data)
      : total = Util.parseInt(data['ju_count']),
        level = Util.parseInt(data['level']),
        score = Util.parseInt(data['score']),
        run = Util.parseInt(data['run']),
        winRate = Util.parseDouble(data['win_rate']);
}

class PlayJuListItem {
  String jid;
  String name;
  String icon;
  int deleted;

  PlayJuListItem.fromJson(Map data)
      : jid = data['jid'] ?? '',
        name = data['name'] ?? '',
        icon = data['name'] != null ? System.imageDomain + data['icon'] : '',
        deleted = Util.parseInt(data['deleted'], 0);
}
