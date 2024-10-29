package ly.plugins.pulse_im;

import android.app.Activity;
import android.content.pm.PackageManager;
import android.media.AudioAttributes;
import android.media.MediaPlayer;
import android.media.MediaRecorder;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.util.Base64;
import android.util.Log;

import androidx.annotation.NonNull;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/**
 * 目前提供录音相关功能。
 */
public class PulseImPlugin implements FlutterPlugin, ActivityAware, MethodCallHandler, EventChannel.StreamHandler, PluginRegistry.RequestPermissionsResultListener {

    private Activity activity;
    private ActivityPluginBinding activityPluginBinding;
    private EventChannel.EventSink events;

    public static final String EVENT_CHANNEL_NAME = "ly.plugins.pulse_im.message";
    public static final String CHANNEL_NAME = "ly.plugins.pulse_im";

    private File recordTarget;
    static final int REQUEST_RECORD_AUDIO_PERMISSION = 200;
    private Handler mHandler = new Handler();
    private int mRecordSecs;
    private final int SEC_DELAY = 1000;

    private MediaPlayer mediaPlayer;

    private static final String PLAYER_TAG = "CommonIm_player";

    MethodChannel channel;
    EventChannel eventChannel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(binding.getBinaryMessenger(), CHANNEL_NAME);
        eventChannel = new EventChannel(binding.getBinaryMessenger(), EVENT_CHANNEL_NAME);
        channel.setMethodCallHandler(this);
        eventChannel.setStreamHandler(this);
        recordTarget = new File(binding.getApplicationContext().getFilesDir(), "common_im_voice_record.amr");
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        eventChannel.setStreamHandler(null);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
        activityPluginBinding = binding;
        activityPluginBinding.addRequestPermissionsResultListener(this);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {
        activityPluginBinding.removeRequestPermissionsResultListener(this);
        activityPluginBinding = null;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        result = new ResultWrapper(result);
        switch (call.method) {
            case "startRecordVoice":
                this.startRecordVoice(call, result);
                break;
            case "finishRecordVoice":
                this.finishRecordVoice(call, result);
                break;
            case "cancelRecordVoice":
                this.cancelRecordVoice(call, result);
                break;
            case "startPlayVoice":
                this.startPlayVoice(call, result);
                break;
            case "stopPlayVoice":
                this.stopPlayVoice(call, result, true);
                break;
        }
    }

    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        this.events = events;
    }

    @Override
    public void onCancel(Object arguments) {
        this.events = null;
    }

    @Override
    public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        switch (requestCode) {
            case REQUEST_RECORD_AUDIO_PERMISSION:
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    Map<String, Object> ret = new HashMap<>();
                    ret.put("success", true);
                    ResultWrapper.success(recordResult, ret);
                    recordResult = null;
                    return true;
                } else {
                    Map<String, Object> retFail = new HashMap<>();
                    retFail.put("success", false);
                    ResultWrapper.success(recordResult, retFail);
                    recordResult = null;
                    return true;
                }
            default:
                break;
        }
        return false;
    }


    private MediaRecorder recorder;

    private long startTime;

    private Result recordResult;

    private void startRecordVoice(MethodCall call, Result result) {
        recordResult = result;

        if (Build.VERSION.SDK_INT >= 33) {
            Log.d("microphone:", "33");
            if (
                    activity.checkSelfPermission(android.Manifest.permission.READ_MEDIA_AUDIO) != PackageManager.PERMISSION_GRANTED
                            ||
                            activity.checkSelfPermission(android.Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED
            ) {
                activity.requestPermissions(new String[]{
                        android.Manifest.permission.READ_MEDIA_AUDIO,
                        android.Manifest.permission.RECORD_AUDIO
                }, REQUEST_RECORD_AUDIO_PERMISSION);
                return;
            }
        }

        else if (Build.VERSION.SDK_INT<33 && Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (
                    activity.checkSelfPermission(android.Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED
                            || activity.checkSelfPermission(android.Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED
            ) {
                activity.requestPermissions(new String[]{
                        android.Manifest.permission.RECORD_AUDIO,
                        android.Manifest.permission.WRITE_EXTERNAL_STORAGE,
                }, REQUEST_RECORD_AUDIO_PERMISSION);
                return;
            }
        }

        Map<String, Object> ret = new HashMap<>();
        ret.put("success", true);

        if (recorder != null) {
            cancelRecordVoice(call, result);
            return;
        }

        beginTimeCount();

        startTime = new Date().getTime();
        recorder = new MediaRecorder();// new出MediaRecorder对象
        // 设置MediaRecorder的音频源为麦克风
        recorder.setAudioSource(MediaRecorder.AudioSource.MIC);
        // 设置MediaRecorder录制的音频格式
        recorder.setOutputFormat(MediaRecorder.OutputFormat.AMR_NB);
        // 设置MediaRecorder录制音频的编码为amr.
        recorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);

        recorder.setAudioChannels(1);
        recorder.setAudioSamplingRate(8000);

        recorder.setOnErrorListener(new MediaRecorder.OnErrorListener() {
            @Override
            public void onError(MediaRecorder mr, int what, int extra) {
                Log.d("MediaRecord", "OnError: " + what + "" + extra);
            }
        });

        recorder.setOnInfoListener(new MediaRecorder.OnInfoListener() {
            @Override
            public void onInfo(MediaRecorder mr, int what, int extra) {
                Log.d("MediaRecord", "OnInfo: " + what + "" + extra);
            }
        });

        recorder.setOutputFile(recordTarget.toString());

        try {
            recorder.prepare();
        } catch (IOException e) {
            recorder.release();
            recorder = null;
            ResultWrapper.error(result, "IOException encountered", call.method, e);
            return;
        }
        recorder.start();

        recordResult = result;
    }

    public void cancelRecordVoice(MethodCall call, Result result) {
        if (recorder == null) {
            return;
        }
        endTimeCount();
        try {
            recorder.stop();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        recorder.release();
        recorder = null;
        ResultWrapper.success(result, true);
    }

    public void finishRecordVoice(MethodCall call, Result result) {
        if (recorder == null) {
            return;
        }
        endTimeCount();
        try {
            recorder.stop();
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        recorder.release();
        recorder = null;
        FileInputStream inputFile = null;
        try {
            Map<String, Object> ret = new HashMap();

            inputFile = new FileInputStream(recordTarget);
            byte[] buffer = new byte[(int) recordTarget.length()];
            inputFile.read(buffer);
            inputFile.close();

            Map<String, Object> retMap = new HashMap();
            ret.put("data", retMap);
            retMap.put("type", "voice");
            retMap.put("base64", Base64.encodeToString(buffer, Base64.DEFAULT));
            retMap.put("uri", Uri.fromFile(recordTarget).toString());
            int secs = (int) (Math.ceil(new Date().getTime() - startTime) / 1000.0f);
            retMap.put("duration", secs);
            ret.put("success", true);
            recordResult.success(ret);
            ResultWrapper.success(result, true);
        } catch (IOException e) {
            ResultWrapper.error(result, "IOException encountered", call.method, e);
            e.printStackTrace();
        }
        recordResult = null;
    }


    private void beginTimeCount() {
        endTimeCount();
        mRecordSecs = 0;

        mHandler.postDelayed(mIntervalRunnable, SEC_DELAY);
    }

    private void endTimeCount() {
        mHandler.removeCallbacks(mIntervalRunnable);
    }

    private final Runnable mIntervalRunnable = new Runnable() {
        @Override
        public void run() {
            mRecordSecs += 1;
            sendMessageToClient("onRecordDurationChanged", String.valueOf(mRecordSecs));
            mHandler.postDelayed(this, SEC_DELAY);
        }
    };

    private void sendMessageToClient(final String type, final Object message) {
        Activity activity = this.activity;
        if (activity == null) {
            return;
        }
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                HashMap<String, Object> args = new HashMap<String, Object>();
                args.put("type", type);
                args.put("message", message);
                if (events != null) {
                    try {
                        events.success(args);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        });
    }

    private void startPlayVoice(final MethodCall call, final Result result) {
        stopPlayVoice(call, result, false);
        Object urlObj = call.argument("url");
        if (urlObj == null) {
            ResultWrapper.error(result, "startPlayVoice", "Url Invalid ", "Url is empty...");
            return;
        }

        String url = urlObj.toString();
        AudioAttributes audioAttribute = null;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            audioAttribute = new AudioAttributes.Builder()
                    .setUsage(AudioAttributes.USAGE_MEDIA)
                    .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                    .build();
        }

        mediaPlayer = new MediaPlayer();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            mediaPlayer.setAudioAttributes(audioAttribute);
        }
        //mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC);

        try {
            mediaPlayer.setDataSource(url);
        } catch (IOException e) {
            Log.w(PLAYER_TAG, "Invalid DataSource", e);
            ResultWrapper.error(result, call.method, e.getMessage(), "Invalid DataSource");
            return;
        }

        mediaPlayer.prepareAsync();

        mediaPlayer.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
            @Override
            public void onPrepared(MediaPlayer mp) {
                mediaPlayer.start();
                //channel.invokeMethod("audio.onStart", mediaPlayer.getDuration());
                //result.success("playing");
            }
        });

        mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mp) {
                stopPlayVoice(call, result, false);
                //channel.invokeMethod("audio.onComplete", null);
            }
        });

        mediaPlayer.setOnErrorListener(new MediaPlayer.OnErrorListener() {
            @Override
            public boolean onError(MediaPlayer mp, int what, int extra) {
                //channel.invokeMethod("audio.onError", String.format(Locale.US, "{\"what\":%d,\"extra\":%d}", what, extra));
                return true;
            }
        });
        result.success("playing");
    }


    private void stopPlayVoice(MethodCall call, Result result, boolean shouldReply) {
        if (mediaPlayer != null) {
            mediaPlayer.stop();
            mediaPlayer.release();
            mediaPlayer = null;
        }

        if (shouldReply) {
            result.success(true);
        }
    }


}
