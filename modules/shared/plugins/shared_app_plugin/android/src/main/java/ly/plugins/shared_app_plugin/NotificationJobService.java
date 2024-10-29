package ly.plugins.shared_app_plugin;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.util.Log;
import android.widget.RemoteViews;

import androidx.annotation.Nullable;
import androidx.core.app.NotificationCompat;

import ly.plugins.shared_app_plugin.utils.ImageUtils;


public class NotificationJobService extends Service {
  public static final String TAG = NotificationJobService.class.getSimpleName();
  public static final  String CHANNEL_ID          = "channel_room_local_notification";
  private static String CHANNEL_NAME;
  private static String CHANNEL_DESCRIPTION;
  public static final String ICON_CACHE_FILE_PATH = "iconCacheFilePath";
  public static final String JPUSH_SHEME = "jpush_scheme";
  public static final String OWNER_NAME = "ownerName";

  @Override
  public void onTaskRemoved(Intent rootIntent) {
    super.onTaskRemoved(rootIntent);
    stopForeground(true);
    stopSelf();
    android.os.Process.killProcess(android.os.Process.myPid());
  }

  private void keepAlive(String iconCacheFilePath, String ownerName, String jPushScheme) {
    Log.d(TAG, "keepAlive = " + iconCacheFilePath + ", name = " + ownerName + "jpush: " + jPushScheme);
    Notification notification;
    if (jPushScheme != null && !jPushScheme.isEmpty()) {
      // 极光拉活push点击
      notification = buildJPushNotification(ownerName, jPushScheme);
    } else {
      // 房间保活
      notification = buildNotification(iconCacheFilePath, ownerName);
    }

    if (notification == null) {
      Log.d(TAG, "keepAlive = notification is null");
      return;
    }

    startForeground(101, notification);
  }

  private Notification buildJPushNotification(String ownerName, String jPushScheme) {

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      CHANNEL_NAME = getResources().getString(R.string.notification_channel_name_room_control);
      CHANNEL_DESCRIPTION = getResources().getString(R.string.notification_channel_description_room_control);
      NotificationChannel channel = new NotificationChannel(CHANNEL_ID, CHANNEL_NAME, NotificationManager.IMPORTANCE_HIGH);
      NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
      if (manager == null) {
        return null;
      }
      channel.setSound(null, null); //关闭通知提示音
      manager.createNotificationChannel(channel);
    }

    Intent intent = new Intent(Intent.ACTION_VIEW);
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    intent.setData(Uri.parse(jPushScheme));
    
    PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, intent, 0);

    RemoteViews contentView = buildJPushContentView(ownerName);
    RemoteViews simpleContentView = buildJPushSimpleContentView(ownerName);

    NotificationCompat.Builder builder = null;
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      builder = new NotificationCompat.Builder(this, CHANNEL_ID);
    } else {
      builder = new NotificationCompat.Builder(this);
      builder.setPriority(NotificationCompat.PRIORITY_DEFAULT);
    }

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      return builder
              .setAutoCancel(true)
              .setCategory(Notification.CATEGORY_SERVICE)
              .setOngoing(true)
              .setPriority(NotificationManager.IMPORTANCE_LOW)
              .setSmallIcon(R.mipmap.ic_launcher)
              .setCustomContentView(simpleContentView)
              .setCustomBigContentView(contentView)
              .setContentIntent(pendingIntent)
              .build();
    } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
      return builder
              .setAutoCancel(true)
              .setCategory(Notification.CATEGORY_SERVICE)
              .setOngoing(true)
              .setPriority(NotificationManager.IMPORTANCE_LOW)
              .setSmallIcon(R.mipmap.ic_launcher)
              .setContent(contentView)
              .setCustomBigContentView(contentView)
              .setContentIntent(pendingIntent)
              .build();
    } else {
      return builder
              .setAutoCancel(true)
              .setCategory(Notification.CATEGORY_SERVICE)
              .setOngoing(true)
              .setPriority(NotificationManager.IMPORTANCE_LOW)
              .setSmallIcon(R.mipmap.ic_launcher)
              .setContentTitle(ownerName)
              .setContentText("")
              .setContentIntent(pendingIntent)
              .build();
    }
  }

  private Notification buildNotification(String iconCacheFilePath, String ownerName) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      CHANNEL_NAME = getResources().getString(R.string.notification_channel_name_room_control);
      CHANNEL_DESCRIPTION = getResources().getString(R.string.notification_channel_description_room_control);
      NotificationChannel channel = new NotificationChannel(CHANNEL_ID, CHANNEL_NAME, NotificationManager.IMPORTANCE_HIGH);
      NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
      if (manager == null) {
        Log.e(TAG, "buildNotification NotificationManager is null");
        return null;
      }
      channel.setSound(null, null); //关闭通知提示音
      manager.createNotificationChannel(channel);
    }

    String packageName = getPackageName();
    PackageManager packageManager = getPackageManager();
    Intent intent =  packageManager.getLaunchIntentForPackage(packageName);
    intent.setPackage(null);

    int flags = PendingIntent.FLAG_UPDATE_CURRENT;
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
      flags |= PendingIntent.FLAG_IMMUTABLE;
    }

    PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, intent, flags);

    RemoteViews contentView = buildContentView(iconCacheFilePath, ownerName);
    RemoteViews simpleContentView = buildSimpleContentView(iconCacheFilePath, ownerName);

    NotificationCompat.Builder builder = new NotificationCompat.Builder(this, CHANNEL_ID);
    String owner_desc = getResources().getString(R.string.room_owner_desc, ownerName);
    return builder
            .setAutoCancel(true)
            .setCategory(Notification.CATEGORY_SERVICE)
            .setOngoing(true)
            .setPriority(NotificationManager.IMPORTANCE_LOW)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setCustomContentView(simpleContentView)
            .setCustomBigContentView(contentView)
            .setContentIntent(pendingIntent)
            .setContentTitle(owner_desc)
            .setContentText("点击返回互动派对")
            .build();
  }

  @Nullable
  @Override
  public IBinder onBind(Intent intent) {
    return null;
  }

  @Override
  public int onStartCommand(Intent intent, int flags, int startId) {
    if (intent == null) {
      Log.e(TAG, "onStartCommand intent == null!!!");
      return Service.START_NOT_STICKY;
    }

    final String iconCacheFilePath = intent.getStringExtra(ICON_CACHE_FILE_PATH);
    final String ownerName = intent.getStringExtra(OWNER_NAME);
    final String jPushScheme = intent.getStringExtra(JPUSH_SHEME);
    Log.d(TAG, "onStartCommand path = " + iconCacheFilePath + ", name = " + ownerName + "jpush: " + jPushScheme);

    keepAlive(iconCacheFilePath, ownerName, jPushScheme);
    return Service.START_NOT_STICKY;
  }

  private RemoteViews buildContentView(String iconCacheFilePath, String ownerName) {
    RemoteViews remoteViews = new RemoteViews(getPackageName(), R.layout.default_ongoing_notification);

    //方法1：通过图片文件的URI对系统通知栏共享
//    File iconFile = new File(iconCacheFilePath);
//    Uri iconUri = FileUtils.getIconCacheUri(this, iconFile);
//    remoteViews.setImageViewUri(R.id.icon, iconUri);

    //方法2：直接传递bitmap对象给系统通知栏
    try {
      if (iconCacheFilePath != null && !iconCacheFilePath.isEmpty()) {
        Bitmap bitmap = ImageUtils.loadBitmapFromFile(iconCacheFilePath);
        Bitmap circleBitmap = ImageUtils.createCircleBitmap(bitmap);
        remoteViews.setImageViewBitmap(R.id.icon, circleBitmap);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    //显示房间的房主名称
    String owner_desc = getResources().getString(R.string.room_owner_desc, ownerName);
    remoteViews.setTextViewText(R.id.desc, owner_desc);
    return remoteViews;
  }

  private RemoteViews buildSimpleContentView(String iconCacheFilePath, String ownerName) {
    RemoteViews remoteViews = new RemoteViews(getPackageName(), R.layout.default_ongoing_notification_simple);

    try {
      if (iconCacheFilePath != null && !iconCacheFilePath.isEmpty()) {
        Bitmap bitmap = ImageUtils.loadBitmapFromFile(iconCacheFilePath);
        Bitmap circleBitmap = ImageUtils.createCircleBitmap(bitmap);
        remoteViews.setImageViewBitmap(R.id.icon, circleBitmap);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    //显示房间的房主名称
    String owner_desc = getResources().getString(R.string.room_owner_desc, ownerName);
    remoteViews.setTextViewText(R.id.desc, owner_desc);
    return remoteViews;
  }

  private RemoteViews buildJPushContentView(String ownerName) {
    RemoteViews remoteViews = new RemoteViews(getPackageName(), R.layout.default_jpush_notification);
    remoteViews.setTextViewText(R.id.desc, ownerName);
    return remoteViews;
  }

  private RemoteViews buildJPushSimpleContentView(String ownerName) {
    RemoteViews remoteViews = new RemoteViews(getPackageName(), R.layout.default_ongoing_notification_simple);
    remoteViews.setTextViewText(R.id.desc, ownerName);
    return remoteViews;
  }
}
