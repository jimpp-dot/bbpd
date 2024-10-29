package ly.plugins.shared_app_plugin.utils;

import java.util.Map;

/**
 * Project Name:EasyProtector
 * Package Name:com.lahm.library
 * Created by lahm on 2018/7/25 15:19 .
 */
public interface EmulatorCheckCallback {
    void findEmulator(String emulatorInfo);
    void findEmulator(String emulatorInfo, Map<String, Object> properties);
}
