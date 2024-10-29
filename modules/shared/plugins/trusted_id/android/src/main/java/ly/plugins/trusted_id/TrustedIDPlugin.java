package ly.plugins.trusted_id;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.VisibleForTesting;

import java.util.concurrent.ConcurrentHashMap;

import cn.shuzilm.core.Listener;
import cn.shuzilm.core.Main;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** TrustedIDPlugin */
public class TrustedIDPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {

  public static final String CHANNEL_NAME = "ly.plugins.trusted_id";
  private static final String TAG = "TrustedIDPlugin";

  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private ActivityPluginBinding activityPluginBinding;
  private Registrar registrar;
  private ConcurrentHashMap<String,Result> resultMaps;


  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  public static void registerWith(Registrar registrar) {
    TrustedIDPlugin instance = new TrustedIDPlugin();
    instance.setUpRegistrar(registrar);
    instance.initInstance(registrar.messenger(), registrar.context());
    Log.d(TAG, "init registerWith: ");
  }

  private void setUpRegistrar(Registrar registrar) {
    this.registrar = registrar;
  }

  public void initInstance(BinaryMessenger messenger, Context context) {
    Main.init(context.getApplicationContext(),getApiKey(context));
    // 在queryID之前调用该方法，禁止sdk读取已安装应用列表
    Main.setConfig("pkglist", "1");
    channel = new MethodChannel(messenger, CHANNEL_NAME);
    channel.setMethodCallHandler(this);
    resultMaps = new ConcurrentHashMap<>();
    queryID(context);
  }

  private String getApiKey(Context context) {
    int clientIdIdentifier =
            context
                    .getResources()
                    .getIdentifier("digital_union_key", "string", context.getPackageName());
    if (clientIdIdentifier != 0) {
      return context.getString(clientIdIdentifier);
    }else throw new IllegalArgumentException("please configure digital_union_key");
  }

  private void queryID(Context context){
    Log.d(TAG, "init getQueryID: ");
    Main.getQueryID(context.getApplicationContext(), "default", "init", 1, new Listener() {
      @Override
      public void handler(String id) {
        Log.d(TAG, "getQueryID: " + id);
      }
    });
  }

  private void dispose() {
    channel.setMethodCallHandler(null);
    channel = null;
  }

  private Activity activity(){
    return activityPluginBinding == null? registrar.activity():activityPluginBinding.getActivity();
  }

  private void attachToActivity(ActivityPluginBinding activityPluginBinding) {
    this.activityPluginBinding = activityPluginBinding;
  }

  private void disposeActivity() {
    activityPluginBinding = null;
    resultMaps.clear();
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    initInstance(binding.getBinaryMessenger(), binding.getApplicationContext());
    Log.d(TAG, "init onAttachedToEngine: ");
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    dispose();
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
    attachToActivity(activityPluginBinding);
    Log.d(TAG, "init onAttachedToActivity: ");
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    disposeActivity();
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding activityPluginBinding) {
    attachToActivity(activityPluginBinding);
  }

  @Override
  public void onDetachedFromActivity() {
    disposeActivity();
  }


  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    final String method = call.method;
    resultMaps.put(method,result);
    if (call.method.equals("getQueryID")) {
      String channel = call.argument("channel");
      String extraMsg = call.argument("extra");
      if(channel == null || channel.isEmpty()) channel = "default";
      if(extraMsg == null) extraMsg = "";
      Main.getQueryID(activity(), channel, extraMsg, 1, new Listener() {
        @Override
        public void handler(String id) {
          resultSuccess(method,id);
        }
      });
    }
    else if(call.method.equals("getOpenAnmsID")){
      Main.getOpenAnmsID(activity(), new Listener() {
        @Override
        public void handler(String id) {
          resultSuccess(method,id);
        }
      });
    }
    else if(call.method.equals("setConfig")){
      String key = call.argument("key");
      String value = call.argument("value");
      if(key != null && !key.isEmpty()){
        Log.d(TAG, "setConfig: key == "+key);
        Log.d(TAG, "setConfig: value == "+value);
        Main.setConfig(key,value);
        resultSuccess(method,"set success");
      }else {
        resultError(method,"DU1001","key is empty",null);
      }
    }
    else if(call.method.equals("setData")){
      String key = call.argument("key");
      String value = call.argument("value");
      if(key != null && !key.isEmpty()){
        Main.setData(key,value);
        resultSuccess(method,"set success");
      }else {
        resultError(method,"DU1002","key is empty",null);
      }
    }
    else {
      result.notImplemented();
    }
  }

  private void resultSuccess(final String key,final Object data){
      if (activity() == null) return;
    if(data!=null) Log.d(TAG, key+ " success: " + data.toString());
    activity().runOnUiThread(new Runnable() {
        @Override
        public void run() {
          Result result = resultMaps.remove(key);
          if(result != null) result.success(data);
        }
      });
  }

  private void resultError(final String key, final String errorCode, final String errorMessage, final Object data){
    if (activity() == null) return;
    Log.d(TAG, key+ " error: " + errorMessage);
    activity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        Result result = resultMaps.remove(key);
        if(result != null) result.error(errorCode,errorMessage,data);
      }
    });
  }
}
