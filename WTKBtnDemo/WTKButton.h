//
//  WTKButton.h
//  RuntimeDemo1
//
//  Created by 王同科 on 16/8/16.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTKButton : UIButton
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
@end
