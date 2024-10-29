//
//  OneClickAuthShortcutAlert.h
//  onekey
//
//  Created by 王威2 on 2022/8/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OneClickAuthShortcutAlert : UIView
@property(nonatomic, strong) UIButton *agreeBtn;
@property(nonatomic, strong) UIButton *cancelBtn;
@property(nonatomic, copy) void (^clickAgreeBtn)(void);
@property(nonatomic, copy) void (^clickUrl)(NSURL *);

- (instancetype)initWithAttrString:(NSAttributedString *)attrString;
- (void)showOn:(UIView *)superView;
- (void)dismiss:(void (^_Nullable)(BOOL finished))completion;
@end

/// 为了在当前页面跳转到协议页，暂时废弃present方式
@interface NSObjectShortcutAlertController : UIViewController
@property(nonatomic, strong) NSAttributedString *attrString;
@property(nonatomic, copy) void (^clickTreaty)(void);
@end

NS_ASSUME_NONNULL_END
