//
//  DuihuaViewController.m
//  share
//
//  Created by tuqiangyao on 2018/8/2.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "DuihuaViewController.h"
#import "MKJChatModel.h"
#import "MKJInputView.h"
#import "MKJChatTableViewCell.h"

@interface DuihuaViewController ()
<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSouce;
@property (nonatomic,strong) MKJInputView *inputView;

@end
static NSString *identify = @"MKJChatTableViewCell";


@implementation DuihuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.00f green:0.54f blue:0.80f alpha:1.00f];
    //修改按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //修改字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:22],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"与share小兰对话";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //这里要改尺寸
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 414, 736 - 30) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    // 这个是Xib的注册，尼玛写多了写错了
    //    [self.tableView registerNib:[UINib nibWithNibName:identify bundle:nil] forCellReuseIdentifier:identify];
    [self.tableView registerClass:[MKJChatTableViewCell class] forCellReuseIdentifier:identify];
    
    // 小技巧，用了之后不会出现多余的Cell
    UIView *view = [[UIView alloc] init];
    self.tableView.tableFooterView = view;
    
    // 底部输入栏
    //这里要改尺寸
    self.inputView = [[MKJInputView alloc] initWithFrame:CGRectMake(0, 736 - 37 -64, 414, 30)];
    self.inputView.backgroundColor = [UIColor whiteColor];
    self.inputView.textField.delegate = self;
    [self.inputView.button addTarget:self action:@selector(clickSengMsg:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.inputView];
    
    // 注册键盘的通知hide or show
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
    // 增加手势，点击弹回
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    [self.view addGestureRecognizer:tap];
    
}
- (void)click:(UITapGestureRecognizer *)tap
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}
// 监听键盘弹出
- (void)keyBoardShow:(NSNotification *)noti
{
    // 咱们取自己需要的就好了
    CGRect rec = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.inputView.frame = CGRectMake(0, 736 - 37-64 , 414, 30);
    // 小于，说明覆盖了输入框
    if ([UIScreen mainScreen].bounds.size.height - rec.size.height  < self.inputView.frame.origin.y + self.inputView.frame.size.height)
    {
        // 把我们整体的View往上移动
        CGRect tempRec = self.view.frame;
        tempRec.origin.y = - (rec.size.height - 64 );
        self.view.frame = tempRec;
    }
    // 由于可见的界面缩小了，TableView也要跟着变化Frame
    //这里要改尺寸
    self.tableView.frame = CGRectMake(0, rec.size.height, 414, 736 - 75 - rec.size.height - 30);
    if (self.dataSouce.count != 0)
    {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.dataSouce.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    
    
}
// 监听键盘隐藏
- (void)keyboardHide:(NSNotification *)noti
{
    //这里要改尺寸
    self.view.frame = CGRectMake(0, 0, 414, 736+64+30);
    self.inputView.frame = CGRectMake(0, 736 - 37 , 414, 30);
    //这里要改尺寸
    self.tableView.frame = CGRectMake(0, 64, 414, 736 - 64 - 30);
}

- (void)clickSengMsg:(UIButton *)btn
{
    if (![self.inputView.textField.text isEqualToString:@""])
    {
        MKJChatModel *chatModel = [[MKJChatModel alloc] init];
        chatModel.msg = self.inputView.textField.text;
        chatModel.isRight = arc4random() % 2; // 0 or 1
        [self.dataSouce addObject:chatModel];
    }
    [self.tableView reloadData];
    // 滚到底部  scroll so row of interest is completely visible at top/center/bottom of view
    if (self.dataSouce.count != 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.dataSouce.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MKJChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    [cell refreshCell:self.dataSouce[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MKJChatModel *model = self.dataSouce[indexPath.row];
    CGRect rec =  [model.msg boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    return rec.size.height + 45 ;
    
}

- (NSMutableArray *)dataSouce
{
    if (_dataSouce == nil) {
        _dataSouce = [[NSMutableArray alloc] init];
    }
    return _dataSouce;
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
