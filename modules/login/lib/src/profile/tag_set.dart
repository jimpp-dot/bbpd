import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

/// 个人标签 or 交友偏好
///
class TagSet extends StatefulWidget {
  final bool isModify;
  final bool isSkipNicknameWrite;
  final bool aboutSelf;

  const TagSet(
      {Key? key,
      this.isModify = false,
      this.isSkipNicknameWrite = false,
      this.aboutSelf = true})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<TagSet> {
  bool _loading = true;
  bool _loadSuccess = false;
  List<TagCategoryModel> categories = [];
  final HashSet<String> _selectionSet = HashSet<String>();
  final HashSet<String> _selectionName = HashSet<String>();
  final ILoginManager _loginManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);

  @override
  void initState() {
    super.initState();
    Tracker.instance
        .track(TrackEvent.register, properties: {'step': 'interest'});
    _load();
  }

  @override
  void dispose() {
    // 弹新用户礼包
    if (widget.isModify != true && widget.aboutSelf == false) {
      if (_loginManager.isNoviceGuide) {
        eventCenter.emit(EventConstant.ShowNewUserGuide);
      } else {
        eventCenter.emit(EventConstant.ShowNewUserPackage);
      }
    }
    super.dispose();
  }

  String _typeString() {
    String type = 'self';
    if (!widget.aboutSelf) {
      type = 'friend';
    }
    return type;
  }

  String _titleString() {
    if (widget.isModify) {
      if (widget.aboutSelf) {
        return K.self_tag;
      }
      return K.friend_tag;
    }
    return '';
  }

  void _load() async {
    String url = '${System.domain}tag/index';
    try {
      XhrResponse response = await Xhr.postJson(url, {'type': _typeString()});
      _loading = false;
      _loadSuccess = false;
      if (response.error == null) {
        Map res = response.value();
        if (res['success'] == true) {
          List<dynamic>? data = res['data'];
          if (data != null) {
            categories =
                Util.parseList(data, (e) => TagCategoryModel.fromJson(e));
            for (var category in categories) {
              for (var item in category.detail) {
                if (item.selected == true) {
                  _selectionSet.add(item.id);
                  _selectionName.add(item.name);
                }
              }
            }
          }
          _loadSuccess = true;
        }
      }
    } catch (e) {
      _loading = false;
      Log.d(e.toString());
    }

    if (!mounted) return;
    setState(() {});
  }

  void _finish(String select) async {
    Tracker.instance
        .track(TrackEvent.register, properties: {'step': 'interest_finish'});
    if (mounted) {
      if (widget.isModify == true) {
        Navigator.of(context).pop(select);
      } else {
        _skipClick();
      }
    }
  }

  void _skipClick() {
    if (widget.aboutSelf) {
      //第一步
      PageRoute route = MaterialPageRoute(
        builder: (context) => TagSet(
          isSkipNicknameWrite: widget.isSkipNicknameWrite,
          aboutSelf: false,
        ),
        fullscreenDialog: true,
        settings: const RouteSettings(name: '/tagSet'),
      );
      Navigator.of(context).pushAndRemoveUntil(route, ModalRoute.withName('/'));
    } else {
      if (Util.isLoginBeforeBoot()) {
        eventCenter.emit(EventConstant.EventLoginBeforeBoot, context);
      }
      if (!widget.isSkipNicknameWrite) {
        Navigator.of(context).popUntil(ModalRoute.withName('/'));
      }
    }
  }

