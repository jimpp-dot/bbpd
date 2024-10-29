import 'package:shared/shared.dart';
import 'package:shared/src/page/developer/edit_server_config_page.dart';
import 'package:flutter/material.dart';

class OtherDeveloperSettingPage extends StatefulWidget {
  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const OtherDeveloperSettingPage(),
      settings: const RouteSettings(name: '/OtherDeveloperSettingPage'),
    ));
  }

  const OtherDeveloperSettingPage({Key? key}) : super(key: key);

  @override
  State createState() => _OtherDeveloperSettingPageState();
}

class _OtherDeveloperSettingPageState extends State<OtherDeveloperSettingPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      _buildEditServerConfig(),
    ];
    return Scaffold(
      appBar: BaseAppBar('其他'),
      backgroundColor: R.color.mainBgColor,
      body: ListView.builder(
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 10),
        itemCount: children.length,
        itemBuilder: (_, index) {
          return children[index];
        },
      ),
    );
  }

  Widget _buildEditServerConfig() {
    return ListTile(
      dense: true,
      onTap: () {
        EditServerConfigPage.show(context);
      },
      title: Text(
        '修改服务端配置',
        textScaleFactor: 1.0,
        style: R.textStyle.subtitle,
      ),
      trailing: Icon(
        Icons.navigate_next,
        color: R.color.secondTextColor,
      ),
    );
  }
}
