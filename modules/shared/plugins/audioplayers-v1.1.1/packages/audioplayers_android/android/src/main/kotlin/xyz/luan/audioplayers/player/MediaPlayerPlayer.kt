package xyz.luan.audioplayers.player

import android.media.MediaPlayer
import android.os.Build
import android.os.PowerManager
import xyz.luan.audioplayers.AudioContextAndroid
import xyz.luan.audioplayers.source.Source

class MediaPlayerPlayer(
    private val wrappedPlayer: WrappedPlayer,
) : Player {
    private val mediaPlayer = createMediaPlayer(wrappedPlayer)

    private fun createMediaPlayer(wrappedPlayer: WrappedPlayer): MediaPlayer {
        return MediaPlayer().apply {
            setOnPreparedListener { wrappedPlayer.onPrepared() }
            setOnCompletionListener { wrappedPlayer.onCompletion() }
            setOnSeekCompleteListener { wrappedPlayer.onSeekComplete() }
            setOnErrorListener { _, what, extra -> wrappedPlayer.onError(what, extra) }
            setOnBufferingUpdateListener { _, percent -> wrappedPlayer.onBuffering(percent) }
        }
    }

    override fun getDuration(): Int? {
        // media player returns -1 if the duration is unknown
        return mediaPlayer.duration.takeUnless { it == -1 }
    }

    override fun getCurrentPosition(): Int {
        return mediaPlayer.currentPosition
    }

    override fun isActuallyPlaying(): Boolean {
        try {
            return mediaPlayer.isPlaying
        } catch (e: Exception) {
        }
        return false
    }

    override fun setVolume(volume: Float) {
        mediaPlayer.setVolume(volume, volume)
    }

    override fun setRate(rate: Float) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            mediaPlayer.playbackParams = mediaPlayer.playbackParams.setSpeed(rate)
        } else {
            error("Changing the playback rate is only available for Android M/23+ or using LOW_LATENCY mode.")
        }
    }

    override fun setSource(source: Source) {
        reset()
        source.setForMediaPlayer(mediaPlayer)
    }

    override fun setLooping(looping: Boolean) {
        mediaPlayer.isLooping = looping
    }

    override fun start() {
        try {
            mediaPlayer.start()
        } catch (e: Exception) {
        }

    }

    override fun pause() {
        try {
            mediaPlayer.pause()
        } catch (e: Exception) {
        }
    }

    override fun stop() {
        try {
            mediaPlayer.stop()
        } catch (e: Exception) {
        }
    }

    override fun release() {
        try {
            mediaPlayer.reset()
            mediaPlayer.release()
        } catch (e: Exception) {
        }

    }

    override fun seekTo(position: Int) {
        try {
            mediaPlayer.seekTo(position)
        } catch (e: Exception) {
        }

    }

    override fun updateContext(context: AudioContextAndroid) {
        // TODO(luan) is this global?
        wrappedPlayer.audioManager.isSpeakerphoneOn = context.isSpeakerphoneOn
        context.setAttributesOnPlayer(mediaPlayer)
        if (context.stayAwake) {
            mediaPlayer.setWakeMode(wrappedPlayer.applicationContext, PowerManager.PARTIAL_WAKE_LOCK)
        }
    }

    override fun prepare() {
        try {
            mediaPlayer.prepare()
        } catch (e: Exception) {
        }
    }

    override fun reset() {
        try {
            mediaPlayer.reset()
        } catch (e: Exception) {
        }
    }

    override fun isLiveStream(): Boolean {
        val duration = getDuration()
        return duration == null || duration == 0
    }
}
