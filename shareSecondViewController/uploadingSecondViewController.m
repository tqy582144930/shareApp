//
//  uploadingSecondViewController.m
//  share
//
//  Created by tuqiangyao on 2018/7/31.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "uploadingSecondViewController.h"
#import "LMJDropdownMenu.h"
#import "upLoadingCollectionViewController.h"

@interface uploadingSecondViewController ()

@end

@implementation uploadingSecondViewController

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.00f green:0.54f blue:0.80f alpha:1.00f];
//    //修改按钮颜色
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    //修改字体颜色
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    self.navigationController.navigationBar.translucent = NO;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    
    
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.frame = CGRectMake(10, 180, 90, 35);
    //按钮点击事件切换
    [btn1 setTitle:@"平面设计" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor whiteColor]];
    [btn1.layer setMasksToBounds:YES];
    [btn1.layer setCornerRadius:5];
    [btn1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.frame = CGRectMake(110, 180, 90, 35);
    //按钮点击事件切换
    [btn2 setTitle:@"网页设计" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor whiteColor]];
    [btn2.layer setMasksToBounds:YES];
    [btn2.layer setCornerRadius:5];
    [btn2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] init];
    btn3.frame = CGRectMake(210, 180, 90, 35);
    //按钮点击事件切换
    [btn3 setTitle:@"UI/icon" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setBackgroundColor:[UIColor whiteColor]];
    [btn3.layer setMasksToBounds:YES];
    [btn3.layer setCornerRadius:5];
    [btn3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] init];
    btn4.frame = CGRectMake(310, 180, 90, 35);
    //按钮点击事件切换
    [btn4 setTitle:@"插画/手绘" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 setBackgroundColor:[UIColor whiteColor]];
    [btn4.layer setMasksToBounds:YES];
    [btn4.layer setCornerRadius:5];
    [btn4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc] init];
    btn5.frame = CGRectMake(10, 225, 100, 35);
    //按钮点击事件切换
    [btn5 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn5 setBackgroundColor:[UIColor whiteColor]];
    [btn5.layer setMasksToBounds:YES];
    [btn5.layer setCornerRadius:5];
    [btn5 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
    UIButton *btn6 = [[UIButton alloc] init];
    btn6.frame = CGRectMake(120, 225, 85, 35);
    //按钮点击事件切换
    [btn6 setTitle:@"影视" forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn6 setBackgroundColor:[UIColor whiteColor]];
    [btn6.layer setMasksToBounds:YES];
    [btn6.layer setCornerRadius:5];
    [btn6 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn6];
    
    UIButton *btn7 = [[UIButton alloc] init];
    btn7.frame = CGRectMake(215, 225, 85, 35);
    //按钮点击事件切换
    [btn7 setTitle:@"摄影" forState:UIControlStateNormal];
    [btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn7 setBackgroundColor:[UIColor whiteColor]];
    [btn7.layer setMasksToBounds:YES];
    [btn7.layer setCornerRadius:5];
    [btn7 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn7];
    
    UIButton *btn8 = [[UIButton alloc] init];
    btn8.frame = CGRectMake(310, 225, 90, 35);
    //按钮点击事件切换
    [btn8 setTitle:@"其他" forState:UIControlStateNormal];
    [btn8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn8 setBackgroundColor:[UIColor whiteColor]];
    [btn8.layer setMasksToBounds:YES];
    [btn8.layer setCornerRadius:5];
    [btn8 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn8];
    
    nameTextField = [[UITextField alloc] init];
    nameTextField.frame = CGRectMake(0, 280, [UIScreen mainScreen].bounds.size.width, 30);
    nameTextField.borderStyle = UITextBorderStyleNone;
    nameTextField.backgroundColor = [UIColor whiteColor];
    nameTextField.placeholder = @"   作品名称";
    nameTextField.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:nameTextField];
    
    introduceTextView = [[UITextView alloc] init];
    introduceTextView.frame = CGRectMake(0, 320, [UIScreen mainScreen].bounds.size.width, 100);
    introduceTextView.text = @"  请添加作品说明/文章内容......";
    introduceTextView.font = [UIFont systemFontOfSize:16];
    introduceTextView.textColor = [UIColor colorWithRed:0.68f green:0.69f blue:0.69f alpha:1.00f];
    introduceTextView.keyboardType = UIKeyboardTypeDefault;
    introduceTextView.delegate = self;
    [self.view addSubview:introduceTextView];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(10, 495, 120, 20);
    [button setTitle:@"禁止下载" forState:UIControlStateNormal];
    [button setTitle:@"禁止下载" forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setImage:[UIImage imageNamed:@"checkbox_unchecked"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"checkbox_checked"] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    LMJDropdownMenu * dropdownMenu = [[LMJDropdownMenu alloc] init];
    dropdownMenu.layer.masksToBounds = YES;
    dropdownMenu.layer.borderWidth = 1;
    dropdownMenu.layer.borderColor = [UIColor blackColor].CGColor;
    [dropdownMenu.layer setMasksToBounds:YES];
    [dropdownMenu.layer setCornerRadius:5];
    [dropdownMenu setFrame:CGRectMake(260, 100, 120, 35)];
    [dropdownMenu setMenuTitles:@[@"设计资料",@"设计师观点",@"设计教程"] rowHeight:30];
    dropdownMenu.tintColor = [UIColor colorWithRed:0.81f green:0.80f blue:0.80f alpha:1.00f];
    dropdownMenu.delegate = self;
    [self.view addSubview:dropdownMenu];
    
    UIImageView *firstImageView = [[UIImageView alloc] init];
    firstImageView.frame = CGRectMake(260, 62, 20, 20);
    firstImageView.image = [UIImage imageNamed:@"定位 位置"];
    [self.view addSubview:firstImageView];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(285, 60, 90, 25);
    lable.text = @"陕西省,西安市";
    lable.font = [UIFont systemFontOfSize:12];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor whiteColor];
    [lable.layer setMasksToBounds:YES];
    [lable.layer setCornerRadius:12];
    lable.backgroundColor = [UIColor colorWithRed:0.00f green:0.54f blue:0.80f alpha:1.00f];
    [self.view addSubview:lable];
    
    UIButton *button1 = [[UIButton alloc] init];
    [button1 setTitle:@"发布" forState:UIControlStateNormal];
    button1.tintColor = [UIColor whiteColor];
    button1.backgroundColor = [UIColor colorWithRed:0.00f green:0.53f blue:0.80f alpha:1.00f];
    button1.frame = CGRectMake(10, 430, [UIScreen mainScreen].bounds.size.width-20, 55);
    [button1 addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIImageView *titleImageView = [[UIImageView alloc] init];
    titleImageView.backgroundColor = [UIColor colorWithRed:0.84f green:0.83f blue:0.83f alpha:1.00f];
    titleImageView.frame = CGRectMake(10, 20, 220, 130);
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(75, 70, 90, 30);
    //按钮点击事件切换
    [btn setTitle:@"选择图片" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor colorWithRed:0.84f green:0.83f blue:0.83f alpha:1.00f]];
    [btn addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:titleImageView];
    [self.view addSubview:btn];
    
}

- (void) buttonPress{
    upLoadingCollectionViewController* nextView1 = [[upLoadingCollectionViewController alloc] init];
    nextView1.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:nextView1 animated:YES];
}

-(void)pressBtn{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否发布" message:@"" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"发布" style:UIAlertActionStyleDestructive handler:nil];
    [alertController addAction:cancelAction];
    
    [alertController addAction:deleteAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"  请添加作品说明/文章内容......";
        textView.textColor = [UIColor grayColor];
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"  请添加作品说明/文章内容......"]){
        textView.text=@"  ";
        textView.textColor=[UIColor blackColor];
    }
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [introduceTextView resignFirstResponder];
    [nameTextField resignFirstResponder];
}

- (void)buttonClick1:(UIButton *)button {
    button.selected = !button.selected;
}

- (void)buttonClick:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        [button setBackgroundColor:[UIColor colorWithRed:0.00f green:0.54f blue:0.80f alpha:1.00f]];
    } else {
        [button setBackgroundColor:[UIColor whiteColor]];
    }
    
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
