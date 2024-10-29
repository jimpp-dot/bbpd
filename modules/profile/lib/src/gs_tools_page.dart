import 'package:profile/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/api/api.dart';
import 'package:profile/src/model/gs_tool_item.dart';

/// 主播工具中心
class GsToolsPage extends StatefulWidget {
  const GsToolsPage({super.key});

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const GsToolsPage(),
      settings: const RouteSettings(name: '/GsToolsPage'),
    ));
  }

  @override
  _GsToolsPageState createState() => _GsToolsPageState();
}

class _GsToolsPageState extends State<GsToolsPage> {
  List<GsToolItem> _toolList = [];
  bool _loading = true;
  String? _errMsg;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    DataRsp<List<GsToolItem>> rsp = await Api.gsTools();
    if (rsp.success == true && rsp.data != null) {
      _toolList = rsp.data!;
    } else {
      _errMsg = rsp.msg;
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  _reload() {
    setState(() {
      _errMsg = null;
      _loading = true;
    });
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.profile_gs_tool_center),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errMsg != null) {
      return ErrorData(
        error: _errMsg,
        onTap: _reload,
      );
    }

    if (_toolList.isEmpty) {
      return const EmptyWidget();
    }

    return GridView.builder(
      padding: const EdgeInsetsDirectional.only(
        top: 8,
        start: 20,
        end: 20,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 15,
        childAspectRatio: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(_toolList[index]);
      },
      itemCount: _toolList.length,
    );
  }

  Widget _buildItem(GsToolItem item) {
    double ratio = (Util.width - 55) / 320;
    List<Color> bgColors = const [
      Color(0xFF7970FF),
      Color(0xFF7544FF),
    ];
    if (Util.validList(item.bgColor)) {
      bgColors = item.bgColor;
    }
    return GestureDetector(
      onTap: () {
        String url = SchemeUrlHelper.instance()
            .checkSchemeUrlAndGo(context, item.jumpPage);
        if (Util.validStr(url)) {
          setState(() {
            item.showRedpoint = false;
          });
        }
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: bgColors,
              ),
              borderRadius: BorderRadiusDirectional.circular(12),
            ),
          ),
          PositionedDirectional(
            top: ratio * 2,
            end: -ratio * 14,
            child: CachedNetworkImage(
              imageUrl: Util.parseIcon(item.icon),
              width: ratio * 96,
              height: ratio * 96,
            ),
          ),
          PositionedDirectional(
            top: 12,
            start: 12,
            child: Row(
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                if (item.showRedpoint) _renderRedPoint(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderRedPoint() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 2),
      child: R.img('ic_new.webp',
          width: 24, height: 12, package: ComponentManager.MANAGER_PROFILE),
    );
  }
}
