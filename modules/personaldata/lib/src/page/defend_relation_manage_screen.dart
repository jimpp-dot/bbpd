import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import '../model/defend_bean.dart';
import '../widget/delete_defend_ralation_dialog.dart';
import '../widget/delete_defend_relation_force_dialog.dart';

/// 关系管理页面
class DefendRelationManageScreen extends StatefulWidget {
  const DefendRelationManageScreen({super.key});

  @override
  DefendRelationManageState createState() {
    return DefendRelationManageState();
  }

  static Future<void> show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const DefendRelationManageScreen(),
      settings: const RouteSettings(name: '/DefendRelationManageScreen'),
    ));
  }
}

class DefendRelationManageState extends State<DefendRelationManageScreen> {
  late GlobalKey<PageLoadingListState> _refreshKey;

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<PageLoadingListState>();
  }

  Future<DefendRelationManageResponse> _loadData(int page) async {
    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}profile/defendList/?version=5&uid=${Session.uid}&page=$page&manage=1",
        throwOnError: true,
      );
      DefendListResponse defendListResponse =
          DefendListResponse.fromJson(response.value() as Map<String, dynamic>);

      bool hasData = defendListResponse.data != null &&
          (defendListResponse.data?.length ?? 0) > 0;

      bool more = hasData && (defendListResponse.more == true);

      return DefendRelationManageResponse(
          success: defendListResponse.success == true,
          msg: defendListResponse.msg ?? '',
          datas: defendListResponse.data,
          more: more);
    } catch (e) {
      Log.d(e);
      return DefendRelationManageResponse(
          success: false, msg: BaseK.K.base_net_error, datas: [], more: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.personal_defend_manager,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 28,
              margin: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, bottom: 16),
              padding: const EdgeInsetsDirectional.only(start: 16),
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(13),
                color: R.color.mainBrandColor.withOpacity(0.1),
              ),
              child: Text(
                K.personal_defend_manager_tips,
                style: TextStyle(
                  fontSize: 12,
                  color: R.color.mainBrandColor,
                ),
              ),
            ),
            Expanded(
              child: PageLoadingList<DefendRelationModel>(
                key: _refreshKey,
                loadData: (page) => _loadData(page),
                indicatorBuilder: (context, status) {
                  return const SizedBox.shrink();
                },
                itemBuilder: (context, item, index) {
                  return _buildItem(item, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(DefendRelationModel item, int index) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 18, end: 16, bottom: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (Session.uid != item.uid) {
                IPersonalDataManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                manager.openImageScreen(System.context, item.uid,
                    refer: const PageRefer('DefendRelationManageScreen'));
              }
            },
            child: DefendRelationHeader(
              defendRelationModel: item,
              iconSize: 56,
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
                  item.name ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  item.expire ?? '',
                  style: TextStyle(
                    fontSize: 11,
                    color: R.color.secondTextColor,
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
              /// 删除
              bool? isForceDelete = await DeleteDefendRelationDialog.show(
                  buildContext: context, item: item);
              if (isForceDelete == true) {
                await DeleteDefendRelationForceDialog.show(
                    buildContext: System.context, item: item);
              }
              refresh();
            },
            child: Container(
              width: 52,
              height: 28,
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
                K.delete,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void refresh() {
    _refreshKey.currentState?.refresh();
  }
}

class DefendRelationManageResponse extends BaseResponse
    with PageListResponse<DefendRelationModel> {
  List<DefendRelationModel>? datas;
  bool more;

  @override
  List<DefendRelationModel> get items => datas ?? [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  DefendRelationManageResponse(
      {bool success = false, String msg = '', this.datas, this.more = false})
      : super(success: success, msg: msg);

  @override
  bool get hasMore => more;
}
