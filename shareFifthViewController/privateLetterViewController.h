//
//  privateLetterViewController.h
//  share (个人信息界面)
//
//  Created by tuqiangyao on 2018/8/2.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface privateLetterViewController : UIViewController
<UITabBarDelegate,
UITableViewDataSource>
{
    UITableView *_tableView;
}
@end
