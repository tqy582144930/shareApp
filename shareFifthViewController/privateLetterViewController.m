//
//  privateLetterViewController.m
//  share (个人信息界面)
//
//  Created by tuqiangyao on 2018/8/2.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "privateLetterViewController.h"
#import "DuihuaViewController.h"

@interface privateLetterViewController ()

@end

@implementation privateLetterViewController

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
    return 4;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell1;
    //标题
    NSArray *sec = [NSArray arrayWithObjects:@"share小格", @"share小兰", @"share小明", @"share小雪", @"share萌萌", @"shareLity",nil];
    NSArray *sec1 = [NSArray arrayWithObjects:@"你的作品我很喜欢！！", @"谢谢，已关注你", @"为你点赞！",@"你好可以问问你是怎么拍的吗？", nil];
    NSArray *sec2 = [NSArray arrayWithObjects:@"11-03 09:45",@"11-03 10:00",@"11-03 10:23",@"11-03 11:20", nil];
    
    NSString *str1 = [NSString stringWithFormat:@"sixin_img1"];
    NSString *str2 = [NSString stringWithFormat:@"sixin_img2"];
    NSString *str3 = [NSString stringWithFormat:@"sixin_img3"];
    NSString *str4 = [NSString stringWithFormat:@"sixin_img4"];
 
    
    NSArray *row = [NSArray arrayWithObjects:str1, str2, str3, str4, nil];
    
    if (cell1 == nil) {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        UILabel *nameLable = [[UILabel alloc] init];
        nameLable.text = [sec objectAtIndex:indexPath.section];
        nameLable.font = [UIFont systemFontOfSize:20];
        nameLable.frame = CGRectMake(110, 25, 140, 20);
        
        UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[row objectAtIndex:indexPath.section]]];
        titleImageView.frame = CGRectMake(30, 20, 60, 60);
        
        UILabel *nameLable1 = [[UILabel alloc] init];
        nameLable1.text = [sec1 objectAtIndex:indexPath.section];
        nameLable1.font = [UIFont systemFontOfSize:17];
        nameLable1.textColor = [UIColor colorWithRed:0.12f green:0.57f blue:0.82f alpha:1.00f];
        nameLable1.frame = CGRectMake(110, 60, 250, 20);
        
        UILabel *nameLable2 = [[UILabel alloc] init];
        nameLable2.text = [sec2 objectAtIndex:indexPath.section];
        nameLable2.font = [UIFont systemFontOfSize:15];
        nameLable2.textColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.83f alpha:1.00f];
        nameLable2.frame = CGRectMake(310, 25, 140, 20);
        
        [cell1.contentView addSubview:nameLable];
        [cell1.contentView addSubview:titleImageView];
        [cell1.contentView addSubview:nameLable1];
        [cell1.contentView addSubview:nameLable2];
    }
    return cell1;
    
}

-(void)buttonClick:(UIButton*) button
{
    button.selected = !button.selected;
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
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    DuihuaViewController *detailView = [[DuihuaViewController alloc] init];

    detailView.hidesBottomBarWhenPushed = YES;

    if (indexPath.section == 1) {
        [self.navigationController pushViewController:detailView animated:YES];
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
