package com.example.bugly.flutter_bugly;

import android.text.TextUtils;

import androidx.annotation.NonNull;

import com.tencent.bugly.crashreport.CrashReport;
import com.tencent.bugly.crashreport.BuglyLog;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * FlutterBuglyPlugin
 */
public class FlutterBuglyPlugin implements MethodCallHandler, FlutterPlugin {

    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(binding.getBinaryMessenger(), "flutter_bugly");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onMethodCall(MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "getPlatformVersion":
                result.success("Android " + android.os.Build.VERSION.RELEASE);
                break;
            case "reportError":
                reportError(call, result);
                break;
            case "setUserId":
                if (call.hasArgument("userId")) {
                    String userId = call.argument("userId");
                    setUserId(userId);
                }
                result.success(null);
                break;
            case "infoLog":
                if (call.hasArgument("info")) {
                    String info = call.argument("info");
                    if (info instanceof String && !info.isEmpty()) {
                        BuglyLog.i("", info);
                    }
                }
                result.success("Android " + android.os.Build.VERSION.RELEASE);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void reportError(MethodCall call, Result result) {
        String message = "";
        String detail = null;
        if (call.hasArgument("exception")) {
            message = call.argument("exception");
        }
        if (call.hasArgument("stackTrace")) {
            detail = call.argument("stackTrace");
        }
        if (TextUtils.isEmpty(detail)) return;
        String[] details = detail.split("#");
        List<StackTraceElement> elements = new ArrayList<>();
        for (String s : details) {
            if (!TextUtils.isEmpty(s)) {
                String methodName = "unknow";
                String fileName = "unknow";
                int lineNum = -1;
                String[] contents = s.split(" \\(");
                if (contents.length > 0) {
                    methodName = contents[0];
                    String packageContent = "";
                    if (contents.length > 1) {
                        packageContent = contents[1].replace(")", "");
                        String[] packageContentArray = packageContent.split("\\.dart:");
                        if (packageContentArray.length > 0) {
                            if (packageContentArray.length == 1) {
                                fileName = packageContentArray[0];
                            } else {
                                fileName = packageContentArray[0] + ".dart";
                                Pattern patternTrace = Pattern.compile("[1-9]\\d*");
                                Matcher m = patternTrace.matcher(packageContentArray[1]);
                                if (m.find()) {
                                    String lineNumStr = m.group();
                                    lineNum = Integer.parseInt(lineNumStr);
                                }
                            }
                        }
                    }
                }
                StackTraceElement element = new StackTraceElement("Dart", methodName, fileName, lineNum);
                elements.add(element);
            }
        }
        StackTraceElement[] elementsArray = new StackTraceElement[elements.size()];
        Throwable throwable = new Throwable(message);
        throwable.setStackTrace(elements.toArray(elementsArray));
        CrashReport.postCatchedException(throwable);
        result.success(null);
    }

    private void setUserId(String uid) {
        CrashReport.setUserId(uid);
    }


}
