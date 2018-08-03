//
//  CollectionViewCell.m
//  UICollect
//
//  Created by tuqiangyao on 2018/7/26.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        _topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 136, 140)];
        _topImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_topImage];
    }
    return self;
}
@end
