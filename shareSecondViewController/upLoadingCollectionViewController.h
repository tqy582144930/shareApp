//
//  upLoadingCollectionViewController.h
//  share
//
//  Created by tuqiangyao on 2018/8/1.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface upLoadingCollectionViewController : UIViewController
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>
{
    UICollectionView* mainCollectionView;
}
@end
