//
//  focusViewController.m
//  share (个人信息界面)
//
//  Created by tuqiangyao on 2018/7/30.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "focusViewController.h"

@interface focusViewController ()

@end

@implementation focusViewController

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
    return 6;
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
    NSString *str1 = [NSString stringWithFormat:@"sixin_img1"];
    NSString *str2 = [NSString stringWithFormat:@"sixin_img2"];
    NSString *str3 = [NSString stringWithFormat:@"sixin_img3"];
    NSString *str4 = [NSString stringWithFormat:@"sixin_img4"];
    NSString *str5 = [NSString stringWithFormat:@"guanzhu_img5"];
    NSString *str6 = [NSString stringWithFormat:@"guanzhu_img6"];
    
    NSArray *row = [NSArray arrayWithObjects:str1, str2, str3, str4, str5, str6, nil];
    
    if (cell1 == nil) {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        UILabel *nameLable = [[UILabel alloc] init];
        nameLable.text = [sec objectAtIndex:indexPath.section];
        nameLable.font = [UIFont systemFontOfSize:20];
        nameLable.frame = CGRectMake(120, 42, 140, 20);
        
        UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[row objectAtIndex:indexPath.section]]];
        titleImageView.frame = CGRectMake(30, 10, 80, 80);
        
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(300, 40, 80, 30);
        
        [button setImage:[UIImage imageNamed:@"guanzhu_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"guanzhu_pressed"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell1.contentView addSubview:nameLable];
        [cell1.contentView addSubview:button];
        [cell1.contentView addSubview:titleImageView];
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
