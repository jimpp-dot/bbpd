// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:profile/assets.dart';
import 'package:profile/src/model/pb/generated/slp_voice_auto.pb.dart';
import '../k.dart';

class VoiceAuthPage extends StatefulWidget {
  const VoiceAuthPage({super.key});

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const VoiceAuthPage(),
      settings: const RouteSettings(name: '/VoiceAuth'),
    ));
  }

  @override
  State<StatefulWidget> createState() => _VoiceAuthPageState();
}

class _VoiceAuthPageState extends State<VoiceAuthPage> {
  final PageController _controller =
      PageController(initialPage: Session.sex == 2 ? 1 : 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(K.profile_voice_auth),
        actions: [
          UnconstrainedBox(
              child: _SexSwitchWidget(onTabChanged: _onTabChanged)),
        ],
      ),
      body: Container(
        padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp, top: 6),
        child: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            _VoiceAuthSubPage(index: 0),
            _VoiceAuthSubPage(index: 1),
          ],
        ),
      ),
    );
  }

  void _onTabChanged(int index) {
    _controller.jumpToPage(index);
  }
}

class _VoiceAuthSubPage extends StatefulWidget {
  final int index;

  const _VoiceAuthSubPage({required this.index});

  @override
  State<StatefulWidget> createState() => _VoiceAuthSubPageState();
}

class _VoiceAuthSubPageState extends State<_VoiceAuthSubPage>
    with AutomaticKeepAliveClientMixin {
  bool _loading = true;
  String _err = '';
  VoiceVerifyHomeData? _homeData;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    ResVoiceVerifyHome res;
    try {
      XhrResponse response = await Xhr.get(
          'go/yy/voice/verifyHome?gender=${widget.index + 1}',
          pb: true,
          throwOnError: true);
      res = ResVoiceVerifyHome.fromBuffer(response.bodyBytes);
    } catch (e) {
      res = ResVoiceVerifyHome(msg: e.toString(), success: false);
    }
    _loading = false;
    if (res.success) {
      _err = '';
      _homeData = res.data;
    } else {
      _err = res.msg;
    }
    refresh();
  }

  void _reload() {
    _loading = true;
    _err = '';
    refresh();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Loading();
    } else if (_err.isNotEmpty) {
      return ErrorData(
        error: _err,
        onTap: _reload,
      );
    } else if (_homeData == null || _homeData!.list.isEmpty) {
      return const EmptyWidget();
    } else {
      return CustomScrollView(slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(_buildItem,
              childCount: _homeData!.list.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 167.5 / 104,
            crossAxisSpacing: 8.dp,
            mainAxisSpacing: 8.dp,
          ),
        ),
      ]);
    }
  }

  Widget _buildItem(BuildContext buildContext, int index) {
    VoiceVerifyItem model = _homeData!.list[index];
    Color btnColor = model.verify == 2
        ? Colors.white
        : (widget.index == 0
            ? const Color(0xFF37AFE7)
            : const Color(0xFFFF7F7F));
    Color btnBgColor;

    String statusName = '';
    String btnTitle = K.profile_apply;
    if (model.verify == 1) {
      //审核中
      statusName = K.profile_welcome_state_check;
      btnTitle = K.profile_apply;
      btnBgColor = Colors.white;
    } else if (model.verify == 2) {
      //已认证
      statusName = K.profile_authenticated_status;
      btnTitle = K.profile_cancle_auth;
      btnBgColor = Colors.white.withOpacity(0.2);
    } else {
      statusName = K.profile_ready_auth_status;
      btnTitle = K.profile_apply;
      btnBgColor = Colors.white;
    }

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(model.image),
          fit: BoxFit.cover,
        ),
        PositionedDirectional(
          top: 12.dp,
          start: 12.dp,
          child: Text(
            model.name,
            style: R.textStyle.medium18.copyWith(color: Colors.white),
          ),
        ),
        PositionedDirectional(
            top: 36.dp,
            start: 12.dp,
            child: Text(statusName,
                style: R.textStyle.regular12
                    .copyWith(fontSize: 13, color: Colors.white))),
        PositionedDirectional(
          bottom: 12.dp,
          start: 12.dp,
          child: GestureDetector(
            onTap: () async {
              if (model.verify == 2) {
                String? msg = await cancelAuth(model.tagId);
                if (msg != null) {
                  Fluttertoast.showCenter(msg: msg);
                } else {
                  _reload();
                }
              } else if (model.verify == 0) {
                String? audioUrl;
                String bg = widget.index == 0
                    ? Assets.profile$voice_auth_bg_record_male_webp
                    : Assets.profile$voice_auth_bg_record_female_webp;
                IPersonalDataManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                await manager.openAudioRecord(buildContext,
                    type: AudioRecordType.common,
                    bgAsset: bg,
                    minDuration: 10, uploadedFunc: (String url) {
                  audioUrl = url;
                }, afterUploaded: [
                  () async {
                    if (audioUrl == null) {
                      return K.audio_url_cannot_empty;
                    }

                    String? msg = await auth(model.tagId, audioUrl!);
                    return msg;
                  }
                ]);
                _reload();
              }
            },
            child: Container(
              width: 70,
              height: 28,
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                  shape: const StadiumBorder(), color: btnBgColor),
              child: Text(
                btnTitle,
                style: R.textStyle.medium12
                    .copyWith(fontSize: 13, color: btnColor),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<String?> auth(int tagId, String audioUrl) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/voice/saveAudio',
        {'tag_id': tagId.toString(), 'audio': audioUrl},
        pb: true,
        throwOnError: true,
      );
      NormalNull res = NormalNull.fromBuffer(response.bodyBytes);
      return res.success ? null : res.msg;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> cancelAuth(int tagId) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/voice/cancelVerify',
        {'tag_id': tagId.toString()},
        pb: true,
        throwOnError: true,
      );
      NormalNull res = NormalNull.fromBuffer(response.bodyBytes);
      return res.success ? null : res.msg;
    } catch (e) {
      return e.toString();
    }
  }
}

class _SexSwitchWidget extends StatefulWidget {
  final ValueChanged<int> onTabChanged;

  const _SexSwitchWidget({required this.onTabChanged});

  @override
  State<_SexSwitchWidget> createState() => _SexSwitchWidgetState();
}

class _SexSwitchWidgetState extends State<_SexSwitchWidget> {
  int _index = Session.sex == 2 ? 1 : 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 28,
      margin: const EdgeInsetsDirectional.only(end: 16),
      padding: const EdgeInsetsDirectional.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(14),
          color: const Color(0x0A000000)),
      child: Row(
        children: [
          _buildSex(0, const Color(0x290097FF),
              Assets.profile$voice_auth_ic_sex_male_webp),
          _buildSex(1, const Color(0x29FA507C),
              Assets.profile$voice_auth_ic_sex_female_webp),
        ],
      ),
    );
  }

  Widget _buildSex(int index, Color bgSelect, String icon) {
    bool select = _index == index;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (select) {
          return;
        }
        setState(() {
          _index = index;
        });
        widget.onTabChanged(index);
      },
      child: Container(
        width: 36,
        height: 24,
        decoration: select
            ? BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(12),
                color: bgSelect)
            : null,
        alignment: AlignmentDirectional.center,
        child: R.img(icon,
            width: 16,
            height: 16,
            color: select ? null : const Color(0x3D000000)),
      ),
    );
  }
}
