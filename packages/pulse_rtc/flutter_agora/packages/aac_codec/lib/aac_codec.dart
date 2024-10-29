import 'dart:async';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:flutter/cupertino.dart';

import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

final DynamicLibrary nativeAACLib = Platform.isAndroid
    ? DynamicLibrary.open("libfdk_aac.so")
    : DynamicLibrary.open("fdk_aac.framework/fdk_aac");
// : DynamicLibrary.process();

final int Function(int x, int y) nativeAdd = nativeAACLib
    .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
    .asFunction();

final void Function(Pointer<Uint8>, Pointer<Uint8>, int, Pointer<Int32>, int) nativePCMToAACBytes =
nativeAACLib.lookup<NativeFunction<Void Function(Pointer<Uint8>, Pointer<Uint8>, Int32, Pointer<Int32>, Int32)>>("pcmToAACBytes").asFunction();

class AacCodec {

  static int addWithCpp(int x, int y) {
    return nativeAdd(x, y);
    // return 0;
  }

  static Pointer<Uint8> pcmBytes = calloc<Uint8>(4096);
  static const aacBufSize = 20480;
  static Pointer<Uint8> aacBytes = calloc<Uint8>(aacBufSize);
  static final pAacByteCount = calloc<Int32>();

  // for test 将一段录音存成文件
  static const bool _saveAACFileForDebug = false;
  static bool _fileSaved = false;
  static final List<int> _aacBuffer = [];

  static Uint8List pcmToAACBytes(Uint8List bytes) {
    // Pointer<Uint8> pcmBytes = calloc<Uint8>(bytes.length);
    // Pointer<Uint8> aacBytes = calloc<Uint8>(aacBufSize);
    // final pAacByteCount = calloc<Int32>();

    for (int i = 0; i < bytes.length; i++) {
      pcmBytes[i] = bytes[i];
      // pcmBytes[i] = 128;
    }

    // var start = DateTime.now().microsecondsSinceEpoch;
    nativePCMToAACBytes(pcmBytes, aacBytes, bytes.length, pAacByteCount, 1);

    // var end = DateTime.now().microsecondsSinceEpoch;
    // print('liqf: pcmToAACBytes nativePCMToAACBytes duration = ${end - start} us');
    // start = end;

    Uint8List aacByteList = aacBytes.asTypedList(pAacByteCount.value);

    if (_saveAACFileForDebug) {
      _aacBuffer.addAll(aacByteList);
      debugPrint('^^^^^^^^^^^^^^AacCodec.pcmToAACBytes _aacBuffer length = ${_aacBuffer.length}');
      if (_aacBuffer.length >= 100 * 1000 && !_fileSaved) {
        var tmpBuf = Uint8List.fromList(_aacBuffer);
        _fileSaved = true;
        Future.delayed(Duration.zero, () async {
          String baseDir = '';
          if (Platform.isAndroid) {
            final externalStorageDirectory = await getExternalStorageDirectory();
            baseDir = join(externalStorageDirectory?.path ?? '', 'aac');
          }
          if (Platform.isIOS) {
            final externalStorageDirectory = await getApplicationDocumentsDirectory();
            baseDir = join(externalStorageDirectory.path, 'aac');
          }
          await Directory(baseDir).create(recursive: true);
          File file = File(join(baseDir, 'pcmToAAC.aac'));
          file.writeAsBytes(tmpBuf);
          debugPrint('^^^^^^^^^^^^^^AacCodec.pcmToAACBytes writeAsBytes path = ${file.path}');
          debugPrint('^^^^^^^^^^^^^^AacCodec.pcmToAACBytes writeAsBytes length = ${tmpBuf.length}');
        });
      }
    }

    // calloc.free(pAacByteCount);
    // calloc.free(pcmBytes);
    // calloc.free(aacBytes);

    // print('FlutterNoCppSrc.pcmToAACBytes bytes = ${aacByteList.map((e) => e.toRadixString(16)).join(' ')}');
    return aacByteList;
  }
}
