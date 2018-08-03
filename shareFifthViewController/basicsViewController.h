//
//  basicsViewController.h
//  share
//
//  Created by tuqiangyao on 2018/7/30.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface basicsViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView *_tableView;
}
@end
