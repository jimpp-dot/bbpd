import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/love_test/love_test_share_page.dart';
import 'package:profile/src/model/pb/generated/act.pb.dart';
import 'package:profile/src/love_test/views/love_test_info_view.dart';
import 'package:profile/src/api/api.dart';

import '../../../assets.dart';
import '../../../k.dart';

class LoveTestResultView extends StatefulWidget {
  final int tagId;

  const LoveTestResultView({super.key, required this.tagId});

  @override
  State<LoveTestResultView> createState() => _LoveTestResultViewState();
}

class _LoveTestResultViewState extends State<LoveTestResultView> {
  /// 数据
  ResLoveMatchRes? _resp;
  List<MatchPerson> _personList = [];

  /// 分页参数
  int _page = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _requestTestResult();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CupertinoActivityIndicator());
    }

    if (_resp?.success ?? false) {
      return Scaffold(
        body: Container(child: _buildBody()),
        bottomNavigationBar: _buildBottomNavBar(context),
      );
    }

    // 出错的视图
    return Center(
      child: ErrorData(
        error: _resp?.msg,
        onTap: () {
          _page = 1;
          _requestTestResult();
        },
      ),
    );
  }

  Widget _buildBody() {
    return Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.profile$lovetest_love_test_bg_webp),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.only(
                start: 12.dp, top: 20.dp, end: 12.dp, bottom: 10.dp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoveTestInfoView(info: _resp!.data),
                SizedBox(height: 10.dp),
                _buildTitleView(),
                SizedBox(height: 10.dp),
                _buildPersonListView()
              ],
            )));
  }

  // 底部分享按钮
  Widget _buildBottomNavBar(BuildContext context) {
    return BottomButton.of(
        title: K.profile_love_test_share,
        bgColor: [const Color(0xFF484848), const Color(0xFF000000)],
        onTap: () {
          LoveTestSharePage.show(context, info: _resp!.data);
        });
  }

  // 换一换
  Widget _buildTitleView() {
    return Container(
      height: 30.dp,
      padding: EdgeInsetsDirectional.only(
          start: 10.dp, top: 0, end: 10.dp, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(K.profile_love_test_find,
              style: TextStyle(fontSize: 14.dp, fontWeight: FontWeight.bold)),
          GestureDetector(
            child: Text(K.profile_love_test_change,
                style: TextStyle(fontSize: 14.dp, fontWeight: FontWeight.bold)),
            onTap: () {
              _requestTestResult();
            },
          ),
        ],
      ),
    );
  }

  // 匹配用户列表
  Widget _buildPersonListView() {
    List<Widget> items = _personList.map((e) {
      return _buildItem(e);
    }).toList();
    return Column(children: items);
  }

  Widget _buildItem(MatchPerson item) {
    return Column(
      children: [
        Container(
          height: 80.dp,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.black, width: 1.dp, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20.dp),
          ),
          child: Row(
            children: [
              SizedBox(width: 12.dp),
              CommonAvatar(
                path: item.icon,
                size: 56.dp,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(28.dp),
                onTap: () {
                  _onAvatarTapped(item.uid);
                },
              ),
              SizedBox(width: 12.dp),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 100.dp),
                        child: Text(item.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15.dp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                    SizedBox(width: 2.dp),
                    UserSexAndAgeWidget(sex: item.sex, age: item.age),
                  ]),
                  _buildTagListView(item.marks)
                ],
              ),
              const Spacer(),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  // 进入到私聊页
                  _onSayHiButtonTap(item);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      child: R.img(Assets.profile$lovetest_love_test_sayhi_webp,
                          width: 46.dp,
                          height: 46.dp,
                          package: ComponentManager.MANAGER_PROFILE),
                    ),
                    const SizedBox(height: 4),
                    Text(K.profile_love_test_greet,
                        style: TextStyle(fontSize: 10.dp))
                  ],
                ),
              ),
              SizedBox(width: 12.dp)
            ],
          ),
        ),
        SizedBox(height: 10.dp)
      ],
    );
  }

  Widget _buildTagListView(List<String> tags) {
    var children = tags.map((e) {
      return Row(
        children: [
          Container(
            height: 17.dp,
            padding: EdgeInsetsDirectional.only(
                start: 5.dp, top: 0, end: 5.dp, bottom: 0),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F2EC),
              borderRadius: BorderRadius.circular(8.dp),
            ),
            child: Text(e,
                style:
                    TextStyle(color: const Color(0XFF9C8262), fontSize: 11.dp)),
          ),
          SizedBox(width: 5.dp)
        ],
      );
    }).toList();
    return Row(children: children);
  }

  Future<void> _requestTestResult() async {
    var curPage = _page;
    var isFirstLoad = (curPage == 1);
    if (isFirstLoad) {
      _isLoading = true;
    }
    var resp = await Api.getLoveTestResult(widget.tagId, curPage);
    if (isFirstLoad) {
      _isLoading = false;
    }

    if (resp.success) {
      if (curPage == 1) {
        // 第一次请求
        _resp = resp;
      }
      _personList = resp.data.personList;
      curPage++;
      _page = curPage;
    } else {
      if (curPage == 1) {
        _resp = resp;
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  _onAvatarTapped(int uid) {
    var mgr = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    mgr.openImageScreen(context, uid);

    Tracker.instance.track(TrackEvent.love_personality_click, properties: {
      'type': "result_gs",
    });
  }

  _onSayHiButtonTap(MatchPerson item) async {
    String type = 'private';
    MessageContent content = MessageContent(
        'text', SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = item.sayHiWord;
    bool canSendMsgWhenSayHi =
        await BaseRequestManager.checkCanSendMsgWhenSayHi(item.uid, type);
    if (canSendMsgWhenSayHi) {
      await Im.sendMessage(type, item.uid.toString(), content,
          supportVersion: ImSupportSDKVersions.MOMENT_MESSAGE_SUPPORT_VERSION);
    }
    IChatManager chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(context,
        type: type, targetId: item.uid, title: item.name);
  }
}
