import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:synchronized/synchronized.dart';
import 'package:path/path.dart';

/// 声网声音录制
class AgoraAudioRecorder {
  List<int> _buffer = [];
  int _contentLength = 0;
  int _totalContentLength = 0;
  late int _numOfSamples, _bytesPerSample, _channels, _samplesPerSec;
  File? _audioFilePath;
  RecordConfig? _config;

  bool _recording = false;

  final _lock = Lock();

  /// 开始录制
  void startRecord(RecordConfig config) {
    rtcLog('AgoraAudioRecorder startRecord');
    _resetParam();
    _config = config;
    _recording = true;
  }

  /// 结束录制
  Future<String?> endRecord() async {
    rtcLog('AgoraAudioRecorder endRecord');
    _recording = false;
    if (_buffer.isNotEmpty && _contentLength > 0) {
      await _writeTempFile(_buffer.sublist(0, _contentLength));
      _totalContentLength += _contentLength;
      _buffer.clear();
      _contentLength = 0;
    }
    return _generateMusic();
  }

  /// 生成最终的音乐文件
  Future<String?> _generateMusic() async {
    if (_audioFilePath != null && await _audioFilePath!.exists()) {
      try {
        int millisecondsSinceEpoch = DateTime
            .now()
            .millisecondsSinceEpoch;
        String fileName =
            '${basenameWithoutExtension(
            _config!.filePath)}_$millisecondsSinceEpoch.wav';
        String filePath = join(dirname(_config!.filePath), fileName);
        File resultFile = await _generateFile(filePath);

        // 音乐内容长度
        int dataLen = _audioFilePath!.lengthSync();
        RandomAccessFile randomAccessFile =
        await resultFile.open(mode: FileMode.write);
        await randomAccessFile.writeFrom(_head(dataLen, _numOfSamples,
            _bytesPerSample, _channels, _samplesPerSec));
        await randomAccessFile.writeFrom(await _audioFilePath!.readAsBytes());
        await randomAccessFile.close();
        _audioFilePath!.delete();
        rtcLog('gmic AgoraAudioRecorder _generateMusic '
            '_totalContentLength: $_totalContentLength '
            'dataLen:$dataLen '
            'file path: ${resultFile.path}'
            'file length: ${resultFile.lengthSync()}');
        return resultFile.path;
      } catch (e) {
        print(e);
      }
    }
    return null;
  }

  /// 录制音频数据
  Future record(Uint8List samples, int numOfSamples, int bytesPerSample,
      int channels, int samplesPerSec) async {
    rtcLog('gmic record numOfSamples：$numOfSamples '
        'bytesPerSample: $bytesPerSample '
        'channels:$channels '
        'samplesPerSec: $samplesPerSec');

    _lock.synchronized(() async {
      if (!_recording) return;
      this._numOfSamples = numOfSamples;
      this._bytesPerSample = bytesPerSample;
      this._channels = channels;
      this._samplesPerSec = samplesPerSec;

      if (_contentLength + samples.length < 1024 * 1024) {
        _buffer.addAll(samples);
        _contentLength += samples.length;
      } else {
        await _writeTempFile(_buffer.sublist(0, _contentLength));
        _totalContentLength += _contentLength;
        _buffer.clear();
        _contentLength = samples.length;
        _buffer.addAll(samples);
      }
    });
    return true;
  }

  /// 重置数据
  _resetParam() {
    _recording = false;
    _buffer.clear();
    _contentLength = 0;
    _totalContentLength = 0;
    _audioFilePath = null;
  }

  /// 写入临时文件
  Future<File> _writeTempFile(List<int> bytes) async {
    if (_audioFilePath == null) {
      int millisecondsSinceEpoch = DateTime
          .now()
          .millisecondsSinceEpoch;
      String fileName =
          '${basenameWithoutExtension(
          _config!.filePath)}_$millisecondsSinceEpoch.wav';
      String filePath = join(dirname(_config!.filePath), fileName);
      File resultFile = await _generateFile(filePath);
      _audioFilePath = resultFile;
    }
    try {
      await _audioFilePath!.writeAsBytes(bytes,
          mode: FileMode.writeOnlyAppend, flush: true);
    } catch (e) {
      rtcLog('gmic AgoraAudioRecorder _writeTempFile error: $e');
    }
    return _audioFilePath!;
  }

  /// 音频头文件 wav格式
  /// [dataLength] 数据内容长度
  /// [numOfSamples] 采样数
  /// [bytesPerSample] 每个样本的字节数
  /// [channels] 频道数量 单声道：1 双声道2
  /// [samplesPerSec] 每声道每秒的采样点数
  Uint8List _head(int dataLength, int numOfSamples, int bytesPerSample,
      int channels, int samplesPerSec) {
    int sampleRate = samplesPerSec; // 采样率
    int byteRate = sampleRate * channels * bytesPerSample; // 字节比特率

    var size = dataLength;

    var fileSize = size + 36;

    Uint8List header = Uint8List.fromList([
      // "RIFF"
      82, 73, 70, 70,
      fileSize & 0xff,
      (fileSize >> 8) & 0xff,
      (fileSize >> 16) & 0xff,
      (fileSize >> 24) & 0xff,
      // WAVE
      87, 65, 86, 69,
      // fmt
      102, 109, 116, 32,
      // fmt chunk size 16
      16, 0, 0, 0,
      // Type of format
      1, 0,
      // One channel
      channels, 0,
      // Sample rate
      sampleRate & 0xff,
      (sampleRate >> 8) & 0xff,
      (sampleRate >> 16) & 0xff,
      (sampleRate >> 24) & 0xff,
      // Byte rate
      byteRate & 0xff,
      (byteRate >> 8) & 0xff,
      (byteRate >> 16) & 0xff,
      (byteRate >> 24) & 0xff,
      // Uhm
      bytesPerSample * channels, 0,
      // bitsize
      bytesPerSample * 8, 0,
      // "data"
      100, 97, 116, 97,
      size & 0xff,
      (size >> 8) & 0xff,
      (size >> 16) & 0xff,
      (size >> 24) & 0xff,
    ]);
    return header;
  }

  /// 生成声音文件路径
  Future<File> _generateFile(String path) async {
    File file = File(path);
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    return file;
  }
}
