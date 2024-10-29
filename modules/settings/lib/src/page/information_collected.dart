import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/model/pb/generated/law.pb.dart';
import '../../k.dart';
import 'package:shared/k.dart' as BaseK;

/// 已收集个人信息清单
class InformationCollectedScreen extends StatefulWidget {
  const InformationCollectedScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return InformationCollectedState();
  }

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const InformationCollectedScreen(),
      settings: const RouteSettings(name: '/InformationCollected'),
    ));
  }
}

class InformationCollectedState extends State<InformationCollectedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.settings_information_collected,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
      ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(top: 2),
              padding: const EdgeInsetsDirectional.only(
                  start: 20, end: 20, top: 10, bottom: 10),
              child: Text(
                K.setting_collect_subtitle,
                style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    ).withCommonBg();
  }

  Future<CollectInfoResponse> _loadData(int page) async {
    ResCollectInfo? info;
    try {
      String url = '${System.domain}go/yy/law/collectInfo';
      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      info = ResCollectInfo.fromBuffer(response.bodyBytes);
    } catch (e) {
      Log.d('informationCollected _loadData error: $e');
    }

    if (info == null || !Util.validList(info.info)) {
      return CollectInfoResponse(success: false, msg: BaseK.K.base_net_error);
    } else {
      return CollectInfoResponse(success: true, msg: '', datas: info.info);
    }
  }

  Widget _buildBody() {
    return PageLoadingList<CollectInfo>(
      loadData: (page) => _loadData(page),
      indicatorBuilder: (context, status) {
        return const SizedBox(
          height: 10,
        );
      },
      itemBuilder: (context, item, index) {
        return _buildCommodity(item, index);
      },
    );
  }

  Widget _buildCommodity(CollectInfo item, int index) {
    return GestureDetector(
      onTap: () {
        if (Util.validStr(item.url)) {
          String schemeUrl = SchemeUrlHelper.instance().concatSchemeUrl(
              item.url, SchemeUrlHelper.scheme_path_common_redirect);
          SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, schemeUrl);
        }
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(
            start: 20, end: 20, top: index == 0 ? 10 : 5, bottom: 5),
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    K.setting_collect_purpose + item.purpose,
                    style: TextStyle(
                      fontSize: 16,
                      color: R.color.secondTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    K.setting_collect_scene + item.scene,
                    style: TextStyle(
                      fontSize: 16,
                      color: R.color.secondTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    K.setting_collect_state + item.info,
                    style: TextStyle(
                      fontSize: 16,
                      color: R.color.secondTextColor,
                    ),
                  ),
                  if (Util.validStr(item.content)) ...[
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      K.setting_collect_info + item.content,
                      style: TextStyle(
                        fontSize: 16,
                        color: R.color.secondTextColor,
                      ),
                    ),
                  ]
                ],
              ),
            ),
            if (Util.validStr(item.url))
              R.img(
                'ic_next.svg',
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_PROFILE,
                color: R.color.secondTextColor,
              ),
          ],
        ),
      ),
    );
  }
}

class CollectInfoResponse extends BaseResponse
    with PageListResponse<CollectInfo> {
  List<CollectInfo>? datas;

  @override
  List<CollectInfo> get items => datas ?? [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  CollectInfoResponse({super.success, super.msg, this.datas});

  @override
  bool get hasMore => false;
}
