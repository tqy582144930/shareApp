//
//  five.m
//  share
//
//  Created by tuqiangyao on 2018/7/27.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "five.h"
#import "setViewController.h"
#import "uploadingViewController.h"
#import "recommendViewController.h"
#import "myMessageViewController.h"


@interface five ()

@end

@implementation five

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
    self.navigationItem.title = @"个人信息";
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* array = [NSArray arrayWithObjects:@1, @1, @1, @1, @1, @1, @1, nil];
    return [[array objectAtIndex:section] integerValue];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell1;
    UITableViewCell* cell2;
    //标题
    NSArray *sec = [NSArray arrayWithObjects:@"  我上传的", @"  我的信息", @"  我推荐的", @"  院系通知", @"  设置", @"  退出", nil];
    
    //图片
    NSString* str1 = [NSString stringWithFormat:@"img2"];
    NSString* str2 = [NSString stringWithFormat:@"img4"];
    NSString* str3 = [NSString stringWithFormat:@"button_zan"];
    NSString* str4 = [NSString stringWithFormat:@"img5"];
    NSString* str8 = [NSString stringWithFormat:@"img6"];
    NSString* str9 = [NSString stringWithFormat:@"img7"];
    
    NSArray* str = [NSArray arrayWithObjects:str1, str2, str3, str4, str8, str9, nil];
    
    //按钮图片
    NSString* str5 = [NSString stringWithFormat:@"button_zan"];
    NSString* str6 = [NSString stringWithFormat:@"button_guanzhu"];
    NSString* str7 = [NSString stringWithFormat:@"img1"];
    
    if (indexPath.section == 0) {
        if (cell1 == nil) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            UIButton *but1 = [[UIButton alloc] init];
            but1.backgroundColor = [UIColor whiteColor];
            but1.frame = CGRectMake(150, 105, 50, 20);
            //按钮点击事件切换
            [but1 setTitle:@" 15" forState:UIControlStateNormal];
            [but1 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
            but1.titleLabel.font = [UIFont systemFontOfSize:15];
            [but1 setImage:[UIImage imageNamed:str7] forState:UIControlStateNormal];
            
            UIButton *but2 = [[UIButton alloc] init];
            but2.backgroundColor = [UIColor whiteColor];
            but2.frame = CGRectMake(220, 105, 50, 20);
            //按钮点击事件切换
            [but2 setTitle:@" 120" forState:UIControlStateNormal];
            but2.titleLabel.font = [UIFont systemFontOfSize:15];
            [but2 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
            [but2 setImage:[UIImage imageNamed:str5] forState:UIControlStateNormal];
            
            UIButton *but3 = [[UIButton alloc] init];
            but3.backgroundColor = [UIColor whiteColor];
            but3.frame = CGRectMake(280, 105, 70, 20);
            //按钮点击事件切换
            [but3 setTitle:@" 89" forState:UIControlStateNormal];
            but3.titleLabel.font = [UIFont systemFontOfSize:15];
            [but3 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
            [but3 setImage:[UIImage imageNamed:str6] forState:UIControlStateNormal];
            
            UILabel* nameLable1 = [[UILabel alloc] init];
            nameLable1.backgroundColor = [UIColor whiteColor];
            nameLable1.textColor = [UIColor blackColor];
            nameLable1.font = [UIFont systemFontOfSize:20];
            nameLable1.frame = CGRectMake(150, 25, 300, 20);
            nameLable1.text = @"share小白";
            
            UILabel* nameLable2 = [[UILabel alloc] init];
            nameLable2.backgroundColor = [UIColor whiteColor];
            nameLable2.textColor = [UIColor blackColor];
            nameLable2.font = [UIFont systemFontOfSize:13];
            nameLable2.frame = CGRectMake(150, 50, 300, 20);
            nameLable2.text = @"数媒/设计爱好者";
            
            UILabel* nameLable3 = [[UILabel alloc] init];
            nameLable3.backgroundColor = [UIColor whiteColor];
            nameLable3.textColor = [UIColor blackColor];
            nameLable3.font = [UIFont systemFontOfSize:15];
            nameLable3.frame = CGRectMake(150, 80, 300, 20);
            nameLable3.text = @"开心了就笑，不开心了就过会再笑";
            
            UIImageView* titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sixin_img1"]];
            titleImageView.frame = CGRectMake(30, 20, 100, 100);
            
            [cell1.contentView addSubview:but1];
            [cell1.contentView addSubview:but2];
            [cell1.contentView addSubview:but3];
            [cell1.contentView addSubview:nameLable1];
            [cell1.contentView addSubview:nameLable2];
            [cell1.contentView addSubview:nameLable3];
            [cell1.contentView addSubview:titleImageView];
            
        }
        return cell1;
    } else {
        if (cell2 == nil) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell2"];
            UIImageView *pictureImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img3"]];
            pictureImageView.frame = CGRectMake(330, 25, 15, 15);
            [cell2.contentView addSubview:pictureImageView];
        }
        
        cell2.textLabel.text = [sec objectAtIndex:indexPath.section - 1];
        cell2.imageView.image = [UIImage imageNamed:[str objectAtIndex:indexPath.section - 1]];
        
        CGSize itemSize = CGSizeMake(10, 10);
        UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
        [cell1.imageView.image drawInRect:imageRect];
        cell1.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return cell2;
    }
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

//获取尾部高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    } else {
        return 1;
    }
    
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
        return 140;
    } else {
        return 60;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    setViewController *detailView = [[setViewController alloc]init];
    uploadingViewController *detailView1 = [[uploadingViewController alloc] init];
    recommendViewController *detailView2 = [[recommendViewController alloc] init];
    myMessageViewController *detailView3 = [[myMessageViewController alloc] init];
    
    
    detailView.hidesBottomBarWhenPushed = YES;
    detailView1.hidesBottomBarWhenPushed = YES;
    detailView2.hidesBottomBarWhenPushed = YES;
    detailView3.hidesBottomBarWhenPushed = YES;
    
    if (indexPath.section == 5) {
        [self.navigationController pushViewController:detailView animated:YES];
    }
    if (indexPath.section == 1) {
        [self.navigationController pushViewController:detailView1 animated:YES];
    }
    if (indexPath.section == 3) {
        [self.navigationController pushViewController:detailView2 animated:YES];
    }
    if (indexPath.section == 2) {
        [self.navigationController pushViewController:detailView3 animated:YES];
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
