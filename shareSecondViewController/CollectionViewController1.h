//
//  CollectionViewController1.h
//  UICollect
//
//  Created by tuqiangyao on 2018/7/26.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController1 : UIViewController

<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>
{
    UICollectionView* mainCollectionView;
}
@end
