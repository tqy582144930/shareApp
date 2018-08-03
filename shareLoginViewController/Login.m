//
//  Login.m
//  share
//
//  Created by tuqiangyao on 2018/7/27.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "Login.h"
#import "First.h"
#import "Register.h"
#import "AppDelegate.h"
#import "First.h"
#import "second.h"
#import "thrid.h"
#import "four.h"
#import "five.h"
#import "Boot.h"

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.sef
    self.view.backgroundColor = [UIColor colorWithRed:0.00f green:0.53f blue:0.80f alpha:1.00f];
    
    _logo = [UIImage imageNamed:@"login_logo"];
    UIImageView *logoView = [[UIImageView alloc] initWithImage:_logo];
    logoView.frame = CGRectMake(140, 100, 120, 120);
    
    _imgUser = [UIImage imageNamed:@"user_img"];
    UIImageView *userView = [[UIImageView alloc] initWithImage:_imgUser];
    userView.frame = CGRectMake(0, 0, 40, 40);
    
    _imgPass = [UIImage imageNamed:@"pass_img"];
    UIImageView *passView = [[UIImageView alloc] initWithImage:_imgPass];
    passView.frame = CGRectMake(0, 0, 40, 40);
    
    _line = [UIImage imageNamed:@"line"];
    UIImageView *lineView = [[UIImageView alloc] initWithImage:_line];
    lineView.frame = CGRectMake(40, 0, 2, 40);
    
    
    _name = [[UILabel alloc] init];
    _name.backgroundColor = [UIColor colorWithRed:0.00f green:0.53f blue:0.80f alpha:1.00f];
    _name.text = @"SHARE";
    _name.textColor = [UIColor whiteColor];
    _name.font = [UIFont systemFontOfSize:40];
    _name.frame = CGRectMake(140, 230, 200, 35);
    
    //用户名输入提示框
    _tfUserName = [[UITextField alloc] init];
    _tfUserName.frame = CGRectMake(50, 310, 320, 50);
    _tfUserName.placeholder = @"请输入用户名";
    _tfUserName.borderStyle = UITextBorderStyleRoundedRect;
    
    //密码输入框
    _tfPassword = [[UITextField alloc] init];
    _tfPassword.frame = CGRectMake(50, 370, 320, 50);
    _tfPassword.placeholder = @"请输入密码...";
    _tfPassword.borderStyle = UITextBorderStyleRoundedRect;
    _tfPassword.secureTextEntry = YES;
    
    
    _tfUserName.leftView = userView;
    _tfUserName.leftViewMode = UITextFieldViewModeAlways;
    
    _tfPassword.leftView = passView;
    _tfPassword.leftViewMode = UITextFieldViewModeAlways;
    
    //    _tfPassword.leftView = lineView;
    //    _tfPassword.leftViewMode = UITextFieldViewModeAlways;
    
    //    _tfUserName.leftView = lineView;
    //    _tfUserName.leftViewMode = UITextFieldViewModeAlways;
    
    //登陆注册按钮
    _btLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btLogin.backgroundColor = [UIColor colorWithRed:0.00f green:0.53f blue:0.80f alpha:1.00f];
    _btLogin.frame = CGRectMake(90, 450, 110, 40);
    _btLogin.tintColor = [UIColor whiteColor];
    [_btLogin.layer setCornerRadius:10];
    [_btLogin.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_btLogin.layer setBorderWidth:2];
    [_btLogin setTitle:@"登陆" forState:UIControlStateNormal];
    _btLogin.titleLabel.font = [UIFont systemFontOfSize:25];
    [_btLogin addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    _btRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btRegister.backgroundColor = [UIColor colorWithRed:0.00f green:0.53f blue:0.80f alpha:1.00f];
    _btRegister.frame = CGRectMake(230, 450, 110, 40);
    _btRegister.tintColor = [UIColor whiteColor];
    [_btRegister.layer setCornerRadius:10];
    [_btRegister.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_btRegister.layer setBorderWidth:2];
    [_btRegister setTitle:@"注册" forState:UIControlStateNormal];
    _btRegister.titleLabel.font = [UIFont systemFontOfSize:25];
    [_btRegister addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor colorWithRed:0.00f green:0.53f blue:0.80f alpha:1.00f];
    button.frame = CGRectMake(50, 510, 120, 20);
    
    [button setTitle:@"自动登录" forState:UIControlStateNormal];
    [button setTitle:@"自动登录" forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"checkbox_unchecked"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"checkbox_checked"] forState:UIControlStateSelected];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [button setTitleColor:[UIColor colorWithRed:0.00f green:0.31f blue:0.60f alpha:1.00f] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 100)];
    
    [self.view addSubview:logoView];
    [self.view addSubview:passView];
    [self.view addSubview:userView];
    [self.view addSubview:_name];
    [self.view addSubview:_tfPassword];
    [self.view addSubview:_tfUserName];
    [self.view addSubview:_btRegister];
    [self.view addSubview:_btLogin];
    [self.view addSubview:button];
    
}

-(void)buttonClick:(UIButton*) button
{
    button.selected = !button.selected;
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //使虚拟键盘回收，不再作为第一消息响应者
    [_tfUserName resignFirstResponder];
    [_tfPassword resignFirstResponder];
}


- (void) pressRegister
{
    Register* regist = [[Register alloc] init];
    regist.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.9 animations:^{
        regist.view.transform = CGAffineTransformIdentity;
    }];
    
    self.view.window.rootViewController = regist;
    
}

- (void)pressLogin
{
    First* login = [[First alloc] init];

    First* firstView = [[First alloc] init];
    firstView.tabBarItem.image = [[UIImage imageNamed:@"radio_button1_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    firstView.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button1_pressed"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    second* secondView = [[second alloc] init];
    secondView.tabBarItem.image = [[UIImage imageNamed:@"radio_button2_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    secondView.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button2_pressed"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    thrid* thridView = [[thrid alloc] init];
    thridView.tabBarItem.image = [[UIImage imageNamed:@"radio_button3_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    thridView.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button3_pressed"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    four* fourView = [[four alloc] init];
    fourView.tabBarItem.image = [[UIImage imageNamed:@"radio_button4_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fourView.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button4_pressed"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    five* fiveView = [[five alloc] init];
    fiveView.tabBarItem.image = [[UIImage imageNamed:@"radio_button5_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fiveView.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button5_pressed"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarController* tabController = [[UITabBarController alloc] init];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:0.11f green:0.11f blue:0.11f alpha:1.00f]];
    [UITabBar appearance].translucent = NO;
    
    //Boot* boot = [[Boot alloc] init];
    
    UINavigationController* nav1= [[UINavigationController alloc] initWithRootViewController:firstView];
    UINavigationController* nav2= [[UINavigationController alloc] initWithRootViewController:secondView];
    UINavigationController* nav3= [[UINavigationController alloc] initWithRootViewController:thridView];
    UINavigationController* nav4= [[UINavigationController alloc] initWithRootViewController:fourView];
    UINavigationController* nav5= [[UINavigationController alloc] initWithRootViewController:fiveView];

    NSArray* arrayVC = [NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nav5, nil];
    tabController.viewControllers = arrayVC;
    
    AppDelegate * appDelagete = [UIApplication sharedApplication].delegate;

    appDelagete.window.rootViewController = tabController;
    
    self.view.window.rootViewController = login;
    
    login.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.3 animations:^{
        login.view.transform = CGAffineTransformIdentity;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
