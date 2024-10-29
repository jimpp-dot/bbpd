package ly.plugins.flt_push.oppo;

import android.content.Context;

import com.heytap.msp.push.mode.DataMessage;
import com.heytap.msp.push.service.CompatibleDataMessageCallbackService;

/**
 * <p>Title:${Title} </p>
 * <p>Description: PushMessageService</p>
 * <p>Copyright (c) 2016 www.oppo.com Inc. All rights reserved.</p>
 * <p>Company: OPPO</p>
 *
 * @author QuWanxin
 * @version 1.0
 * @date 2017/7/28
 */

/**
 *  接收应用注册信息
 * */
public class PushMessageService extends CompatibleDataMessageCallbackService {
    /**
     * 如果业务仅仅是获取Opush RegisterID则不需要添加逻辑，直接按照
     * super.processMessage(context.getApplicationContext(), message)
     * 即可
     */
    @Override
    public void processMessage(Context context, DataMessage message) {
        super.processMessage(context.getApplicationContext(), message);
    }
}
