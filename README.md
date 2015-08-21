# LGSelectButtonView

###概述

    一个选择菜单，可以收缩成一个button，可以展开成一个tableView。button上始终显示最新选择的条目的title

###初始化

```
    - (void)init
    {
        LGSelectButtonView *view = [[LGSelectButtonView alloc] initWithFrame:CGRectMake(100, 100, 150, 100)];
        view.tableViewTextLableArray = @[@"123",@"6",@"73389"];
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
    }
```
