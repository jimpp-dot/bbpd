#import <ATAuthSDK/ATAuthSDK.h>
#import <objc/runtime.h>
#import "OneClickAuthPlugin.h"
#import "OneClickAuthShortcutAlert.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];

@interface OneClickAuthPlugin ()
//反射获取第三方的关键控件
@property (nonatomic, weak) UIView *loginView;
@property (nonatomic, weak) UIButton *loginBtn;
@property (nonatomic, weak) UIButton *agreeBtn;
@property (nonatomic, weak) UITextView *textView;

@property (nonatomic, strong) NSMutableDictionary *treatyDic;
@end

@implementation OneClickAuthPlugin

+ (void)load
{
    //交换PNSLoginView的hitTest方法
    Class target = NSClassFromString(@"PNSLoginView");
    if (target) {
        swizzleInstanceMethodToSelf(target, @selector(hitTest:withEvent:), @selector(swizzle_hitTest:withEvent:));
    }
}

- (UIView *)swizzle_hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [self swizzle_hitTest:point withEvent:event];
    
    @try {
        UIView *loginView = (id)self;
        __block UIButton *agreeBtn = nil;
        [loginView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.bounds.size.width == obj.bounds.size.height && obj.bounds.size.width == 15) {
                agreeBtn = obj;
                *stop = YES;
            }
        }];
        if (!agreeBtn) {
            return hitView;
        }
        
        CGRect agreeBtnFrame = [loginView convertRect:agreeBtn.frame toView:loginView];
        CGPoint agreeBtnCenter = CGPointMake(agreeBtnFrame.origin.x + agreeBtnFrame.size.width / 2.0, agreeBtnFrame.origin.y + agreeBtnFrame.size.height / 2.0);
        if (pow(point.x - agreeBtnCenter.x, 2) <= 900 && pow(point.y - agreeBtnCenter.y, 2) <= 900) {
            //触碰点距离同意按钮中心距离小于30
            return agreeBtn;
        }
        
        return hitView;
    } @catch (NSException *exception) {
        return hitView;
    }
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"ly.plugins.oneclick_auth"
            binaryMessenger:[registrar messenger]];
    OneClickAuthPlugin* instance = [[OneClickAuthPlugin alloc] init];
  instance.channel = channel;
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"init" isEqualToString:call.method]) {
        NSString *key = call.arguments;
        [[TXCommonHandler sharedInstance] setAuthSDKInfo:key complete:^(NSDictionary * _Nonnull resultDic) {
            result(resultDic);
        }];
    } else if ([@"checkEnvAvailable" isEqualToString:call.method]) {
        [[TXCommonHandler sharedInstance] checkEnvAvailableWithAuthType:PNSAuthTypeLoginToken complete:^(NSDictionary * _Nullable resultDic) {
            BOOL enabled = [PNSCodeSuccess isEqualToString:[resultDic objectForKey:
                                                            @"resultCode"]];
            result(@(enabled));
        }];
    } else if ([@"setDebugMode" isEqualToString:call.method]) {
        result(nil);
    } else if ([@"preLogin" isEqualToString:call.method]) {
        [TXCommonHandler.sharedInstance accelerateLoginPageWithTimeout:2.0 complete:^(NSDictionary * _Nonnull resultDic) {
            NSString *code = [resultDic valueForKey:@"resultCode"];
            NSString *msg = [resultDic valueForKey:@"msg"];

            if ([code isEqualToString: PNSCodeSuccess]) {
                result(nil);
            } else {
                result([NSString stringWithFormat:@"预取号失败，code:%@  %@",code, msg]);
            }
        }];
    } else if ([@"getLoginToken" isEqualToString:call.method]) {
        __weak typeof(self) weakSelf = self;
        [TXCommonHandler.sharedInstance getLoginTokenWithTimeout:3.0 controller:[UIApplication sharedApplication].keyWindow.rootViewController model:[self uiModel:call] complete:^(NSDictionary * _Nonnull resultDic) {
            NSString *code = [resultDic valueForKey:@"resultCode"];
            if ([PNSCodeLoginControllerPresentSuccess isEqualToString:code]) {
                // 调起授权页成功
                //获取关键控件
                [CATransaction setCompletionBlock:^{
                    [self getKeyControlsOnLoginPage];
                }];
                result(resultDic);
                [CATransaction commit];
            } else if ([PNSCodeLoginControllerPresentFailed isEqualToString:code]) {
                // 调起授权页失败
                result(resultDic);
            } else if ([PNSCodeLoginControllerClickLoginBtn isEqualToString:code]) {
                // 点击了登录按钮
                [self showShortcutAlertIfNeeded:nil];
            } else if ([PNSCodeLoginControllerClickCheckBoxBtn isEqualToString:code]) {
                // 点击了CheckBox
                weakSelf.isChecked = [resultDic[@"isChecked"] boolValue];
                [self.channel invokeMethod:@"onReceiveAuthPageEvent" arguments: resultDic];
            } else if ([PNSCodeLoginControllerClickProtocol isEqualToString:code]) {
                // 点击协议富文本文字
            } else {
                [[TXCommonHandler sharedInstance] cancelLoginVCAnimated:YES complete:nil];
                //一键登录回调
                [self.channel invokeMethod:@"onReceiveAuthPageEvent" arguments: resultDic];
            }
        }];

    } else if ([@"getAuthToken" isEqualToString:call.method]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[TXCommonHandler sharedInstance] getVerifyTokenWithTimeout:3.0 complete:^(NSDictionary * _Nonnull resultDic) {
                result(resultDic);
            }];
        });
    } else if ([@"quitAuthPage" isEqualToString:call.method]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[TXCommonHandler sharedInstance] cancelLoginVCAnimated:YES complete:^{
                result(nil);
            }];
        });
    } else {
        result(FlutterMethodNotImplemented);
    }
}

