import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/api/api.dart';
import 'package:personaldata/src/model/title_role_bean.dart';

/// 称号说明弹框
class TitleRoleDescriptionWidget extends StatefulWidget {
  static Future<T?> openTitleRoleDescriptionDialog<T>(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const TitleRoleDescriptionWidget();
      },
    );
  }

  const TitleRoleDescriptionWidget({Key? key}) : super(key: key);

  @override
  State<TitleRoleDescriptionWidget> createState() {
    return _TitleRoleDescriptionWidgetState();
  }
}

class _TitleRoleDescriptionWidgetState
    extends State<TitleRoleDescriptionWidget> {
  bool _loading = true;
  String _error = '';
  List<TitleRoleItemBean> _data = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _load() async {
    try {
      _loading = true;
      _error = '';

      _data = [];

      TitleRoleBean response = await Api.getRoleTitles();
      if (response.success == false) {
        _error = response.msg ?? '';
      } else {
        _data = response.items ?? [];
      }
    } catch (e) {
      _error = e.toString();
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  Widget _renderBody() {
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return Material(
      child: ListView(
        children: [
          ErrorData(
            error: _error.toString(),
            onTap: () {
              setState(() {
                _loading = true;
              });
              _load();
            },
          ),
        ],
      ),
    );

    if (_data.isEmpty) {
      return Material(
        child: ListView(
          children: [
            ErrorData(
              error: K.personal_no_title_role,
              onTap: () {
                setState(() {
                  _loading = true;
                });
                _load();
              },
            ),
          ],
        ),
      );
    }

    List<Widget> res = [];
    for (int i = 0; i < _data.length; i++) {
      TitleRoleItemBean titleRoleItemBean = _data[i];
      res.add(
        Container(
          constraints: const BoxConstraints(
            minHeight: 48.0,
          ),
          padding: const EdgeInsetsDirectional.only(
            top: 4.0,
            bottom: 4.0,
          ),
          // color: Colors.red,
          child: Row(
            children: [
              Container(
                width: 20.0,
              ),
              Container(
                width: 95.0, //75+5
                alignment: AlignmentDirectional.centerStart,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: "${titleRoleItemBean.icon}",
                      fit: BoxFit.fitHeight,
                      fadeOutDuration: const Duration(microseconds: 0),
                      fadeInDuration: const Duration(microseconds: 0),
                      height: 24.0,
                    ),
                  ),
                ),
              ),
              Container(
                width: 20.0,
              ),
              Expanded(
                child: Text(
                  '${titleRoleItemBean.description}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: R.color.secondTextColor,
                  ),
                ),
              ),
              Container(
                width: 20.0,
              ),
            ],
          ),
        ),
      );

      res.add(
        Container(
          height: 0.5,
          color: R.color.dividerColor,
          margin: const EdgeInsetsDirectional.only(
            start: 20.0,
            end: 20.0,
          ),
        ),
      );
    }

    return ListView(
      children: res,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 13.0, bottom: 9.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      K.personal_title_role_description,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: R.color.mainTextColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 0.5,
                  color: R.color.dividerColor,
                ),
                Expanded(
                  child: _renderBody(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
