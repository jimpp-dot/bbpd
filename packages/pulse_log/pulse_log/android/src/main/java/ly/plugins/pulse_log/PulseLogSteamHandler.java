package ly.plugins.pulse_log;

import android.content.Context;

import androidx.core.content.ContextCompat;

import java.util.Map;

import io.flutter.plugin.common.EventChannel;

class PulseLogSteamHandler implements EventChannel.StreamHandler{

   private final Context context;
   private EventChannel.EventSink eventSink;

   PulseLogSteamHandler(Context context) {
      this.context = context;
   }

   @Override
   public void onListen(Object arguments, EventChannel.EventSink events) {
      eventSink = events;
   }

   @Override
   public void onCancel(Object arguments) {
      eventSink = null;
   }

   void sendMsgToDart(Map<String,Object> msg){
      if(context != null && eventSink != null){
         ContextCompat.getMainExecutor(context).execute(new Runnable() {
            @Override
            public void run() {
               eventSink.success(msg);
            }
         });
      }
   }
}
