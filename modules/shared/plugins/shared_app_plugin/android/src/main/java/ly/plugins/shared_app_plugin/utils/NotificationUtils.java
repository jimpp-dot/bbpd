package ly.plugins.shared_app_plugin.utils;

import android.annotation.TargetApi;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.res.Resources;
import android.os.Build;

import ly.plugins.shared_app_plugin.R;

import java.util.ArrayList;
import java.util.List;

class ChannelInfo {
  String id;
  String name;
  String desc;
  int importance;

  public ChannelInfo(String id, String name, String desc, int importance) {
    this.id = id;
    this.name = name;
    this.desc = desc;
    this.importance = importance;
  }
}

public class NotificationUtils {
  public static ArrayList<ChannelInfo> sNotificationChannels;

//  static {
//    sNotificationChannels = new ArrayList<>();
//    sNotificationChannels.add(new ChannelInfo("channel_chat_msg", "聊天通知", "新消息通知", NotificationManager.IMPORTANCE_DEFAULT));
//    sNotificationChannels.add(new ChannelInfo("channel_msg_notification", "消息通知", "访问主页、新订单、好友开播、动态更新等", NotificationManager.IMPORTANCE_DEFAULT));
//    sNotificationChannels.add(new ChannelInfo("channel_oper_notification", "运营通知", "礼包过期提醒", NotificationManager.IMPORTANCE_DEFAULT));
//    sNotificationChannels.add(new ChannelInfo("channel_hot_notification", "热门推送", "热门内容推送", NotificationManager.IMPORTANCE_DEFAULT));
//    sNotificationChannels.add(new ChannelInfo("channel_room_local_notification", "进厅通知", "在厅中的常驻通知", NotificationManager.IMPORTANCE_HIGH));
//  }

  static void initChannels(final Context context) {
    if (sNotificationChannels != null) return;

    sNotificationChannels = new ArrayList<>();
    sNotificationChannels.add(new ChannelInfo("channel_msg_notification", "消息通知", "访问主页、新订单、好友开播、动态更新等", NotificationManager.IMPORTANCE_DEFAULT));
    sNotificationChannels.add(new ChannelInfo("channel_oper_notification", "运营通知", "礼包过期提醒", NotificationManager.IMPORTANCE_DEFAULT));
    sNotificationChannels.add(new ChannelInfo("channel_hot_notification", "热门推送", "热门内容推送", NotificationManager.IMPORTANCE_DEFAULT));

    Resources resources = context.getResources();
    String name, desc;

    name = resources.getString(R.string.notification_channel_name_room_control);
    desc = resources.getString(R.string.notification_channel_description_room_control);
    sNotificationChannels.add(new ChannelInfo("channel_room_local_notification", name, desc, NotificationManager.IMPORTANCE_HIGH));

    name = resources.getString(R.string.notification_channel_name_chat_msg);
    desc = resources.getString(R.string.notification_channel_description_chat_msg);
    sNotificationChannels.add(new ChannelInfo("channel_chat_msg", name, desc, NotificationManager.IMPORTANCE_DEFAULT));
  }

  @TargetApi(Build.VERSION_CODES.O)
  public static void createNotificationChannels(Context context) {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
      return;
    }
    
    NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
    if (manager == null) {
      return;
    }

//    List<NotificationChannel> notificationChannels = manager.getNotificationChannels();
//    for (NotificationChannel notificationChannel : notificationChannels) {
//      manager.deleteNotificationChannel(notificationChannel.getId());
//    }

    List<NotificationChannel> channels = buildChannels(context);
    manager.createNotificationChannels(channels);

    List<NotificationChannel> notificationChannels = manager.getNotificationChannels();
    if (notificationChannels == null || notificationChannels.isEmpty()) {
      return;
    }
    for (NotificationChannel channel : notificationChannels) {
      if (channel.getId() != null && channel.getId().equals("channel_room_control")) {
        // 删除channel_room_control，该通知默认打开了声音
        manager.deleteNotificationChannel(channel.getId());
      }
    }
  }

  static List<NotificationChannel> buildChannels(Context context) {
    initChannels(context);

    List<NotificationChannel> channels = new ArrayList<>();
    for (ChannelInfo channelInfo : sNotificationChannels) {
      String owner_desc = context.getResources().getString(R.string.notification_channel_name_room_control);
      NotificationChannel channel = new NotificationChannel(channelInfo.id, channelInfo.name, channelInfo.importance);
      channel.setDescription(channelInfo.desc);
      if (channelInfo.id == "channel_room_local_notification") {
        channel.setSound(null, null);
      }
      // 开启指示灯，如果设备有的话。
//    mChannel.enableLights(true);
      // 开启震动
//      channel.enableVibration(true);
      //  设置指示灯颜色
//    mChannel.setLightColor(Color.RED);
      // 设置是否应在锁定屏幕上显示此频道的通知
//    mChannel.setLockscreenVisibility(Notification.VISIBILITY_PRIVATE);
      // 设置是否显示角标
//    mChannel.setShowBadge(true);
      //  设置绕过免打扰模式
//    mChannel.setBypassDnd(true);
      // 设置震动频率
//      channel.setVibrationPattern(new long[]{100, 200, 300, 400});

      channels.add(channel);
    }
    return channels;
  }
}
