# fmodifier

思想来自于 SwiftUI,使用体验类似如下：
```
Center(
   child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Icon(
         Icons.home,
         size: 50,
      ),
      Text(
         'Hello World',
         style: Theme.of(context).textTheme.headline6,
      )
            .paddingExt(EdgeInsets.all(10))
            .backgroundColorExt(Colors.green)
            .paddingExt(EdgeInsets.all(25))
            .backgroundColorExt(Colors.red)
            .overlayExt(Icon(Icons.handyman), alignment: Alignment.bottomRight),
      ],
   ),
);
```
![BLu3XvGUzpt6EAr](https://i.loli.net/2021/05/26/BLu3XvGUzpt6EAr.png)

使用此扩展有几个好处：

1. 突出了内容主体，对主体的布局设置或修饰等，都以 `.`语法的形式进行修改。
2. 便于书写，链式语法对主体进行修饰；

按使用场景，Modifier 分为一下几类：
- Layout：布局相关，如边距、宽高、前后背景等等；
- Render：渲染相关：如边框、前后背景色、圆角等等；
- Gesture： 简单手势相关，支持：单击、双击、长按；
- 常用Widget
    - Button
    - Image
    - Text
