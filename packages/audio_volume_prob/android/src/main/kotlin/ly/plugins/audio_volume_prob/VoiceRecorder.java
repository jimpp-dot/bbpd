package ly.plugins.audio_volume_prob;

import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder;
import android.util.Log;

import com.konovalov.vad.Vad;
import com.konovalov.vad.VadConfig;
import com.konovalov.vad.VadListener;

import static android.media.AudioFormat.CHANNEL_IN_MONO;
import static android.media.AudioFormat.CHANNEL_IN_STEREO;

/**
 * Created by George Konovalov on 11/16/2019.
 */

public class VoiceRecorder {
    private static final int PCM_CHANNEL = CHANNEL_IN_MONO;
    private static final int PCM_ENCODING_BIT = AudioFormat.ENCODING_PCM_16BIT;

    private Vad vad;
    private AudioRecord audioRecord;
    private Listener callback;
    private Thread thread;
//    private Context mContext;

    private boolean isListening = false;

    private static final String TAG = VoiceRecorder.class.getSimpleName();

    public VoiceRecorder(Listener callback, VadConfig config) {
        this.callback = callback;
        this.vad = new Vad(config);
//        this.mContext = ((AudioVolumeProbPlugin)callback).getMActivity();
    }

    public void updateConfig(VadConfig config) {
        vad.setConfig(config);
    }

    private static final int VAD_INITIALIZED = -999;
    private static final int VAD_NO = 0;
    private static final int VAD_YES = 1;
    private int mLastReportedVad = VAD_INITIALIZED;

    public void start() {
        stop();
        Log.d(TAG, "vad start");
        audioRecord = createAudioRecord();
        if (audioRecord != null) {
            isListening = true;
            audioRecord.startRecording();
            mLastReportedVad = VAD_INITIALIZED;

            thread = new Thread(new ProcessVoice());
            thread.start();
            vad.start();
            Log.d(TAG, "vad start success");
        } else {
            Log.w(TAG, "Failed start Voice Recorder!");
        }
    }


    public void stop() {
        Log.d(TAG, "vad stop");
        isListening = false;
        if (thread != null) {
            thread.interrupt();
            thread = null;
        }
        if (audioRecord != null) {
            try {
                audioRecord.release();
            } catch (Exception e) {
                Log.e(TAG, "vad Error stop AudioRecord ", e);
            }
            audioRecord = null;
        }
        if (vad != null) {
            vad.stop();
        }
    }


    private AudioRecord createAudioRecord() {
        try {
            final int minBufSize = AudioRecord.getMinBufferSize(vad.getConfig().getSampleRate().getValue(), PCM_CHANNEL, PCM_ENCODING_BIT);

            if (minBufSize == AudioRecord.ERROR_BAD_VALUE) {
                return null;
            }

//            AudioManager audioManager = ((AudioManager) mContext.getSystemService(Context.AUDIO_SERVICE));
//            if (audioManager != null) {
//                audioManager.setMode(AudioManager.MODE_NORMAL);
//            }

            final AudioRecord audioRecord = new AudioRecord(MediaRecorder.AudioSource.DEFAULT, vad.getConfig().getSampleRate().getValue(), PCM_CHANNEL, PCM_ENCODING_BIT, minBufSize);

            if (audioRecord.getState() == AudioRecord.STATE_INITIALIZED) {
                return audioRecord;
            } else {
                audioRecord.release();
            }
        } catch (IllegalArgumentException e) {
            Log.e(TAG, "vad Error can't create AudioRecord ", e);
        }

        return null;
    }

    private int getNumberOfChannels() {
        switch (PCM_CHANNEL) {
            case CHANNEL_IN_MONO:
                return 1;
            case CHANNEL_IN_STEREO:
                return 2;
        }
        return 1;
    }

    private class ProcessVoice implements Runnable {

        @Override
        public void run() {
            android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_AUDIO);

            while (!Thread.interrupted() && isListening && audioRecord != null) {
                short[] buffer = new short[vad.getConfig().getFrameSize().getValue() * getNumberOfChannels() * 2];
                int ret = audioRecord.read(buffer, 0, buffer.length);

                if (ret > 0) {
                    isSpeechDetected(buffer);
                } else if (ret == 0) {
                    Log.w(TAG, "vad audioRecord.read ret code is 0");
                    callback.onVadFailed();
                    break;
                } else {
                    Log.e(TAG, "vad audioRecord.read ret error code is " + ret);
                    callback.onVadFailed();
                    break;
                }
            }
        }

        private void isSpeechDetected(short[] buffer) {
            vad.isContinuousSpeech(buffer, new VadListener() {
                @Override
                public void onSpeechDetected() {
                  if (mLastReportedVad != VAD_YES) {
                      mLastReportedVad = VAD_YES;
                      callback.onSpeechDetected();
                  }
                }

                @Override
                public void onNoiseDetected() {
                  if (mLastReportedVad != VAD_NO) {
                      mLastReportedVad = VAD_NO;
                      callback.onNoiseDetected();
                  }
                }
            });
        }
    }

    public interface Listener {
        void onSpeechDetected();

        void onNoiseDetected();

        void onVadFailed();
    }

}
