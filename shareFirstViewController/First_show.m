//
//  First_show.m
//  share
//
//  Created by tuqiangyao on 2018/7/29.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "First_show.h"
#import "AppDelegate.h"
#import "First.h"
#import "second.h"
#import "thrid.h"
#import "four.h"
#import "five.h"
#import "Boot.h"

@interface First_show ()

@end

@implementation First_show

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.00f green:0.54f blue:0.80f alpha:1.00f];
    //修改字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SHARE";

    UIBarButtonItem* leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressRight) ];
    leftBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
    UITableViewCell *cell = nil;
    cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    UITableViewCell *cell1 = nil;
    cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1"];
    
    //按钮图片
    NSString* str5 = [NSString stringWithFormat:@"button_zan"];
    NSString* str6 = [NSString stringWithFormat:@"button_share"];
    NSString* str7 = [NSString stringWithFormat:@"button_guanzhu"];
    if (indexPath.section == 0) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            UIButton *but1 = [[UIButton alloc] init];
            but1.backgroundColor = [UIColor whiteColor];
            but1.frame = CGRectMake(240, 60, 50, 20);
            //按钮点击事件切换
            [but1 setTitle:@" 101" forState:UIControlStateNormal];
            [but1 setTitle:@" 102" forState:UIControlStateSelected];
            [but1 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
            but1.titleLabel.font = [UIFont systemFontOfSize:12];
            [but1 setImage:[UIImage imageNamed:str5] forState:UIControlStateNormal];
            [but1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *but2 = [[UIButton alloc] init];
            but2.backgroundColor = [UIColor whiteColor];
            but2.frame = CGRectMake(300, 60, 50, 20);
            //按钮点击事件切换
            [but2 setTitle:@" 26" forState:UIControlStateNormal];
            but2.titleLabel.font = [UIFont systemFontOfSize:12];
            [but2 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
            [but2 setImage:[UIImage imageNamed:str7] forState:UIControlStateNormal];
            
            UIButton *but3 = [[UIButton alloc] init];
            but3.backgroundColor = [UIColor whiteColor];
            but3.frame = CGRectMake(360, 60, 50, 20);
            //按钮点击事件切换
            [but3 setTitle:@" 20" forState:UIControlStateNormal];
            but3.titleLabel.font = [UIFont systemFontOfSize:12];
            [but3 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
            [but3 setImage:[UIImage imageNamed:str6] forState:UIControlStateNormal];
            
            
            UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, 100, 20)];
            name.backgroundColor = [UIColor whiteColor];
            name.font = [UIFont systemFontOfSize:23];
            name.text = @"假日";
            
            UILabel *datlName1 = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 100, 20)];
            datlName1.backgroundColor = [UIColor whiteColor];
            datlName1.font = [UIFont systemFontOfSize:20];
            datlName1.text = @"share小白";
            
            UILabel *datlName2 = [[UILabel alloc] initWithFrame:CGRectMake(350, 20, 80, 20)];
            datlName2.backgroundColor = [UIColor whiteColor];
            datlName2.font = [UIFont systemFontOfSize:12];
            datlName2.text = @"15分钟前";
            
            
            UIImage *str = [UIImage imageNamed:@"works_head"];
            UIImageView* iView = [[UIImageView alloc] initWithImage:str];
            iView.frame = CGRectMake(10, 20, 50, 50);
            
            [cell.contentView addSubview:but1];
            [cell.contentView addSubview:but2];
            [cell.contentView addSubview:but3];
            [cell.contentView addSubview:datlName1];
            [cell.contentView addSubview:datlName2];
            [cell.contentView addSubview:iView];
            [cell.contentView addSubview:name];
        }
        return cell;
    } else {
        if (cell1 == nil) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            UIImage* str1 = [UIImage imageNamed:@"works_img1"];
            UIImageView* iView1 = [[UIImageView alloc] initWithImage:str1];
            iView1.frame = CGRectMake(10, 40, 390, 230);
            
            UIImage* str2 = [UIImage imageNamed:@"works_img2"];
            UIImageView* iView2 = [[UIImageView alloc] initWithImage:str2];
            iView2.frame = CGRectMake(10, 275, 390, 230);
            
            UIImage* str3 = [UIImage imageNamed:@"works_img4"];
            UIImageView* iView3 = [[UIImageView alloc] initWithImage:str3];
            iView3.frame = CGRectMake(10, 510, 390, 230);
            
            UIImage* str4 = [UIImage imageNamed:@"works_img3"];
            UIImageView* iView4 = [[UIImageView alloc] initWithImage:str4];
            iView4.frame = CGRectMake(100, 745, 230, 330);
            
            UIImage* str5 = [UIImage imageNamed:@"works_img5"];
            UIImageView* iView5 = [[UIImageView alloc] initWithImage:str5];
            iView5.frame = CGRectMake(100, 1080, 230, 330);
            
            UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 400, 20)];
            title.backgroundColor = [UIColor whiteColor];
            title.font = [UIFont systemFontOfSize:15];
            title.text = @"多希望列车能把我带到有你的城市。";
            
            
            [cell1.contentView addSubview:iView1];
            [cell1.contentView addSubview:iView2];
            [cell1.contentView addSubview:iView3];
            [cell1.contentView addSubview:iView4];
            [cell1.contentView addSubview:iView5];
            [cell1.contentView addSubview:title];
        }
        return cell1;
    }
    
}

-(void)buttonClick:(UIButton*) button
{
    button.selected = !button.selected;
}

- (void)pressRight
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

//获取尾部高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
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
        return 90;
    }else {
        return 1420;
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
