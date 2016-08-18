//
//  WTKButton.m
//  RuntimeDemo1
//
//  Created by 王同科 on 16/8/16.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "WTKButton.h"


@interface WTKButton ()
@property(nonatomic,assign)BOOL wtkFlag;
@end

@implementation WTKButton

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{

    if (!self.wtkFlag)
    {
        [super sendAction:action to:target forEvent:event];
        self.wtkFlag = !self.wtkFlag;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.wtkFlag = !self.wtkFlag;
        });
    }
    else
    {
        return;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
