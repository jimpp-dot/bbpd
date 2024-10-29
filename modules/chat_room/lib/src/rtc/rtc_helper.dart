import 'package:shared/k.dart';
import 'package:commonrtc_api/commonrtc_api.dart';

class RtcErrorMessage {
  final String message;
  final int level;

  RtcErrorMessage(this.message, this.level);

  @override
  String toString() => 'msg=$message, level=$level';
}

extension ErrorCodeExt on ErrorCode {
  RtcErrorMessage errorMsg() {
    switch (this) {
      case ErrorCode.LoadMediaEngine:
        return RtcErrorMessage(K.rtc_err_load_media_engine, 2);
      case ErrorCode.StartCall:
        return RtcErrorMessage(K.rtc_err_start_call, 2);
      case ErrorCode.StartCamera:
        return RtcErrorMessage(K.rtc_err_start_camera, 2);
      case ErrorCode.StartVideoRender:
        return RtcErrorMessage(K.rtc_err_start_video_render, 2);
      case ErrorCode.AdmGeneralError:
        return RtcErrorMessage(K.rtc_err_adm_general, 2);
      case ErrorCode.AdmJavaResource:
        return RtcErrorMessage(K.rtc_err_adm_java_resource, 2);
      case ErrorCode.AdmSampleRate:
        return RtcErrorMessage(K.rtc_err_adm_sample_rate, 1);
      case ErrorCode.AdmInitPlayout:
        return RtcErrorMessage(K.rtc_err_int_playout, 1);
      case ErrorCode.AdmStartPlayout:
        return RtcErrorMessage(K.rtc_err_adm_start_playout, 1);
      case ErrorCode.AdmStopPlayout:
        return RtcErrorMessage(K.rtc_err_adm_stop_playout, 0);
      case ErrorCode.AdmInitRecording:
        return RtcErrorMessage(K.rtc_err_init_recording, 1);
      case ErrorCode.AdmStartRecording:
        return RtcErrorMessage(K.rtc_err_adm_start_recording, 1);
      case ErrorCode.AdmNoPermission:
        return RtcErrorMessage(K.rtc_err_adm_no_permission, 1);
      case ErrorCode.AdmStopRecording:
        return RtcErrorMessage(K.rtc_err_adm_stop_recording, 0);
      case ErrorCode.AdmRuntimePlayoutError:
        return RtcErrorMessage(K.rtc_err_adm_runtime_playout, 2);
      case ErrorCode.AdmRuntimeRecordingError:
        return RtcErrorMessage(K.rtc_err_runtime_recording, 2);
      case ErrorCode.AdmRecordAudioFailed:
        return RtcErrorMessage(K.rtc_err_adm_record_audio_failed, 2);
      case ErrorCode.AdmInitLoopback:
        return RtcErrorMessage(K.rtc_err_adm_init_loopback, 2);
      case ErrorCode.AdmStartLoopback:
        return RtcErrorMessage(K.rtc_err_adm_start_loopback, 2);
      case ErrorCode.VdmCameraNotAuthorized:
        return RtcErrorMessage(K.rtc_err_vdm_camera_not_authorized, 2);
      default:
        return RtcErrorMessage('unknown', -1);
    }
  }
}