-(NSString *)jsonStrFromDic: (NSDictionary *)dic {
    if (dic == nil) {
        return nil;
    }
    NSError *parseError = nil;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    if(parseError) {
        NSString *errorString = [NSString stringWithFormat:@"字典转json失败____%@",parseError.description];
        NSLog(@"jsonStrFromDic error，errorString = %@",errorString);
        return nil;
    }
    NSString * str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return str;
}

- (void)showToast:(NSString *)text {
    double width = 150.0;
    double height = 40.0;
    UIWindow *superView = [UIApplication sharedApplication].keyWindow;

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake((superView.bounds.size.width - 150.0) / 2, superView.bounds.size.height - 100, width, height)];
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    view.layer.cornerRadius = 10;
    view.layer.masksToBounds = YES;

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14.0];
    [view addSubview:label];

    [superView addSubview:view];

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);

    dispatch_after(popTime, dispatch_get_main_queue(), ^() {
        [view removeFromSuperview];
    });
}

-(void)doWechatLogin:(UIButton *)btn{
    __weak typeof(self) weakSelf = self;
    [self showShortcutAlertIfNeeded:^{
        [TXCommonHandler.sharedInstance cancelLoginVCAnimated:NO complete:^(void) {
            NSDictionary *json = [NSDictionary dictionaryWithObjectsAndKeys:@111,@"resultCode",@"do_wechat_login",@"msg", nil];
            [weakSelf.channel invokeMethod:@"onReceiveAuthPageEvent" arguments: json];
        }];
    }];
}

-(void)doQQLogin:(UIButton *)btn{
    __weak typeof(self) weakSelf = self;
    [self showShortcutAlertIfNeeded:^{
        [TXCommonHandler.sharedInstance cancelLoginVCAnimated:NO complete:^(void) {
            NSDictionary *json = [NSDictionary dictionaryWithObjectsAndKeys:@222, @"resultCode",@"do_qq_login",@"msg", nil];
            [weakSelf.channel invokeMethod:@"onReceiveAuthPageEvent" arguments: json];
        }];
    }];
}

-(void)doAppleLogin:(UIButton *)btn{
    __weak typeof(self) weakSelf = self;
    [self showShortcutAlertIfNeeded:^{
        [TXCommonHandler.sharedInstance cancelLoginVCAnimated:NO complete:^(void) {
            NSDictionary *json = [NSDictionary dictionaryWithObjectsAndKeys:@333, @"resultCode",@"do_apple_login",@"msg", nil];
            [weakSelf.channel invokeMethod:@"onReceiveAuthPageEvent" arguments: json];
        }];
    }];
}

-(void)doDouyinLogin:(UIButton *)btn{
    __weak typeof(self) weakSelf = self;
    [self showShortcutAlertIfNeeded:^{
        [TXCommonHandler.sharedInstance cancelLoginVCAnimated:NO complete:^(void) {
            NSDictionary *json = [NSDictionary dictionaryWithObjectsAndKeys:@555, @"resultCode",@"do_douyin_login",@"msg", nil];
            [weakSelf.channel invokeMethod:@"onReceiveAuthPageEvent" arguments: json];
        }];
    }];
}

- (void)navMoreViewClick{
    [TXCommonHandler.sharedInstance cancelLoginVCAnimated:NO complete:^(void) {
        NSDictionary *json = [NSDictionary dictionaryWithObjectsAndKeys:@800000, @"resultCode",@"navMoreViewClick",@"msg", nil];
        [self.channel invokeMethod:@"onReceiveAuthPageEvent" arguments: json];
    }];
    
}

