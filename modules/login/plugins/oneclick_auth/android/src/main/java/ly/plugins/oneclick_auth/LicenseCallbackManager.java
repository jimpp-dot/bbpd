package ly.plugins.oneclick_auth;

public class LicenseCallbackManager {
    private static LicenseCallbackManager instance;

    private LicenseCallbackManager() {
    }

    public static LicenseCallbackManager getInstance() {
        if (instance == null) {
            instance = new LicenseCallbackManager();
        }
        return instance;
    }

    private LicenseCallback callback;

    public void setLicenseCallback(LicenseCallback callback) {
        this.callback = callback;
    }

    public LicenseCallback getLicenseCallback() {
        return callback;
    }

    public void reset() {
        callback = null;
    }

    interface LicenseCallback {
        void agreeToLogin(int code, String message);
    }
}
