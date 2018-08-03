//
//  setViewController.m
//  share
//
//  Created by tuqiangyao on 2018/7/30.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "setViewController.h"
#import "basicsViewController.h"
#import "fixViewController.h"
#import "messageViewController.h"

@interface setViewController ()

@end

@implementation setViewController

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
    NSArray *sec = [NSArray arrayWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];

    
    if (cell1 == nil) {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        UILabel *nameLable = [[UILabel alloc] init];
        nameLable.text = [sec objectAtIndex:indexPath.section];
        nameLable.frame = CGRectMake(40, 20, 100, 20);
        
        UIImageView *pictureImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img3"]];
        pictureImageView.frame = CGRectMake(320, 20, 20, 20);
        
        [cell1.contentView addSubview:nameLable];
        [cell1.contentView addSubview:pictureImageView];
        
    }
    return cell1;
    
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
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    basicsViewController *detailView = [[basicsViewController alloc]init];
    fixViewController *detailView1 = [[fixViewController alloc] init];
    messageViewController *detailView2 = [[messageViewController alloc] init];
    detailView.hidesBottomBarWhenPushed = YES;
    detailView1.hidesBottomBarWhenPushed = YES;
    detailView2.hidesBottomBarWhenPushed = YES;
    
    if (indexPath.section == 0) {
        [self.navigationController pushViewController:detailView animated:YES];
    }
    if (indexPath.section == 1) {
        [self.navigationController pushViewController:detailView1 animated:YES];
    }
    if (indexPath.section == 2) {
        [self.navigationController pushViewController:detailView2 animated:YES];
    }
    if (indexPath.section == 4) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否清除缓存" message:@"清除后不可恢复" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
        
        [alertController addAction:cancelAction];
        
        [alertController addAction:deleteAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
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
