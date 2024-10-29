package ly.plugins.shared_app_plugin.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public final class TimeUtils {

    public static String getTimeString(String format, long timestamp) {
        final Date date = new Date(timestamp < 0 ? System.currentTimeMillis() : timestamp);
        format = format == null ? "yyyyMMdd_HHmmss" : format;
        return new SimpleDateFormat(format).format(date);
    }

    public static String getCurrentTimeString(String format) {
        return getTimeString(format, -1);
    }

    public static String getCurrentTimeString() {
        return getCurrentTimeString(null);
    }

    private TimeUtils() {
    }
}
