import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/k.dart';
import 'package:profile/src/api/api.dart';
import 'package:profile/src/love_test/views/love_test_guide_view.dart';
import 'package:profile/src/love_test/views/love_test_result_view.dart';
import 'package:profile/src/model/pb/generated/act.pb.dart';

/// 恋爱人格测试测试状态
enum LoveTestStatus {
  undone, // 未完成
  done // 已完成
}

/// 恋爱人格测试首页（根据用户是否参与测试，展示页面为引导页/结果页）

class LoveTestIndexPage extends StatefulWidget {
  const LoveTestIndexPage({super.key});

  static Future<void> show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoveTestIndexPage(),
      settings: const RouteSettings(name: '/loveTestIndex'),
    ));
  }

  @override
  State<LoveTestIndexPage> createState() => _LoveTestIndexPageState();
}

class _LoveTestIndexPageState extends State<LoveTestIndexPage> {
  LoveExamIndexRes? _indexResp;
  bool _isLoading = false;

  // 如果页面请求失败，那么 _curStatus == null
  LoveTestStatus? get _curStatus {
    if (_indexResp == null || _indexResp!.success == false) {
      return null;
    }
    return (_indexResp!.data.status == 1)
        ? LoveTestStatus.done
        : LoveTestStatus.undone;
  }

  @override
  void initState() {
    super.initState();

    _requestTestStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.profile_love_test, onBackPressedCallback: _pop),
      body: Container(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CupertinoActivityIndicator());
    }
    if (_curStatus == LoveTestStatus.done) {
      return LoveTestResultView(tagId: _indexResp!.data.tagId);
    }
    if (_curStatus == LoveTestStatus.undone) {
      return LoveTestGuideView(list: _indexResp!.data.matchPool);
    }
    return Center(
      child: ErrorData(
        error: _indexResp?.msg,
        onTap: () {
          _requestTestStatus();
        },
      ),
    );
  }

  Future<void> _requestTestStatus() async {
    _isLoading = true;
    _indexResp = await Api.getLoveTestStatus();
    _isLoading = false;

    if (mounted) {
      setState(() {});
    }

    Tracker.instance.track(TrackEvent.enter_love_personality, properties: {
      'is_finish': _indexResp?.data.status ?? 0,
    });

    if (Session.sex <= 0) {
      var loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      await loginManager.showCompleteInfoWidget(context, check: false);
      _pop();
    }
  }

  void _pop() {
    Navigator.of(context).popUntil((route) =>
        (route.settings.name != '/loveTestIndex' &&
            route.settings.name != '/LoveTestAnswerPage'));
  }
}
