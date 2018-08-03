//
//  First.h
//  share
//
//  Created by tuqiangyao on 2018/7/27.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface First : UIViewController
<UITableViewDelegate,
UITableViewDataSource,
UIScrollViewDelegate>
{
    UITableView* _tableView;
    UIScrollView* _sv;
}
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,retain) UIPageControl *pageControl;

@end
