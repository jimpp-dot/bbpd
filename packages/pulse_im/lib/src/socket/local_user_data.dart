import 'package:pulse_im/src/util/im_config.dart';

class LocalUserData {
  static late String _senderUserId;
  static late String _senderName;
  static String? _senderPortraitUri;
  static late String _baseFileDir;
  static late String _senderToken;
  static int? _heart;
  static String _package = "";
  static String? _socketAddress;
  static late String _imDomain;
  static late int _version;
  static int _uuid = 0;
  static String? _customAppId;

  static setUp(String senderUserId, String senderName, String senderPortraitUri, String baseFileDir, String package,
      int version) {
    _senderUserId = senderUserId;
    _senderName = senderName;
    _senderPortraitUri = senderPortraitUri;
    _baseFileDir = baseFileDir;
    _package = package;
    _version = version;
    if (_uuid == 0) {
      _uuid = DateTime.now().millisecondsSinceEpoch;
    }
  }

  static setUpRemoteConfig(String senderToken, int heart, String socketAddress, String imDomain,
      {String? customAppId}) {
    _senderToken = senderToken;
    _heart = heart;
    _socketAddress = socketAddress;
    _imDomain = imDomain;
    _customAppId = customAppId;
  }

  static String? get senderPortraitUri => _senderPortraitUri;

  static String get senderName => _senderName;

  static String get senderUserId => _senderUserId;

  static String get baseFileDir => _baseFileDir;

  static String get senderToken => _senderToken;

  static int get heart => (_heart == null || _heart! <= 0) ? IMConfig.DEFAULT_HEARTBEAT : _heart!;

  static String get package => _package;

  static String? get socketAddress => _socketAddress;

  static String get imDomain => _imDomain;

  static int get version => _version;

  static int get uuid => _uuid;

  static String? get customAppId => _customAppId;
}
