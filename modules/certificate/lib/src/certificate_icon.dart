import 'package:certificate/assets.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../k.dart';
import 'model/certifyRepository.dart';

/// 头像认证
class CertificateIconScreen extends StatefulWidget {
  const CertificateIconScreen({super.key});

  @override
  _CertificateIconScreenState createState() => _CertificateIconScreenState();
}

class _CertificateIconScreenState extends State<CertificateIconScreen> {
  bool isLoading = true;
  Map? demo;
  Map? user;
  List<Map>? errorDemos;
  final GlobalKey<ImageUploadState> _imgUploadKey =
      GlobalKey<ImageUploadState>();

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    isLoading = true;

    Map data = await CertifyRepository.getCertifyDemoInfo();

    if (data.isEmpty) return;
    if (!mounted) return;

    setState(() {
      isLoading = false;
      demo = data['demo'];
      user = data['user'];
      errorDemos = data['errorDemos'];
    });
  }

  void _gotoImageViewScreen(String uri) {
    IPersonalDataManager? personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager?.openImageViewScreen(context,
        image: Uri.decodeComponent(uri));
  }

  void _onNextBtnTaped() {
    Navigator.pop(context);
    ICertificateManager certificateManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_CERTIFICATE);
    certificateManager.openCertificateVerifyScreen(context, updateIcon: false);
  }

  Widget _renderIcon() {
    //tmp_icon为待审核icon，若为空则使用正式icon
    String? icon = user?['tmp_icon'];
    if (icon == null || icon.isEmpty) icon = user?['icon'];

    if (icon == null || icon.isEmpty) {
      return R.img(
        BaseAssets.shared$profile_add_png,
        width: 104.0,
        color: R.color.mainTextColor,
      );
    }

    return CommonAvatar(
      path: icon,
      size: 104,
      borderRadius: BorderRadius.circular(12),
    );
  }

  Widget _buildHeaderUser() {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              CommonAvatar(
                path: demo!['icon'],
                size: 120,
                borderRadius: BorderRadius.circular(12),
                onTap: () =>
                    _gotoImageViewScreen(System.imageDomain + demo!['icon']),
              ),
              const SizedBox(height: 12),
              Text(
                K.cer_avatar_eg,
                style: TextStyle(fontSize: 14, color: R.color.mainTextColor),
              ),
              const SizedBox(height: 8),
              Text(
                K.cer_avatar_tip,
                style: TextStyle(
                    fontSize: 11,
                    color: R.color.mainTextColor.withOpacity(0.4)),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImageUpload(
                    key: _imgUploadKey,
                    source: ImageSource.gallery,
                    uploadUrl: '${System.domain}upload/image/',
                    postFields: const {'hook': 'editIcon', 'is_skill': '1'},
                    crop: true,
                    minSize: Util.getUserUploadAvatarMinSize(),
                    child: _renderIcon(),
                    onComplete:
                        (String name, int width, int height, Map origin) {
                      _load();
                      return true;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => _imgUploadKey.currentState?.switchImage(),
                child: Container(
                  width: 84,
                  height: 32,
                  alignment: AlignmentDirectional.center,
                  decoration: ShapeDecoration(
                      shape: const StadiumBorder(),
                      gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors)),
                  child: Text(
                    K.cer_update_avatar,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescDivider() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 54,
          height: 1,
          color: R.color.dividerColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            K.cer_dont_like_this,
            style: R.textStyle.caption,
          ),
        ),
        Container(
          width: 54,
          height: 1,
          color: R.color.dividerColor,
        ),
      ],
    );
  }

  Widget _buildErrorDemoItem(Map errorDemo) {
    String imgUrl = errorDemo['icon'];

    return Column(
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imgUrl.startsWith('http')
                  ? CachedNetworkImage(
                      imageUrl: imgUrl,
                      fit: BoxFit.cover,
                      width: 60.0,
                      height: 60.0,
                    )
                  : R.img(imgUrl, width: 60, height: 60),
            ),
            PositionedDirectional(
              bottom: -8,
              child: R.img(
                Assets.certificate$ic_delete_svg,
                width: 16,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Text(
            errorDemo['desc'],
            style: TextStyle(fontSize: 12, color: R.color.thirdTextColor),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorDemos() {
    if (errorDemos == null) return const SizedBox();
    return GridView.builder(
      padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.6,
        crossAxisSpacing: 28,
      ),
      itemBuilder: (context, index) => _buildErrorDemoItem(errorDemos![index]),
      itemCount: errorDemos!.length,
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Loading();
    } else {
      return Column(
        children: <Widget>[
          _buildHeaderUser(),
          _buildDescDivider(),
          const SizedBox(height: 12),
          Expanded(
            child: _buildErrorDemos(),
          ),
          BottomButton.of(
            title: K.cer_next_step,
            onTap: _onNextBtnTaped,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.certificate_icon),
      body: _buildBody(),
    );
  }
}
