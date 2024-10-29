import 'package:personaldata/k.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;

class DefendGardenSettingScreen extends StatefulWidget {
  List<DefendRelationModel>? hiddenList;
  DefendGardenSettingScreen({super.key, this.hiddenList});

  @override
  DefendGardenSettingState createState() {
    return DefendGardenSettingState();
  }

  static Future<void> show(
      BuildContext context, List<DefendRelationModel>? hiddenList) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DefendGardenSettingScreen(
        hiddenList: hiddenList,
      ),
      settings: const RouteSettings(name: '/DefendGardenSettingScreen'),
    ));
  }
}

class DefendGardenSettingState extends State<DefendGardenSettingScreen> {
  int privacy = 0;
  int scope = 0;
  bool loading = true;
  String errorMsg = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}defend/getSecretGardenSetting",
        throwOnError: true,
      );

      Map map = response.value();
      bool success = Util.parseBool(map['success']);
      var data = map['data'];
      String? msg = Util.parseStr(map['msg']);
      if (success == true && data is Map) {
        privacy = Util.parseInt(data['privacy']);
        scope = Util.parseInt(data['scope']);
      } else if (Util.validStr(msg)) {
        errorMsg = msg!;
      } else {
        errorMsg = BaseK.K.base_net_error;
      }
    } catch (e) {
      Log.d(e);
      errorMsg = BaseK.K.base_net_error;
    }

    loading = false;

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.personal_defend_garden_setting_title,
      ),
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    if (errorMsg.isEmpty && loading) {
      return const Loading();
    } else if (errorMsg.isNotEmpty) {
      return Center(
        child: ErrorData(
          error: errorMsg,
          onTap: () {
            if (!mounted) return;
            setState(() {
              errorMsg = '';
              loading = true;
            });
            loadData();
          },
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingItemWidget(
          title: K.personal_defend_garden_setting_title_1,
          trailingText: getPrivacyTailingText(),
          space: 20,
          onClicked: onPrivacyClick,
        ),
        if (privacy != 2)
          SettingItemWidget(
            title: K.personal_defend_garden_setting_title_2,
            trailingText: getScopeTailingText(),
            space: 20,
            onClicked: onScopeClick,
          ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
          child: Text(
            K.personal_defend_garden_setting_delete_title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: R.color.mainTextColor,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
          child: Text(
            K.personal_defend_garden_setting_delete_subtitle,
            style: TextStyle(
              fontSize: 13,
              color: R.color.secondTextColor,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.hiddenList?.length ?? 0,
            itemExtent: 101,
            itemBuilder: (context, index) {
              return buildItem(widget.hiddenList?[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget buildItem(DefendRelationModel? item) {
    return Container(
      width: Util.width - 24,
      height: 87,
      margin: const EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 14),
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: BorderRadiusDirectional.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              offset: const Offset(0, 2),
              blurRadius: 10,
              spreadRadius: 2),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (Session.uid != item?.uid) {
                IPersonalDataManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                manager.openImageScreen(System.context, item?.uid ?? 0,
                    refer: const PageRefer('DefendGardenSettingScreen'));
              }
            },
            child: DefendRelationHeader(
              defendRelationModel: item,
              iconSize: 62,
              showBorderIcon: true,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item?.name ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: R.color.mainTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  item?.expire ?? '',
                  style: TextStyle(
                    fontSize: 13,
                    color: R.color.thirdTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () async {
              /// 移除关系卡
              deleteHide(item?.id);
            },
            child: Container(
              height: 28,
              padding: const EdgeInsetsDirectional.only(
                  start: 13, end: 13, top: 2.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(14),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: R.color.mainBrandGradientColors,
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.personal_defend_garden_delete_btn,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getPrivacyTailingText() {
    switch (privacy) {
      case 0:
        return K.personal_defend_garden_privacy_1;
      case 1:
        return K.personal_defend_garden_privacy_3;
      case 2:
        return K.personal_defend_garden_privacy_2;
      default:
        return K.personal_defend_garden_privacy_1;
    }
  }

  void onPrivacyClick() async {
    List<SheetItem> res = [];
    res.add(SheetItem(K.personal_defend_garden_privacy_1, "privacy_0"));
    res.add(SheetItem(K.personal_defend_garden_privacy_3, "privacy_1"));
    res.add(SheetItem(K.personal_defend_garden_privacy_2, "privacy_2"));

    SheetCallback result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result.reason == SheetCloseReason.Active) {
      return;
    }

    int newPrivacy = 0;
    switch (result.value?.key) {
      case 'privacy_0':
        newPrivacy = 0;
        break;
      case 'privacy_1':
        newPrivacy = 1;
        break;
      case 'privacy_2':
        newPrivacy = 2;
        break;
    }

    if (newPrivacy != privacy) {
      bool succ = await setSetting(privacy: newPrivacy);
      if (mounted && succ == true) {
        privacy = newPrivacy;
        setState(() {});
      }
    }
  }

  String getScopeTailingText() {
    switch (scope) {
      case 1:
        return K.personal_defend_garden_scope_1;
      default:
        return K.personal_defend_garden_scope_2;
    }
  }

  void onScopeClick() async {
    List<SheetItem> res = [];
    res.add(SheetItem(K.personal_defend_garden_scope_2, "scope_0"));
    res.add(SheetItem(K.personal_defend_garden_scope_1, "scope_1"));

    SheetCallback result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result.reason == SheetCloseReason.Active) {
      return;
    }

    int newScope = 0;
    switch (result.value?.key) {
      case 'scope_0':
        newScope = 0;
        break;
      case 'scope_1':
        newScope = 1;
        break;
    }

    if (newScope != scope) {
      bool succ = await setSetting(scope: newScope);
      if (mounted && succ == true) {
        scope = newScope;
        setState(() {});
      }
    }
  }

  Future<bool> setSetting({int? privacy, int scope = 0}) async {
    try {
      Map<String, String> post;
      if (privacy != null) {
        post = {'field': 'privacy', 'privacy': '$privacy'};
      } else {
        post = {'field': 'scope', 'scope': '$scope'};
      }

      XhrResponse response = await Xhr.postJson(
        "${System.domain}defend/setSecretGarden",
        post,
        throwOnError: true,
      );
      BaseResponse baseResponse = BaseResponse.parse(response);
      if (baseResponse.success == true) {
        return true;
      } else if (Util.validStr(baseResponse.msg)) {
        Fluttertoast.showToast(msg: baseResponse.msg);
      } else {
        Fluttertoast.showToast(msg: BaseK.K.base_net_error);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }

    return false;
  }

  bool delete = false;
  void deleteHide(String? id) async {
    if (delete) {
      return;
    }
    delete = true;
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}defend/hideOrShowRelation?version=3",
        {'id': id ?? '', 'hidden': '0'},
        throwOnError: true,
      );
      BaseResponse baseResponse = BaseResponse.parse(response);
      if (baseResponse.success == true) {
        widget.hiddenList?.removeWhere((element) {
          return id == element.id;
        });
        if (mounted) {
          setState(() {});
        }
      } else if (Util.validStr(baseResponse.msg)) {
        Fluttertoast.showToast(msg: baseResponse.msg);
      } else {
        Fluttertoast.showToast(msg: BaseK.K.base_net_error);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }
    delete = false;
  }
}
