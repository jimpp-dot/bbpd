import 'dart:async';
import 'dart:core';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/api/api.dart';
import 'package:personaldata/src/model/voiceTextModel.dart';
import 'package:personaldata/src/widget/mark_down_content_widget.dart';

import '../../k.dart';

class MarkDownScreen extends StatefulWidget {
  final int type; //1-主播管理规则，2-用户行为规则 3-派对管理规范
  const MarkDownScreen(this.type, {super.key});
  static show(BuildContext context, int type) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MarkDownScreen(type),
        settings: const RouteSettings(name: '/MarkDownScreen'),
      ),
    );
  }

  @override
  _MarkDownScreenState createState() => _MarkDownScreenState();
}

class _MarkDownScreenState extends State<MarkDownScreen> {
  late ScrollController _scrollController;
  Timer? _timer;
  int _countDownTime = 0;
  bool _loading = true;
  DataRsp<MarkDownInfo>? _dataRsp;
  bool _hasScrollDown = false;
  bool _hasSelect = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(_loading ? '' : _dataRsp?.data?.title ?? ''),
      body: _buildBoyd(),
      bottomNavigationBar: _loading ? null : _buildFooter(),
    );
  }

  _buildBoyd() {
    if (_loading) {
      return const Loading();
    }
    if (!(_dataRsp?.success ?? false)) {
      return ErrorData(
        error: _dataRsp?.msg,
        onTap: _loadData,
      );
    }
    return MarkDownContentWidget(
      content: _dataRsp?.data?.rules ?? '',
      controller: _scrollController,
    );
  }

  _loadData() async {
    _dataRsp = await Api.getBehaviorRules(widget.type);
    if (_dataRsp?.success == true) {
      _countDownTime = _dataRsp?.data?.countdown ?? 0;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _countDownTime--;
        if (_countDownTime <= 0) {
          _countDownTime = 0;
          _timer!.cancel();
        }
        if (mounted) {
          setState(() {});
        }
      });
    }
    _loading = false;
    if (mounted) {
      setState(() {});
    }
  }

  _canGoNext() {
    _onScroll();
    return _hasScrollDown && _hasSelect && (_countDownTime <= 0);
  }

  _onScroll() {
    if (!_scrollController.hasClients) return;
    if (!_hasScrollDown &&
        _scrollController.position.maxScrollExtent <=
            _scrollController.offset) {
      _hasScrollDown = true;
    }
  }

  Widget _buildFooter() {
    String str = K.personal_next_step;
    if (_countDownTime > 0) {
      str = '$str (${_countDownTime}s)';
    }
    Widget btn;
    if (_canGoNext()) {
      btn = BottomButton.of(title: str, onTap: _nextStepAction);
    } else {
      btn = BottomButton.of(
          title: str,
          decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(24.0))),
          textColor: R.color.thirdTextColor.withOpacity(0.2));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _hasSelect = !_hasSelect;
                if (mounted) {
                  setState(() {});
                }
              },
              child: _hasSelect
                  ? Container(
                      decoration: ShapeDecoration(
                          shape: const StadiumBorder(),
                          color: R.color.mainBrandColor),
                      child: R.img('ic_checkbox_selected.webp',
                          width: 16,
                          height: 16,
                          package: ComponentManager.MANAGER_PERSONALDATA),
                    )
                  : Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: R.color.mainBgColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 2, color: const Color(0x33313131)),
                      ),
                    ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              K.personal_rules_tips([_dataRsp?.data?.title ?? '']),
              maxLines: 1,
              style: R.textStyle.regular10
                  .copyWith(color: R.color.secondTextColor, fontSize: 11),
            )
          ],
        ),
        btn
      ],
    );
  }

  _nextStepAction() {
    if (widget.type == 1) {
      MarkDownScreen.show(context, 2);
    } else {}
  }
}
