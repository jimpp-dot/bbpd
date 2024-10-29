//
//  OneClickAuthShortcutAlert.m
//  onekey
//
//  Created by 王威2 on 2022/8/18.
//

#import "OneClickAuthShortcutAlert.h"

@interface OneClickAuthShortcutAlert () <UITextViewDelegate>
@property (nonatomic, strong) UIView *alertView;
@end
@implementation OneClickAuthShortcutAlert

- (instancetype)initWithAttrString:(NSAttributedString *)attrString
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        //富文本UI调整
        NSMutableAttributedString *newStr = [[NSMutableAttributedString alloc] initWithAttributedString:attrString];
        
        [newStr enumerateAttributesInRange:NSMakeRange(0, newStr.length) options:0 usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
            NSMutableDictionary *newAttrs = [NSMutableDictionary dictionaryWithDictionary:attrs];
            //移除原始段落样式
            [newAttrs removeObjectForKey:NSParagraphStyleAttributeName];
            //重设颜色
            if ([attrs.allKeys containsObject:NSLinkAttributeName]) {
                [newAttrs setObject:[UIColor colorWithRed:96/255.0 green:200/255.0 blue:255/255.0 alpha:1.00000] forKey:NSForegroundColorAttributeName];
            } else {
                [newAttrs setObject:[UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:0.6] forKey:NSForegroundColorAttributeName];
//                [newAttrs removeObjectForKey:NSForegroundColorAttributeName];
            }
            //重设字体大小
            [newAttrs setObject:[UIFont systemFontOfSize:16] forKey:NSFontAttributeName];
            [newStr setAttributes:newAttrs range:range];
        }];
        //重设行间距
        NSMutableParagraphStyle *p = [NSMutableParagraphStyle new];
        p.lineSpacing = 3;
        [newStr addAttributes:@{NSParagraphStyleAttributeName:p} range:NSMakeRange(0, newStr.length)];
        attrString = newStr;
        
        UIView *alertView = [UIView new];
        self.alertView = alertView;
        alertView.translatesAutoresizingMaskIntoConstraints = NO;
        alertView.backgroundColor = [UIColor whiteColor];
        alertView.layer.cornerRadius = 16;
        [self addSubview:alertView];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:alertView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:312]];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:alertView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:275]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:alertView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:alertView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        
        UILabel *lb = [[UILabel alloc] init];
        lb.translatesAutoresizingMaskIntoConstraints = NO;
        lb.tag = 1;
        lb.font = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
        lb.textColor = [UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1.0];
        lb.text = @"用户协议及隐私保护";
        [alertView addSubview:lb];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:lb attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:alertView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:lb attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:alertView attribute:NSLayoutAttributeTop multiplier:1 constant:24]];

        UITextView *textView = [UITextView new];
        textView.translatesAutoresizingMaskIntoConstraints = NO;
        textView.tag = 2;
        [textView setEditable:NO];
        [textView becomeFirstResponder];
        textView.attributedText = attrString;
        textView.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:125/255.0 green:46/255.0 blue:230/255.0 alpha:1.0]};
        textView.textAlignment = NSTextAlignmentCenter;
        [textView resignFirstResponder];
        textView.delegate = self;
        [alertView addSubview:textView];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:alertView attribute:NSLayoutAttributeLeft multiplier:1 constant:20]];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:alertView attribute:NSLayoutAttributeRight multiplier:1 constant:-20]];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:alertView attribute:NSLayoutAttributeTop multiplier:1 constant:65]];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:80]];


        UIButton *agreeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,264,48)];
        agreeBtn.translatesAutoresizingMaskIntoConstraints = NO;
        agreeBtn.tag = 3;
        self.agreeBtn = agreeBtn;
        agreeBtn.titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
        [agreeBtn setTitle:@"同意并登录" forState:UIControlStateNormal];
        agreeBtn.backgroundColor =  [UIColor colorWithRed:125/255.0 green:46/255.0 blue:230/255.0 alpha:1.0];
        agreeBtn.layer.cornerRadius = 24;
        [agreeBtn addTarget:self action:@selector(didClickAgree) forControlEvents:UIControlEventTouchUpInside];
        [alertView addSubview:agreeBtn];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:agreeBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:alertView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:agreeBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:alertView attribute:NSLayoutAttributeTop multiplier:1 constant:173]];
        [agreeBtn addConstraint:[NSLayoutConstraint constraintWithItem:agreeBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:264]];
        [agreeBtn addConstraint:[NSLayoutConstraint constraintWithItem:agreeBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:48]];

        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 264, 42)];
        cancelBtn.translatesAutoresizingMaskIntoConstraints = NO;
        cancelBtn.tag = 4;
        self.cancelBtn = cancelBtn;
        cancelBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [cancelBtn setTitleColor:[UIColor colorWithRed:32/255.0 green:32/255.0 blue:32/255.0 alpha:0.4] forState:UIControlStateNormal];
        [cancelBtn setTitle:@"暂不" forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [alertView addSubview:cancelBtn];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:cancelBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:alertView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [alertView addConstraint:[NSLayoutConstraint constraintWithItem:cancelBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:agreeBtn attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        [cancelBtn addConstraint:[NSLayoutConstraint constraintWithItem:cancelBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:264]];
        [cancelBtn addConstraint:[NSLayoutConstraint constraintWithItem:cancelBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:42]];
    }
    return self;
}

- (void)cancelBtnClick
{
    [self dismiss:nil];
}

- (void)showOn:(UIView *)superView
{
    [superView addSubview:self];
    CGAffineTransform startTransform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 40);
    self.alertView.transform = CGAffineTransformScale(startTransform, 0.9, 0.9);
    self.alertView.alpha = 0;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
    [UIView animateWithDuration:0.08 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alertView.transform = CGAffineTransformIdentity;
        self.alertView.alpha = 1.0;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    } completion:nil];
}

- (void)dismiss:(void (^ _Nullable )(BOOL finished))completion
{    [UIView animateWithDuration:0.08 animations:^{
        self.alertView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 40);
        self.alpha = 0;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (completion) {
            completion(finished);
        }
    }];
}

- (void)didClickAgree
{
    if (self.clickAgreeBtn) {
        self.clickAgreeBtn();
    }
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
{
    if (self.clickUrl) {
        self.clickUrl(URL);
    }
    return NO;
}

@end






@interface NSObjectShortcutAlertController ()
@property (nonatomic, strong) OneClickAuthShortcutAlert *alertView;
@end

@implementation NSObjectShortcutAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        
    self.alertView = [[OneClickAuthShortcutAlert alloc] initWithAttrString:self.attrString];
    [self.alertView.cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.alertView];
    [self.alertView addConstraint:[NSLayoutConstraint constraintWithItem:self.alertView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:312]];
    [self.alertView addConstraint:[NSLayoutConstraint constraintWithItem:self.alertView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:275]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.alertView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.alertView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

- (UIModalPresentationStyle)modalPresentationStyle
{
    return UIModalPresentationOverFullScreen;
}

- (UIModalTransitionStyle)modalTransitionStyle
{
    return UIModalTransitionStyleCrossDissolve;
}

- (void)cancelBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
