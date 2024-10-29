# login

登录模块.

## Getting Started

```dart
/// 自定义ui
EasyLogin.custom();

/// 打开登录面板
EasyLogin.show(context: context);
  or
LoginManager.show(context);

/// 跳转到手机验证码登录界面
LoginManager.openPhoneLogin(context);

/// 跳转到完善注册资料页面
LoginManager.openLoginProfile(context);

/// 微信登录
LoginManager.loginByWechat(context);

/// QQ登录
LoginManager.loginByQQ(context);
```