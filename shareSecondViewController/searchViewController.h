//
//  searchViewController.h
//  ios搜索栏
//
//  Created by tuqiangyao on 2018/8/1.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface searchViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView *_tableView;
}
@end
