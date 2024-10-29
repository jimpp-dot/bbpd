import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/api/api.dart';
import 'package:shared/src/pbModel/generated/slp_pretty.pb.dart';
import '../k.dart';

class PrettyIdSelectPage extends StatefulWidget {
  const PrettyIdSelectPage({super.key});

  static Future<List<int>?> show(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PrettyIdSelectPage(),
        settings: const RouteSettings(name: '/PrettyIdSelectPage'),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => PrettyIdSelectPageState();
}

class PrettyIdSelectPageState extends State<PrettyIdSelectPage>
    with BaseScreenStateMixin {
  int _selectedIndex = -1; // 当前勾选的index
  int _currId = 0;
  late ResMyPrettyIdList rsp;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    rsp = await Api.getPrettyIdList();
    if (rsp.success) {
      if (rsp.data.isNotEmpty) {
        for (int i = 0; i < rsp.data.length; i++) {
          if (rsp.data[i].isUse) {
            _currId = rsp.data[i].prettyId;
            _selectedIndex = i;
            break;
          }
        }
        setScreenReady();
      } else {
        setScreenEmpty();
      }
    } else {
      setScreenError(errorMsg: rsp.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.homeSecondBgColor,
        appBar: BaseAppBar.custom(
          statusBrightness: darkMode ? Brightness.dark : Brightness.light,
          backColor: R.colors.mainTextColor,
          backgroundColor: Colors.transparent,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(K.profile_pretty_id_select_title,
                  style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(height: 2),
              Text(K.profile_pretty_id_select_sub_title,
                  style: TextStyle(
                    color: R.colors.mainTextColor.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
        body: buildStatusContent());
  }

  @override
  Widget buildContent() {
    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 18, bottom: 18),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: rsp.data.length,
                    cacheExtent: 104,
                    itemBuilder: (context, index) {
                      return _buildItem(index);
                    })),
            GestureDetector(
                child: Container(
                  height: 52,
                  width: Util.width,
                  margin: const EdgeInsetsDirectional.only(top: 20, bottom: 30),
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: R.colors.mainBrandGradientColors,
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Text(K.profile_pretty_id_confirm,
                      style: TextStyle(
                        color: R.colors.brightTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),
                onTap: () async {
                  int selectId = (_selectedIndex == -1)
                      ? 0
                      : rsp.data[_selectedIndex].prettyId;
                  int type = (_selectedIndex >= 0 &&
                              _selectedIndex < rsp.data.length &&
                              (rsp.data[_selectedIndex].isUse)) ||
                          _selectedIndex == -1
                      ? 1
                      : 0;
                  if (selectId == _currId) {
                    Navigator.of(context).pop();
                    return;
                  }
                  NormalNull res =
                      await Api.prettyIdUse(selectId, _currId, type);
                  if (res.success) {
                    Fluttertoast.showToast(
                        msg: type == 0
                            ? K.profile_pretty_id_tips1
                            : K.profile_pretty_id_tips2);
                    Navigator.of(context).pop([type, selectId]);
                  } else {
                    if (res.msg.isNotEmpty) {
                      Fluttertoast.showToast(msg: res.msg);
                    }
                  }
                }),
          ],
        ));
  }

  Widget _buildItem(int index) {
    return GestureDetector(
        onTap: () async {
          if (_selectedIndex == index) {
            _selectedIndex = -1;
          } else {
            _selectedIndex = index;
          }
          refresh();
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 18, bottom: 18),
            child: Row(children: [
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: R.colors.mainTextColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrettyIdWidget(
                          prettyId: "${rsp.data[index].prettyId}",
                          height: 20.0,
                          fontSize: 9)
                    ]),
              ),
              const SizedBox(width: 12),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      K.profile_pretty_id_time_start(
                          [(Utility.formatDate(rsp.data[index].startTime))]),
                      style: TextStyle(
                        color: R.colors.mainTextColor,
                        fontSize: 12,
                      )),
                  Text(_remainTime(rsp.data[index].period),
                      style: TextStyle(
                        color: R.colors.mainTextColor,
                        fontSize: 12,
                      )),
                  const SizedBox(height: 8),
                  Divider(
                      height: 0.5,
                      color: R.colors.mainTextColor.withOpacity(0.16)),
                  const SizedBox(height: 8),
                  Text(K.profile_pretty_id_explain([(rsp.data[index].desc)]),
                      style: TextStyle(
                        color: R.colors.mainTextColor.withOpacity(0.5),
                        fontSize: 11,
                      ))
                ],
              )),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 26, bottom: 26, start: 16, end: 0),
                child: SelectedIcon(
                  selected: (_selectedIndex == index) ? true : false,
                  supportDark: true,
                ),
              ),
            ])));
  }

  String _remainTime(int time) {
    if (time <= 0) {
      return K.profile_pretty_id_time_end(['00', '00']);
    }
    return K.profile_pretty_id_time_end([
      '${time ~/ 3600}',
      '${time % 3600 ~/ 60}',
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _selectedIndex = -1;
  }
}
