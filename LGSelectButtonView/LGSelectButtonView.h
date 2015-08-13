//
//  LGSelectButtonView.h
//  LGSelectButtonView
//
//  Created by 李刚 on 15/8/12.
//  Copyright (c) 2015年 李刚. All rights reserved.
//

#import <UIKit/UIKit.h>


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

@property (nonatomic, assign) BOOL isOpen;

@property (nonatomic, weak) id<LGSelectButtonViewDelegate>delegate;

@end