- (TXCustomModel *)uiModel: (FlutterMethodCall*)call {
    BOOL lightStatusBar = NO; // 状态栏文字是否为白色
    NSNumber* logoWidth = @160;
    NSNumber* logoHeight = @160;
    NSNumber* logoOffsetY = @120;
    NSString* loginBtnText = @"本机号码安全登录";
    NSNumber* loginBtnTextColor = nil;
    NSNumber* numberColor = nil; // 掩码颜色
    NSNumber* privacyColor = nil;//基础文字颜色
    NSNumber* privacyAgreeColor = nil;//协议颜色
    NSNumber* numberOffsetY = nil;
    NSString* changeBtnText = @"其他号码登录";
    NSNumber* changeBtnTextColor = nil;
    BOOL showChangeBtn = YES; // 切换号码是否隐藏
    BOOL showWXLogin = YES; // 显示微信登录
    BOOL showQQLogin = YES; // 显示QQ登录
    BOOL showAppleLogin = YES; // 显示Apple登录
    BOOL showDouyinLogin = YES; // 显示抖音登录
    BOOL isPhoneBind = NO; // 手机绑定
    NSString* sloganText = @"手机绑定";
    NSNumber *loginBtnWidth = nil;
    NSNumber *loginBtnHeight = nil;
    NSString *navMoreText = @"";
    BOOL hideBackBtn = NO; // 隐藏返回按钮
    BOOL hideBackBtnFromSmallAccount = YES; // 返回按钮 - 小号
    BOOL checkBoxIsChecked = FALSE;
    NSString* privacyOneName = nil;
    NSString* privacyOneUrl = nil;
    NSString* privacyTwoName = nil;
    NSString* privacyTwoUrl = nil;

    NSDictionary* arguments = [call arguments];
    if (arguments != nil) {
        if ([[arguments allKeys] containsObject:@"lightStatusBar"]) {
            lightStatusBar = [arguments[@"lightStatusBar"] boolValue];
        }
        if ([[arguments allKeys] containsObject:@"logoWidth"]) {
            logoWidth = arguments[@"logoWidth"];
        }
        if ([[arguments allKeys] containsObject:@"logoHeight"]) {
            logoHeight = arguments[@"logoHeight"];
        }
        if ([[arguments allKeys] containsObject:@"logoOffsetY"]) {
            logoOffsetY = arguments[@"logoOffsetY"];
        }
        if ([[arguments allKeys] containsObject:@"loginBtnText"]) {
            loginBtnText = arguments[@"loginBtnText"];
        }
        if ([[arguments allKeys] containsObject:@"loginBtnTextColor"]) {
            loginBtnTextColor = arguments[@"loginBtnTextColor"];
        }
        if ([[arguments allKeys] containsObject:@"numberColor"]) {
            numberColor = arguments[@"numberColor"];
        }
        if ([[arguments allKeys] containsObject:@"numberOffsetY"]) {
            numberOffsetY = arguments[@"numberOffsetY"];
        }
        if ([[arguments allKeys] containsObject:@"changeBtnText"]) {
            changeBtnText = arguments[@"changeBtnText"];
        }
        if ([[arguments allKeys] containsObject:@"changeBtnTextColor"]) {
            changeBtnTextColor = arguments[@"changeBtnTextColor"];
        }
        if ([[arguments allKeys] containsObject:@"showChangeBtn"]) {
            showChangeBtn = [arguments[@"showChangeBtn"] boolValue];
        }
        if ([[arguments allKeys] containsObject:@"showWXLogin"]) {
            showWXLogin = [arguments[@"showWXLogin"] boolValue];
        }
        if ([[arguments allKeys] containsObject:@"showQQLogin"]) {
            showQQLogin = [arguments[@"showQQLogin"] boolValue];
        }
        if ([[arguments allKeys] containsObject:@"showAppleLogin"]) {
            showAppleLogin = [arguments[@"showAppleLogin"] boolValue];
        }
        if ([[arguments allKeys] containsObject:@"showDouyinLogin"]) {
            showDouyinLogin = [arguments[@"showDouyinLogin"] boolValue];
        }
        if ([[arguments allKeys] containsObject:@"isPhoneBind"]) {
            isPhoneBind = [arguments[@"isPhoneBind"] boolValue];
        }
        if ([[arguments allKeys] containsObject:@"sloganText"]) {
            sloganText = arguments[@"sloganText"];
        }
        if ([[arguments allKeys] containsObject:@"privacyColor"]) {
            privacyColor = arguments[@"privacyColor"];
        }
        if ([[arguments allKeys] containsObject:@"privacyAgreeColor"]) {
            privacyAgreeColor = arguments[@"privacyAgreeColor"];
        }
        if ([[arguments allKeys] containsObject:@"loginBtnWidth"]) {
            loginBtnWidth = arguments[@"loginBtnWidth"];
        }
        if ([[arguments allKeys] containsObject:@"loginBtnHeight"]) {
            loginBtnHeight = arguments[@"loginBtnHeight"];
        }
        if ([[arguments allKeys] containsObject:@"navMoreText"]) {
            navMoreText = arguments[@"navMoreText"];
        }
        if ([[arguments allKeys] containsObject:@"hideBackBtn"]) {
            hideBackBtn = [arguments[@"hideBackBtn"] boolValue];
        }
        if ([[arguments allKeys] containsObject:@"hideBackBtnFromSmallAccount"]) {
            hideBackBtnFromSmallAccount = [arguments[@"hideBackBtnFromSmallAccount"] boolValue];
        }
        if ([[arguments allKeys] containsObject:@"checkBoxIsChecked"]) {
            checkBoxIsChecked = [arguments[@"checkBoxIsChecked"] boolValue];
        }
        if ([[arguments allKeys] containsObject:@"privacyOneName"]) {
            privacyOneName = arguments[@"privacyOneName"];
        }
        if ([[arguments allKeys] containsObject:@"privacyOneUrl"]) {
            privacyOneUrl = arguments[@"privacyOneUrl"];
        }
        if ([[arguments allKeys] containsObject:@"privacyTwoName"]) {
            privacyTwoName = arguments[@"privacyTwoName"];
        }
        if ([[arguments allKeys] containsObject:@"privacyTwoUrl"]) {
            privacyTwoUrl = arguments[@"privacyTwoUrl"];
        }
    }
    
    if (@available(iOS 13.0, *)) {
    } else {
        showAppleLogin = NO;
    }
    
    const CGFloat thirdBtnSize = 48;

    TXCustomModel *model = [[TXCustomModel alloc] init];
    
    NSBundle* bundle = [NSBundle bundleForClass:self.class];
    
    // 状态栏风格
    if (@available(iOS 13.0, *)) {
        model.preferredStatusBarStyle = lightStatusBar ? UIStatusBarStyleLightContent : UIStatusBarStyleDarkContent;
    } else {
        model.preferredStatusBarStyle = lightStatusBar ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
    }

    // 隐藏导航栏
    if(isPhoneBind){
        model.navIsHidden = NO;
        UIColor* textColor =  [UIColor colorWithRed:0.141176470588235 green:0.145098039215686 blue:0.163934426229508 alpha:1];
        model.navColor = UIColor.whiteColor;
        model.navTitle = [[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName : textColor,NSFontAttributeName : [UIFont systemFontOfSize:20.0]}];
        NSBundle* bundle = [NSBundle bundleForClass:self.class];
        model.navBackImage = [UIImage imageNamed:@"back_arrow.png" inBundle:bundle compatibleWithTraitCollection:nil];
        model.hideNavBackItem = hideBackBtn;
        if (navMoreText.length > 0) {
            UIButton *navMoreBtn = [UIButton new];
            [navMoreBtn addTarget:self action:@selector(navMoreViewClick) forControlEvents:UIControlEventTouchUpInside];
            [navMoreBtn setTitle:navMoreText forState:UIControlStateNormal];
            [navMoreBtn setTitleColor:[UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:0.6] forState:UIControlStateNormal];
            navMoreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            model.navMoreView = navMoreBtn;
        }
    }else{
        model.navIsHidden = YES;
    }
    
    // logo
    UIImage* logoImage = [UIImage imageNamed:@"logo.png"];
    if (!isPhoneBind && logoImage != nil) {
        model.logoImage = logoImage;
        model.logoFrameBlock = ^CGRect(CGSize screenSize, CGSize superViewSize, CGRect frame) {
            frame.size.width = logoWidth.floatValue;
            frame.size.height = logoHeight.floatValue;
            frame.origin.y = logoOffsetY.floatValue;
            frame.origin.x = (screenSize.width - frame.size.width) * 0.5;
            return frame;
        };
    } else {
        model.logoIsHidden = YES;
    }
    
    // slogan
    if (isPhoneBind) {
        UIColor* textColor =  [UIColor colorWithRed:0.141176470588235 green:0.145098039215686 blue:0.163934426229508 alpha:1];
        model.sloganIsHidden = NO;
        model.sloganText = [[NSAttributedString alloc] initWithString:sloganText attributes:@{NSForegroundColorAttributeName : textColor,NSFontAttributeName : [UIFont systemFontOfSize:24.0]}];
        model.sloganFrameBlock = ^CGRect(CGSize screenSize, CGSize superViewSize, CGRect frame) {
            frame.origin.y = 30;
            return frame;
        };
    } else {
        model.sloganIsHidden = YES;
    }

    // 掩码
    model.numberFont = [UIFont boldSystemFontOfSize:26.0];
    model.numberColor = [UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1.0];
    if (numberColor != nil) {
        model.numberColor = UIColorFromRGB([numberColor integerValue]);
    }
    model.numberFrameBlock = ^CGRect(CGSize screenSize, CGSize superViewSize, CGRect frame) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = (width > 375) ? 370 : ((width > 320) ? 320 : 300);
        frame.origin.y = numberOffsetY == nil ? height : numberOffsetY.floatValue;
        return frame;
    };
    
    // 登录按钮
    UIColor* _loginBtnTextColor = [UIColor whiteColor];
    if (loginBtnTextColor != nil) {
        _loginBtnTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.9];
    }
    model.loginBtnText = [[NSAttributedString alloc] initWithString: loginBtnText attributes:@{NSForegroundColorAttributeName: _loginBtnTextColor, NSFontAttributeName: [UIFont systemFontOfSize:16.0]}];
    UIImage* loginBtnImg = [UIImage imageNamed:@"login_btn.png"];
    if (loginBtnImg != nil) {
        model.loginBtnBgImgs = [NSArray arrayWithObjects:loginBtnImg, loginBtnImg, loginBtnImg, nil];
    }
    model.loginBtnFrameBlock = ^CGRect(CGSize screenSize, CGSize superViewSize, CGRect frame) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = (width > 375) ? 440 : ((width > 320) ? 390 : 340);
        frame.origin.y = numberOffsetY == nil ? height : numberOffsetY.floatValue + 75;
    
        if (loginBtnHeight == nil && loginBtnWidth == nil) {
            frame.size.width = [UIScreen mainScreen].bounds.size.width - 42.5 * 2;
            frame.origin.x = 42.5;
            frame.size.height = 52;
        }
        if (loginBtnHeight != nil) {
            frame.size.height = 52;
        }
        if (loginBtnWidth != nil) {
            frame.size.width = 290;
            frame.origin.x = (screenSize.width - frame.size.width) * 0.5;
        }
        return frame;
    };

    // 切换登录方式按钮
    model.changeBtnIsHidden = !showChangeBtn;
    if (!showChangeBtn) {
        changeBtnText = @"";
    }
    UIColor* _changeBtnTextColor = [UIColor grayColor];
    if (changeBtnTextColor != nil) {
        _changeBtnTextColor = UIColorFromRGB(0xff313131);
    }
    model.changeBtnTitle =[[NSAttributedString alloc] initWithString:changeBtnText attributes:@{NSForegroundColorAttributeName: _changeBtnTextColor, NSFontAttributeName: [UIFont systemFontOfSize:14.0]}];
    model.changeBtnFrameBlock = ^CGRect(CGSize screenSize, CGSize superViewSize, CGRect frame) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = (width > 375) ? 510 : ((width > 320) ? 460 : 430);
        frame.origin.y = numberOffsetY == nil ? height : numberOffsetY.floatValue + 43;
        return frame;
    };

    // 协议
    model.privacyAlignment = NSTextAlignmentCenter;
    model.privacyPreText = @"我已阅读并同意";
    if (privacyOneName != nil && privacyOneUrl != nil) {
        model.privacyOne = [NSArray arrayWithObjects: privacyOneName, privacyOneUrl, nil];
    }
    if (privacyTwoName != nil && privacyTwoUrl != nil) {
        model.privacyTwo = [NSArray arrayWithObjects: privacyTwoName, privacyTwoUrl, nil];
    }
    model.privacyOperatorPreText = @"《";
    model.privacyOperatorSufText = @"》";
    model.checkBoxIsChecked = checkBoxIsChecked;
    _isChecked = checkBoxIsChecked;
    model.checkBoxWH = 15;
    UIImage* checkedImg = [UIImage imageNamed:@"privacy_checked.png"];
    if (checkedImg == nil) {
        checkedImg = [UIImage imageNamed:@"privacy_checked.png" inBundle:bundle compatibleWithTraitCollection:nil];
    }
    UIImage* uncheckedImg = [UIImage imageNamed:@"privacy_unchecked.png"];
    if (uncheckedImg == nil) {
        uncheckedImg = [UIImage imageNamed:@"privacy_unchecked.png" inBundle:bundle compatibleWithTraitCollection:nil];
    }
    model.checkBoxImages = [NSArray arrayWithObjects:uncheckedImg, checkedImg, nil];
    model.privacyNavBackImage = [UIImage imageNamed:@"back_arrow.png" inBundle:bundle compatibleWithTraitCollection:nil];
    if(nil != privacyColor && nil != privacyAgreeColor) {
        UIColor *color1 = UIColorFromRGB(0xff000000);
        UIColor *privacyValue = [color1 colorWithAlphaComponent:0.2];
        UIColor *color2 = UIColorFromRGB(0xff000000);
        UIColor *privacyAgreeValue = [color2 colorWithAlphaComponent:0.9];
        model.privacyColors = @[privacyValue, privacyAgreeValue];
    }
    
    // 微信登录
    __block UIButton *wechatLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* wechatImg = [UIImage imageNamed:@"wechat_login.png"];
    if (wechatImg == nil) {
        wechatImg = [UIImage imageNamed:@"wechat_login.png" inBundle:bundle compatibleWithTraitCollection:nil];
    }
    [wechatLogin setImage:wechatImg forState:0];
    wechatLogin.frame = CGRectMake(0, 0, thirdBtnSize, thirdBtnSize);
    [wechatLogin addTarget:self action:@selector(doWechatLogin:) forControlEvents:UIControlEventTouchUpInside];

    // QQ登录
    __block UIButton *qqLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* qqImg = [UIImage imageNamed:@"qq_login.png"];
    if (qqImg == nil) {
        qqImg = [UIImage imageNamed:@"qq_login.png" inBundle:bundle compatibleWithTraitCollection:nil];
    }
    [qqLogin setImage:qqImg forState:0];
    qqLogin.frame = CGRectMake(0, 0, thirdBtnSize, thirdBtnSize);
    [qqLogin addTarget:self action:@selector(doQQLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    // Apple登录
    __block UIButton *appleLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* appleImg = [UIImage imageNamed:@"apple_login.png"];
    if (appleImg == nil) {
        appleImg = [UIImage imageNamed:@"apple_login.png" inBundle:bundle compatibleWithTraitCollection:nil];
    }
    [appleLogin setImage:appleImg forState:0];
    appleLogin.frame = CGRectMake(0, 0, thirdBtnSize, thirdBtnSize);
    [appleLogin addTarget:self action:@selector(doAppleLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    // Douyin登录
    __block UIButton *douyinLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* douyinImg = [UIImage imageNamed:@"douyin_login.png"];
    if (douyinImg == nil) {
        douyinImg = [UIImage imageNamed:@"douyin_login.png" inBundle:bundle compatibleWithTraitCollection:nil];
    }
    [douyinLogin setImage:douyinImg forState:0];
    douyinLogin.frame = CGRectMake(0, 0, thirdBtnSize, thirdBtnSize);
    [douyinLogin addTarget:self action:@selector(doDouyinLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"close_arrow.png" inBundle:bundle compatibleWithTraitCollection:nil] forState:(UIControlStateNormal)];
    closeBtn.frame = CGRectMake(15, [self statusBarHeight], 38, 38);
    [closeBtn addTarget:self action:@selector(doCloseBtnTapped:) forControlEvents:(UIControlEventTouchUpInside)];
    
    // 全局背景图
    __block UIImageView* bgImgView = nil;
    UIImage* customBg = [UIImage imageNamed:@"onekey_bg.jpg"];
    if (!isPhoneBind && customBg != nil) {
        bgImgView = [[UIImageView alloc] initWithImage:customBg];
        bgImgView.contentMode = UIViewContentModeScaleToFill;
    }
    
    
    UILabel *otherLoginlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 14)];
    otherLoginlabel.text = @"其他方式登录";
    UIColor *color = UIColorFromRGB(0xff313131);
    otherLoginlabel.textColor =  [color colorWithAlphaComponent:0.2];
    otherLoginlabel.textAlignment = NSTextAlignmentCenter;
    otherLoginlabel.font = [UIFont systemFontOfSize:14.0];
    
    
    UIView *otherLoginView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 14)];
    UIView *leftGradientView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 92, 1)];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];

    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor,
                             (__bridge id)[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0].CGColor];

    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    gradientLayer.frame = leftGradientView.bounds;

    [leftGradientView.layer insertSublayer:gradientLayer atIndex:0];
    
    UIView *rightGradientView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 92, 1)];
    CAGradientLayer *rightGradientLayer = [CAGradientLayer layer];

    rightGradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor];

    rightGradientLayer.startPoint = CGPointMake(0, 0.5);
    rightGradientLayer.endPoint = CGPointMake(1, 0.5);
    rightGradientLayer.frame = rightGradientView.bounds;

    [rightGradientView.layer insertSublayer:rightGradientLayer atIndex:0];
    
    
    model.customViewBlock = ^(UIView * _Nonnull superCustomView) {
        if (bgImgView != nil) {
            [superCustomView addSubview:bgImgView];
        }
        if (!hideBackBtnFromSmallAccount) {
            [superCustomView addSubview:closeBtn];
        }
        if (showWXLogin) {
            [superCustomView addSubview:wechatLogin];
        }
        if (showQQLogin) {
            [superCustomView addSubview:qqLogin];
        }
        if (showAppleLogin) {
            [superCustomView addSubview:appleLogin];
        }
        if (showDouyinLogin) {
            [superCustomView addSubview:douyinLogin];
        }
        if (showWXLogin || showQQLogin || showAppleLogin || showDouyinLogin) {
            [superCustomView addSubview:otherLoginView];

            [otherLoginView addSubview:leftGradientView];
            [otherLoginView addSubview:otherLoginlabel];
            [otherLoginView addSubview:rightGradientView];
        }
    };
    model.customViewLayoutBlock = ^(CGSize screenSize, CGRect contentViewFrame, CGRect navFrame, CGRect titleBarFrame, CGRect logoFrame, CGRect sloganFrame, CGRect numberFrame, CGRect loginFrame, CGRect changeBtnFrame, CGRect privacyFrame) {
        if (bgImgView != nil) {
            bgImgView.frame = contentViewFrame;
        }
        
        CGFloat x1 = 0.0;
        CGFloat x2 = 0.0;
        CGFloat x3 = 0.0;
        CGFloat x4 = 0.0;
        CGFloat y = CGRectGetMinY(privacyFrame) - thirdBtnSize - 20;
        NSInteger total = (showQQLogin ? 1 : 0) + (showWXLogin ? 1 : 0) + (showAppleLogin ? 1 : 0) + (showDouyinLogin ? 1 : 0);
        
        if (total == 4) {
            x1 = screenSize.width / 2 - thirdBtnSize / 2 - 150;
            x2 = screenSize.width / 2 - thirdBtnSize / 2 - 50;
            x3 = screenSize.width / 2 - thirdBtnSize / 2 + 50;
            x4 = screenSize.width / 2 - thirdBtnSize / 2 + 150;
        } else if (total == 3) {
            x1 = screenSize.width / 2 - thirdBtnSize / 2 - 100;
            x2 = screenSize.width / 2 - thirdBtnSize / 2;
            x3 = screenSize.width / 2 - thirdBtnSize / 2 + 100;
        } else if (total == 2) {
            x1 = screenSize.width / 2 - thirdBtnSize / 2 - 50;
            x2 = screenSize.width / 2 - thirdBtnSize / 2 + 50;
        } else if (total == 1) {
            x1 = screenSize.width / 2 - thirdBtnSize / 2;
        }

        if (showWXLogin) {
            CGRect wxFrame = wechatLogin.frame;
            wxFrame.origin.x = x1;
            wxFrame.origin.y = y;
            wechatLogin.frame = wxFrame;
        }
        if (showQQLogin) {
            CGRect qqFrame = qqLogin.frame;
            qqFrame.origin.x = total == 1 ? x1 : x2;
            qqFrame.origin.y = y;
            qqLogin.frame = qqFrame;
        }
        if (showAppleLogin) {
            CGRect appleFrame = appleLogin.frame;
            appleFrame.origin.x = total == 1 ? x1 : total == 2 ? x2 : x3;
            appleFrame.origin.y = y;
            appleLogin.frame = appleFrame;
        }
        if (showDouyinLogin) {
            CGRect douyinFrame = douyinLogin.frame;
            douyinFrame.origin.x = total == 1 ? x1 : total == 2 ? x2 : total == 3 ? x3 : x4;
            douyinFrame.origin.y = y;
            douyinLogin.frame = douyinFrame;
        }
        if (showWXLogin || showQQLogin || showAppleLogin || showDouyinLogin) {
            CGRect otherLoginViewFrame = otherLoginView.frame;
            CGRect otherLoginlabelFrame = otherLoginlabel.frame;
            CGRect leftGradientViewFrame = leftGradientView.frame;
            CGRect rightGradientViewFrame = rightGradientView.frame;
            otherLoginViewFrame.origin.y = y - 30;
            otherLoginView.frame = otherLoginViewFrame;
            //文本
            otherLoginlabelFrame.origin.y = 0;
            otherLoginlabelFrame.origin.x =  (screenSize.width - otherLoginlabel.frame.size.width) / 2;
            otherLoginlabel.frame = otherLoginlabelFrame;
            // 左渐变
            leftGradientViewFrame = CGRectMake(screenSize.width / 2 - 8 - 92 - 44, 6.5, 92, 1);
            leftGradientView.frame = leftGradientViewFrame;
            // 右渐变
            rightGradientViewFrame = CGRectMake(screenSize.width / 2 + 8 + 44, 6.5, 92, 1);
            rightGradientView.frame = rightGradientViewFrame;
        }
    };

    return model;
}

