package ly.plugins.shared_app_plugin.utils;

import android.content.Context;

import com.bun.miitmdid.core.ErrorCode;
import com.bun.miitmdid.core.MdidSdkHelper;
import com.bun.miitmdid.interfaces.IIdentifierListener;
import com.bun.miitmdid.interfaces.IdSupplier;

/**
 * 在Application中初始化，详见官方文档
 */
public class MiitHelper implements IIdentifierListener {
    private static final String TAG = "MiitHelper";

    private static boolean supported = false;
    private static String oaid;
    private static String vaid;
    private static String aaid;

    public MiitHelper() {
    }

    public static boolean isSupported() {
        return supported;
    }

    public static String getOaid() {
        return oaid;
    }

    public static String getVaid() {
        return vaid;
    }

    public static String getAaid() {
        return aaid;
    }

    /**
     * 初始化
     */
    public void getDeviceIds(Context cxt) {
//        long timeb = System.currentTimeMillis();
        int nres = CallFromReflect(cxt);
//        int nres=DirectCall(cxt);
//        long timee = System.currentTimeMillis();
//        long offset = timee - timeb;
        if (nres == ErrorCode.INIT_ERROR_DEVICE_NOSUPPORT) {//不支持的设备
            supported = false;
        } else if (nres == ErrorCode.INIT_ERROR_LOAD_CONFIGFILE) {//加载配置文件出错
            supported = false;
        } else if (nres == ErrorCode.INIT_ERROR_MANUFACTURER_NOSUPPORT) {//不支持的设备厂商
            supported = false;
        } else if (nres == ErrorCode.INIT_ERROR_RESULT_DELAY) {//获取接口是异步的，结果会在回调中返回，回调执行的回调可能在工作线程
            supported = false;
        } else if (nres == ErrorCode.INIT_HELPER_CALL_ERROR) {//反射调用出错
            supported = false;
        }
//        Log.i(TAG, "return value: " + nres);
    }


    /**
     * 通过反射调用，解决android 9以后的类加载升级，导至找不到so中的方法
     */
    private int CallFromReflect(Context cxt) {
        int res = ErrorCode.INIT_ERROR_RESULT_DELAY;
        try {
            res = MdidSdkHelper.InitSdk(cxt, true, this);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public void OnSupport(boolean isSupport, IdSupplier _supplier) {
        if (_supplier == null) {
            return;
        }
        supported = isSupport;
        try {
            oaid = _supplier.getOAID();
            vaid = _supplier.getVAID();
            aaid = _supplier.getAAID();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
//        Log.i(TAG, "oaid: " + oaid);
//        Log.i(TAG, "vaid: " + vaid);
//        Log.i(TAG, "aaid: " + aaid);
    }
}
