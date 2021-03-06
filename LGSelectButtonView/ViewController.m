//
//  ViewController.m
//  LGSelectButtonView
//
//  Created by 李刚 on 15/8/12.
//  Copyright (c) 2015年 李刚. All rights reserved.
//

#import "ViewController.h"
#import "LGSelectButtonView.h"

@interface ViewController ()<LGSelectButtonViewDelegate>
{
    LGSelectButtonView *_view;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intelligent_backImage_ipad.jpg"]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.frame = self.view.frame;
    [self.view addSubview:imageView];
    
    LGSelectButtonView *view = [[LGSelectButtonView alloc] initWithFrame:CGRectMake(100, 200, 150, 150)];
    view.tableViewTextLableArray = @[@"德玛西亚",@"寒冰射手",@"无极剑圣"];
    view.buttonHeight = 30;
    view.buttonBackGroundImage = [UIImage imageNamed:@"preference_button_iphone.png"];
    view.buttonDefaultTitle = @"-请选择-";
    view.buttonTitleFontName = @"HelveticaNeue-Thin";
    view.buttonTitleFontSize = 16;
    view.tableViewRowHeight = 30;
    view.backColorAlpha = 0.6;
    [view closeTableView];
    view.delegate = self;
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
    [self.view addSubview:view];
    _view = view;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100 , 130, 150, 30)];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"展开/关闭" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(openBtnTouched) forControlEvents:UIControlEventTouchUpInside];
                                                               
}

- (void)openBtnTouched
{
    static BOOL open = 0;
    open = !open;
    if (open) {
        [_view openTableView];
    } else {
        [_view closeTableView];
    }
}

#pragma mark LGSelectButtonViewDelegate

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"您点击了--%ld",indexPath.row);
}

@end
