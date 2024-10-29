package ly.plugins.shared_app_plugin.utils;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;

public class ImageUtils {
  public static Bitmap createCircleBitmap(Bitmap bitmap)
  {
    //获取图片的宽度
    int width = bitmap.getWidth();
    Paint paint = new Paint();
    //设置抗锯齿
    paint.setAntiAlias(true);

    //创建一个与原bitmap一样宽度的正方形bitmap
    Bitmap circleBitmap = Bitmap.createBitmap(width, width, Bitmap.Config.ARGB_8888);
    //以该bitmap为低创建一块画布
    Canvas canvas = new Canvas(circleBitmap);
    //以（width/2, width/2）为圆心，width/2为半径画一个圆
    canvas.drawCircle(width/2, width/2, width/2, paint);

    //设置画笔为取交集模式
    paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
    //裁剪图片
    canvas.drawBitmap(bitmap, 0, 0, paint);

    return circleBitmap;
  }

  public static Bitmap loadBitmapFromFile(String filePath) {
    Bitmap bitmap = BitmapFactory.decodeFile(filePath);
    return bitmap;
  }
}
