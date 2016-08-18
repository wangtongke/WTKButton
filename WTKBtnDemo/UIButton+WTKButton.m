//
//  UIButton+WTKButton.m
//  RuntimeDemo1
//
//  Created by 王同科 on 16/8/16.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "UIButton+WTKButton.h"
#import <objc/runtime.h>

@interface UIButton (WTKButton)
@property(nonatomic,copy)NSString *wtkFlag;
@end
static char *name;
@implementation UIButton (WTKButton)


+ (void)load
{
    Method originalMethod = class_getInstanceMethod([UIButton class], @selector(sendAction:to:forEvent:));
    Method newMethod    = class_getInstanceMethod([UIButton class], @selector(wtkSendAction:to:forEvent:));
    method_exchangeImplementations(originalMethod, newMethod);
}


- (void)wtkSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{

    self.wtkFlag = @"123";
    
    [self wtkSendAction:action to:target forEvent:event];
    self.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.enabled = YES;
    });
}


- (void)setWtkFlag:(NSString *)wtkFlag
{
    objc_setAssociatedObject(self, name, wtkFlag, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)wtkFlag
{
    return objc_getAssociatedObject(self, name);
}



@end
