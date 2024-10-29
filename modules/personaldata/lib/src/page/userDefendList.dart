import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/model/defend_bean.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/model/defend_bean.dart';

/// 守护列表
class UserDefendListScreen extends StatefulWidget {
  final int uid;

  const UserDefendListScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _UserDefendListState createState() => _UserDefendListState();

  static Future<bool?> showUserDefendListScreen(BuildContext context,
      {int uid = 0}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => UserDefendListScreen(
        uid: uid,
      ),
      settings: const RouteSettings(name: '/userDefendList'),
    ));
  }
}

class _UserDefendListState extends State<UserDefendListScreen> {
  List<DefendRelationModel> _data = [];

  bool _loading = false;
  late ScrollController _controller;
  bool _more = false;
  int _page = 1;
  bool _defendChanged = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_onScroll);
    _onRefresh();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  _loadJson() async {
    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}profile/defendList/?version=5&uid=${widget.uid}&page=$_page",
        throwOnError: true,
      );
      DefendListResponse defendListResponse =
          DefendListResponse.fromJson(response.value() as Map<String, dynamic>);
      if (_page == 1) {
        _data.clear();
        _data = defendListResponse.data ?? [];
      } else {
        _data.addAll(defendListResponse.data ?? []);
      }
      _page++;
      _more = defendListResponse.more;
    } catch (e) {
      Log.d(e.toString());
    }
  }

  _load() async {
    // 判断
    if (_loading) {
      return;
    }
    _loading = true;

    await _loadJson();

    // 显示数据
    _loading = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _onRefresh() async {
    _page = 1;
    await _load();
  }

  _onScroll() {
    if (_more == true &&
        _loading == false &&
        _controller.position.maxScrollExtent == _controller.offset) {
      _load();
    }
  }

  Widget _renderExtend() {
    return Container(
      height: 50.0,
      color: R.color.mainBgColor,
      child: Center(
        child: Text(
          _more ? BaseK.K.common_loading : BaseK.K.common_no_more,
          textScaleFactor: 1.0,
          style:
              TextStyle(fontSize: 12.0, color: Theme.of(context).dividerColor),
        ),
      ),
    );
  }

  _buyDefend() async {
    if (Session.isLogined == false) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return;
    }
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager
        .openUserDefendBuyShowModalBottomSheet(context, uid: widget.uid)
        .then((value) {
      if (value == true) {
        _defendChanged = true;
        _onRefresh();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool myself = (Session.uid != widget.uid);
    return Scaffold(
      appBar: myself
          ? BaseAppBar(
              K.personal_defend,
              actionTitle: K.buy_defend,
              actionColor: R.color.mainBrandColor,
              onPressed: _buyDefend,
              onBackPressedCallback: () async {
                Navigator.of(this.context).pop(_defendChanged);
              },
            )
          : BaseAppBar.custom(
              actions: [
                GestureDetector(
                  onTap: () {
                    String url = Util.getHelpUrlWithQStr('k63');
                    BaseWebviewScreen.show(context, url: url);
                  },
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(end: 20),
                    alignment: AlignmentDirectional.center,
                    child: R.img(
                      'ic_info.svg',
                      color: R.color.mainTextColor,
                      width: 24,
                      height: 24,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ),
                ),
              ],
              onBackPressedCallback: () async {
                Navigator.of(this.context).pop(_defendChanged);
              },
              title: Text(
                K.personal_defend,
                style: TextStyle(fontSize: 17, color: R.color.mainTextColor),
              ),
            ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_data.isEmpty) {
      return ErrorData(
        error: K.personaldata_no_data,
        onTap: () {
          _onRefresh();
        },
      );
    }

    return RefreshIndicatorFactory.of(
      onRefresh: _onRefresh,
      child: CustomScrollView(
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                DefendRelationModel model = _data.elementAt(index);
                return _DefendItem(
                  data: model,
                );
              },
              childCount: _data.length,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [_renderExtend()],
            ),
          ),
        ],
      ),
    );
  }
}

/// 守护列表item
class _DefendItem extends StatelessWidget {
  final DefendRelationModel? data;

  const _DefendItem({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    if (data?.level == 2) {
      textColor = const Color(0xFF8A3E1B);
    } else if (data?.level == 3) {
      textColor = const Color(0xFF25234B);
    }
    return InkWell(
      onTap: () {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(context, data?.uid ?? 0,
            refer: const PageRefer('UserDefendListScreen'));
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 20, end: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            DefendRelationHeader(
              iconSize: 68,
              defendRelationModel: data,
              showBorderIcon: true,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data?.name ?? '',
                    maxLines: 1,
                    style: R.textStyle.regular16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          K.remain(['', (data?.expire ?? '')]),
                          style: TextStyle(
                              color: R.color.secondTextColor, fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 100,
              alignment: AlignmentDirectional.centerEnd,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if ((data?.level ?? 0) > 1)
                    Container(
                      width: 64,
                      height: 22,
                      alignment: AlignmentDirectional.center,
                      margin: const EdgeInsetsDirectional.only(bottom: 4),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            R.imagePath(
                              RoomAssets.defend_ic_defend_tips_x_webp(
                                  data!.level!),
                              package: ComponentManager.MANAGER_BASE_ROOM,
                            ),
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text(
                        '${(data?.levelName ?? '')}${data?.title ?? ''}',
                        style: R.textStyle.medium12
                            .copyWith(fontSize: 9, color: textColor),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Text(
                      data?.defendValue ?? '',
                      textAlign: TextAlign.end,
                      style: R.textStyle.regular14
                          .copyWith(color: R.color.secondaryBrandColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
