//
//  basicsViewController.m
//  share
//
//  Created by tuqiangyao on 2018/7/30.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "basicsViewController.h"
#import "fixViewController.h"

@interface basicsViewController ()

@end

@implementation basicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell1;
    //标题
    NSArray *sec = [NSArray arrayWithObjects:@"头像", @"昵称", @"签名",@"性别", @"邮箱", nil];
    
    if (indexPath.section == 0) {
        if (cell1 == nil) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            UILabel *nameLable = [[UILabel alloc] init];
            nameLable.text = [sec objectAtIndex:indexPath.section];
            nameLable.frame = CGRectMake(40, 50, 50, 20);
            
            UIImageView *pictureImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sixin_img1"]];
            pictureImageView.frame = CGRectMake(120, 10, 100, 100);
            
            [cell1.contentView addSubview:nameLable];
            [cell1.contentView addSubview:pictureImageView];
        }
        return cell1;
    }
    if (indexPath.section == 3) {
        if (cell1 == nil) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            UILabel *nameLable = [[UILabel alloc] init];
            nameLable.text = [sec objectAtIndex:indexPath.section];
            nameLable.frame = CGRectMake(40, 20, 100, 20);
            
            UIButton *firstButton = [[UIButton alloc] init];
            firstButton.frame = CGRectMake(120, 15, 70, 30);
            //按钮点击事件切换
            [firstButton setTitle:@" 男" forState:UIControlStateNormal];
            [firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [firstButton setImage:[UIImage imageNamed:@"boy_button"] forState:UIControlStateNormal];
            
            UIButton *secondButton = [[UIButton alloc] init];
            secondButton.frame = CGRectMake(200, 15, 70, 30);
            //按钮点击事件切换
            [secondButton setTitle:@" 女" forState:UIControlStateNormal];
            [secondButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [secondButton setImage:[UIImage imageNamed:@"girl_button"] forState:UIControlStateNormal];
            
            [cell1.contentView addSubview:nameLable];
            [cell1.contentView addSubview:firstButton];
            [cell1.contentView addSubview:secondButton];
        }
        return cell1;
    } else {
        if (cell1 == nil) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            UILabel *nameLable = [[UILabel alloc] init];
            nameLable.text = [sec objectAtIndex:indexPath.section];
            nameLable.frame = CGRectMake(40, 20, 100, 20);
            
            UILabel *lable = [[UILabel alloc] init];
            lable.frame = CGRectMake(120, 20, 300, 20);
            if (indexPath.section == 1) {
                lable.text = @"share小白";
            } else if (indexPath.section == 2) {
                lable.text = @"开心了就笑，不开心了就过会再笑";
            } else {
                lable.text = @"186####3@qq.com";
            }
            
            [cell1.contentView addSubview:nameLable];
            [cell1.contentView addSubview:lable];
        }
        return cell1;
    }
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
    if (indexPath.section == 0) {
        return 120;
    } else {
        return 60;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    [self.navigationController popViewControllerAnimated:YES];
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
