import 'package:profile/k.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/assets.dart';
import 'package:profile/src/launch_audio/launch_audio_api.dart';
import 'package:profile/src/launch_audio/launch_audio_list_page.dart';
import 'package:profile/src/launch_audio/launch_audio_play_page.dart';
import 'package:profile/src/model/pb/generated/api_tone.pb.dart';

/// 启动音使用变化事件
const eventLaunchAudioUseChange = 'event_launch_audio_use_change';

/// 不夜启动音-分类列表
class LaunchAudioGroupPage extends StatefulWidget {
  const LaunchAudioGroupPage({super.key});

  static Future show(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LaunchAudioGroupPage();
    }));
  }

  @override
  State<LaunchAudioGroupPage> createState() => _LaunchAudioGroupPageState();
}

class _LaunchAudioGroupPageState extends State<LaunchAudioGroupPage> {
  bool _loading = true;
  String? _msg;

  ToneGroupListData? _data;
  ToneAudio? _usingAudio;

  final List<ToneGroup> _list = [];
  bool _male = true;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(eventLaunchAudioUseChange, _onAudioUseChange);
    _loadData();
  }

  @override
  void dispose() {
    eventCenter.removeListener(eventLaunchAudioUseChange, _onAudioUseChange);
    super.dispose();
  }

  void _onAudioUseChange(String type, Object? data) {
    _usingAudio = data as ToneAudio?;
    refresh();
  }

  Future _loadData() async {
    ResToneGroupList resToneGroupList = await LaunchAudioApi.getGroupList();
    // Log.d('LaunchAudioGroupPage _loadData resToneGroupList=${resToneGroupList.toProto3Json()}');
    if (!mounted) return;
    if (resToneGroupList.success) {
      ToneGroupListData data = resToneGroupList.data;
      _data = data;
      if (data.hasUsingAudio()) {
        _usingAudio = data.usingAudio;
      }
      if (data.defaultSex == 1) {
        _male = true;
        _list.addAll(data.male);
      } else {
        _male = false;
        _list.addAll(data.female);
      }
    } else {
      _msg = resToneGroupList.msg;
    }
    _loading = false;
    refresh();
  }

  void _changeSex(bool male) {
    if (male == _male || _data == null) return;
    _male = male;
    _list.clear();
    if (male) {
      _list.addAll(_data!.male);
    } else {
      _list.addAll(_data!.female);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        showBack: true,
        toolbarHeight: 44,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        title: Text(K.sleepless_launch_audio),
        actions: [
          if (_data != null) UnconstrainedBox(child: _renderSexSwitch())
        ],
      ),
      backgroundColor: Colors.transparent,
      body: _renderBody(),
    ).withCommonBg();
  }

  Widget _renderBody() {
    if (_loading) {
      return const Center(child: Loading());
    } else if (_msg != null && _msg!.isNotEmpty) {
      return Center(
        child: ErrorData(
          top: 0,
          bottom: 100,
          error: _msg,
          onTap: () {
            setState(() {
              _loading = true;
            });
            _loadData();
          },
        ),
      );
    } else if (_data == null || _list.isEmpty) {
      return const Center(
        child: EmptyWidget(),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (_usingAudio != null)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              LaunchAudioPlayPage.launch(context, _usingAudio!);
            },
            child: Container(
              width: Util.width,
              height: 44,
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Row(
                children: [
                  Text(
                    K.profile_launch_audio_using,
                    style:
                        const TextStyle(color: Color(0xFF8D6BF7), fontSize: 14),
                  ),
                  CommonAvatar(
                      path: _usingAudio!.icon,
                      size: 21,
                      shape: BoxShape.circle),
                  const SizedBox(width: 3),
                  R.img(
                    BaseAssets.shared$in_room_status_webp,
                    package: ComponentManager.MANAGER_BASE_CORE,
                    color: const Color(0xFF8D6BF7),
                    width: 16,
                    height: 16,
                  ),
                  Expanded(
                    child: Text(
                      _usingAudio!.hotWord,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xFF8D6BF7), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: _list.length,
            padding: const EdgeInsetsDirectional.only(top: 0, bottom: 12),
            itemBuilder: (context, index) {
              return _renderItem(_list[index], index);
            },
          ),
        ),
      ],
    );
  }

  Widget _renderSexSwitch() {
    Widget renderSex(bool male) {
      bool selected = male == _male;
      return GestureDetector(
        onTap: () {
          _changeSex(male);
        },
        child: Container(
          width: 36,
          height: 24,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: selected
                ? (male ? const Color(0x290097FF) : const Color(0x29FA507C))
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: R.img(
            male
                ? Assets.profile$voice_auth_ic_sex_male_webp
                : Assets.profile$voice_auth_ic_sex_female_webp,
            color: selected ? null : const Color(0x3D000000),
            width: 16,
            height: 16,
          ),
        ),
      );
    }

    return Container(
      width: 76,
      height: 28,
      margin: const EdgeInsetsDirectional.only(end: 16),
      padding:
          const EdgeInsetsDirectional.only(start: 2, end: 2, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: const Color(0x0A000000),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          renderSex(true),
          renderSex(false),
        ],
      ),
    );
  }

  Widget _renderItem(ToneGroup item, int index) {
    double width = Util.width - 16 * 2;
    double height = 140.dp;
    List<Color> tagColorList =
        item.tTag.color.map((e) => Util.parseColor(e, Colors.white)!).toList();
    return GestureDetector(
      key: ValueKey('launch_audio_group_${_male}_$index'),
      onTap: () {
        LaunchAudioListPage.launch(context, item.desc, item.groupId);
      },
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(item.imageUrl),
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            PositionedDirectional(
              start: 0,
              end: 0,
              bottom: 0,
              height: 100.dp,
              child: Container(
                width: width,
                height: 100.dp,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x00000000), Color(0x80000000)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, top: 14, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.tTag.tTag.isNotEmpty)
                    Container(
                      padding: const EdgeInsetsDirectional.fromSTEB(4, 2, 4, 2),
                      decoration: BoxDecoration(
                          color: const Color(0xB3000000),
                          borderRadius: BorderRadius.circular(6)),
                      child: GradientText(
                        item.tTag.tTag,
                        gradient: LinearGradient(colors: tagColorList),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  const Spacer(),
                  Text(
                    item.name,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
