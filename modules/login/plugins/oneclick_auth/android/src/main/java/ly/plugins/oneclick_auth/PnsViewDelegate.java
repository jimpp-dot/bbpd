package ly.plugins.oneclick_auth;

import android.view.View;

import com.mobile.auth.gatewayauth.ui.AbstractPnsViewDelegate;

public class PnsViewDelegate extends AbstractPnsViewDelegate implements View.OnClickListener {

    private final int showFlag;
    private final Callback callback;

    public PnsViewDelegate(int showFlag, Callback callback) {
        this.showFlag = showFlag;
        this.callback = callback;
    }

    @Override
    public void onClick(View view) {
        int id = view.getId();
        int loginCode = 0;
        String loginMessage = null;
        if (id == R.id.wechat_login_btn) {
            loginCode = 111;
            loginMessage = "do_wechat_login";
        } else if (id == R.id.qq_login_btn) {
            loginCode = 222;
            loginMessage = "do_qq_login";
        } else if (id == R.id.apple_login_btn) {
            loginCode = 333;
            loginMessage = "do_apple_login";
        } else if (id == R.id.dy_login_btn) {
            loginCode = 555;
            loginMessage = "do_douyin_login";
        }

        if (loginCode > 0) {
            callback.callback(loginCode, loginMessage);
        }
    }

    @Override
    public void onViewCreated(View view) {
        if (showFlag == 0) {
            view.setVisibility(View.GONE);
            return;
        }
        initView(view, R.id.wechat_login_btn, 0);
        initView(view, R.id.qq_login_btn, 1);
        initView(view, R.id.apple_login_btn, 2);
        initView(view, R.id.dy_login_btn, 3);
    }

    public void initView(View view, int resId, int offset) {
        View child = view.findViewById(resId);
        if (child != null) {
            boolean isShow = (1 << offset & showFlag) != 0;
            child.setVisibility(isShow ? View.VISIBLE : View.GONE);
            child.setOnClickListener(this);
        }
    }

    public interface Callback {
        void callback(int loginCode, String loginMessage);
    }

}
