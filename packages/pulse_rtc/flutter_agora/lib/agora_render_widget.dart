import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'rtc_local_view.dart' as localRtcView;
import 'rtc_remote_view.dart' as remoteRtcView;
import 'src/enums.dart';

/// AgoraRenderWidget - This widget will automatically manage the native view.
///
/// Enables create native view with `uid` `mode` `local` and destroy native view automatically.
///
class AgoraRenderWidget extends StatelessWidget {
  // uid
  final int uid;

  // local flag
  final bool local;

  /// render mode
  final VideoRenderMode mode;

  final int facing;

  AgoraRenderWidget(
    this.uid, {
    this.mode = VideoRenderMode.Hidden,
    this.local = false,
    this.facing = 0,
  })  : assert(uid != null),
        assert(mode != null),
        assert(facing != null),
        assert(local != null);

  @override
  Widget build(BuildContext context) {
    if (local) {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return localRtcView.TextureView(
          renderMode: mode,
          facing: facing,
        );
      } else {
        return localRtcView.SurfaceView(
          renderMode: mode,
          facing: facing,
        );
      }
    } else {
      return remoteRtcView.SurfaceView(
        uid: uid,
        renderMode: mode,
      );
    }
  }
}
