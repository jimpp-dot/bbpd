package ly.plugins.pulse_log;

import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.lifecycle.Observer;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** BaseLogPlugin */
public class BaseLogPlugin implements FlutterPlugin, MethodCallHandler {
  private static final String EVENT_CHANNEL_NAME = "ly.plugins.pulse_log.event";
  private static final String CHANNEL_NAME = "ly.plugins.pulse_log";

  private MethodChannel channel;
  private PulseLogSteamHandler eventHandler;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL_NAME);
    channel.setMethodCallHandler(this);
    eventHandler = new PulseLogSteamHandler(flutterPluginBinding.getApplicationContext());
    new EventChannel(flutterPluginBinding.getBinaryMessenger(), EVENT_CHANNEL_NAME).setStreamHandler(eventHandler);

    LiveDataBus.getInstance("log.crash").observeForever(crashObserver);

    Thread.setDefaultUncaughtExceptionHandler(new BaseCrashLogger(flutterPluginBinding.getApplicationContext()));
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformInfo")) {
      Map<String,Object> map = new HashMap<>();
      map.put("version", Build.VERSION.RELEASE);
      map.put("model",Build.MODEL);
      map.put("display",Build.DISPLAY);
      map.put("device",Build.DEVICE);
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        map.put("supported_abis",Build.SUPPORTED_ABIS.toString());
      }
      result.success(map);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
    LiveDataBus.getInstance("log.crash").removeObserver(crashObserver);
  }

  private Observer<Object> crashObserver = crash -> {
    if(crash != null && crash instanceof Throwable){
      StringWriter stringWriter = new StringWriter();
      PrintWriter printWriter = new PrintWriter(stringWriter);
      ((Throwable) crash).printStackTrace(printWriter);

      String crashLog = stringWriter.toString();
      Log.d("baseLog", crashLog);
      if(eventHandler != null){
        Map<String,Object> msg = new HashMap<>();
        msg.put("event","crash");
        if(crashLog.length() > 5000){
          msg.put("data",crashLog.substring(0, 5000));
        }else{
          msg.put("data",crashLog);
        }
        eventHandler.sendMsgToDart(msg);
      }
    }
  };
}
