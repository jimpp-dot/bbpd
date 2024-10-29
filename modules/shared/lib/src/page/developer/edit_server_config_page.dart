import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class EditServerConfigPage extends StatefulWidget {
  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const EditServerConfigPage(),
      settings: const RouteSettings(name: '/EditServerConfigPage'),
    ));
  }

  const EditServerConfigPage({Key? key}) : super(key: key);

  @override
  State createState() => _EditServerConfigPageState();
}

class _EditServerConfigPageState extends State<EditServerConfigPage> {
  bool _loading = true;
  String? _errorMsg;
  List<ConfigItem>? _list;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    DataRsp<List<ConfigItem>> rsp = await _getConfig();
    _loading = false;
    if (rsp.success == true) {
      _errorMsg = null;
      _list = rsp.data;
    } else {
      _errorMsg = rsp.msg;
      Fluttertoast.showCenter(msg: rsp.msg);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar('修改服务端配置'),
      backgroundColor: R.color.mainBgColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMsg != null) {
      return ErrorData(
        error: _errorMsg,
        onTap: () {
          _errorMsg = null;
          _loading = true;
          setState(() {});
          _loadData();
        },
      );
    }

    return ListView.builder(
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 10),
      itemCount: _list!.length,
      itemBuilder: (_, index) {
        return _buildItem(_list![index]);
      },
    );
  }

  Widget _buildItem(ConfigItem item) {
    return ListTile(
      dense: true,
      onTap: () async {
        int index = FormScreen.config(
          type: FormTypes.textArea,
          title: item.content,
          allowEmpty: true,
        );
        String? value = await FormScreen.openFormScreen(context, index);
        if (value != null) {
          String str = value.trim();
          NormalNull rsp = await _commit(item.id, str);
          if (rsp.success) {
            setState(() {
              item.value = str;
            });
          } else {
            Fluttertoast.showCenter(msg: rsp.msg);
          }
        }
      },
      title: Text(
        item.content,
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      subtitle:
          Text(item.value, textScaleFactor: 1.0, style: R.textStyle.regular14),
      trailing: Icon(Icons.navigate_next, color: R.color.secondTextColor),
    );
  }

  static Future<DataRsp<List<ConfigItem>>> _getConfig() async {
    String url = '${System.domain}go/mate/admin/tool/list?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url, formatJson: true);
      return DataRsp<List<ConfigItem>>.fromXhrResponse(
        response,
        (object) => Util.parseList(
            object, (e) => ConfigItem.fromJson(e as Map<String, dynamic>)),
      );
    } catch (e) {
      return DataRsp<List<ConfigItem>>(msg: e.toString(), success: false);
    }
  }

  static Future<NormalNull> _commit(String id, String value) async {
    try {
      final url = '${System.domain}go/mate/admin/tool/modify';
      final response = await Xhr.post(
          url, {'id': id, 'value': value, 'uid': '${Session.uid}'},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}

class ConfigItem {
  final String id;
  final String content;
  String value;

  ConfigItem(this.id, this.content, this.value);

  factory ConfigItem.fromJson(Map<String, dynamic> json) {
    return ConfigItem(
      Util.parseStr(json['id']) ?? '',
      Util.parseStr(json['content']) ?? '',
      Util.parseStr(json['value']) ?? '',
    );
  }
}
