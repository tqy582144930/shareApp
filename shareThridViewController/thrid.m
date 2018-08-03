//
//  thrid.m
//  share
//
//  Created by tuqiangyao on 2018/7/27.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "thrid.h"
#import "thridTableViewCell.h"

@interface thrid ()

@end

@implementation thrid

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.00f green:0.54f blue:0.80f alpha:1.00f];
    //修改按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //修改字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:22],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"文章";
    self.tabBarController.tabBar.hidden = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.93f blue:0.96f alpha:1.00f];
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    NSArray *array = @[@"精选文章", @"热门推荐", @"全部文章"];
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:array];
    _segmentedControl.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
    _segmentedControl.selectedSegmentIndex = 0;
    _segmentedControl.tintColor = [UIColor whiteColor];
    _segmentedControl.momentary = NO;
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                     forState:UIControlStateNormal];
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.45f green:0.45f blue:0.45f alpha:1.00f], NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                     forState:UIControlStateSelected];
    [_segmentedControl setBackgroundColor:[UIColor colorWithRed:0.32f green:0.32f blue:0.32f alpha:1.00f]];
    [_segmentedControl setBackgroundImage:[UIImage imageNamed:@"1111"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_segmentedControl setDividerImage:[UIImage imageNamed:@"essay_line"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_segmentedControl addTarget:self action:@selector(roll:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedControl];
    
    
    _scrollView.bounces = NO;
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    _scrollView.bounces = YES;
    _scrollView.bouncesZoom = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    [self.scrollView addSubview:_tableView1];
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*1 + 10, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    [self.scrollView addSubview:_tableView2];
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*2 +10, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    [self.scrollView addSubview:_tableView3];
    
    _tableView1.tag = 101;
    _tableView2.tag = 102;
    _tableView3.tag = 103;
    [_tableView1 registerClass:[thridTableViewCell class] forCellReuseIdentifier:@"pictureCell1"];
    [_tableView2 registerClass:[thridTableViewCell class] forCellReuseIdentifier:@"pictureCell2"];
    [_tableView3 registerClass:[thridTableViewCell class] forCellReuseIdentifier:@"pictureCell3"];
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void) roll: (UISegmentedControl *) sem {
    NSInteger selectindext = _segmentedControl.selectedSegmentIndex;
    if (selectindext == 0) {
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    if (selectindext == 1) {
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*1, 0) animated:YES];
    }
    if (selectindext == 2) {
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*2, 0) animated:YES];
    }
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
    thridTableViewCell *cell1 = nil;
    thridTableViewCell *cell2 = nil;
    thridTableViewCell *cell3 = nil;
    
    //图片
    NSString* str1 = [NSString stringWithFormat:@"note_img1"];
    NSString* str2 = [NSString stringWithFormat:@"note_img2"];
    NSString* str3 = [NSString stringWithFormat:@"note_img3"];
    NSString* str4 = [NSString stringWithFormat:@"note_img4"];
    NSString* str8 = [NSString stringWithFormat:@"list_img1"];
    NSString* str9 = [NSString stringWithFormat:@"list_img2"];
    NSString* str10 = [NSString stringWithFormat:@"list_img3"];
    

    NSArray* row1 = [NSArray arrayWithObjects:str1, str2, str3, str4, nil];
    NSArray* row2 = [NSArray arrayWithObjects:str8, str9, str3, str4, nil];
    NSArray* row3 = [NSArray arrayWithObjects:str9, str10, str3, str4, nil];
    
    //按钮图片
    NSString* str5 = [NSString stringWithFormat:@"button_zan"];
    NSString* str6 = [NSString stringWithFormat:@"button_share"];
    NSString* str7 = [NSString stringWithFormat:@"button_guanzhu"];
    
    
    if (tableView.tag == 101) {
        cell1 = [tableView dequeueReusableCellWithIdentifier:@"pictureCell1" forIndexPath:indexPath];
        NSArray *sec1 = [NSArray arrayWithObjects:@"关于设计反馈的5件事", @"用户设计PK战！\n脸书vs人人", @"字体故事", @"板式整理术：高效解决多风格要求",nil];
        NSArray *sec2 = [NSArray arrayWithObjects:@"share小白", @"share小王", @"share小吕", @"share小黑",nil];
        NSArray *sec3 = [NSArray arrayWithObjects:@"设计文章-原创-理论", @"设计文章-原创-Web/Flash", @"设计文章-经验-设计观点", @"设计文章-经验-案例分析",nil];
        NSArray *sec4 = [NSArray arrayWithObjects:@"15分钟前", @"16分钟前", @"17分钟前", @"18分钟前",nil];
        cell1.name.text = [sec1 objectAtIndex:indexPath.section];
        cell1.datlName1.text = [sec2 objectAtIndex:indexPath.section];
        cell1.datlName2.text = [sec3 objectAtIndex:indexPath.section];
        cell1.datlName3.text = [sec4 objectAtIndex:indexPath.section];
        [cell1.btn1 setImage:[UIImage imageNamed:str5] forState:UIControlStateNormal];
        [cell1.btn2 setImage:[UIImage imageNamed:str6] forState:UIControlStateNormal];
        [cell1.btn3 setImage:[UIImage imageNamed:str7] forState:UIControlStateNormal];
        
        cell1.iView.image = [UIImage imageNamed:[row1 objectAtIndex:indexPath.section]];
        
        return cell1;
    }else if (tableView.tag == 102) {
        cell2 = [tableView dequeueReusableCellWithIdentifier:@"pictureCell2" forIndexPath:indexPath];
        NSArray *sec1 = [NSArray arrayWithObjects:@"假日",@"国外画册欣赏",  @"字体故事", @"板式整理术：高效解决多风格要求",nil];
        NSArray *sec2 = [NSArray arrayWithObjects:@"share小白",@"share小王",  @"share小吕", @"share小黑",nil];
        NSArray *sec3 = [NSArray arrayWithObjects:@"原创-插画-练习习作",@"平面设计-画册设计",  @"设计文章-经验-设计观点", @"设计文章-经验-案例分析",nil];
        NSArray *sec4 = [NSArray arrayWithObjects:@"15分钟前", @"16分钟前",  @"17分钟前", @"18分钟前",nil];
        cell2.name.text = [sec1 objectAtIndex:indexPath.section];
        cell2.datlName1.text = [sec2 objectAtIndex:indexPath.section];
        cell2.datlName2.text = [sec3 objectAtIndex:indexPath.section];
        cell2.datlName3.text = [sec4 objectAtIndex:indexPath.section];
        [cell2.btn1 setImage:[UIImage imageNamed:str5] forState:UIControlStateNormal];
        [cell2.btn2 setImage:[UIImage imageNamed:str6] forState:UIControlStateNormal];
        [cell2.btn3 setImage:[UIImage imageNamed:str7] forState:UIControlStateNormal];
        
        cell2.iView.image = [UIImage imageNamed:[row2 objectAtIndex:indexPath.section]];
        
        return cell2;
    } else {
        cell3 = [tableView dequeueReusableCellWithIdentifier:@"pictureCell3" forIndexPath:indexPath];
        NSArray *sec1 = [NSArray arrayWithObjects:@"国外画册欣赏",@"collection扁平设计",  @"字体故事", @"板式整理术：高效解决多风格要求",nil];
        NSArray *sec2 = [NSArray arrayWithObjects:@"share小王",@"share小白",  @"share小吕", @"share小黑",nil];
        NSArray *sec3 = [NSArray arrayWithObjects:@"平面设计-画册设计",@"平面设计海报设计",  @"设计文章-经验-设计观点", @"设计文章-经验-案例分析",nil];
        NSArray *sec4 = [NSArray arrayWithObjects:@"15分钟前",@"16分钟前",  @"17分钟前", @"18分钟前",nil];
        cell3.name.text = [sec1 objectAtIndex:indexPath.section];
        cell3.datlName1.text = [sec2 objectAtIndex:indexPath.section];
        cell3.datlName2.text = [sec3 objectAtIndex:indexPath.section];
        cell3.datlName3.text = [sec4 objectAtIndex:indexPath.section];
        [cell3.btn1 setImage:[UIImage imageNamed:str5] forState:UIControlStateNormal];
        [cell3.btn2 setImage:[UIImage imageNamed:str6] forState:UIControlStateNormal];
        [cell3.btn3 setImage:[UIImage imageNamed:str7] forState:UIControlStateNormal];
        
        cell3.iView.image = [UIImage imageNamed:[row3 objectAtIndex:indexPath.section]];
        
        return cell3;
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == 0) {
        _segmentedControl.selectedSegmentIndex = 0;
    } else if (scrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width*1) {
        _segmentedControl.selectedSegmentIndex = 1;
    } else if (scrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width*2) {
        _segmentedControl.selectedSegmentIndex = 2;
    }
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
