import 'dart:async';
import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vap_texture/flutter_vap_texture.dart';

class GiftAnimTestPage extends StatefulWidget {
  const GiftAnimTestPage({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GiftAnimTestPage(),
        settings: const RouteSettings(name: '/gift_anim_test'),
      ),
    );
  }

  @override
  State<GiftAnimTestPage> createState() => _GiftAnimTestPageState();
}

class _GiftAnimTestPageState extends State<GiftAnimTestPage> {
  final TextEditingController _controller = TextEditingController();
  final RepeatCallChecker _callCheck = RepeatCallChecker();

  bool _showActionBar = true;

  String _giftId = '';
  bool _isAwaken = false;

  String? _giftPath;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar('礼物动画测试'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        R.img(
          Util.getRemoteImgUrl('static/background/room_background_KTV2.0.jpg'),
          width: Util.width,
          height: Util.height,
          fit: BoxFit.fill,
        ),
        Visibility(
          visible: _giftPath != null,
          child: VapWidget(
            hybridComposition: !Util.cantHybridComposition(),
            onPlatformViewCreated: (controller) =>
                controller.startPlay(_giftPath!),
            onComplete: () {
              _giftPath = null;
              _showActionBar = true;
              refresh();
            },
          ),
        ),
        Visibility(
          visible: _showActionBar,
          child: PositionedDirectional(
            bottom: 0,
            child: _buildActionBar(),
          ),
        ),
      ],
    );
  }

  Widget _buildActionBar() {
    return Container(
      width: Util.width,
      padding: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
        color: R.color.secondBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 100,
                alignment: AlignmentDirectional.centerStart,
                child: Text('giftId',
                    style:
                        R.textStyle.subtitle.copyWith(color: Colors.black54)),
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: R.textStyle.subtitle.copyWith(color: Colors.black54),
                  textAlign: TextAlign.end,
                  onChanged: (text) => _giftId = text,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 100,
                alignment: AlignmentDirectional.centerStart,
                child: Text('是否觉醒',
                    style:
                        R.textStyle.subtitle.copyWith(color: Colors.black54)),
              ),
              const Spacer(),
              CupertinoSwitch(
                value: _isAwaken,
                activeColor: R.dColor.tagTextColor,
                onChanged: (value) {
                  _isAwaken = value;
                  refresh();
                },
              ),
            ],
          ),
          GestureDetector(
            onTap: _playAnim,
            child: Container(
              width: Util.width,
              height: 50,
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsetsDirectional.only(top: 16),
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: const Text('播放',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  void _playAnim() {
    if (!_giftId.isNumeric() || _callCheck.isInvalidCall()) return;
    FocusManager.instance.primaryFocus?.unfocus();
    _showActionBar = false;
    refresh();
    _realPlay(TestGiftConfig(giftId: _giftId, isAwaken: _isAwaken));
  }

  void _realPlay(TestGiftConfig config) async {
    bool hasGiftInfo = await _getGiftInfo(config);
    if (!hasGiftInfo) {
      _showActionBar = true;
      refresh();
      Fluttertoast.showCenter(msg: '获取礼物信息失败，请重试！');
      return;
    }

    int giftId = Util.parseInt(config.giftId);
    bool isReady = await cacheGiftWithTry(
      giftId,
      config.size,
      isVap: true,
      isAwake: config.isAwaken,
      effect: config.effect,
      effectSize: config.effectSize,
      isTest: true,
    );
    File giftFile =
        config.isAwaken ? getAwakeVapGiftFile(giftId) : getVapGiftFile(giftId);
    if (isReady) {
      _giftPath = giftFile.path;
    } else {
      _showActionBar = true;
      int size = config.isAwaken ? config.effectSize : config.size;
      int localFileSiz = 0;
      if (await giftFile.exists()) {
        localFileSiz = (await giftFile.stat()).size;
      }
      Fluttertoast.showCenter(
          msg: '礼物$giftId播放失败, 配置礼物大小：$size，本地文件大小：$localFileSiz');
    }
    refresh();
  }

  Future<bool> _getGiftInfo(TestGiftConfig config) async {
    try {
      XhrResponse resp = await Xhr.getJson(
        '${System.domain}test/gift',
        params: {'gid': config.giftId},
        throwOnError: true,
      );
      Map result = resp.value();
      if (Util.parseBool(result['success'])) {
        config.size = Util.parseInt(result['data']['vap_size']);
        config.effectSize = Util.parseInt(result['data']['awake_vap_size']);
      }
      return config.size > 0;
    } catch (e) {
      return false;
    }
  }
}

class TestGiftConfig {
  final String giftId;
  final bool isAwaken;
  int size = 0;
  int effectSize = 0;

  String get effect => isAwaken ? 'static/gift_big/$giftId.awake.mp4' : '';

  TestGiftConfig({required this.giftId, this.isAwaken = false});
}
