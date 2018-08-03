//
//  upLoadingCollectionViewController.m
//  share
//
//  Created by tuqiangyao on 2018/8/1.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "upLoadingCollectionViewController.h"
#import "uoLoadingCollectionViewCell.h"

@interface upLoadingCollectionViewController ()

@end

@implementation upLoadingCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:mainCollectionView];
    mainCollectionView.backgroundColor = [UIColor clearColor];
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [mainCollectionView registerClass:[uoLoadingCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
    mainCollectionView.allowsMultipleSelection = YES;
    
    UIBarButtonItem* rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStylePlain target:self action:@selector(upLodingBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
//    rightBtn.layer.masksToBounds = YES;
//    rightBtn.layer.borderWidth = 1;
//    rightBtn.layer.borderColor = [UIColor redColor].CGColor;
//    rightBtn.frame = CGRectMake(330, 40, 75, 30);
//    [rightBtn.layer setMasksToBounds:YES];
//    [rightBtn.layer setCornerRadius:5];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    uoLoadingCollectionViewCell *cell = (uoLoadingCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    NSString* str1 = [NSString stringWithFormat:@"upPicture1"];
    NSString* str2 = [NSString stringWithFormat:@"upPicture2"];
    NSString* str3 = [NSString stringWithFormat:@"upPicture3"];
    NSString* str4 = [NSString stringWithFormat:@"upPicture4"];
    NSString* str5 = [NSString stringWithFormat:@"upPicture5"];
    NSString* str6 = [NSString stringWithFormat:@"upPicture6"];
    NSString* str7 = [NSString stringWithFormat:@"upPicture7"];
    NSString* str8 = [NSString stringWithFormat:@"upPicture8"];
    NSString* str9 = [NSString stringWithFormat:@"upPicture9"];
    NSString* str10 = [NSString stringWithFormat:@"upPicture10"];
    NSString* str11 = [NSString stringWithFormat:@"upPicture11"];
    NSString* str12 = [NSString stringWithFormat:@"upPicture12"];
    NSString* str14 = [NSString stringWithFormat:@"guanzhu_img6"];
    NSString* str15 = [NSString stringWithFormat:@"sixin_img2"];
    NSString* str16 = [NSString stringWithFormat:@"works_head"];
    
    NSArray* sec = [NSArray arrayWithObjects:str1, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, str12, str14, str15, str16, nil];
    cell.topImage.image = [UIImage imageNamed:[sec objectAtIndex:indexPath.item]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(136, 140);
}

///处置间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

//水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

//点击item的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    uoLoadingCollectionViewCell *cell = (uoLoadingCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    UIImageView *ImageView = [[UIImageView alloc] init];
    ImageView.frame = CGRectMake(100, 20, 30, 30);
    ImageView.image = [UIImage imageNamed:@"my_button_pressed"];
    [cell.topImage addSubview:ImageView];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    uoLoadingCollectionViewCell *cell = (uoLoadingCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.topImage.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)upLodingBtn {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定上传所选内容" message:@"" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"上传" style:UIAlertActionStyleDestructive handler:nil];
    [alertController addAction:cancelAction];
    
    [alertController addAction:deleteAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
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
