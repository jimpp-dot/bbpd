import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 房间资源mock
class RoomResourceMock {
  static String? _avatarFrame; // 头像框
  static String? _ringFrame; // 麦上光圈
  static String? _throneImg; // 皇帝宝座

  /// 用户头像框
  static String? avatarFrame(String? avatarFrame) {
    if (!System.debug) return avatarFrame;
    return _avatarFrame ?? avatarFrame;
  }

  /// 麦位光圈
  static String? ringFrame(String? ringFrame) {
    if (!System.debug) return ringFrame;
    return _ringFrame ?? ringFrame;
  }

  /// 麦位皇帝宝座-皇帝贵族特权
  static String? throneImg(String? throneImg) {
    if (!System.debug) return throneImg;
    return _throneImg ?? throneImg;
  }
}

class RoomResourceMockPage extends StatefulWidget {
  const RoomResourceMockPage({super.key});

  static Future launch(BuildContext context) async {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RoomResourceMockPage();
    }));
  }

  @override
  State<RoomResourceMockPage> createState() => _RoomResourceMockPageState();
}

class _RoomResourceMockPageState extends State<RoomResourceMockPage> {
  final TextEditingController _avatarFrameController =
      TextEditingController(text: RoomResourceMock._avatarFrame); // 头像框
  final TextEditingController _micRingFrameController =
      TextEditingController(text: RoomResourceMock._ringFrame); // 麦位光圈
  final TextEditingController _throneImgFrameController =
      TextEditingController(text: RoomResourceMock._throneImg); // 皇帝宝座

  @override
  void dispose() {
    super.dispose();
    _avatarFrameController.dispose();
    _micRingFrameController.dispose();
  }

  void _save() {
    // 如果输入的CND需要替换成原始域名，避免测试污染CDN
    RoomResourceMock._avatarFrame =
        _handlerURl(_avatarFrameController.text.trim());
    RoomResourceMock._ringFrame =
        _handlerURl(_micRingFrameController.text.trim());
    RoomResourceMock._throneImg =
        _handlerURl(_throneImgFrameController.text.trim());
    setState(() {});
  }

  String? _handlerURl(String url) {
    if (url.trim().isEmpty) return null;
    // 如果输入的CND需要替换成原始域名，避免测试污染CDN
    return Util.getRemoteImgUrl(url.replaceFirst(System.imageProxyDomain, ''),
        useProxy: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar('房间资源测试'),
      body: _renderBody(),
    );
  }

  Widget _renderBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _UserIconMockWidget(),
          _renderItem('头像框URL', _avatarFrameController),
          _renderItem('麦位光圈URL', _micRingFrameController),
          _renderItem('皇帝宝座URL', _throneImgFrameController),
          GestureDetector(
            onTap: _save,
            child: Container(
              width: 200.dp,
              height: 48.dp,
              margin: EdgeInsetsDirectional.only(top: 30.dp),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: R.color.mainBrandColor,
                borderRadius: BorderRadius.circular(24.dp),
              ),
              child: const Text(
                '刷新',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderItem(String title, TextEditingController controller) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 15.dp, bottom: 15.dp),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(width: 16),
          Text(title, style: R.textStyle.title),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: AlignmentDirectional.centerStart,
              constraints: const BoxConstraints(
                minHeight: 40,
              ),
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF666666), width: 1)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      controller: controller,
                      textAlignVertical: TextAlignVertical.center,
                      style: R.textStyle.subtitle.copyWith(fontSize: 14),
                      decoration: null,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.clear();
                      setState(() {});
                    },
                    child: const Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 10, end: 10, top: 4, bottom: 4),
                      child: Icon(Icons.clear_rounded, size: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

class _UserIconMockWidget extends StatelessWidget {
  final double _size = 66;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 30.dp, bottom: 30.dp),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _renderThrone(),
          _renderRingFrame(),
          CommonAvatar(
            path: Session.icon,
            size: _size,
            shape: BoxShape.circle,
          ),
          _renderAvatarFrame(),
        ],
      ),
    );
  }

  /// 皇帝贵族宝座
  Widget _renderThrone() {
    String? throneImg = RoomResourceMock._throneImg;
    if (throneImg == null || throneImg.isEmpty) return const SizedBox.shrink();

    /// 显示麦位大小的2倍
    double realSize = _size * 2;
    double padding = (_size - realSize) / 2;
    String throneImgSuffix =
        '${Util.getRemoteImgUrl(throneImg)}?x-oss-process=image/resize,m_fill,w_${realSize.px},h_${realSize.px},limit_1';

    return PositionedDirectional(
      top: padding,
      start: padding,
      child: IgnorePointer(
        child: SizedBox(
          width: realSize,
          height: realSize,
          child: CachedNetworkImage(
            imageUrl: throneImgSuffix,
            width: realSize,
            height: realSize,
            cachedWidth: realSize.px,
            cachedHeight: realSize.px,
            fit: BoxFit.fill,
            // key: ObjectKey('user-icon-throne-$throneImgSuffix'),
            errorWidget: const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  /// 头像框
  Widget _renderAvatarFrame() {
    String? avatarFrame = RoomResourceMock._avatarFrame;
    if (avatarFrame == null || avatarFrame.isEmpty)
      return const SizedBox.shrink();
    // 所有头像框外边框和内边框按照1.1:1
    double headSize = _size * 1.1;
    return PositionedDirectional(
      top: -0.05 * _size,
      start: -0.05 * _size,
      child: IgnorePointer(
        child: UserIconFrame(
          size: headSize,
          frameUrl: avatarFrame,
        ),
      ),
    );
  }

  Widget _renderRingFrame() {
    String? ringFrame = RoomResourceMock._ringFrame;
    if (ringFrame == null || ringFrame.isEmpty) return const SizedBox.shrink();
    double maxSize = _size * 1.6;
    double start = -(maxSize - _size) / 2;
    double top = -(maxSize - _size) / 2;
    return PositionedDirectional(
      start: start,
      top: top,
      width: maxSize,
      height: maxSize,
      child: IgnorePointer(
        child: UserIconFrame(
          size: maxSize,
          frameUrl: ringFrame,
        ),
      ),
    );
  }
}
