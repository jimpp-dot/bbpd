package ly.plugins.pulse_log;

import android.content.Context;

import androidx.annotation.NonNull;

// 异常捕获
public class BaseCrashLogger implements Thread.UncaughtExceptionHandler{

    Thread.UncaughtExceptionHandler mPreHandler;
    static BaseCrashLogger logger;

    protected BaseCrashLogger(Context context){
        mPreHandler = Thread.getDefaultUncaughtExceptionHandler();
    }

    public static BaseCrashLogger init(Context context){
        if(logger == null){
            logger = new BaseCrashLogger(context);
        }
        return logger;
    }

    @Override
    public void uncaughtException(@NonNull Thread thread, @NonNull Throwable throwable) {
        LiveDataBus.getInstance("log.crash").postValue(throwable);
        if(mPreHandler != null){
            mPreHandler.uncaughtException(thread,throwable);
        }
    }
}
