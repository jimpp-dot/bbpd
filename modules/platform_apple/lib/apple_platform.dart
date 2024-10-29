import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:shared/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:login/login.dart';
import 'package:platform_apple/k.dart';

class ApplePlatform extends Conn with IThirdPlatform {
  static const KEY_APPLE_UID = 'apple_uid';

  @override
  Widget getIcon(
      {String? imgPath, required double width, required double height}) {
    return R.img(
      imgPath ?? 'apple.svg',
      width: width,
      height: height,
      package: ComponentManager.MANAGER_PLATFORM_APPLE,
    );
  }

  @override
  String getName() {
    return "Apple";
  }

  @override
  Future<bool> isInstalled() {
    return AppleSignIn.isAvailable();
  }

  @override
  void initialize() {
    AppleSignIn.onCredentialRevoked.listen((_) {
      if (Config.get(KEY_APPLE_UID, '').isNotEmpty) {
        Session.logout();
      }
    });

    _checkLoggedInState();
  }

  @override
  void onLoginTap(BuildContext context, String? actionType, onSuccess, onError,
      {Map? params}) async {
    this.context = context;
    loginType = actionType;
    onPlatformSuccess = onSuccess;
    onPlatformError = onError;

    try {
      final AuthorizationResult result = await AppleSignIn.performRequests([
        const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
      ]);

      switch (result.status) {
        case AuthorizationStatus.authorized:
          if (result.credential?.authorizationCode != null) {
            String code =
                String.fromCharCodes(result.credential!.authorizationCode!);
            _sendTokenToServer(
              code: code,
              name: result.credential?.fullName.toString() ?? '',
              email: result.credential?.email ?? '',
              uid: result.credential?.user ?? '',
            );
          } else {
            onConnError('');
          }
          break;

        case AuthorizationStatus.error:
          onConnError(result.error?.localizedDescription ?? '');
          break;

        case AuthorizationStatus.cancelled:
          onConnError(K.apple_user_cancel);
          break;
      }
    } on Exception catch (e) {
      Log.d(e.toString());
      onConnError(e.toString());
    }
  }

  // Apple登录增加重试机制
  int _sendTokenIndex = 0;
  static const int SendTokenMax = 3;

  Future _sendTokenToServer({
    required String code,
    required String name,
    required String uid,
    required String email,
  }) async {
    try {
      showLoading(R.string('login_vertifying'));
      ReqData reqData = await getReqData();

      String dtoken = Session.getString('dtoken', '');

      int publicIp = await DeviceInfo.getPublicIP(false);
      XhrResponse resp = await Xhr.postJson(
          "${System.domain}account/xappleLogin",
          {
            'type': loginType ?? 'login',
            'manufacturer': reqData.manufacturer ?? '',
            'model': reqData.model ?? '',
            'dtoken': dtoken,
            'code': code,
            'nickname': name,
            'email': email,
            'ip': publicIp.toString()
          },
          throwOnError: false);
      Map res = resp.value();
      if (res['success'] == true) {
        _sendTokenIndex = 0;
        Config.set(KEY_APPLE_UID, uid);
        onConnComplete(res['data'], ConnType.Apple);
      } else {
        if (_sendTokenIndex < SendTokenMax) {
          _sendTokenIndex++;
          _sendTokenToServer(code: code, name: name, uid: uid, email: email);
          return;
        }
        _sendTokenIndex = 0;
        if (res['msg'] != null && res['msg'] is String) {
          onConnError(res['msg']);
        }
      }
    } catch (e) {
      _sendTokenIndex = 0;
      onConnError(R.string('login_failed'));
    }
  }

  @override
  void onShareTap(
      BuildContext context, ShareInfo? shareInfo, onSuccess, onError,
      {Map? params}) async {}

  @override
  bool supportShare() {
    return false;
  }

  @override
  String tag() {
    return 'apple';
  }

  @override
  bool supportLogin() {
    return true;
  }

  @override
  bool supportAddFriend() {
    return false;
  }

  @override
  String shareTag() {
    return 'apple';
  }

  void _checkLoggedInState() async {
    final String userId = Config.get(KEY_APPLE_UID, '');
    if (userId.isEmpty) {
      Log.d("No stored user ID");
      return;
    }

    final credentialState = await AppleSignIn.getCredentialState(userId);
    switch (credentialState.status) {
      case CredentialStatus.authorized:
        Log.d("getCredentialState returned authorized");
        break;

      case CredentialStatus.error:
        Log.d(
            "getCredentialState returned an error: ${credentialState.error?.localizedDescription}");
        break;

      case CredentialStatus.revoked:
        Session.logout();
        Log.d("getCredentialState returned revoked");
        break;

      case CredentialStatus.notFound:
        Log.d("getCredentialState returned not found");
        break;

      case CredentialStatus.transferred:
        Log.d("getCredentialState returned not transferred");
        break;
    }
  }

  ConnType connType() {
    return ConnType.Apple;
  }
}
