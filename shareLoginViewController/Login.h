//
//  Login.h
//  share
//
//  Created by tuqiangyao on 2018/7/27.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController
{
    UIImage* _logo;
    UIImage* _imgUser;
    UIImage* _imgPass;
    UIImage* _line;
    
    UILabel* _name;
    
    //用户名输入框
    UITextField* _tfUserName;
    //密码输入框
    UITextField* _tfPassword;
    
    //登陆按钮
    UIButton* _btLogin;
    //注册按钮
    UIButton* _btRegister;
    
}
@end
