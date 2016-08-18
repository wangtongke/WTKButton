//
//  ViewController.m
//  WTKBtnDemo
//
//  Created by 王同科 on 16/8/18.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "WTKButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WTKButton *btn      = [WTKButton buttonWithType:UIButtonTypeCustom];
    btn.frame           = CGRectMake(100, 300, 100, 40);
    btn.backgroundColor = [UIColor purpleColor];
    [btn addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

#warning 如果继承和类别都实现了，则会走类别的方法

- (void)btn2Click{
    NSLog(@"自定义按钮点击了");
}

- (IBAction)btn1Click:(id)sender {
    
    NSLog(@"storyB按钮点击了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