  void _submit() async {
    if (_selectionSet.isNotEmpty) {
      String url = '${System.domain}tag/set';
      XhrResponse resp = await Xhr.postJson(url,
          {'tagIds': _selectionSet.toList().join(','), 'type': _typeString()},
          throwOnError: false);
      Map? res = resp.value();
      if (res['success'] == true) {
        _finish(_selectionName.toList().join('，'));
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } else {
      Fluttertoast.showToast(
          msg: K.please_select_a_interest_at_least,
          gravity: ToastGravity.CENTER);
    }
  }

  Widget _renderFooter() {
    return BottomButton.of(
      title:
          (widget.isModify || !widget.aboutSelf) ? K.login_ensure : K.next_step,
      onTap: _submit,
    );
  }

  void _selectItem(PersonalTagModel tagModel) async {
    if (_selectionSet.contains(tagModel.id)) {
      _selectionSet.remove(tagModel.id);
      _selectionName.remove(tagModel.name);
    } else if (_selectionSet.length >= 8) {
      Fluttertoast.showToast(
          msg: K.login_interset_max_select_toast, gravity: ToastGravity.CENTER);
      return;
    } else {
      _selectionSet.add(tagModel.id);
      _selectionName.add(tagModel.name);
    }

    setState(() {});
  }

  Widget _buttonItem(PersonalTagModel item) {
    String title = item.name ?? ' ';

    bool selected = _selectionSet.contains(item.id);

    /// 部分手机刚好展示3个卡片，后面的内容没有露出来，兼容一下
    double width = 112;
    double extra = Util.width - 20 - 24 - 3 * 113;
    if (extra > 0 && extra < 15) {
      width = 102;
    }

    return GestureDetector(
      onTap: () => _selectItem(item),
      child: Container(
        height: 35,
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
        decoration: BoxDecoration(
          color: selected ? null : R.color.secondBgColor,
          borderRadius: BorderRadius.circular(8),
          gradient: selected
              ? LinearGradient(colors: R.color.mainBrandGradientColors)
              : null,
        ),
        child: Text(
          title,
          maxLines: 1,
          style: TextStyle(
            fontSize: 13,
            color: selected ? Colors.white : R.color.mainTextColor,
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(TagCategoryModel? categoryModel) {
    if (categoryModel != null) {
      List<Widget> widgets = [];
      for (var item in categoryModel.detail) {
        widgets.add(_buttonItem(item));
      }
      int line = 1;
      if (widgets.length > 9) {
        line = 3;
      } else if (widgets.length > 6) {
        line = 2;
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20, top: 16, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CachedNetworkImage(
                    imageUrl: categoryModel.icon,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover),
                const SizedBox(width: 8),
                Text(
                  categoryModel.name,
                  style: TextStyle(
                      fontSize: 16,
                      color: R.color.mainTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(
                start: 0, end: 0, bottom: 10.0),
            height: (((35.0 * line) + (line - 1) * 12) + 10),
            alignment: AlignmentDirectional.centerStart,
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: widgets,
              ),
            ),
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    List<Widget> widgets = [];
    if (!_loading) {
      widgets.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: Row(
            children: <Widget>[
              Text(
                widget.aboutSelf ? K.describe_self : K.describe_friend,
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 24,
                  fontWeight:
                      loginManager.bold ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              Text(
                K.login_interset_select_count(['${_selectionSet.length}']),
                style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
              ),
              const Spacer(),
              if (!widget.isModify)
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _skipClick,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Text(
                      K.login_skip,
                      style: R.textStyle.medium16
                          .copyWith(color: R.color.mainBrandColor),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );

      widgets.add(Container(
        padding:
            const EdgeInsetsDirectional.only(top: 6, bottom: 18, start: 20),
        alignment: AlignmentDirectional.topStart,
        child: Text(
          widget.aboutSelf
              ? K.select_your_interest_for_recommend
              : K.friend_tag_tips,
          style: TextStyle(color: R.color.secondTextColor, fontSize: 14),
        ),
      ));

      for (var category in categories) {
        widgets.add(_buildCategory(category));
      }
    }

    return WillPopScope(
      onWillPop: () async => widget.isModify,
      child: Scaffold(
        appBar: widget.isModify
            ? BaseAppBar(
                _titleString(),
                showBack: widget.isModify,
              )
            : PreferredSize(
                preferredSize: Size.fromHeight(Util.statusHeight),
                child: Container()),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : !_loadSuccess
                ? ErrorData(
                    error: K.interset_network_error_retry,
                    onTap: () {
                      if (!mounted) return;
                      setState(() {
                        _loading = true;
                      });
                      _load();
                    },
                  )
                : Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: widgets,
                        ),
                      ),
                      _renderFooter(),
                    ],
                  ),
      ),
    );
  }
}
