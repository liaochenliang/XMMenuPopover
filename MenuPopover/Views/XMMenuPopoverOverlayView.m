//
//  XMMenuPopoverOverlayView.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/27.
//

#import "XMMenuPopoverOverlayView.h"
#import "XMMenuPopover.h"

@interface XMMenuPopoverOverlayView()<UIGestureRecognizerDelegate>

@end

@implementation XMMenuPopoverOverlayView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    if (XMMenuPopover.shared.menuInHideAnimation) {
//        return  nil;
//    }
//    if (XMMenuPopover.shared.tapPointHandler != nil) {
//        XMMenuPopover.shared.tapPointHandler(point);
//    }
//    [XMMenuPopover.shared hideMenu];
//    return nil;
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (XMMenuPopover.shared.menuInHideAnimation) {
        return;
    }
    if (XMMenuPopover.shared.tapPointHandler != nil) {
        UITouch *aTouch = [touches anyObject];
        CGPoint point = [aTouch locationInView:self];
        XMMenuPopover.shared.tapPointHandler(point);
    }
    [XMMenuPopover.shared hideMenu];
}

@end
