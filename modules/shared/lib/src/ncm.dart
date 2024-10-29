import 'dart:io';
import 'dart:typed_data';
import 'package:shared/shared.dart';
import "package:pointycastle/pointycastle.dart";
import 'dart:convert';

class Ncm {
  final File ncm;
  final File mp3;

  int _musicId = 0;
  String _musicName = '';

  Ncm(this.ncm, this.mp3);

  String get name {
    return _musicName;
  }

  int get id {
    return _musicId;
  }

  bool format() {
    try {
      RandomAccessFile fp = ncm.openSync();
      if (fp.lengthSync() < 14) return false;

      int globalOffset = 10;
      fp.setPositionSync(globalOffset);
      List<int> buffer = fp.readSync(4);
      int keyLength = readUInt32LE(buffer);

      Uint8List keyDataBuffer = fp.readSync(keyLength);
      for (int i = 0; i < keyLength; i++) {
        keyDataBuffer[i] ^= 0x64;
      }

      if (keyDataBuffer.length != keyLength) return false;

      Uint8List coreKey = Uint8List.fromList([
        0x68,
        0x7A,
        0x48,
        0x52,
        0x41,
        0x6D,
        0x73,
        0x6F,
        0x35,
        0x6B,
        0x49,
        0x6E,
        0x62,
        0x61,
        0x78,
        0x57
      ]);

      BlockCipher aes = PaddedBlockCipher("AES/ECB/PKCS7");
      aes.init(false, PaddedBlockCipherParameters(KeyParameter(coreKey), null));
      Uint8List keyData = aes.process(keyDataBuffer);
      Uint8List trimKeyData = keyData.sublist(17);

      int metaLength = readUInt32LE(fp.readSync(4));
      List<int> metaDataBuffer = fp.readSync(metaLength);
      for (int i = 0; i < metaLength; i++) {
        metaDataBuffer[i] ^= 0x63;
      }

      Uint8List base64decodeBuffer =
          base64Decode(String.fromCharCodes(metaDataBuffer.sublist(22)));
      Uint8List metaKey = Uint8List.fromList([
        0x23,
        0x31,
        0x34,
        0x6C,
        0x6A,
        0x6B,
        0x5F,
        0x21,
        0x5C,
        0x5D,
        0x26,
        0x30,
        0x55,
        0x3C,
        0x27,
        0x28
      ]);

      BlockCipher decryptionCipher = PaddedBlockCipher("AES/ECB/PKCS7");
      decryptionCipher.init(
          false, PaddedBlockCipherParameters(KeyParameter(metaKey), null));

      //Map musicInfo = json.decode(new String.fromCharCodes(decryptionCipher.process(base64decodeBuffer)).substring(6));
      Map musicInfo = json.decode(utf8
          .decode(decryptionCipher.process(base64decodeBuffer))
          .substring(6));
      _musicId = musicInfo.containsKey('musicId')
          ? int.parse(musicInfo['musicId'].toString())
          : 0;
      _musicName = musicInfo.containsKey('musicName')
          ? musicInfo['musicName'].toString()
          : '';

      fp.setPositionSync(fp.positionSync() + 9);
      int imageLength = readUInt32LE(fp.readSync(4));
      fp.setPositionSync(imageLength + fp.positionSync());

      Uint8List box = buildKeyBox(trimKeyData);

      if (mp3.existsSync()) {
        mp3.deleteSync();
      }

      int n = 0x8000;
      List<int> mp3Buffer = [];
      while (n > 1) {
        List<int> buffer = fp.readSync(n);
        n = buffer.length;
        for (int i = 0; i < n; i++) {
          int j = (i + 1) & 0xff;
          buffer[i] ^= box[(box[j] + box[(box[j] + j) & 0xff]) & 0xff];
        }
        mp3Buffer.addAll(buffer);
        if (mp3Buffer.length >= 1024 * 1024 * 2) {
          mp3.writeAsBytesSync(mp3Buffer, mode: FileMode.writeOnlyAppend);
          mp3Buffer.clear();
        }
      }
      if (mp3Buffer.isNotEmpty) {
        mp3.writeAsBytesSync(mp3Buffer, mode: FileMode.writeOnlyAppend);
        mp3Buffer.clear();
      }

      return true;
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return false;
  }

  int readUInt32LE(List<int> args) {
    return args[3] * 256 * 256 * 256 +
        args[2] * 256 * 256 +
        args[1] * 256 +
        args[0];
  }

  Uint8List buildKeyBox(Uint8List key) {
    int keyLength = key.length;
    Uint8List box = Uint8List(256);

    for (int i = 0; i < 256; i++) {
      box[i] = i;
    }

    int swap = 0;
    int c = 0;
    int lastByte = 0;
    int keyOffset = 0;

    for (int i = 0; i < 256; ++i) {
      swap = box[i];
      c = ((swap + lastByte + key[keyOffset++]) & 0xff);
      if (keyOffset >= keyLength) {
        keyOffset = 0;
      }
      box[i] = box[c];
      box[c] = swap;
      lastByte = c;
    }

    return box;
  }
}
