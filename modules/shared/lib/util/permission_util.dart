import 'package:shared/k.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../shared.dart';

class PermissionUtil {
  ///仅检查权限不请求
  static Future<PermissionStatus> checkPermissions(
      BuildContext context, Permission permission) async {
    return await permission.status;
  }

  // 只应用启动主动取一次位置权限
  static const String HasRequestLocationPermissionKey =
      'has_request_location_permission';

  static get hasRequestLocationPermission =>
      Config.get(HasRequestLocationPermissionKey, '0') == '1';

  /// 检查并获取权限
  /// 获取权限规则：
  /// 用户未开关过对应权限时，直接弹系统获取权限dialog；
  /// 权限被用户关时，app引导开启dialog，确定后跳转app权限设置页；
  static Future<PermissionStatus> checkAndRequestPermissions(
      BuildContext context, Permission permission) async {
    if (permission == Permission.location ||
        permission == Permission.locationWhenInUse) {
      Config.set(HasRequestLocationPermissionKey, '1');
    }

    if (Platform.isAndroid && DeviceInfo.androidSdkInt < 23) {
      // Android 6.0以下不需要授权
      [permission].request();
      return PermissionStatus.granted;
    }

    if (Platform.isAndroid &&
        DeviceInfo.androidSdkInt < 31 &&
        (permission == Permission.bluetooth ||
            permission == Permission.bluetoothScan ||
            permission == Permission.bluetoothConnect ||
            permission == Permission.bluetoothAdvertise)) {
      /// Android 12及以上才需要动态申请蓝牙权限
      return PermissionStatus.granted;
    }

    PermissionStatus status = await permission.status;
    if (status == PermissionStatus.granted) {
      PermissionOverlay.dispose();
      return PermissionStatus.granted;
    }
    String typeName = permission.toString();
    List<String> list = typeName.split('.');
    if (Util.validList(list)) {
      typeName = list.last;
    }
    // 第一次直接弹系统获取权限dialog
    if (Config.getBool('has_request_$permission', false) == false) {
      Config.setBool('has_request_$permission', true);

      Tracker.instance.track(TrackEvent.permissionPopup,
          properties: {'permission_type': typeName, 'is_first': true});

      PermissionOverlay.show(permission);
      Map<Permission, PermissionStatus> map = await [permission].request();
      PermissionOverlay.dispose();

      Tracker.instance.track(TrackEvent.permissionPopupClick, properties: {
        'permission_type': typeName,
        'is_first': true,
        'is_agreed': (map[permission] == PermissionStatus.granted)
      });

      if (map[permission] == PermissionStatus.granted) {
        return PermissionStatus.granted;
      }
    } else {
      // 弹APP的引导dialog，跳转APP权限设置页
      String dialogTitle;
      String dialogContent;
      if (permission == Permission.phone) {
        // 仅Android，电话权限，用户拒绝过，不再主动提示
        return PermissionStatus.denied;
      } else if (permission == Permission.camera) {
        // Android/IOS,相机权限
        dialogTitle = K.base_permission_other_title([K.base_permission_camera]);
        dialogContent =
            K.base_permission_other_content([K.base_permission_camera]);
      } else if (permission == Permission.location ||
          permission == Permission.locationWhenInUse) {
        // Android/IOS,位置权限
        dialogTitle = K.base_permission_location_title;
        dialogContent = K.base_permission_location_content;
      } else if (permission == Permission.storage) {
        // 仅Android，存储权限
        dialogTitle = K.base_permission_storage_title;
        dialogContent =
            K.base_permission_other_content([K.base_permission_storage]);
      } else if (permission == Permission.microphone) {
        // Android/IOS,麦克风权限
        dialogTitle =
            K.base_permission_other_title([K.base_permission_microphone]);
        dialogContent =
            K.base_permission_other_content([K.base_permission_microphone]);
      } else if (permission == Permission.photos) {
        // 仅IOS，相册权限
        dialogTitle = K.base_permission_other_title([K.base_permission_photos]);
        dialogContent =
            K.base_permission_other_content([K.base_permission_photos]);
      } else if (permission == Permission.contacts) {
        dialogTitle = K.base_permission_contacts_title;
        dialogContent = K.base_permission_contacts_content([Util.appName]);
      } else if (permission == Permission.bluetooth ||
          permission == Permission.bluetoothScan ||
          permission == Permission.bluetoothConnect ||
          permission == Permission.bluetoothAdvertise) {
        /// 仅Android12以上，蓝牙
        dialogTitle = K.base_permission_other_title(['']);
        dialogContent = K.base_permission_other_content(['']);
      } else {
        dialogTitle = K.base_permission_other_title(['']);
        dialogContent = K.base_permission_other_content(['']);
      }

      Tracker.instance.track(TrackEvent.permissionPopup,
          properties: {'permission_type': typeName, 'is_first': true});

      bool result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(
              title: dialogTitle,
              content: dialogContent,
              negativeButton: NegativeButton(
                  text: K.cancel,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  }),
              positiveButton: PositiveButton(
                  text: K.base_go_open,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  }),
            );
          });

      Tracker.instance.track(TrackEvent.permissionPopupClick, properties: {
        'permission_type': typeName,
        'is_first': false,
        'is_agreed': result
      });

      if (result == true) {
        bool shouldShowRationale = await permission.shouldShowRequestRationale;
        Log.d('shouldShowRationale: $shouldShowRationale');
        if (Platform.isAndroid && shouldShowRationale == true) {
          // 用户拒绝过，但是并未选中【禁止后不再询问】
          PermissionOverlay.show(permission);
          Map<Permission, PermissionStatus> map = await [permission].request();
          PermissionOverlay.dispose();
          if (map[permission] == PermissionStatus.granted) {
            return PermissionStatus.granted;
          }
        } else {
          // 用户拒绝过，但是并选中【禁止后不再询问】,打开权限设置页
          openAppSettings();
        }
      }
    }

    return PermissionStatus.denied;
  }
}

