import 'package:chat/k.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat/src/bottom/emote.dart';
import 'package:flutter/material.dart';

/// 自定义表情标签
class CustomImageScreen extends StatefulWidget {
  const CustomImageScreen({super.key});

  @override
  _CustomImageScreenState createState() => _CustomImageScreenState();
}

class _CustomImageScreenState extends State<CustomImageScreen> {
  final List<EmoteItem> _data = [];
  final Map<EmoteItem, bool> _selectedItems = {};
  bool _loading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}account/getusercustomemote',
          throwOnError: true);
      Map res = response.value();
      List data = res['data'];
      if (mounted == false) return;
      setState(() {
        for (var value in data) {
          Map config = value;
          _data.add(
            EmoteItem(
              key: config['id'].toString(),
              name: K.chat_custom_photo,
              width: 100,
              height: 100,
              source: config['icon'],
            ),
          );
        }
        _loading = false;
        _error = '';
      });
    } catch (e) {
      if (mounted == false) return;
      setState(() {
        _loading = true;
        _error = e.toString();
      });
    }
  }

  _remove() async {
    if (_selectedItems.isEmpty) {
      Toast.showCenter(context, K.please_choose_emoji_tag);
      return;
    }
    List<int> ids = [];
    _selectedItems.forEach((EmoteItem item, bool selected) {
      if (selected) {
        ids.add(Util.parseInt(item.key));
      }
    });
    if (ids.isEmpty) return;
    try {
      await Xhr.postJson(
          '${System.domain}account/delusercustomemote', {'data': ids.join(',')},
          throwOnError: true);
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        Toast.showCenter(context, e.toString());
      }
    }
  }

  Widget _renderBody() {
    if (_loading == true) {
      return const Center(
        child: Loading(),
      );
    } else if (_error.isNotEmpty) {
      return Center(
        child: Text(
          _error,
          style: R.textStyle.body1.copyWith(color: R.colors.mainTextColor),
        ),
      );
    } else {
      return GridView.extent(
        primary: false,
        shrinkWrap: true,
        maxCrossAxisExtent: 100.0,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.only(
            left: 12.0, right: 12.0, top: 6.0, bottom: 6.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: _data.map((EmoteItem item) {
          bool selected =
              _selectedItems.containsKey(item) ? _selectedItems[item]! : false;
          return Center(
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedItems[item] = _selectedItems.containsKey(item)
                          ? !_selectedItems[item]!
                          : true;
                    });
                  },
                  child: CachedNetworkImage(
                    imageUrl:
                        '${System.imageDomain}${item.source}?x-oss-process=image/resize,h_200',
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                PositionedDirectional(
                  top: 2.0,
                  end: 2.0,
                  child: IgnorePointer(
                    child: selected
                        ? const CheckBoxChecked()
                        : const CheckBoxUnchecked(),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        title: Text(
          K.chat_cutom_emoji_tag,
        ),
        actions: <Widget>[
          IconButton(
            icon: R.img(
              BaseAssets.shared$icon_delete_svg,
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 24,
              height: 24,
              color: R.colors.mainTextColor,
            ),
            onPressed: _remove,
          ),
        ],
        suppDark: true,
      ),
      body: _renderBody(),
    );
  }
}
