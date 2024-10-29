package ly.plugins.flt_push.oppo;

import android.content.Context;

import com.heytap.msp.push.mode.DataMessage;
import com.heytap.msp.push.service.DataMessageCallbackService;

/**
 *  接收应用注册信息
 * */
public class AppPushMessageService extends DataMessageCallbackService {

    /**
     *  如果业务仅仅是获取Opush RegisterID则不需要添加逻辑，直接按照
     *  super.processMessage(context.getApplicationContext(), message)
     *  即可
     */
    @Override
    public void processMessage(Context context, DataMessage message) {
        super.processMessage(context, message);
    }

}
