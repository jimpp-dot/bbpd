package ly.plugins.pulse_im;

import android.os.Handler;
import android.os.Looper;

import androidx.annotation.Nullable;

import io.flutter.plugin.common.MethodChannel;

public class ResultWrapper implements MethodChannel.Result {

    private final MethodChannel.Result impl;

    private boolean isCalled = false;

    public ResultWrapper(MethodChannel.Result impl) {
        this.impl = impl;
    }


    @Override
    public void success(@Nullable Object result) {
        if (isCalled) return;
        isCalled = true;
        impl.success(result);
    }

    @Override
    public void error(String errorCode, @Nullable String errorMessage, @Nullable Object errorDetails) {
        if (isCalled) return;
        isCalled = true;
        impl.error(errorCode, errorMessage, errorDetails);
    }

    @Override
    public void notImplemented() {
        if (isCalled) return;
        isCalled = true;
        impl.notImplemented();
    }

    private static Handler mHandler;

    private static void ensureHandler() {
        if (mHandler == null) {
            synchronized (ResultWrapper.class) {
                if (mHandler == null) {
                    mHandler = new Handler(Looper.getMainLooper());
                }
            }
        }
    }

    public static void success(final MethodChannel.Result result, final Object var1) {
        if (result == null) return;
        ensureHandler();
        mHandler.post(new Runnable() {
            @Override
            public void run() {
                result.success(var1);
            }
        });
    }

    public static void error(final MethodChannel.Result result, final String var1, final String var2, final Object var3) {
        if (result == null) return;
        ensureHandler();
        mHandler.post(new Runnable() {
            @Override
            public void run() {
                result.error(var1, var2, var3);
            }
        });
    }

}
