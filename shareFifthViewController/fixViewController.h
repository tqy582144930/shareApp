//
//  fixViewController.h
//  share
//
//  Created by tuqiangyao on 2018/7/30.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fixViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate
>
{
    UITableView *_tableView;
    UITextField *_tfUserword;
}
@end
