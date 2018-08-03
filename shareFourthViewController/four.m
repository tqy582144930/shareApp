//
//  four.m
//  share
//
//  Created by tuqiangyao on 2018/7/27.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "four.h"

@interface four ()

@end

@implementation four

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
    self.navigationItem.title = @"活动";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.93f blue:0.96f alpha:1.00f];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    //_tableView.backgroundColor = [UIColor grayColor];

    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    //标题
    NSArray *sec = [NSArray arrayWithObjects:@"下厨也要美美的，从一条围裙开始-六月鲜围裙创意设计大赛", @"MIUI主题市场让你的创意改变世界", @"华为花粉-让你的创意惊艳世界",nil];
    
    //图片
    NSString* str1 = [NSString stringWithFormat:@"activity_img1"];
    NSString* str2 = [NSString stringWithFormat:@"activity_img2"];
    NSString* str3 = [NSString stringWithFormat:@"activity_img3"];
    
    NSArray* str = [NSArray arrayWithObjects:str1, str2, str3,nil];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UILabel* titleLable = [[UILabel alloc] init];
        titleLable.frame = CGRectMake(10, 210, 400, 15);
        titleLable.text = [sec objectAtIndex:indexPath.section];
        titleLable.font = [UIFont systemFontOfSize:12];
        
        UIImageView* activityImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[str objectAtIndex:indexPath.section]]];
        activityImageView.frame = CGRectMake(0, 0,  [UIScreen mainScreen].bounds.size.width - 20, 200);
        
        [cell.contentView addSubview:titleLable];
        [cell.contentView addSubview:activityImageView];
    }
    
    return cell;
}



- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
//获取尾部高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
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
    return 235;
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
