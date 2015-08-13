//
//  LGSelectButtonView.h
//  LGSelectButtonView
//
//  Created by 李刚 on 15/8/12.
//  Copyright (c) 2015年 李刚. All rights reserved.
//

#import <UIKit/UIKit.h>

//选择菜单，包括一个button和一个tableView，tableView可收缩。button上始终显示最新选择的条目的title
@protocol LGSelectButtonViewDelegate <NSObject>

@optional

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LGSelectButtonView : UIView

@property (nonatomic, copy) NSArray *tableViewTextLableArray;

@property (nonatomic, assign) CGFloat tableViewRowHeight;

@property (nonatomic, assign) CGFloat buttonHeight;

@property (nonatomic, strong) UIImage *buttonBackGroundImage;

@property (nonatomic, strong) UIColor *buttonBackGroundColor;

@property (nonatomic, copy) NSString *buttonDefaultTitle;

@property (nonatomic, copy) NSString *buttonTitleFontName;

@property (nonatomic, assign) NSInteger buttonTitleFontSize;

@property (nonatomic, assign) CGFloat backColorAlpha;

@property (nonatomic, weak) id<LGSelectButtonViewDelegate>delegate;

- (void)openTableView;

- (void)closeTableView;

@end
