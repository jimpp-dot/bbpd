//
//  FLTGestureInterceptView.m
//  webview_flutter
//  用于解决webview上面盖有flutter widget时，对widget执行的手势操作会被透传到webview(platformview)
//
//  Created by 陈恩裕 on 2022/6/9.
//

#import "FLTGestureInterceptView.h"

@implementation FLTGestureInterceptView

{
    NSMutableArray<UIView*> *_overlayViews;
}

// 查找FlutterOverlayView
// 深度优先遍历(先序)
-(void)findFlutterOverlayView:(UIView*)superView{
    for(int i=0;i<superView.subviews.count;i++){
        UIView *subView = superView.subviews[i];
        // 先查找到自己，在自己上层的才可以放入数组
        if(subView == self){
            _overlayViews = @[].mutableCopy;
        }
        if(_overlayViews){
            NSString *className = NSStringFromClass([subView class]);
            if([className isEqualToString:@"FlutterOverlayView"]){
                // subview的clipsToBounds = YES; 用来裁剪子view
                [_overlayViews addObject:subView];
                // 如果找到了，就不需要递归查找自己的子view
                // 经调试发现，子view是一个frame为全屏的FlutterOverlayView，会影响坐标判断，所以只记录当前view即可
                continue;
            }
        }
        [self findFlutterOverlayView:subView];
    }
}

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event{
    _overlayViews = nil; // 每次点击事件，都要重置数组
    UIView *rootView = [UIApplication sharedApplication].keyWindow;
    [self findFlutterOverlayView:rootView];

    // 从后往前找，即从上往下
    for(NSInteger i = _overlayViews.count - 1; i >= 0; i--){
        UIView *subView = _overlayViews[i];
        CGPoint p = [self getGlobalPoint:point OfView:self];
        if(CGRectContainsPoint([self getGlobalFrameOfView:subView], p)){
            return subView;
        }
    }
    return [super hitTest:point withEvent:event];
}

-(CGPoint)getGlobalPoint:(CGPoint)point OfView:(UIView*)view{
    UIView *superView = view;
    CGPoint globalPoint = point;
    while (superView) {
        globalPoint = CGPointMake(globalPoint.x+superView.frame.origin.x, globalPoint.y+superView.frame.origin.y);
        superView = superView.superview;
    }
    return globalPoint;
}

-(CGRect)getGlobalFrameOfView:(UIView*)view{
    CGRect globalFrame = view.frame;
    UIView *superView = view.superview;
    while (superView) {
        globalFrame = CGRectMake(globalFrame.origin.x+superView.frame.origin.x, globalFrame.origin.y+superView.frame.origin.y, globalFrame.size.width, globalFrame.size.height);
        superView = superView.superview;
    }
    return globalFrame;
}

@end
