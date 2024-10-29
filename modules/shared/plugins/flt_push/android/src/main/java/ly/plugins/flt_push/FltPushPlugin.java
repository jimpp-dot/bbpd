package ly.plugins.flt_push;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FltPushPlugin */
public class FltPushPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, IPushCallback {
  private static final String TAG = FltPushPlugin.class.getSimpleName();
  private FlutterPluginBinding flutterPluginBinding;
  private MethodChannel channel;
  private EventChannel eventChannel;
  private EventChannel.EventSink eventSink;
  private Activity activity;
  private String mToken;
  private String mVendor;

  private static final String EVENT_PUSH_REGISTERED = "EVENT_PUSH_REGISTERED";

  private void setup(final BinaryMessenger messenger, final Activity activity) {
    this.activity = activity;
    channel = new MethodChannel(messenger, "ly.plugins.flt_push");
    channel.setMethodCallHandler(this);

    eventChannel = new EventChannel(messenger, "ly.plugins.flt_push.event_channel");
    eventChannel.setStreamHandler(new EventChannel.StreamHandler() {
      @Override
      public void onListen(Object arguments, EventChannel.EventSink events) {
        eventSink = events;
        if (mToken != null && mVendor != null) {
          sendToDartListener(mToken, mVendor);
          mToken = null;
          mVendor = null;
        }
      }

      @Override
      public void onCancel(Object arguments) {
        eventSink = null;
      }
    });

    initOfflinePush(activity);
  }

  private void initOfflinePush(Activity activity) {
    FltPushManager.getInstance().init(activity, this);
  }

  private void tearDown() {
    channel.setMethodCallHandler(null);
    channel = null;
    eventChannel.setStreamHandler(null);
    eventChannel = null;
  }

  @Override
  public void onAttachedToEngine(FlutterPluginBinding binding) {
    flutterPluginBinding = binding;
  }

  @Override
  public void onDetachedFromEngine(FlutterPluginBinding binding) {
    flutterPluginBinding = null;
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {
    setup(flutterPluginBinding.getBinaryMessenger(), binding.getActivity());
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity();
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    onAttachedToActivity(binding);
  }

  @Override
  public void onDetachedFromActivity() {
    tearDown();
  }

  private void sendToDartListener(String token, String vendor) {
    final HashMap<String, String> params = new HashMap<>();
    params.put("token", token);
    params.put("vendor", vendor);
    params.put("client_type", "android");
    sendMessageToClient(EVENT_PUSH_REGISTERED, params);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    switch (call.method) {
      case "getPlatformVersion":
        result.success("Android " + android.os.Build.VERSION.RELEASE);
        break;
      case "getTokenInfo":
        String token = FltPushManager.getInstance().getToken(this.activity);
        String vendor = FltPushManager.getInstance().getVendor();
        Map<String, Object> tokenInfo = new HashMap<>();
        tokenInfo.put("token", token);
        tokenInfo.put("vendor", vendor);
        tokenInfo.put("client_type", "android");
        result.success(tokenInfo);
        break;
      case "initOfflinePush":
        FltPushManager.getInstance().start(activity);
        result.success(true);
        break;
      default:
        result.notImplemented();
        break;
    }
  }

  private void sendMessageToClient(final String type, final Object message){
    if (activity == null) {
      return;
    }

    activity.runOnUiThread(new Runnable() {
      @Override
      public void run() {
        HashMap<String, Object> args = new HashMap<>();
        args.put("type", type);
        args.put("message", message);
        if(FltPushPlugin.this.eventSink != null){
          try {
            FltPushPlugin.this.eventSink.success(args);
          } catch (Exception e) {
            e.printStackTrace();
          }
        }
      }
    });
  }

  @Override
  public void onPushRegistered(String token, String vendor) {
    Log.d(TAG, "PushChannel onPushRegistered token = " + token + ", vendor = " + vendor);
    // 把用户token传给dart，然后持久化以及上报服务器
    if (eventSink != null) {
      sendToDartListener(token, vendor);
    } else { //如果dart层还未来得及注册监听，就暂存一下等待上报
      mToken = token;
      mVendor = vendor;
    }
  }

  @Override
  public void onReceivePushMessage(Context context, String msg, String from, boolean playSound) {
    //TODO 处理透传消息
  }

  @Override
  public void onClickNotification(String msg, String from) {
    //TODO 处理点击通知栏事件，只有部分厂商有此回调（小米）
  }
}
