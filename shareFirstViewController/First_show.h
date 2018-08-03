//
//  First_show.h
//  share
//
//  Created by tuqiangyao on 2018/7/29.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface First_show : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView* _tableView;
}
@property (nonatomic, strong) UIImageView *iView;
@property (nonatomic, strong) UILabel* name;
@property (nonatomic, strong) UILabel* datlName1;
@property (nonatomic, strong) UILabel* datlName2;

@end
