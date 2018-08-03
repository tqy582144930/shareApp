//
//  uploadingTableViewCell.m
//  share (个人信息界面)
//
//  Created by tuqiangyao on 2018/7/30.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "uploadingTableViewCell.h"

@implementation uploadingTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.name = [[UILabel alloc] init];
        _name.backgroundColor = [UIColor whiteColor];
        _name.textColor = [UIColor blackColor];
        _name.font = [UIFont systemFontOfSize:18];
        _name.numberOfLines = 0;
        [self.contentView addSubview:_name];
        
        self.datlName1 = [[UILabel alloc] init];
        _datlName1.backgroundColor = [UIColor whiteColor];
        _datlName1.textColor = [UIColor blackColor];
        _datlName1.font = [UIFont systemFontOfSize:13];
        _datlName1.textColor = [UIColor grayColor];
        [self.contentView addSubview:_datlName1];
        
        self.datlName2 = [[UILabel alloc] init];
        _datlName2.backgroundColor = [UIColor whiteColor];
        _datlName2.textColor = [UIColor blackColor];
        _datlName2.font = [UIFont systemFontOfSize:13];
        _datlName2.textColor = [UIColor grayColor];
        [self.contentView addSubview:_datlName2];
        
        self.datlName3 = [[UILabel alloc] init];
        _datlName3.backgroundColor = [UIColor whiteColor];
        _datlName3.textColor = [UIColor blackColor];
        _datlName3.font = [UIFont systemFontOfSize:13];
        _datlName3.textColor = [UIColor grayColor];
        [self.contentView addSubview:_datlName3];
        
        
        self.iView = [[UIImageView alloc] init];
        _iView.layer.cornerRadius = 5;
        _iView.layer.masksToBounds = YES;
        [self.contentView addSubview:_iView];
        
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    _name.frame = CGRectMake(200, 15, 200, 50);
    
    _datlName1.frame = CGRectMake(320, 50, 100, 15);
    _datlName2.frame = CGRectMake(200, 65, 300, 20);
    _datlName3.frame = CGRectMake(200, 85, 300, 20);
    
    
    _iView.frame = CGRectMake(0, 0, 180, 140);
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
