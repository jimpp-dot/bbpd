import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../k.dart';
import '../api.dart';
import '../model/pb/generated/category.pb.dart';

/// 申请资质
class CertificateMainScreen extends StatefulWidget {
  static const String routeName = 'CertificateMainScreen';

  const CertificateMainScreen({super.key});

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CertificateMainScreen(),
        settings: const RouteSettings(name: routeName),
      ),
    );
  }

  @override
  _CertificateMainScreenState createState() => _CertificateMainScreenState();
}

class _CertificateMainScreenState extends State<CertificateMainScreen> {
  bool _loading = true;
  String? _errorMessage;
  final ILoginManager _loginManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
  final List<CategoryList> _categories = [];
  bool _neeMobile = false;
  int _role = 0;
  bool _iconOk = false;
  List<String> tipWords = R.array('tip_words');

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Navigator.Page.Pop', _onPageChanged);
    _load();
  }

  @override
  void dispose() {
    eventCenter.removeListener('Navigator.Page.Pop', _onPageChanged);
    super.dispose();
  }

  _onPageChanged(String type, dynamic value) {
    String pageName = value;
    if (pageName == CertificateMainScreen.routeName) {
      _load();
    }
  }

  _load() async {
    _errorMessage = null;
    _loading = true;

    ResCategoryIndex response = await Api.getCategoryList();
    if (response.success) {
      _neeMobile = response.mobile != 1;
      _role = response.role;
      _iconOk = response.iconOk;
      _categories.clear();
      for (CategoryList list in response.data) {
        if (list.list.isNotEmpty) {
          _categories.add(list);
        }
      }
    } else {
      _errorMessage = response.msg;
    }

    _loading = false;
    if (mounted) setState(() {});
  }

  void _onTapItem(CategoryInfo item) async {
    if (_neeMobile) {
      ISettingManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_SETTINGS);
      manager.openBindScreen(context);
      return;
    }

    if (_role == 0) {
      _loginManager.openLoginProfile(context);
      return;
    }

    if (!_iconOk) {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(K.notice),
              content: Text(K.change_big_photo_notice),
              actions: <Widget>[
                CupertinoButton(
                  child: Text(K.sure),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    IPersonalDataManager manager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_PERSONALDATA);
                    manager.openImageModifyScreen(context);
                  },
                ),
              ],
            );
          });
      return;
    }

    ICertificateManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_CERTIFICATE);
    manager.openCertificateResultScreenV2(context, item.cid, item.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.apply_certificate),
      body: _renderBody(),
    );
  }

  Widget _renderBody() {
    if (_loading) {
      return const Loading();
    }

    if (_categories.isEmpty) {
      return const EmptyWidget();
    }

    if (_errorMessage != null) {
      return ErrorData(
        error: _errorMessage,
        onTap: () {
          setState(() {
            _loading = true;
          });
          _load();
        },
      );
    }
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: _categories.map((e) => _buildCategory(e)).toList(),
    );
  }

  Widget _buildCategoryItem(CategoryInfo item) {
    return InkWell(
      onTap: () => _onTapItem(item),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              CommonAvatar(
                path: item.icon,
                size: 40,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              if (item.verifyState == 0)
                PositionedDirectional(
                  start: 0,
                  top: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: ShapeDecoration(
                      color: R.color.mainBrandColor,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      tipWords[1],
                      style: const TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(height: 4),
          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
          )
        ],
      ),
    );
  }

  Widget _buildCategory(CategoryList categoryList) {
    return Column(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsetsDirectional.only(
              top: 20, bottom: 12, start: 20, end: 20),
          child: Text(
            categoryList.name,
            style: TextStyle(
                fontSize: 15.0,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(
              start: 18.0, end: 18.0, bottom: 10.0),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(0.0),
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: 4,
            shrinkWrap: true,
            children:
                categoryList.list.map((e) => _buildCategoryItem(e)).toList(),
          ),
        )
      ],
    );
  }
}
