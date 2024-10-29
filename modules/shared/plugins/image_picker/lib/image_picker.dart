// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared/shared.dart';

/// Specifies the source where the picked image should come from.
enum ImageSource {
  /// Opens up the device camera, letting the user to take a new picture.
  camera,

  /// Opens the user's photo gallery.
  gallery,
}

class ImagePicker {
  static const MethodChannel _channel =
      MethodChannel('plugins.flutter.io/image_picker');

  /// Returns a [File] object pointing to the image that was picked.
  ///
  /// The [source] argument controls where the image comes from. This can
  /// be either [ImageSource.camera] or [ImageSource.gallery].
  ///
  /// If specified, the image will be at most [maxWidth] wide and
  /// [maxHeight] tall. Otherwise the image will be returned at it's
  /// original width and height.
  static Future<File?> pickImage({
    required ImageSource source,
    int onlyGif = 0,
    double? maxWidth,
    double? maxHeight,
  }) async {
    if (maxWidth != null && maxWidth < 0) {
      throw ArgumentError.value(maxWidth, 'maxWidth cannot be negative');
    }

    if (maxHeight != null && maxHeight < 0) {
      throw ArgumentError.value(maxHeight, 'maxHeight cannot be negative');
    }

    // 权限申请走统一逻辑
    PermissionStatus permissionStatus = PermissionStatus.granted;
    if (Platform.isAndroid) {
      if (source == ImageSource.gallery) {
        permissionStatus= await getPermission();
      } else if (source == ImageSource.camera) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.camera);
      }
    } else if (Platform.isIOS) {
      if (source == ImageSource.gallery) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.photos);
      } else if (source == ImageSource.camera) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.camera);
      }
    }

    if (permissionStatus != PermissionStatus.granted) {
      return null;
    }

    final String? path = await _channel.invokeMethod(
      'pickImage',
      <String, dynamic>{
        'source': source.index,
        'onlyGif': onlyGif,
        'maxWidth': maxWidth,
        'maxHeight': maxHeight,
      },
    );

    return path == null ? null : File(path);
  }

  static Future<PermissionStatus> getPermission() async {
    PermissionStatus permissionStatus = PermissionStatus.granted;
    if(DeviceInfo.androidSdkInt<33){
      permissionStatus = await PermissionUtil.checkAndRequestPermissions(
          Constant.context, Permission.storage);
    }else{
       permissionStatus = PermissionStatus.granted;
    }
    return permissionStatus;
  }


  //ios14以上专用 选取相册照片
  static Future<List<File>?> pickImages({
    required ImageSource source,
    double? maxWidth,
    double? maxHeight,
    int count = 1,
  }) async {
    if (maxWidth != null && maxWidth < 0) {
      throw ArgumentError.value(maxWidth, 'maxWidth cannot be negative');
    }

    if (maxHeight != null && maxHeight < 0) {
      throw ArgumentError.value(maxHeight, 'maxHeight cannot be negative');
    }

    // 权限申请走统一逻辑
    PermissionStatus permissionStatus = PermissionStatus.granted;
    if (Platform.isAndroid) {
      if (source == ImageSource.gallery) {
        permissionStatus= await getPermission();
      } else if (source == ImageSource.camera) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.camera);
      }
    } else if (Platform.isIOS) {
      if (source == ImageSource.gallery) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.photos);
      } else if (source == ImageSource.camera) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.camera);
      }
    }

    if (permissionStatus != PermissionStatus.granted) {
      return null;
    }

    final List path = await _channel.invokeMethod(
      'pickImages',
      <String, dynamic>{
        'source': source.index,
        'maxWidth': maxWidth,
        'maxHeight': maxHeight,
        'count': count
      },
    );
    if (path.isEmpty) {
      return null;
    }
    return path.map((e) => File(e)).toList();
  }

  static Future<File?> pickVideo({
    required ImageSource source,
  }) async {
    // 权限申请走统一逻辑
    PermissionStatus? permissionStatus;
    if (Platform.isAndroid) {
      if (source == ImageSource.gallery) {
        permissionStatus= await getPermission();
      } else if (source == ImageSource.camera) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.camera);
      }
    } else if (Platform.isIOS) {
      if (source == ImageSource.gallery) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.photos);
      } else if (source == ImageSource.camera) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.camera);
      }
    }

    if (permissionStatus != PermissionStatus.granted) {
      return null;
    }

    final String? path = await _channel.invokeMethod(
      'pickVideo',
      <String, dynamic>{
        'source': source.index,
      },
    );
    return path == null ? null : File(path);
  }

  static Future<String?> saveToCameraRoll(String path) async {
    // 权限申请走统一逻辑
    PermissionStatus? permissionStatus;
    if (Platform.isAndroid) {
      permissionStatus= await getPermission();

    } else if (Platform.isIOS) {
      permissionStatus = await PermissionUtil.checkAndRequestPermissions(
          Constant.context, Permission.photos);
    }

    if (permissionStatus != PermissionStatus.granted) {
      return null;
    }

    final String? result =
        await _channel.invokeMethod("saveToCameraRoll", <String, dynamic>{
      'source': path,
    });
    return result;
  }

  /// return [path] image save path
  ///
  /// 返回null表示失败
  static Future<String?> saveByteDataImageToGallery(Uint8List data) async {
    // 权限申请走统一逻辑
    PermissionStatus? permissionStatus;
    if (Platform.isAndroid) {
      permissionStatus= await getPermission();
    } else if (Platform.isIOS) {
      permissionStatus = await PermissionUtil.checkAndRequestPermissions(
          Constant.context, Permission.photos);
    }

    if (permissionStatus != PermissionStatus.granted) {
      return null;
    }

    final Map<String, dynamic> params = <String, dynamic>{
      'uint8List': data,
    };
    String? path =
        await _channel.invokeMethod('saveByteDataImageToGallery', params);
    return path;
  }
}
