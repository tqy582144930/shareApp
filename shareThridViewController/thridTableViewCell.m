//
//  thridTableViewCell.m
//  share
//
//  Created by tuqiangyao on 2018/7/30.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "thridTableViewCell.h"

@implementation thridTableViewCell
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
        
        _btn1 = [[UIButton alloc] init];
        _btn1.backgroundColor = [UIColor whiteColor];
        
        //按钮点击事件切换
        [_btn1 setTitle:@" 101" forState:UIControlStateNormal];
        [_btn1 setTitle:@" 102" forState:UIControlStateSelected];
        [_btn1 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
        _btn1.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btn1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_btn1];
        
        _btn2 = [[UIButton alloc] init];
        _btn2.backgroundColor = [UIColor whiteColor];
        
        //按钮点击事件切换
        [_btn2 setTitle:@" 26" forState:UIControlStateNormal];
        _btn2.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btn2 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
        [self.contentView addSubview:_btn2];
        
        _btn3 = [[UIButton alloc] init];
        _btn3.backgroundColor = [UIColor whiteColor];
        
        //按钮点击事件切换
        [_btn3 setTitle:@" 20" forState:UIControlStateNormal];
        _btn3.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btn3 setTitleColor:[UIColor colorWithRed:0.31f green:0.62f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
        [self.contentView addSubview:_btn3];
        
        
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
    
    _btn1.frame = CGRectMake(200, 110, 50, 20);
    _btn2.frame = CGRectMake(260, 110, 50, 20);
    _btn3.frame = CGRectMake(320, 110, 50, 20);
    
    _iView.frame = CGRectMake(0, 0, 180, 140);
    
    
}

-(void)buttonClick:(UIButton*) button
{
    button.selected = !button.selected;
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
