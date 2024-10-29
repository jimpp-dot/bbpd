import 'dart:async';
import 'dart:convert';

import 'package:certificate/assets.dart';
import 'package:shared/shared.dart';
import 'package:certificate/k.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../api.dart';
import '../audio_record_button.dart';
import '../base/certificate_screen_mixin.dart';
import '../certify_audio_demo_dialog.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../model/pb/generated/category.pb.dart';

/// 具体资质申请认证
class CertificateDetailScreen extends StatefulWidget {
  /// 技能id
  final int cid;

  /// 技能名称
  final String name;

  const CertificateDetailScreen(
      {super.key, required this.cid, required this.name});

  static Future show(BuildContext context, int? cid, String? name) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CertificateDetailScreen(
          cid: cid ?? 0,
          name: name ?? '',
        ),
        settings: const RouteSettings(name: '/certificateDetailScreen'),
      ),
    );
  }

  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<CertificateDetailScreen>
    with CertificateScreenMixin {
  bool disabled = true;

  String audio = '';
  String audioLocalFile = '';
  int duration = 0;

  String accompany = '';
  String accompanyLocalFile = '';
  int accompanyDuration = 0;

  /// 0-默认；1-音频1正在占用；2-音频2正在占用；
  int _audioState = 0;
  String cover = '';
  String gameId = '';
  String description = '';
  String sign = '';
  int level = 0;
  String levelMessage = '';
  String deviceMessage = "";

  late FocusNode _focusNode;
  late TextEditingController _textController;

  String? _signCode;
  final IPersonalDataManager _personalDataManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);

  final ScrollController _controller = ScrollController();

  late StreamSubscription<bool> keyboardSubscription;

  // 歌手资质
  bool get isSinger => widget.cid == 34;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    skillName = widget.name;
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocus);

    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible == false) {
        _focusNode.unfocus();
      }
    });
    load(widget.cid);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_onFocus);
    _focusNode.dispose();
    _textController.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  void initConfigs() {
    if (skillDetail != null && verifyDetail != null) {
      verifyState = verifyDetail!.verifyState;
      cover = verifyDetail!.cover;
      gameId = verifyDetail!.gameId;
      description = verifyDetail!.orderDescription;
      _textController.text = description;
      deviceMessage = verifyDetail!.gameSystem;
      level = verifyDetail!.level;
      if (level > 0) {
        List<CategoryLevel> tempList = skillDetail!.levelList;
        for (var item in tempList) {
          if (Util.parseInt(item.id) == level) {
            levelMessage = item.title;
          }
        }
      }

      List audioConfig = verifyDetail!.audio.split(':');
      if (audioConfig.length == 2) {
        if (!audioConfig[0].startsWith(RegExp(r'http(s?)://'))) {
          audio = System.imageDomain + audioConfig[0];
        } else {
          audio = audioConfig[0];
        }
        duration = Util.parseInt(audioConfig[1]);
      } else {
        audio = "";
        duration = 0;
      }

      List accompanyConfig = verifyDetail!.accompany.split(':');
      if (accompanyConfig.length == 2) {
        if (!accompanyConfig[0].startsWith(RegExp(r'http(s?)://'))) {
          accompany = System.imageDomain + accompanyConfig[0];
        } else {
          accompany = accompanyConfig[0];
        }
        accompanyDuration = Util.parseInt(accompanyConfig[1]);
      } else {
        accompany = "";
        accompanyDuration = 0;
      }
    }
    _check();
    refresh();
  }

  _onFocus() {
    Log.d("focus --------------- ${_focusNode.hasFocus}");
  }

  Widget _renderIcon() {
    if (cover.isEmpty) {
      return R.img(
        Assets.certificate$certificate_addpic_png,
        width: 115.0,
      );
    }
    return CommonAvatar(
      path: cover,
      size: 90,
      borderRadius: BorderRadius.circular(12),
    );
  }

  void _onRecordComplete(String localFile, int tmpDuration) {
    if (!mounted) return;
    setState(() {
      audioLocalFile = localFile;
      duration = tmpDuration;
    });

    _check();
  }

  void _onRecordComplete2(String localFile, int tmpDuration) {
    if (!mounted) return;
    setState(() {
      accompanyLocalFile = localFile;
      accompanyDuration = tmpDuration;
    });

    _check();
  }

  String _getSignCode() {
    return jsonEncode({
      'cover': cover,
      'audio': audio,
      'audioLocalFile': audioLocalFile,
      if (isSinger) 'accompany': accompany,
      if (isSinger) 'accompanyLocalFile': accompanyLocalFile,
      'description': description,
      'level': level,
      'game_id': gameId,
      'sign': sign
    });
  }

  bool _check() {
    bool audioNeed = Util.parseInt(skillDetail?.audioNeed) > 0;
    bool gameIdNeed = Util.parseInt(skillDetail?.gameIdNeed) > 0;
    List devices = skillDetail?.systems ?? [];
    bool deviceNeed = devices.isNotEmpty;

    bool hasAudio = false;
    bool hasLevel = true;
    bool hasGameId = true;
    bool hasDevice = true;

    if (isSinger) {
      if (((audioLocalFile.isNotEmpty || audio.isNotEmpty) &&
              (accompanyLocalFile.isNotEmpty || accompany.isNotEmpty)) ||
          audioNeed == false) {
        hasAudio = true;
      }
    } else {
      if (audioLocalFile.isNotEmpty || audio.isNotEmpty || audioNeed == false) {
        hasAudio = true;
      }
    }

    List tempList = skillDetail?.levelList ?? [];
    if (tempList.isNotEmpty && level == 0) {
      hasLevel = false;
    }

    if (gameIdNeed && gameId.isEmpty) {
      hasGameId = false;
    }

    if (deviceNeed && deviceMessage.isEmpty) {
      hasDevice = false;
    }

    if (isSinger && hasAudio && description.isNotEmpty) {
      disabled = false;
    } else if (cover.isNotEmpty &&
        hasAudio &&
        hasLevel &&
        description.isNotEmpty &&
        hasGameId &&
        hasDevice) {
      disabled = false;
    }
    Log.d(
        "check local : disabled:$disabled,singer:$isSinger,cover:$cover,hasAudio:$hasAudio,hasLevel:$hasLevel,description:$description,hasGameId:$hasGameId,hasDevice:$hasDevice");
    if (!mounted) return false;
    setState(() {});

    return true;
  }

  /// 技能说明/主播游戏卡说明
  List<Widget> _buildSkillInfo() {
    String? cond = skillDetail?.cond;
    bool hasCond = cond != null && cond.isNotEmpty;

    List<Widget> widgets = [
      buildTitleWidget(K.skill_introduce, left: 16, top: 20),
      buildContentWidget(skillDetail?.description ?? '', top: 12),
    ];

    /// 资质条件
    if (hasCond) {
      widgets.add(
          buildTitleWidget(K.skill_certificate_request, top: 24, left: 16));
      widgets.add(buildContentWidget(cond, bottom: 16, top: 12));
    }
    widgets.add(WidgetUtils.buildDivider());

    return widgets;
  }

  /// 填写技能等级
  List<Widget> _buildGameInfo() {
    List<CategoryLevel> levels = skillDetail?.levelList ?? [];
    bool hasGameId = Util.parseInt(skillDetail?.gameIdNeed) > 0;
    bool hasLevel = levels.isNotEmpty;
    List devices = skillDetail?.systems ?? [];
    bool hasDevice = devices.isNotEmpty;
    bool hasGameLevelItem = hasGameId || hasLevel || hasDevice;

    List<Widget> widgets = [];

    if (hasGameLevelItem) {
      widgets.add(buildTitleWidget(K.input_skill_level, left: 16, top: 20));

      if (hasGameId) {
        widgets.add(ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Text(
            K.game_id,
            style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 9),
                child: Text(
                  gameId.toString(),
                  style: TextStyle(
                    color: R.color.secondTextColor,
                  ),
                ),
              ),
              Icon(Icons.navigate_next, color: R.color.thirdTextColor),
            ],
          ),
          onTap: () async {
            int index = FormScreen.config(
              title: K.please_input_game_id,
              value: gameId.toString(),
              allowEmpty: false,
            );

            String? value = await FormScreen.openFormScreen(context, index);
            if (!mounted || value == null) return;
            setState(() {
              gameId = value;
            });
            _check();
          },
        ));
      }
      if (hasLevel) {
        widgets.add(ListTile(
          title: Text(
            K.level,
            style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 9),
                child: Text(
                  levelMessage.toString(),
                  style: TextStyle(color: R.color.secondTextColor),
                ),
              ),
              Icon(Icons.navigate_next, color: R.color.thirdTextColor),
            ],
          ),
          onTap: () async {
            List<SheetItem> types = [];
            for (var item in levels) {
              types.add(SheetItem(item.title, "${item.id}"));
            }

            SheetCallback? result = await displayModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return RadioBottomSheet(title: K.choose_level, data: types);
                });
            if (result == null || result.reason == SheetCloseReason.Active) {
              return;
            }

            if (!mounted) return;
            setState(() {
              level = Util.parseInt(result.value?.key);
              levelMessage = result.value?.label ?? "";
            });
            _check();
          },
        ));
      }
      if (hasDevice) {
        widgets.add(ListTile(
          title: Text(
            K.cer_game_device,
            style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 9),
                child: Text(
                  deviceMessage.toString(),
                  style: TextStyle(color: R.color.secondTextColor),
                ),
              ),
              Icon(Icons.navigate_next, color: R.color.thirdTextColor),
            ],
          ),
          onTap: () async {
            List<SheetItem> types = [];
            for (int i = 0; i < devices.length; i++) {
              types.add(SheetItem(devices[i], "$i"));
            }
            SheetCallback? result = await displayModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return RadioBottomSheet(
                      title: K.cer_choose_device, data: types);
                });
            if (result == null || result.reason == SheetCloseReason.Active) {
              return;
            }

            if (!mounted) return;
            setState(() {
              deviceMessage = result.value?.label ?? "";
            });
            _check();
          },
        ));
      }
      widgets.add(Container(
        height: 10,
      ));
      widgets.add(buildDivider());
    }

    return widgets;
  }

  void _gotoImageViewScreen(String uri) {
    _personalDataManager.openImageViewScreen(context,
        image: Uri.decodeComponent(uri));
  }

  /// 上传技能封面
  List<Widget> _buildSkillCover() {
    List<Widget> widgets = [];
    widgets.add(buildTitleWidget(K.upload_skill_cover, left: 16, top: 20));

    widgets.add(Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 4, right: 16),
      child: Text(
        skillDetail?.coverDescription ?? K.please_upload_better_photo,
        style: TextStyle(color: R.color.fourthBrightColor, fontSize: 13),
      ),
    ));
    widgets.add(
      Container(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 24),
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                        onTap: () {
                          _gotoImageViewScreen(
                              Util.getRemoteImgUrl(skillDetail!.example));
                        },
                        child: Image.network(
                          Util.cover375(skillDetail?.example ?? "") ?? '',
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    K.eg_photo,
                    style: TextStyle(
                      fontSize: 13,
                      color: R.color.thirdTextColor,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ImageUpload(
                      source: ImageSource.gallery,
                      uploadUrl: '${System.domain}upload/image/',
                      child: _renderIcon(),
                      onComplete:
                          (String name, int width, int height, Map origin) {
                        if (!mounted) return false;
                        setState(() {
                          cover = name;
                        });
                        return _check();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    K.upload_cover,
                    style: TextStyle(
                      fontSize: 13,
                      color: R.color.thirdTextColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    widgets.add(WidgetUtils.buildDivider());

    return widgets;
  }

  /// 录制技能语音
  List<Widget> _buildAudio() {
    bool audioNeed = Util.parseInt(skillDetail?.audioNeed ?? 0) > 0;
    String audioDesc = K.record_voice_introduce_skill;

    List audioExample = [];
    try {
      audioExample = skillDetail?.audioExample ?? [];
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    List<String> audioDemos = [];
    for (var element in audioExample) {
      audioDemos.add('$element');
    }

    List<Widget> widgets = [];
    if (audioNeed) {
      widgets.add(Row(
        children: <Widget>[
          Expanded(
              child: buildTitleWidget(K.record_skill_voice, left: 16, top: 20)),
          if (audioDemos.isNotEmpty)
            GestureDetector(
              onTap: () {
                CertifyAudioDemoDialog.show(context, audioDemos);
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 18, top: 20, end: 12),
                child: Row(
                  children: [
                    Text(
                      K.cer_eg_voice,
                      style: TextStyle(
                          fontSize: 13, color: R.color.thirdTextColor),
                    ),
                    const SizedBox(width: 2),
                    Icon(Icons.navigate_next, color: R.color.thirdTextColor),
                  ],
                ),
              ),
            ),
        ],
      ));

      widgets.add(
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 6),
          child: Text(
            audioDesc,
            style: TextStyle(fontSize: 13, color: R.color.fourthBrightColor),
          ),
        ),
      );

      widgets.add(Container(
        alignment: AlignmentDirectional.center,
        child: AudioRecordButton(
          onRecordComplete: _onRecordComplete,
          onRecordRemoved: () {
            setState(() {
              duration = 0;
              audioLocalFile = '';
              audio = '';
            });
          },
          audioUrl: audio,
          audioDuration: duration,
        ),
      ));
      widgets.add(WidgetUtils.buildDivider());
    }

    return widgets;
  }

  /// 录制技能语音
  List<Widget> _buildAudio1() {
    bool audioNeed = Util.parseInt(skillDetail?.audioNeed ?? 0) > 0;
    String audioDesc = K.record_voice_introduce_skill;

    List audioExample = skillDetail?.audioExample ?? [];
    List<String> audioDemos = [];
    for (var element in audioExample) {
      audioDemos.add('$element');
    }

    List<Widget> widgets = [];
    if (audioNeed) {
      widgets.add(Row(
        children: <Widget>[
          Expanded(
              child: buildTitleWidget(
                  isSinger ? K.cer_juke_audio_title_1 : K.cer_audio_title_1,
                  left: 16,
                  top: 20)),
          if (audioDemos.isNotEmpty)
            GestureDetector(
              onTap: () {
                CertifyAudioDemoDialog.show(context, audioDemos);
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 18, top: 20, end: 12),
                child: Row(
                  children: [
                    Text(
                      K.cer_eg_voice,
                      style: TextStyle(
                          fontSize: 13, color: R.color.thirdTextColor),
                    ),
                    const SizedBox(width: 2),
                    Icon(Icons.navigate_next, color: R.color.thirdTextColor),
                  ],
                ),
              ),
            ),
        ],
      ));

      widgets.add(
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 6),
          child: Text(
            audioDesc,
            style: TextStyle(fontSize: 13, color: R.color.fourthBrightColor),
          ),
        ),
      );

      widgets.add(Container(
        alignment: AlignmentDirectional.center,
        child: AudioRecordButton(
          maxRecordDuration: isSinger ? 120 : 60,
          onRecordComplete: _onRecordComplete,
          onRecordRemoved: () {
            setState(() {
              duration = 0;
              audioLocalFile = '';
              audio = '';
            });
          },
          onAudioState: (state) {
            _audioState = (state != 0) ? 1 : 0;
          },
          onTapFilter: () {
            if (_audioState == 2) {
              /// 音频2 正在录制或正在播放
              return true; // 拦截点击
            }
            return false;
          },
          audioUrl: audio,
          audioDuration: duration,
        ),
      ));
      widgets.add(WidgetUtils.buildDivider());
    }

    return widgets;
  }

  /// 录制技能语音
  List<Widget> _buildAudio2() {
    bool audioNeed = Util.parseInt(skillDetail?.audioNeed ?? 0) > 0;
    String audioDesc = K.record_voice_introduce_skill;

    List audioExample = skillDetail?.audioExample ?? [];
    List<String> audioDemos = [];
    for (var element in audioExample) {
      audioDemos.add('$element');
    }

    List<Widget> widgets = [];
    if (audioNeed) {
      widgets.add(Row(
        children: <Widget>[
          Expanded(
              child: buildTitleWidget(
                  isSinger ? K.cer_juke_audio_title_2 : K.cer_audio_title_2,
                  left: 16,
                  top: 20)),
          if (audioDemos.isNotEmpty)
            GestureDetector(
              onTap: () {
                CertifyAudioDemoDialog.show(context, audioDemos);
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 18, top: 20, end: 12),
                child: Row(
                  children: [
                    Text(
                      K.cer_eg_voice,
                      style: TextStyle(
                          fontSize: 13, color: R.color.thirdTextColor),
                    ),
                    const SizedBox(width: 2),
                    Icon(Icons.navigate_next, color: R.color.thirdTextColor),
                  ],
                ),
              ),
            ),
        ],
      ));

      widgets.add(
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 6),
          child: Text(
            audioDesc,
            style: TextStyle(fontSize: 13, color: R.color.fourthBrightColor),
          ),
        ),
      );

      widgets.add(Container(
        alignment: AlignmentDirectional.center,
        child: AudioRecordButton(
          maxRecordDuration: isSinger ? 120 : 60,
          onRecordComplete: _onRecordComplete2,
          onRecordRemoved: () {
            setState(() {
              accompanyDuration = 0;
              accompanyLocalFile = '';
              accompany = '';
            });
          },
          onAudioState: (state) {
            _audioState = (state != 0) ? 2 : 0;
          },
          onTapFilter: () {
            if (_audioState == 1) {
              /// 音频1 正在录制或正在播放
              return true; // 拦截点击
            }
            return false;
          },
          audioUrl: accompany,
          audioDuration: accompanyDuration,
        ),
      ));
      widgets.add(WidgetUtils.buildDivider());
    }
    return widgets;
  }

  /// 接单说明
  List<Widget> _buildOrderExplain() {
    List<Widget> widgets = [];
    widgets.add(buildTitleWidget(
        isSinger ? K.cer_self_introduce : K.receive_order_intro,
        left: 16,
        top: 20));
    widgets.add(_buildTextArea());
    return widgets;
  }

  List<Widget> _buildBottomWidgets() {
    List<Widget> widgets = [];
    widgets.add(Container(
      margin: const EdgeInsets.only(left: 16, top: 34, right: 16, bottom: 14),
      child: InkWell(
        onTap: () {
          _check();
          if (disabled) {
            Toast.showCenter(context, K.cer_please_perfect_all_info);
            return;
          }
          _submit();
        },
        borderRadius: BorderRadius.circular(27),
        child: Ink(
          height: 48,
          decoration: BoxDecoration(
            color: R.color.mainBrandColor,
            borderRadius: BorderRadius.circular(27),
          ),
          child: Center(
            child: Text(
              K.cer_submit,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    ));
    return widgets;
  }

  Widget _buildNormal() {
    List<Widget> widgets = [];
    widgets.addAll(_buildSkillInfo());
    widgets.addAll(_buildGameInfo());

    if (isSinger) {
      // 歌手资质
      if (Util.parseBool(skillDetail?.coverNeed) == true) {
        widgets.addAll(_buildSkillCover());
      }
      widgets.addAll(_buildAudio1());
      widgets.addAll(_buildAudio2());
      widgets.addAll(_buildOrderExplain());
    } else {
      // 其它所有资质
      if (Util.parseBool(skillDetail?.coverNeed) == true) {
        widgets.addAll(_buildSkillCover());
      }

      widgets.addAll(_buildAudio());
      widgets.addAll(_buildOrderExplain());
    }

    widgets.add(Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: Text(K.cer_cancel_tips(["${skillDetail?.cancelMoney ?? 0}"]),
            style: TextStyle(
                fontSize: 12,
                color: R.color.thirdTextColor,
                fontWeight: FontWeight.normal))));
    widgets.addAll(_buildBottomWidgets());

    return ListView(
      controller: _controller,
      addAutomaticKeepAlives: true,
      children: widgets,
    );
  }

  void _submit() async {
    if (_getSignCode() == _signCode) {
      Fluttertoast.showToast(
          msg: K.cer_empty_modify_notice, gravity: ToastGravity.CENTER);
      return;
    }

    String? audioUrl;
    if (audioLocalFile.isNotEmpty) {
      audioUrl = await uploadFile(audioLocalFile);
      if (audioUrl == null || audioUrl.isEmpty == true) {
        Fluttertoast.showToast(
            msg: K.cer_audio_upload_error_tips, gravity: ToastGravity.CENTER);
        return;
      }
    } else {
      audioUrl = verifyDetail?.audio ?? "";
    }
    try {
      Map<String, String> postData = {
        'cid': "${widget.cid}",
        'cover': cover,
        'audio': audioUrl,
        'duration': duration.toString(),
        'description': description,
        'sign': sign,
        'level': level.toString(),
        'game_id': gameId,
        'game_system': deviceMessage,
      };
      if (isSinger) {
        String? accompanyAudioUrl;
        if (accompanyLocalFile.isNotEmpty) {
          accompanyAudioUrl = await uploadFile(accompanyLocalFile);
          if (accompanyAudioUrl == null || accompanyAudioUrl.isEmpty == true) {
            Fluttertoast.showToast(
                msg: K.cer_audio_upload_error_tips,
                gravity: ToastGravity.CENTER);
            return;
          }
        } else {
          accompanyAudioUrl = verifyDetail?.accompany ?? "";
        }
        postData['accompany'] = accompanyAudioUrl;
        postData['accompanyDuration'] = accompanyDuration.toString();
      }

      NormalNull rsp = await Api.postCertificate(postData);
      if (rsp.success) {
        Fluttertoast.showToast(
            msg: K.cer_waitting_check_after_submit,
            gravity: ToastGravity.CENTER);
        Navigator.pop(context);
      } else {
        if (rsp.msg.isNotEmpty) {
          Fluttertoast.showToast(msg: rsp.msg, gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  Widget _buildTextArea() {
    return Container(
      height: 107,
      margin: const EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: R.color.secondBgColor,
      ),
      padding:
          const EdgeInsetsDirectional.only(start: 12.0, end: 12, bottom: 12),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: TextField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.send,
          cursorWidth: 1.0,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 15.0,
            color: R.color.mainTextColor,
          ),
          focusNode: _focusNode,
          controller: _textController,
          autocorrect: true,
          autofocus: false,
          onChanged: (value) {
            if (!mounted) return;
            setState(() {
              description = value;
            });
            _check();
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 12),
            helperStyle: TextStyle(
              fontSize: 11.0,
              color: R.color.thirdTextColor,
            ),
            hintStyle: TextStyle(
              fontSize: 15.0,
              color: R.color.thirdTextColor,
            ),
            border: InputBorder.none,
            hintText: isSinger
                ? K.cer_juke_introduce_hint
                : K.cer_intro_self_skill_time,
          ),
          maxLines: 3,
          maxLength: 50,
        ),
      ),
    );
  }

  @override
  Widget buildContent() {
    return WillPopScope(
        onWillPop: () async {
          if (_getSignCode() != _signCode && verifyState == -1) {
            int result = await showDialog(
                  context: context,
                  builder: (context) {
                    return ConfirmDialog(
                      content: K.cer_preback_tip,
                      positiveButton: PositiveButton(
                        text: K.cancel,
                        onPressed: () {
                          Navigator.of(context).pop(1);
                        },
                      ),
                      negativeButton: NegativeButton(
                        text: K.sure,
                        onPressed: () {
                          Navigator.of(context).pop(2);
                        },
                      ),
                    );
                  },
                ) ??
                0;
            if (result == 1) {
              /// 滚动到底部
              _controller.jumpTo(_controller.position.maxScrollExtent);
            }
            return result == 2;
          }
          return true;
        },
        child: _buildNormal());
  }
}
