package ly.plugins.oneclick_auth;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.text.method.LinkMovementMethod;
import android.text.style.ClickableSpan;
import android.text.style.ForegroundColorSpan;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.NonNull;


import com.google.gson.Gson;
import com.mobile.auth.gatewayauth.ExceptionProcessor;
import com.mobile.auth.gatewayauth.activity.AuthWebVeiwActivity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class LicenseDialog extends Activity {

    private View view;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT != Build.VERSION_CODES.O) {
            setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        }
        setContentView(R.layout.dialog_license);

        String licenseJson = getIntent().getStringExtra("license_json");
        final int loginCode = getIntent().getIntExtra("login_code", 1000);
        final String loginMessage = getIntent().getStringExtra("login_message");
        setContent(licenseJson);

        TextView btnPositive = findViewById(R.id.btn_positive);
        btnPositive.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                LicenseCallbackManager.LicenseCallback callback = LicenseCallbackManager.getInstance().getLicenseCallback();
                if (callback != null) {
                    callback.agreeToLogin(loginCode, loginMessage);
                }
                LicenseCallbackManager.getInstance().reset();
            }
        });

        view = findViewById(R.id.main_view);
    }

    public void setContent(String json) {
        if (json == null || json.isEmpty()) {
            return;
        }
        List<Map<String, String>> contents = new ArrayList<>();
        Gson gson = new Gson();
        contents = gson.fromJson(json, contents.getClass());
        if (contents == null || contents.isEmpty()) {
            return;
        }
        SpannableStringBuilder ssb = new SpannableStringBuilder();
        ssb.append(getString(R.string.privacy_before));
        for (int i = 0; i < contents.size(); i++) {
            Map<String, String> item = contents.get(i);
            SpannableString spannableString = buildSpanItem(item.get("protocolName"), item.get("protocolUrl"));
            ssb.append(spannableString);
            if (i == contents.size() - 2) {
                ssb.append("和");
            } else if (i != contents.size() - 1) {
                ssb.append("，");
            }
        }
        TextView tvContent = findViewById(R.id.tv_content);
        if (tvContent != null) {
            tvContent.setHighlightColor(Color.TRANSPARENT);
            tvContent.setMovementMethod(LinkMovementMethod.getInstance());
            tvContent.setText(ssb);
        }
    }

    private SpannableString buildSpanItem(final String text, final String url) {
        SpannableString spannableString = new SpannableString("《" + text + "》");
        ClickableSpan clickableSpan = new ClickableSpan() {
            @Override
            public void onClick(@NonNull View view) {
                if (view instanceof TextView) {
                    ((TextView) view).setHighlightColor(Color.TRANSPARENT);
                }
                Intent intent = new Intent(LicenseDialog.this, AuthWebVeiwActivity.class);
                intent.putExtra("url", url);
                intent.putExtra("name", text);
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                LicenseDialog.this.startActivity(intent);
            }

            @Override
            public void updateDrawState(@NonNull TextPaint ds) {
                ds.setColor(ds.linkColor);
                ds.setUnderlineText(false);
            }
        };
        spannableString.setSpan(clickableSpan, 0, text.length() + 2, Spannable.SPAN_INCLUSIVE_EXCLUSIVE);
        ForegroundColorSpan colorSpan = new ForegroundColorSpan(getResources().getColor(R.color.color_purple));
        spannableString.setSpan(colorSpan, 0, text.length() + 2, Spannable.SPAN_INCLUSIVE_EXCLUSIVE);
        return spannableString;
    }

    @Override
    public void finish() {
        super.finish();
        overridePendingTransition(0, 0);
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent ev) {
        try {
            int var2 = (int) ev.getRawX();
            int var3 = (int) ev.getRawY();
            if (ev.getAction() == 1 && !this.isTouchPointInView(this.view, var2, var3)) {
                this.finish();
            }

            return super.dispatchTouchEvent(ev);
        } catch (Throwable var4) {
            ExceptionProcessor.processException(var4);
            return false;
        }
    }

    private boolean isTouchPointInView(View var1, int var2, int var3) {
        boolean var10000;
        try {
            if (var1 == null) {
                return false;
            }

            int[] var4 = new int[2];
            var1.getLocationOnScreen(var4);
            int var5 = var4[0];
            int var6 = var4[1];
            int var7 = var5 + var1.getMeasuredWidth();
            int var8 = var6 + var1.getMeasuredHeight();
            if (var3 >= var6 && var3 <= var8 && var2 >= var5 && var2 <= var7) {
                return true;
            }

            var10000 = false;
        } catch (Throwable var9) {
            ExceptionProcessor.processException(var9);
            return false;
        }

        return var10000;
    }
}
