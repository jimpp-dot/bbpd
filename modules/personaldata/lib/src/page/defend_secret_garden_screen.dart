import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:personaldata/src/page/defend_garden_add_dialog.dart';

import '../model/defend_garden_bean.dart';
import '../widget/defend_relation_item.dart';
import 'defend_garden_buy_dialog.dart';
import 'defend_garden_setting_screen.dart';

class DefendSecretGardenScreen extends StatefulWidget {
  final int uid;
  const DefendSecretGardenScreen({super.key, this.uid = 0});

  static Future<bool?> show(BuildContext context, int uid) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DefendSecretGardenScreen(uid: uid),
      settings: const RouteSettings(name: '/DefendSecretGardenScreen'),
    ));
  }

  @override
  DefendSecretGardenState createState() {
    return DefendSecretGardenState();
  }
}

class DefendSecretGardenState extends State<DefendSecretGardenScreen> {
  String errorMsg = '';
  DefendGardenData? data;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}defend/secretGardenInfo?version=3&uid=${widget.uid}",
        throwOnError: true,
      );
      DefendGardenBean defendGardenResponse =
          DefendGardenBean.fromJson(response.value() as Map<String, dynamic>);
      if (defendGardenResponse.success == true &&
          defendGardenResponse.data != null) {
        data = defendGardenResponse.data;
      } else if (Util.validStr(defendGardenResponse.msg)) {
        errorMsg = defendGardenResponse.msg ?? '';
      } else {
        errorMsg = BaseK.K.base_net_error;
      }
    } catch (e) {
      Log.d(e);
      errorMsg = BaseK.K.base_net_error;
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            buildColorBg(),
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(
                  'static/defend/ic_defend_garden_bg_top.webp'),
              width: Util.width,
              height: 300,
              fit: BoxFit.fill,
            ),
            PositionedDirectional(
              bottom: 0,
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(
                    'static/defend/ic_defend_garden_bg_bottom.webp'),
                width: Util.width,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
            SafeArea(child: buildBody(context)),
          ],
        ),
      ),
    );
  }

  Widget buildColorBg() {
    return Container(
      width: Util.width,
      height: Util.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0xFFFCA9EB), Color(0xFFDBE0FF), Color(0xFFA55FFF)],
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    if (errorMsg.isEmpty && data == null) {
      return const Loading();
    } else if (errorMsg.isNotEmpty) {
      return Center(
        child: ErrorData(
          error: errorMsg,
          onTap: () {
            if (!mounted) return;
            setState(() {
              errorMsg = '';
            });
            loadData();
          },
        ),
      );
    }

    EdgeInsets padding = MediaQuery.of(context).padding;
    double height = Util.height - padding.top - padding.bottom - kToolbarHeight;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BaseAppBar.custom(
          title: const SizedBox.shrink(),
          backgroundColor: Colors.transparent,
          backColor: Colors.white,
          actions: Session.uid != widget.uid
              ? null
              : [
                  GestureDetector(
                    onTap: () async {
                      /// 设置
                      await DefendGardenSettingScreen.show(
                          context, data?.hiddenList);
                      loadData();
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, start: 10, end: 20),
                      child: R.img(
                        'defend/ic_defend_garden_setting.png',
                        width: 24,
                        height: 24,
                        package: ComponentManager.MANAGER_PERSONALDATA,
                      ),
                    ),
                  ),
                ],
        ),
        SizedBox(
          width: Util.width,
          height: height,
          child: Stack(
            children: [
              PositionedDirectional(
                top: 29,
                start: 14,
                child: buildGarden(height),
              ),
              if (widget.uid == Session.uid)
                PositionedDirectional(
                  bottom: padding.bottom + Util.iphoneXBottom + 30,
                  end: 31,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        top: 6, bottom: 6, start: 8, end: 8),
                    decoration: BoxDecoration(
                      color: const Color(0x19313131),
                      borderRadius: BorderRadiusDirectional.circular(13),
                    ),
                    child: Text(
                      '${K.personal_defend_garden_card_status}${data?.hiddenList.length ?? 0}/${data?.capacity}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0x66313131),
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
              PositionedDirectional(
                start: (Util.width - 266) / 2,
                child: Container(
                  width: 266,
                  height: 62,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(R.imagePath(
                          'defend/ic_defend_garden_title_bg.webp',
                          package: ComponentManager.MANAGER_PERSONALDATA)),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: AlignmentDirectional.topCenter,
                  padding: const EdgeInsetsDirectional.only(top: 7),
                  child: Text(
                    K.personal_defend_garden,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFDEFF),
                      letterSpacing: 6,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 2),
                          blurRadius: 4.0,
                          color: Color(0x805D34B2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildGarden(double parentHeight) {
    int itemCount = data?.capacity ?? 0;
    if (widget.uid == Session.uid &&
        (data?.hiddenList.length ?? 0) >= itemCount &&
        (data?.canUnlockNum ?? 0) > 0) {
      /// 自己的秘密花园，在已经加满了卡片，且还允许解锁，展示一个解锁卡片
      itemCount = itemCount + 1;
    }

    if (Session.uid != widget.uid) {
      itemCount = data?.hiddenList.length ?? 0;
    }

    double width = Util.width - 28;
    double height = parentHeight - 29 - 15;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0xFFFFF4BE), Color(0xFFFFE1C1), Color(0xFFFF96CB)],
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Container(
        width: width - 12,
        height: height - 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(8),
          color: Colors.white,
        ),
        child: GridView.builder(
          padding: const EdgeInsetsDirectional.only(
              top: 42, start: 8, end: 8, bottom: 52),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 6,
            childAspectRatio: 102 / 158,
            mainAxisExtent: (width - 14 - 14 - 12) / 3 / 102 * 158,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (index < (data?.hiddenList.length ?? 0)) {
              /// 关系卡片
              return DefendRelationItem(
                uid: widget.uid,
                item: data!.hiddenList[index],
                ratio: (width - 14 - 14 - 12) / 3 / 102,
                refresh: () async {
                  loadData();
                },
              );
            } else {
              if (index < (data?.capacity ?? 0)) {
                /// 空卡片，可添加关系卡片
                return buildEmptyCard(
                    buy: false, ratio: (width - 14 - 14 - 12) / 3 / 102);
              } else {
                /// 空卡片，可购买展示位
                return buildEmptyCard(
                    buy: true, ratio: (width - 14 - 14 - 12) / 3 / 102);
              }
            }
          },
          itemCount: itemCount,
        ),
      ),
    );
  }

  Widget buildEmptyCard({bool buy = false, double ratio = 0}) {
    return GestureDetector(
      onTap: () async {
        if (buy) {
          /// 购买展示位
          bool? succ = await DefendGardenBuyDialog.show(
              buildContext: context,
              money: data?.unlockMoney ?? 0,
              subTitle: data?.unlockTips ?? '');
          if (succ == true) {
            loadData();
          }
        } else {
          /// 添加新的关系卡片
          if ((data?.showList.length ?? 0) == 0) {
            Fluttertoast.showToast(
                msg: K.personal_defend_garden_no_card_to_add);
            return;
          }
          bool? add = await DefendGardenAddDialog.show(
              context: context, showList: data?.showList);
          if (add == true) {
            loadData();
          }
        }
      },
      child: Container(
        width: 102 * ratio,
        height: 158 * ratio,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(12),
          border: Border.all(color: const Color(0xFFF4F4F4), width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 41 * ratio,
            ),
            Container(
              width: 52 * ratio,
              height: 52 * ratio,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0x19313131)),
              ),
              alignment: AlignmentDirectional.center,
              child: R.img(
                'ic_defend_add.png',
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_PERSONALDATA,
              ),
            ),
            SizedBox(
              height: 4 * ratio,
            ),
            Text(
              buy ? K.personal_defend_gargen_buy : K.personal_defend_garden_add,
              style: TextStyle(
                fontSize: 11 * ratio,
                color: const Color(0x99202020),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
