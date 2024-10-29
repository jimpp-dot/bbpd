import 'dart:math';
import 'package:certificate/src/base/certificate_screen_mixin.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';
import '../../k.dart';
import '../api.dart';

///疗愈师认证
class CertificateHealerScreen extends StatefulWidget {
  /// 技能id
  final int cid;

  /// 技能名称
  final String name;

  const CertificateHealerScreen(
      {super.key, required this.cid, required this.name});

  @override
  CertificateHealerScreenState createState() => CertificateHealerScreenState();

  static Future showHealerScreen(BuildContext context, int cid, String? name) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CertificateHealerScreen(
          cid: cid,
          name: name ?? '',
        ),
        settings: const RouteSettings(name: 'CertificateV3Screen'),
      ),
    );
  }
}

class CertificateHealerScreenState extends State<CertificateHealerScreen>
    with CertificateScreenMixin {
  final String _tag = "CertificateHealerScreenState";
  List<String> audioExamples = [];
  String audioUrl = "";
  int duration = 0;
  final ValueNotifier<int> _audioIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    skillName = widget.name;
    load(widget.cid).then((value) => initConfigs());
  }

  @override
  void initConfigs() {
    if (skillDetail != null && verifyDetail != null) {
      verifyState = verifyDetail!.verifyState;
      audioExamples = skillDetail!.audioExample;
      List temp = verifyDetail!.audio.split(':');
      if (temp.length == 2) {
        if (!temp[0].startsWith(RegExp(r'http(s?)://'))) {
          audioUrl = System.imageDomain + temp[0];
        } else {
          audioUrl = temp[0];
        }
        duration = Util.parseInt(temp[1]);
      } else {
        audioUrl = "";
        duration = 0;
      }
    }
    refresh();
  }

  @override
  Widget buildContent() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ListView(
        addAutomaticKeepAlives: true,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        children: [
          ..._buildDesc(),
          const SizedBox(height: 20),
          ..._buildAudioSample(),
          const SizedBox(height: 10),
          Text(K.cer_cancel_tips(["${skillDetail?.cancelMoney ?? 0}"]),
              style: TextStyle(
                  fontSize: 12,
                  color: R.color.thirdTextColor,
                  fontWeight: FontWeight.normal)),
          const SizedBox(height: 10),
          _buildAudioControl(),
        ],
      ),
    );
  }

  List<Widget> _buildDesc() {
    return [
      buildTitleWidget(K.skill_introduce, top: 20, left: 0),
      buildContentWidget(skillDetail?.description ?? "", left: 0, top: 12),
      if (skillDetail?.cond.isNotEmpty == true) ...[
        buildTitleWidget(K.skill_certificate_request, top: 24, left: 0),
        buildContentWidget(skillDetail?.cond ?? "", left: 0, top: 12),
      ],
      const SizedBox(height: 12),
      buildDivider(),
    ];
  }

  List<Widget> _buildAudioSample() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(K.cer_audio_sample,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w700)),
          Container(
            height: 28,
            padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.06),
              borderRadius: BorderRadius.circular(14),
            ),
            child: GestureDetector(
                onTap: () {
                  _audioIndex.value =
                      (_audioIndex.value + 1) % (max(1, audioExamples.length));
                },
                child: Text(K.cer_change,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w700))),
          )
        ],
      ),
      const SizedBox(height: 8.5),
      Container(
        height: 300,
        decoration: BoxDecoration(
            color: const Color(0xFF926AFF).withOpacity(0.06),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFFFFF).withOpacity(0.2),
                blurRadius: 0.0,
                spreadRadius: 0,
                offset: const Offset(0.0, 2.0),
              )
            ],
            border:
                Border.all(color: const Color(0xFF926AFF).withOpacity(0.2))),
        child: Stack(
          children: [
            PositionedDirectional(
                start: 15,
                top: 15,
                child: R.img(Assets.certificate$ic_quote_webp, height: 49.5)),
            PositionedDirectional(
                end: 9.5,
                top: 10,
                child: R.img(Assets.certificate$ic_tips_webp, height: 42.5)),
            PositionedDirectional(
                end: 15,
                bottom: 15,
                child: Transform.rotate(
                    angle: pi,
                    child:
                        R.img(Assets.certificate$ic_quote_webp, height: 49.5))),
            PositionedDirectional(
                top: 78,
                start: 17.5,
                end: 17.5,
                child: ValueListenableBuilder<int>(
                  valueListenable: _audioIndex,
                  builder: (context, value, child) {
                    return Text(
                        value < audioExamples.length
                            ? audioExamples[value]
                            : "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            height: 2.5,
                            fontSize: 16,
                            fontWeight: FontWeight.w300));
                  },
                ))
          ],
        ),
      )
    ];
  }

  Widget _buildAudioControl() {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    return manager.getAudioRecorderWidget(
        maxBottomMargin: 12,
        audioUrl: audioUrl,
        duration: duration,
        onFinish: _onFinish,
        onCompleted: _submit,
        onDelete: _onDelete,
        maximumDuration: 60,
        onStartRecord: _onStartRecord,
        minDuration: 10,
        type: AudioRecordType.quickReply,
        supportDark: false);
  }

  void _onStartRecord() {
    Log.d(tag: _tag, "_onStartRecord");
  }

  void _onFinish(String? localFile, int? duration) {
    Log.d(tag: _tag, "_onFinish,$localFile,$duration");
  }

  void _onDelete() {
    Log.d(tag: _tag, "_onDelete");
  }

  Future<void> _submit(String? localFile, int? duration) async {
    Log.d(tag: _tag, "_submit,$localFile,$duration");
    String? audioUrl;
    if (localFile?.isNotEmpty == true) {
      audioUrl = await uploadFile(localFile!);
      if (audioUrl == null || audioUrl.isEmpty == true) {
        Fluttertoast.showToast(
            msg: K.cer_audio_upload_error_tips, gravity: ToastGravity.CENTER);
        return;
      }
    } else {
      audioUrl = verifyDetail?.audio ?? "";
    }
    Map<String, String> postData = {
      'cid': '${skillDetail?.cid}',
      'audio': audioUrl,
      'duration': '$duration',
    };
    NormalNull rsp = await Api.postCertificate(postData);
    if (rsp.success) {
      Fluttertoast.showToast(
          msg: K.cer_waitting_check_after_submit, gravity: ToastGravity.CENTER);
      Navigator.pop(context);
    } else {
      if (rsp.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: rsp.msg, gravity: ToastGravity.CENTER);
      }
    }
  }
}
