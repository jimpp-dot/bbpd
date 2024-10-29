import 'package:chat/k.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart' hide SliverAppBar;
import 'package:shared/shared.dart' as prefix0;
import 'package:flutter/material.dart';

import '../../assets.dart';

/// 多人红包详情页
class GroupPackageDetail extends StatefulWidget {
  final int id;
  final PageRefer? refer;

  static Future openGroupPackageDetail(
      BuildContext context, int id, PageRefer? refer) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return GroupPackageDetail(
          id: id,
          refer: PageRefer('GroupPackageDetail', refer),
        );
      }),
    );
  }

  const GroupPackageDetail({super.key, required this.id, this.refer});

  @override
  GroupPackageDetailState createState() => GroupPackageDetailState();
}

class GroupPackageDetailState extends State<GroupPackageDetail> {
  List _data = [];
  Map? _package;
  int _money = 0;
  int _max = 0;
  int _history = 0;

  Color textColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    try {
      String url =
          "${System.domain}fleet/packageResult/?packageId=${widget.id}";
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (!mounted) return;
      Map res = response.value();
      Log.d(res);
      setState(() {
        _money = 0;
        if (res['data'] != null) {
          _data = res['data'];
          for (var value in _data) {
            Map val = value;
            _money += Util.parseInt(val['money']);
          }
        }

        _package = res['package'];
        _max = Util.parseInt(res['max']);
        _history = Util.parseInt(res['history']);
      });
    } catch (e) {
      if (!mounted) return;
      Toast.showCenter(context, e.toString());
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = kToolbarHeight + (Util.isIphoneX ? 34.0 : 0.0);
    double imageHeight = 54 / 325 * MediaQuery.of(context).size.width;
    double height = appBarHeight + imageHeight + 80.0;
    if (_history > 0) {
      height += 60.0;
    }
    String name = "";
    String description = "";
    String? icon;
    int packageNum = 0;
    int packageTotal = 0;
    int packageMoney = 0;

    if (_package != null) {
      name = _package!['sender']['name'];
      icon = _package!['sender']['icon'];
      description = _package!['description'];
      packageNum = Util.parseInt(_package!['num']);
      packageTotal = Util.parseInt(_package!['total']);
      packageMoney = Util.parseInt(_package!['money']);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color(0xffE36046),
            centerTitle: true,
            pinned: true,
            floating: true,
            snap: false,
            elevation: 0.0,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                width: kToolbarHeight,
                height: kToolbarHeight,
                alignment: AlignmentDirectional.centerStart,
                child: R.img(
                  BaseAssets.shared$ic_titlebar_back_svg,
                  width: 24,
                  height: 24,
                  package: prefix0.ComponentManager.MANAGER_BASE_CORE,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              K.red_envelope_detail,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            expandedHeight: height,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: height,
                decoration: const BoxDecoration(color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: appBarHeight,
                          decoration: const BoxDecoration(
                            color: Color(0xffE36046),
                          ),
                        ),
                        R.img(
                          Assets.chat$package_display_background_png,
                          width: MediaQuery.of(context).size.width,
                          package: ComponentManager.MANAGER_CHAT,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 40.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                name,
                                maxLines: 1,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                margin: const EdgeInsets.only(left: 6),
                                color: const Color(0xffFFA844),
                                alignment: Alignment.center,
                                child: const Text(
                                  '拼',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, bottom: 6.0),
                          child: Text(
                            description,
                            maxLines: 1,
                            style: TextStyle(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        if (_history > 0)
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  MoneyConfig.moneyNum(_history,
                                      fractionDigits: 2),
                                  style: TextStyle(
                                    fontSize: 36.0,
                                    color: textColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, bottom: 8),
                                  child: Text(
                                    MoneyConfig.moneyName,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: textColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                    PositionedDirectional(
                      start:
                          (MediaQuery.of(this.context).size.width - 60.0) / 2,
                      top: appBarHeight + imageHeight - 60.0 / 2 - 16.0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3.0,
                            color: const Color(0xFFF8D8AF),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: icon != null
                              ? CachedNetworkImage(
                                  imageUrl:
                                      '${System.imageDomain}$icon!head100',
                                  width: 60.0,
                                  height: 60.0,
                                )
                              : const SizedBox(width: 60.0, height: 60.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  height: 40.0,
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsets.only(left: 18.0, top: 19.0),
                  child: Text(
                    '${K.already_received}$packageNum/$packageTotal${K.num_and_total}${MoneyConfig.moneyNum(_money, fractionDigits: 2)}/${MoneyConfig.moneyNum(packageMoney)}${MoneyConfig.moneyName}',
                    style: TextStyle(
                        color: textColor.withOpacity(0.7),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Map info = _data.elementAt(index);
                List<Widget> res = [
                  Row(
                    children: <Widget>[
                      Text(
                        MoneyConfig.moneyNum(Util.parseInt(info['money']),
                            fractionDigits: 2),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                      Image.asset(MoneyConfig.moneyIcon,
                          width: 20.0, height: 20.0)
                    ],
                  )
                ];

                if (Util.parseInt(info['money']) >= _max) {
                  res.add(
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        R.img(
                          Assets.chat$chat_package_best_svg,
                          width: 13.0,
                          height: 11.0,
                          package: ComponentManager.MANAGER_CHAT,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              end: 2.0, start: 3),
                          child: Text(
                            K.package_best_of_lucky,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Color(0xffFFA844),
                            ),
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                  );
                }

                return InkWell(
                  onTap: () {
                    IPersonalDataManager? personalDataManager = ComponentManager
                        .instance
                        .getManager(ComponentManager.MANAGER_PERSONALDATA);
                    personalDataManager?.openImageScreen(
                        context, Util.parseInt(info['uid']),
                        refer: widget.refer);
                  },
                  child: Container(
                    height: 76.0,
                    padding: const EdgeInsets.only(
                        top: 14.0, bottom: 14.0, left: 16.0, right: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                '${System.imageDomain + info['icon']}!head100',
                            width: 56.0,
                            height: 56.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  info['name'],
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: textColor,
                                  ),
                                  maxLines: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    info['dateline_message'],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: textColor.withOpacity(0.4),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: res,
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: _data.length,
              addAutomaticKeepAlives: false,
              semanticIndexOffset: 0,
            ),
            itemExtent: 85.0,
          ),
        ],
      ),
    );
  }
}
