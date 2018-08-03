//
//  myMessageViewController.m
//  share (个人信息界面)
//
//  Created by tuqiangyao on 2018/7/30.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "myMessageViewController.h"
#import "focusViewController.h"
#import "privateLetterViewController.h"

@interface myMessageViewController ()

@end

@implementation myMessageViewController

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
    NSArray *sec = [NSArray arrayWithObjects:@"评论", @"推荐我的", @"新关注的", @"私信", @"活动通知", nil];
    
    NSArray *row = [NSArray arrayWithObjects:@"7", @"9", @"5", @"4", @"1", nil];
    
    if (cell1 == nil) {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        UILabel *nameLable = [[UILabel alloc] init];
        nameLable.text = [sec objectAtIndex:indexPath.section];
        nameLable.frame = CGRectMake(40, 20, 100, 20);
        
        UILabel *nameLable1 = [[UILabel alloc] init];
        nameLable1.text = [row objectAtIndex:indexPath.section];
        nameLable1.frame = CGRectMake(345, 20, 100, 20);
        
        UIImageView *pictureImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img3"]];
        pictureImageView.frame = CGRectMake(320, 20, 20, 20);
        
        [cell1.contentView addSubview:nameLable];
        [cell1.contentView addSubview:pictureImageView];
        [cell1.contentView addSubview:nameLable1];
        
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
    
    focusViewController* detailView = [[focusViewController alloc] init];
    privateLetterViewController* detailView1 = [[privateLetterViewController alloc] init];
    
    detailView.hidesBottomBarWhenPushed = YES;
    detailView1.hidesBottomBarWhenPushed = YES;
    
    if (indexPath.section == 1) {
        [self.navigationController pushViewController:detailView animated:YES];
    }
    if (indexPath.section == 3) {
        [self.navigationController pushViewController:detailView1 animated:YES];
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
