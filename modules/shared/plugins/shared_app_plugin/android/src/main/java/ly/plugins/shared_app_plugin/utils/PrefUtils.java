package ly.plugins.shared_app_plugin.utils;

import android.content.Context;
import android.content.SharedPreferences;

public final class PrefUtils {
    private static final String PREF_NAME = "ee";

    private static SharedPreferences getSharedPreferences(final Context context) {
        return context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
    }

    public static void putString(final Context context, final String key, final String value) {
        final SharedPreferences.Editor editor = getSharedPreferences(context).edit();
        editor.putString(key, value);
        editor.commit();
    }

    public static String getString(final Context context, final String key, final String defaultValue) {
        return getSharedPreferences(context).getString(key, defaultValue);
    }
}