- (void)doCloseBtnTapped:(UIButton *)btn {
    [TXCommonHandler.sharedInstance cancelLoginVCAnimated:YES complete:^(void) {
        
    }];
}


- (CGFloat)statusBarHeight {
    CGFloat statusBarHeight = 0;
    if (@available(iOS 13.0, *)) {
        statusBarHeight = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height;
    } else {
        statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    }
    return statusBarHeight;
}


#pragma mark - runtime operations

- (void)showShortcutAlertIfNeeded:(void (^)(void))then
{
    if (![self allLoginControlsDidFind]) {
        //找不到控件，尝试重新获取
        [self getKeyControlsOnLoginPage];
    }
    
    if (!self.isChecked) {
        BOOL canShow = [self canShowShortcutAlert:then];
        if (!canShow) {
            [self showToast: @"请勾选同意后再登录"];
            return;
        }
    } else {
        if (then) {
            then();
        }
    }
}

- (BOOL)canShowShortcutAlert:(void (^)(void))then
{
    if (![self allLoginControlsDidFind]) {
        //找不到控件
        return NO;
    }
    
    OneClickAuthShortcutAlert *alert = [[OneClickAuthShortcutAlert alloc] initWithAttrString:self.textView.attributedText];
    __weak typeof(alert) weakAlert = alert;
    __weak typeof(self) weakSelf = self;
    [alert setClickAgreeBtn:^{
        //关联点击同意协议按钮
        [weakSelf.agreeBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
        [weakAlert dismiss:^(BOOL finished) {
            if (then) {
                then();
            } else {
                [weakSelf.loginBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
            }
        }];
    }];
    [alert setClickUrl:^(NSURL * _Nonnull url) {
        //关联点击对应协议
        NSRange range = [weakSelf.treatyDic[[url absoluteString]] rangeValue];
        [self.textView.delegate textView:self.textView shouldInteractWithURL:url inRange:range interaction:0];
    }];
    [alert showOn:self.loginView];
    
    return YES;
}

- (BOOL)allLoginControlsDidFind
{
    if (!self.agreeBtn || !self.textView || !self.loginBtn) {
        //找不到控件
        return NO;
    }
    
    return YES;
}

- (void)getKeyControlsOnLoginPage
{
    UIViewController *rootVC = [[[UIApplication sharedApplication].delegate window] rootViewController];
    UINavigationController *navController = (id)[rootVC presentedViewController];
    if (![navController isKindOfClass:[UINavigationController class]]) {
        return;
    }
    
    UIView *view = navController.topViewController.view;
    __block UIView *loginView = nil;
    [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"PNSLoginView")]) {
            loginView = obj;
            *stop = YES;
        }
    }];
    
    if (!loginView) {
        //找不到登录视图
        return;
    }
    
    self.loginView = loginView;
    [loginView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.bounds.size.width == obj.bounds.size.height && obj.bounds.size.width == 15) {
            self.agreeBtn = obj;
        }
        if ([obj isKindOfClass:NSClassFromString(@"PNSTextView")]) {
            self.textView = obj;
        }
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if ([[btn attributedTitleForState:UIControlStateNormal].string containsString:@"本机"]) {
                self.loginBtn = obj;
            }
        }
        if (self.loginBtn && self.agreeBtn && self.textView) {
            *stop = YES;
        }
    }];
    
    if (!self.agreeBtn || !self.textView || !self.loginBtn) {
        //找不到控件
        return;
    }
    
    self.treatyDic = [NSMutableDictionary new];
    __weak typeof(self) weakSelf = self;
    [self.textView.attributedText enumerateAttributesInRange:NSMakeRange(0, self.textView.attributedText.length) options:0 usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        [attrs enumerateKeysAndObjectsUsingBlock:^(NSAttributedStringKey  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([key isEqualToString:NSLinkAttributeName]) {
                //obj为link的url字符串
                if ([obj isKindOfClass:[NSString class]]) {
                    [weakSelf.treatyDic addEntriesFromDictionary:@{obj:[NSValue valueWithRange:range]}];
                }
            }
        }];
    }];
    
    if (self.treatyDic.count < 1) {
        //找不到协议链接
        self.textView = nil;
        return;
    }
}

void swizzleInstanceMethodToSelf(Class class, SEL originalSEL, SEL replacementSEL)
{
    //class_getInstanceMethod()，如果子类没有实现相应的方法，则会返回父类的方法。
    Method originMethod = class_getInstanceMethod(class, originalSEL);
    Method replaceMethod = class_getInstanceMethod([OneClickAuthPlugin class], replacementSEL);
    
    if (class_addMethod(class, originalSEL, method_getImplementation(replaceMethod),method_getTypeEncoding(replaceMethod))) {
        class_replaceMethod(class,replacementSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, replaceMethod);
    }
}
@end
