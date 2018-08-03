//
//  searchViewController.m
//  ios搜索栏
//
//  Created by tuqiangyao on 2018/8/1.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "searchViewController.h"
#import "searchTableViewCell.h"

@interface searchViewController ()

@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[searchTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    searchTableViewCell *cell = nil;
    NSArray *row1 = [NSArray arrayWithObjects:@"Icon of Baymax", @"每个人都需要一个大白",nil];
    NSArray *row2 = [NSArray arrayWithObjects:@"share小白",@"share小王", nil];
    NSArray *row3 = [NSArray arrayWithObjects:@"原创-UI-icon", @"原创作品-摄影", nil];
    NSArray *row4 = [NSArray arrayWithObjects:@"15分钟前", @"1个月前", nil];
    
    NSString* str5 = [NSString stringWithFormat:@"button_zan"];
    NSString* str6 = [NSString stringWithFormat:@"button_share"];
    NSString* str7 = [NSString stringWithFormat:@"button_guanzhu"];

    NSArray *row5 = [NSArray arrayWithObjects:@"DBPicture1", @"DBPicture2", nil];
    if (cell == nil) {
        cell = [_tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        UIButton *but1 = [[UIButton alloc] init];
        but1.backgroundColor = [UIColor whiteColor];
        but1.frame = CGRectMake(200, 110, 50, 20);
        //按钮点击事件切换
        [but1 setTitle:@" 101" forState:UIControlStateNormal];
        [but1 setTitle:@" 102" forState:UIControlStateSelected];
        [but1 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
        but1.titleLabel.font = [UIFont systemFontOfSize:15];
        [but1 setImage:[UIImage imageNamed:str5] forState:UIControlStateNormal];
        [but1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *but2 = [[UIButton alloc] init];
        but2.backgroundColor = [UIColor whiteColor];
        but2.frame = CGRectMake(260, 110, 50, 20);
        //按钮点击事件切换
        [but2 setTitle:@" 26" forState:UIControlStateNormal];
        but2.titleLabel.font = [UIFont systemFontOfSize:15];
        [but2 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
        [but2 setImage:[UIImage imageNamed:str7] forState:UIControlStateNormal];
        
        UIButton *but3 = [[UIButton alloc] init];
        but3.backgroundColor = [UIColor whiteColor];
        but3.frame = CGRectMake(320, 110, 50, 20);
        //按钮点击事件切换
        [but3 setTitle:@" 20" forState:UIControlStateNormal];
        but3.titleLabel.font = [UIFont systemFontOfSize:15];
        [but3 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
        [but3 setImage:[UIImage imageNamed:str6] forState:UIControlStateNormal];
        
        
        [cell.contentView addSubview:but1];
        [cell.contentView addSubview:but2];
        [cell.contentView addSubview:but3];
    }
    cell.name.text = [row1 objectAtIndex:indexPath.section];
    cell.datlName1.text = [row2 objectAtIndex:indexPath.section];
    cell.datlName2.text = [row3 objectAtIndex:indexPath.section];
    cell.datlName3.text = [row4 objectAtIndex:indexPath.section];
    cell.iView.image = [UIImage imageNamed:[row5 objectAtIndex:indexPath.section]];
    return cell;
}

-(void)buttonClick:(UIButton*) button
{
    button.selected = !button.selected;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
//获取尾部高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
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
    return 140;
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
