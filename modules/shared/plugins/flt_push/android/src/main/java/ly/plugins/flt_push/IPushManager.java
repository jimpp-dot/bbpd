package ly.plugins.flt_push;

import android.content.Context;

public interface IPushManager {
  void start(final Context context);
  void stop(final Context context);
  String getToken(final Context context);
}
