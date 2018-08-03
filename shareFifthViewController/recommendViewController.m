//
//  recommendViewController.m
//  share (个人信息界面)
//
//  Created by tuqiangyao on 2018/7/30.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "recommendViewController.h"
#import "recommendTableViewCell.h"

@interface recommendViewController ()

@end

@implementation recommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    
    //_tableView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.93f blue:0.96f alpha:1.00f];
    [_tableView registerClass:[recommendTableViewCell class] forCellReuseIdentifier:@"pictureCell"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
    recommendTableViewCell *cell = nil;
    cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    //标题
    NSArray *sec1 = [NSArray arrayWithObjects:@"匆匆那年", @"国外画册欣赏",@"collection扁平设计", @"字体故事", @"板式整理术：高效解决多风格要求",nil];
    NSArray *sec2 = [NSArray arrayWithObjects:@"share小白", @"share小王", @"share小吕", @"share小黑",@"share小王",nil];
    NSArray *sec3 = [NSArray arrayWithObjects:@"原创-摄影-练习习作", @"设计文章-原创-理论", @"设计文章-原创-Web/Flash", @"设计文章-经验-设计观点", @"设计文章-经验-设计观点", nil];
    NSArray *sec4 = [NSArray arrayWithObjects:@"10分钟前", @"16分钟前", @"17分钟前", @"45分钟前",@"58分钟前",nil];
    
    //图片
    NSString* str1 = [NSString stringWithFormat:@"list_img1"];
    NSString* str2 = [NSString stringWithFormat:@"list_img2"];
    NSString* str3 = [NSString stringWithFormat:@"list_img3"];
    NSString* str4 = [NSString stringWithFormat:@"note_img3"];
    NSString* str8 = [NSString stringWithFormat:@"note_img4"];
    
    NSArray* str = [NSArray arrayWithObjects:str1, str2, str3, str4, str8, nil];
    
    //按钮图片
    NSString* str5 = [NSString stringWithFormat:@"button_zan"];
    NSString* str6 = [NSString stringWithFormat:@"button_share"];
    NSString* str7 = [NSString stringWithFormat:@"button_guanzhu"];
    
    if (cell == nil) {
        cell = [_tableView dequeueReusableCellWithIdentifier:@"pictureCell" forIndexPath:indexPath];
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
    cell.name.text = [sec1 objectAtIndex:indexPath.section];
    cell.datlName1.text = [sec2 objectAtIndex:indexPath.section];
    cell.datlName2.text = [sec3 objectAtIndex:indexPath.section];
    cell.datlName3.text = [sec4 objectAtIndex:indexPath.section];
    
    //    [cell.btn1 setImage:[UIImage imageNamed:str5] forState:UIControlStateNormal];
    //    [cell.btn2 setImage:[UIImage imageNamed:str6] forState:UIControlStateNormal];
    //    [cell.btn3 setImage:[UIImage imageNamed:str7] forState:UIControlStateNormal];
    
    cell.iView.image = [UIImage imageNamed:[str objectAtIndex:indexPath.section]];
    
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
