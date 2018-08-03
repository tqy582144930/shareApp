//
//  Register.h
//  share
//
//  Created by tuqiangyao on 2018/7/27.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Register : UIViewController
{
    UIImage* _logo;
    UIImage* _imgUser;
    UIImage* _imgPass;
    UIImage* _imgBox;
    
    UILabel* _name;
    
    UITextField* _tfBoxName;
    //用户名输入框
    UITextField* _tfUserName;
    //密码输入框
    UITextField* _tfPassword;
    
}
@end
