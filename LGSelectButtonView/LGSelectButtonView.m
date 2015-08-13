//
//  LGSelectButtonView.m
//  LGSelectButtonView
//
//  Created by 李刚 on 15/8/12.
//  Copyright (c) 2015年 李刚. All rights reserved.
//

#import "LGSelectButtonView.h"

@interface LGSelectButtonView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LGSelectButtonView
{
    UITableView *_tableView;
    CGRect _customFrame;
    UIButton *_button;
    UILabel *_btnTitleLabel;
    UIImageView *_btnArrowImageView;
}

-(void)setButtonHeight:(CGFloat)buttonHeight
{
    _buttonHeight = buttonHeight;
    [self createButton];
    [self createTableView];
}

-(void)setBackColorAlpha:(CGFloat)backColorAlpha
{
    _backColorAlpha = backColorAlpha;
    
    _tableView.backgroundColor= [UIColor colorWithWhite:1 alpha:self.backColorAlpha];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _customFrame = frame;
    }
    return self;
}

- (void)openTableView
{
    _button.selected = NO;
    [self btnTouched];
}

- (void)closeTableView
{
    _button.selected = YES;
    [self btnTouched];
}

- (void)createTableView
{
    CGRect tableViewFrame = CGRectMake(0, self.buttonHeight, CGRectGetWidth(_customFrame), CGRectGetHeight(_customFrame) - self.buttonHeight);
    _tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
}

- (void)createButton
{
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), self.buttonHeight)];
    }
    [_button setBackgroundImage:self.buttonBackGroundImage forState:UIControlStateNormal];
    CGSize titleSize = [self sizeWithText:self.buttonDefaultTitle
                                      font:[UIFont fontWithName:self.buttonTitleFontName size:self.buttonTitleFontSize]
                                   maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGRect titleFrame = CGRectMake((CGRectGetWidth(_customFrame) - titleSize.width)/2, (self.buttonHeight - titleSize.height)/2, titleSize.width, titleSize.height);
    NSLog(@"titleFrame-------%@",NSStringFromCGRect(titleFrame));
    [_btnTitleLabel removeFromSuperview];
    _btnTitleLabel = [[UILabel alloc] initWithFrame:titleFrame];
    _btnTitleLabel.center = _button.center;
    _btnTitleLabel.text = self.buttonDefaultTitle;
    _btnTitleLabel.font = [UIFont systemFontOfSize:self.buttonTitleFontSize];
    _btnTitleLabel.adjustsFontSizeToFitWidth = YES;
    _btnTitleLabel.textColor = [UIColor blackColor];
    [_button addSubview:_btnTitleLabel];
    
    [_btnArrowImageView removeFromSuperview];
    NSString *imageName = _button.selected ? @"class_up_arrow_iPhone.png" : @"class_down_arrow_iPhone.png";
    _btnArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    CGRect arrowImageFrame = CGRectMake(_btnTitleLabel.center.x + CGRectGetWidth(titleFrame)/2 + 5, _btnTitleLabel.center.y - 4, 8, 8);
    _btnArrowImageView.frame = arrowImageFrame;
    [_button addSubview:_btnArrowImageView];
    [_button addTarget:self action:@selector(btnTouched) forControlEvents:UIControlEventTouchUpInside];
    _button.backgroundColor = self.buttonBackGroundColor ? self.buttonBackGroundColor : [UIColor whiteColor];
    
    [self addSubview:_button];
}

- (void)btnTouched
{
    _button.selected = !_button.selected;
    NSLog(@"%d",_button.selected);
    
    if (_button.selected) {
        [UIView animateWithDuration:0.6 animations:^{
            CGRect newFrame = _customFrame;
            self.frame = newFrame;
        }];
    } else {
        [UIView animateWithDuration:0.6 animations:^{
            CGRect newFrame = CGRectMake(_customFrame.origin.x, _customFrame.origin.y, _customFrame.size.width, self.buttonHeight);
            self.frame = newFrame;
        }];
    }
    [_tableView reloadData];
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

#pragma mark -- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableViewTextLableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if (indexPath.row < self.tableViewTextLableArray.count) {
        cell.textLabel.text = self.tableViewTextLableArray[indexPath.row];
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

#pragma mark -- UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self btnTouched];
    
    self.buttonDefaultTitle = self.tableViewTextLableArray[indexPath.row];
    
    [self.delegate didSelectRowAtIndexPath:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  1;
}

//备注：此代理方法，在所有配置完成之后才执行
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    [self createButton];
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.tableViewRowHeight;
}

@end