class PermissionOverlay extends StatelessWidget {
  static OverlayEntry? _overlayEntry;

  static show(Permission permission) async {
    if (_overlayEntry != null) {
      dispose();
    }

    var overlayState = Overlay.of(System.context);

    String? title;
    String? subtitle;
    if (permission == Permission.phone) {
      // 电话权限
      title = K.base_phone_title;
      subtitle = K.base_phone_subtitle;
    } else if (permission == Permission.camera) {
      // Android/IOS,相机权限
      title = K.base_camera_title;
      subtitle = K.base_camera_subtitle;
    } else if (permission == Permission.location ||
        permission == Permission.locationWhenInUse) {
      // Android/IOS,位置权限
      title = K.base_location_title;
      subtitle = K.base_location_subtitle;
    } else if (permission == Permission.storage) {
      // 仅Android，存储权限
      title = K.base_storage_title;
      subtitle = K.base_storage_subtitle;
    } else if (permission == Permission.microphone) {
      // Android/IOS,麦克风权限
      title = K.base_microphone_title;
      subtitle = K.base_microphone_subtitle;
    } else if (permission == Permission.photos) {
      // 仅IOS，相册权限
      title = K.base_storage_title;
      subtitle = K.base_storage_subtitle;
    } else if (permission == Permission.contacts) {
      title = K.base_contacts_title;
      subtitle = K.base_contacts_subtitle;
    } else if (permission == Permission.bluetooth ||
        permission == Permission.bluetoothScan ||
        permission == Permission.bluetoothConnect ||
        permission == Permission.bluetoothAdvertise) {
      /// 仅Android12以上，蓝牙
      title = K.base_bluetooth_title;
      subtitle = K.base_bluetooth_subtitle;
    }

    if (Util.isStringEmpty(title) || Util.isStringEmpty(subtitle)) {
      return;
    }

    _overlayEntry = OverlayEntry(builder: (context) {
      return PermissionOverlay(
        permission: permission,
        title: title!,
        subtitle: subtitle!,
      );
    });

    overlayState.insert(_overlayEntry!);
  }

  static void dispose() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  final Permission permission;
  final String title;
  final String subtitle;

  const PermissionOverlay(
      {super.key,
      required this.permission,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10 + MediaQuery.of(context).padding.top,
      child: Container(
        width: Util.width - 20,
        margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
        padding: const EdgeInsetsDirectional.only(
            top: 8, bottom: 8, start: 8, end: 8),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadiusDirectional.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.12),
                offset: const Offset(0, 2),
                blurRadius: 12)
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              K.base_permission_tips_title,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: R.color.mainTextColor,
                  decoration: TextDecoration.none),
            ),
            const SizedBox(height: 4),
            Text(
              K.base_permission_title_pre([title]),
              style: TextStyle(
                  fontSize: 14,
                  color: R.color.mainTextColor,
                  decoration: TextDecoration.none),
            ),
            const SizedBox(height: 4),
            Text(
              K.base_permission_subtitle_pre([subtitle]),
              style: TextStyle(
                  fontSize: 14,
                  color: R.color.mainTextColor,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
