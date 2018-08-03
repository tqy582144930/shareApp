//
//  fixViewController.m
//  share
//
//  Created by tuqiangyao on 2018/7/30.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "fixViewController.h"

@interface fixViewController ()

@end

@implementation fixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIButton *firstButton = [[UIButton alloc] init];
    firstButton.frame = CGRectMake(160, 240, 80, 35);
    //按钮点击事件切换
    [firstButton setTitle:@"提交" forState:UIControlStateNormal];
    [firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    firstButton.backgroundColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
    firstButton.titleLabel.font = [UIFont systemFontOfSize:20];
    firstButton.layer.cornerRadius = 5.0;
    firstButton.layer.borderColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f].CGColor;
    firstButton.layer.borderWidth = 1.0f;
    [firstButton addTarget:self action:@selector(actionSheet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:firstButton];
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell1;
    //标题
    NSArray *sec = [NSArray arrayWithObjects:@"旧密码", @"新密码", @"确认密码", nil];
    
    if (cell1 == nil) {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        
        UILabel *nameLable = [[UILabel alloc] init];
        nameLable.text = [sec objectAtIndex:indexPath.section];
        nameLable.frame = CGRectMake(40, 20, 80, 20);
        
        NSArray *array = [NSArray arrayWithObjects:@"6-20英文或数字结合", @"6-20英文或数字结合",@"6-20英文或数字结合", nil];
      
        _tfUserword = [[UITextField alloc] init];
        _tfUserword.frame = CGRectMake(130, 15, 320, 30);
        _tfUserword.placeholder = [array objectAtIndex:indexPath.section];
       // _tfUserword.keyboardType = UIKeyboardTypeNumberPad;
        _tfUserword.secureTextEntry = YES;
        _tfUserword.delegate = self;
        
        [cell1.contentView addSubview:nameLable];
        [cell1.contentView addSubview:_tfUserword];
        
    }
    return cell1;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_tfUserword resignFirstResponder];
    return YES;
}

//- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [_tfUserword resignFirstResponder];
//}

-(void)actionSheet{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否提交" message:@"提交后不可更改" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"提交" style:UIAlertActionStyleDestructive handler:nil];
    
    [alertController addAction:cancelAction];
    
    [alertController addAction:deleteAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}





- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

//获取尾部高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 3) {
        return 530;
    } else {
        return 60;
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
