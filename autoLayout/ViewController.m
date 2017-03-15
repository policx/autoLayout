//
//  ViewController.m
//  autoLayout
//
//  Created by policx on 2017/3/15.
//  Copyright © 2017年 policx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createThreeViews];
}

- (void)createThreeViews{
    
    //1 创建3个view的对象
    UIView *leftView = [[UIView alloc]init];
    UIView *rightView = [[UIView alloc]init];
    UIView *bottomView = [[UIView alloc]init];
    
    //2 设置背景颜色
    leftView.backgroundColor = [UIColor greenColor];
    rightView.backgroundColor = [UIColor purpleColor];
    bottomView.backgroundColor = [UIColor orangeColor];
    
    //3 添加视图上显示
    [self.view addSubview:leftView];
    [self.view addSubview:rightView];
    [self.view addSubview:bottomView];
    
    //4 关闭系统的自定义布局
    leftView.translatesAutoresizingMaskIntoConstraints = NO;
    rightView.translatesAutoresizingMaskIntoConstraints = NO;
    bottomView.translatesAutoresizingMaskIntoConstraints = NO;
  
    
//    //leftView的上 = self.view的上+20
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftView
//                                                          attribute:NSLayoutAttributeTop
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeTop
//                                                         multiplier:1.
//                                                           constant:20]];
//    // leftView的左 = self.view的左 + 20
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftView
//                                                          attribute:NSLayoutAttributeLeft
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeLeft
//                                                         multiplier:1.
//                                                           constant:20]];
//    // rightView的上 = leftView的上
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
//                                                          attribute:NSLayoutAttributeTop
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:leftView
//                                                          attribute:NSLayoutAttributeTop
//                                                         multiplier:1.
//                                                           constant:0]];
//    // rightView的左 = leftView的右 + 20
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
//                                                          attribute:NSLayoutAttributeLeft
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:leftView
//                                                          attribute:NSLayoutAttributeRight
//                                                         multiplier:1.
//                                                           constant:20]];
//    // rightView的右 = self.view的右 - 20
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
//                                                          attribute:NSLayoutAttributeRight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeRight
//                                                         multiplier:1.
//                                                           constant:-20]];
//    // rightView的高 = leftView的高
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
//                                                          attribute:NSLayoutAttributeHeight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:leftView
//                                                          attribute:NSLayoutAttributeHeight
//                                                         multiplier:1.
//                                                           constant:0]];
//    // rightView的宽 = leftView的宽
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
//                                                          attribute:NSLayoutAttributeWidth
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:leftView
//                                                          attribute:NSLayoutAttributeWidth
//                                                         multiplier:1.0
//                                                           constant:0]];
//    //bottomView的左 = self.view的左 + 20
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
//                                                          attribute:NSLayoutAttributeLeft
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeLeft
//                                                         multiplier:1
//                                                           constant:20]];
//    //bottomView的右 = self.view的右 - 20
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
//                                                          attribute:NSLayoutAttributeRight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeRight
//                                                         multiplier:1
//                                                           constant:-20]];
//    //bottomView的上 = leftView的下 + 20
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
//                                                          attribute:NSLayoutAttributeTop
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:leftView
//                                                          attribute:NSLayoutAttributeBottom
//                                                         multiplier:1
//                                                           constant:20]];
//    //bottomView的高 = leftView的高
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
//                                                          attribute:NSLayoutAttributeHeight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:leftView
//                                                          attribute:NSLayoutAttributeHeight
//                                                         multiplier:1
//                                                           constant:0]];
//    //bottomView的下 = self.view的下 + 20
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
//                                                          attribute:NSLayoutAttributeBottom
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeBottom
//                                                         multiplier:1
//                                                           constant:-20]];
    
    //创建VFL约束字符串
    
    NSString *hVFL = @"H:|-space-[leftView(==rightView)]-space1-[rightView]-space-|";
    
    NSString *hVFL1 = @"H:|-space-[bottomView]-space-|";
    
    NSString *vVFL = @"V:|-space-[leftView(==bottomView)]-space-[bottomView]-space-|";
    
    NSString *vVFL1 = @"V:|-space-[rightView(==bottomView)]-space-[bottomView]-space-|";
    
    //创建键值映射
    
    NSDictionary *metircs = @{@"space":@20,@"space1":@30};
    
    NSDictionary *views = NSDictionaryOfVariableBindings(leftView,rightView,bottomView);
    //创建约束
    
    NSArray *hconstraint = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];
    
    NSArray *hconstraint1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];
    
    NSArray *vconstraint = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];
    
    NSArray *vconstraint1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:NSLayoutFormatDirectionLeadingToTrailing metrics:metircs views:views];
    //添加约束
    
    [self.view addConstraints:hconstraint];
    
    [self.view addConstraints:hconstraint1];
    
    [self.view addConstraints:vconstraint];
    
    [self.view addConstraints:vconstraint1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
