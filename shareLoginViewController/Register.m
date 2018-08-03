//
//  Register.m
//  share
//
//  Created by tuqiangyao on 2018/7/27.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "Register.h"
#import "Login.h"

@interface Register ()

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.00f green:0.53f blue:0.80f alpha:1.00f];
    
    _logo = [UIImage imageNamed:@"login_logo"];
    UIImageView *logoView = [[UIImageView alloc] initWithImage:_logo];
    logoView.frame = CGRectMake(140, 80, 120, 120);
    
    _imgUser = [UIImage imageNamed:@"user_img"];
    UIImageView *userView = [[UIImageView alloc] initWithImage:_imgUser];
    userView.frame = CGRectMake(0, 0, 40, 40);
    
    _imgPass = [UIImage imageNamed:@"pass_img"];
    UIImageView *passView = [[UIImageView alloc] initWithImage:_imgPass];
    passView.frame = CGRectMake(0, 0, 40, 40);
    
    _imgBox = [UIImage imageNamed:@"email_img"];
    UIImageView *boxView = [[UIImageView alloc] initWithImage:_imgPass];
    boxView.frame = CGRectMake(0, 0, 40, 40);
    
    _name = [[UILabel alloc] init];
    _name.backgroundColor = [UIColor colorWithRed:0.00f green:0.53f blue:0.80f alpha:1.00f];
    _name.text = @"SHARE";
    _name.textColor = [UIColor whiteColor];
    _name.font = [UIFont systemFontOfSize:35];
    _name.frame = CGRectMake(148, 210, 200, 35);
    
    _tfBoxName = [[UITextField alloc] init];
    _tfBoxName.frame = CGRectMake(50, 290, 320, 50);
    _tfBoxName.placeholder = @"请输入邮箱";
    _tfBoxName.borderStyle = UITextBorderStyleRoundedRect;
    
    //用户名输入提示框
    _tfUserName = [[UITextField alloc] init];
    _tfUserName.frame = CGRectMake(50, 355, 320, 50);
    _tfUserName.placeholder = @"请输入用户名";
    _tfUserName.borderStyle = UITextBorderStyleRoundedRect;
    
    //密码输入框
    _tfPassword = [[UITextField alloc] init];
    _tfPassword.frame = CGRectMake(50, 420, 320, 50);
    _tfPassword.placeholder = @"请输入密码...";
    _tfPassword.borderStyle = UITextBorderStyleRoundedRect;
    _tfPassword.secureTextEntry = YES;
    
    _tfBoxName.leftView = boxView;
    _tfBoxName.leftViewMode = UITextFieldViewModeAlways;
    
    _tfUserName.leftView = userView;
    _tfUserName.leftViewMode = UITextFieldViewModeAlways;
    
    _tfPassword.leftView = passView;
    _tfPassword.leftViewMode = UITextFieldViewModeAlways;
    
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor colorWithRed:0.00f green:0.53f blue:0.80f alpha:1.00f];
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 2;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:5];
    button.frame = CGRectMake(140, 530, 140, 40);
    [button setTitle:@"确认注册" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:25];
    button.tintColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:logoView];
    [self.view addSubview:passView];
    [self.view addSubview:userView];
    [self.view addSubview:_tfBoxName];
    [self.view addSubview:_name];
    [self.view addSubview:_tfPassword];
    [self.view addSubview:_tfUserName];
    [self.view addSubview:button];
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //使虚拟键盘回收，不再作为第一消息响应者
    [_tfUserName resignFirstResponder];
    [_tfPassword resignFirstResponder];
    [_tfBoxName resignFirstResponder];
}

- (void) pressLogin
{
    Login* enter = [[Login alloc] init];
    enter.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.9 animations:^{
        enter.view.transform = CGAffineTransformIdentity;
    }];
    
    //[self presentViewController:enter animated:YES completion:nil];
    self.view.window.rootViewController = enter;
    
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
