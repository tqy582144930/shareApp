//
//  First.m
//  share
//
//  Created by tuqiangyao on 2018/7/27.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "First.h"
#import "AppDelegate.h"
#import "second.h"
#import "thrid.h"
#import "four.h"
#import "five.h"
#import "First_show.h"
#import "TableViewCell1.h"

@interface First ()

@end

@implementation First

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.00f green:0.54f blue:0.80f alpha:1.00f];
    //修改按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //修改字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:22],
      NSForegroundColorAttributeName:[UIColor whiteColor]}];
   
    self.navigationItem.title = @"SHARE";
    self.tabBarController.tabBar.hidden = NO;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.93f blue:0.96f alpha:1.00f];
    
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    
    UIView* titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 208)];
    //titleView.backgroundColor = [UIColor whiteColor];
    _tableView.tableHeaderView = titleView;
    
    
    _sv = [[UIScrollView alloc] init];
    _sv.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    //是否按照整页来滚动视图
    _sv.pagingEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大于Frame的大小
    _sv.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*4,200);
    //开启横向弹动效果
    _sv.alwaysBounceHorizontal = YES;
    //显示横向滚动条
    _sv.showsHorizontalScrollIndicator = NO;
    //设置背景颜色
    _sv.delegate = self;
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(100, 170, 200, 30)];
    int count = 4;
    //CGSize size = _sv.frame.size;
    
    
    for (int i = 0; i < 4; i++) {
        NSString* strName = [NSString stringWithFormat:@"main_img%d",i+1];
        
        UIImage* image = [UIImage imageNamed:strName];
        
        UIImageView* iView = [[UIImageView alloc] initWithImage:image];
        
        iView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width,200);
        
        [_sv addSubview:iView];
        
        //CGFloat x = i * size.width;
    }
    
    //4 设置pageControl
    self.pageControl.numberOfPages = count;
    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    //5 设置scrollView的代理
    _sv.delegate = self;
    //6 添加定时器
    [self addTimerTask];
    [titleView addSubview:_sv];
    [titleView addSubview:_pageControl];
    [_tableView registerClass:[TableViewCell1 class] forCellReuseIdentifier:@"pictureCell"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

//把定时器封装起来 方便调用
-(void)addTimerTask{
    //6 定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    self.timer = timer;
    
    //消息循环
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    // 默认是NSDefaultRunLoopMode  但是另外一个属性NSRunLoopCommonModes 能够在多线程中起作用
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //立即执行定时器的方法  fire 是定时器自带的方法
    // [timer fire];
}

-(void)nextImage{
    //当前页码
    NSInteger page = self.pageControl.currentPage;
    //如果是到达最后一张
    if (page == self.pageControl.numberOfPages - 1) {
        page = 0;
        //设置偏移量  当到达最后一张时候 切换到第一张  不产生从最后一张倒回第一张效果
        _sv.contentOffset = CGPointMake(0, 0);
        [_sv setContentOffset:_sv.contentOffset animated:YES];
    }else{
        page++;
    }
    //  self.scrollView setContentOffset:(CGPoint) animated:(BOOL)
    
    CGFloat offsetX = page * _sv.frame.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        self->_sv.contentOffset = CGPointMake(offsetX, 0);
    }];
}

//正在滚动的时候
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //   (offset.x + 100/2)/100
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2)/ scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}
//当你点击图片按住不动的时候 把定时器停止
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止定时器
    [self.timer invalidate];
}
//当不再按图片 也就是松开的时候 立马调用计时器方法
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    //用scheduledTimerWithTimeInterval 创建定时器是用的系统默认的方法 当遇见多线程时候会出现问题
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //所以还是调用上面创建的定时器方法
    [self addTimerTask];
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
    TableViewCell1 *cell = nil;
    cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    //标题
    NSArray *sec1 = [NSArray arrayWithObjects:@"假日", @"国外画册欣赏", @"collection扁平设计", @"板式整理术：高效解决多风格要求",nil];
    NSArray *sec2 = [NSArray arrayWithObjects:@"share小白", @"share小王", @"share小吕", @"share小黑",nil];
    NSArray *sec3 = [NSArray arrayWithObjects:@"原创-插画-联系习作", @"平面设计-画册设计", @"平面设计-海报设计", @"平面设计-排版设计",nil];
    NSArray *sec4 = [NSArray arrayWithObjects:@"15分钟前", @"16分钟前", @"17分钟前", @"18分钟前",nil];
    
    //图片
    NSString* str1 = [NSString stringWithFormat:@"list_img1"];
    NSString* str2 = [NSString stringWithFormat:@"list_img2"];
    NSString* str3 = [NSString stringWithFormat:@"list_img3"];
    NSString* str4 = [NSString stringWithFormat:@"list_img4"];
    
    NSArray* str = [NSArray arrayWithObjects:str1, str2, str3, str4, nil];
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    First_show *detailView = [[First_show alloc]init];
    if (indexPath.section == 0) {
        [self.navigationController pushViewController:detailView animated:YES];
    }
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
