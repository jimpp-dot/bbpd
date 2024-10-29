package com.dooboolab.fluttersound;

import android.content.Context;
import android.media.MediaPlayer;
import android.media.MediaRecorder;
import android.os.Environment;

import java.io.File;

public class AudioModel {
  public int subsDurationMillis = 10;

  private MediaRecorder mediaRecorder;
  private Runnable recorderTicker;
  private long recordTime = 0;

  private MediaPlayer mediaPlayer;
  private long playTime = 0;

  public static String getDefaultFileLocation(Context context) {
    String fileName = System.currentTimeMillis() + "_default.m4a";
    File audioDir = context.getExternalFilesDir("audio");
    if (audioDir == null) {
      audioDir = new File(context.getFilesDir(), "audio");
    }
    audioDir.mkdirs();
    return new File(audioDir, fileName).getAbsolutePath();
  }

  public MediaRecorder getMediaRecorder() {
    return mediaRecorder;
  }

  public void setMediaRecorder(MediaRecorder mediaRecorder) {
    this.mediaRecorder = mediaRecorder;
  }

  public Runnable getRecorderTicker() {
    return recorderTicker;
  }

  public void setRecorderTicker(Runnable recorderTicker) {
    this.recorderTicker = recorderTicker;
  }

  public long getRecordTime() {
    return recordTime;
  }

  public void setRecordTime(long recordTime) {
    this.recordTime = recordTime;
  }

  public MediaPlayer getMediaPlayer() {
    return mediaPlayer;
  }

  public void setMediaPlayer(MediaPlayer mediaPlayer) {
    this.mediaPlayer = mediaPlayer;
  }

  public long getPlayTime() {
    return playTime;
  }

  public void setPlayTime(long playTime) {
    this.playTime = playTime;
  }
}