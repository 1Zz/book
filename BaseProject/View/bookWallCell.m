//
//  bookWallCell.m
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "bookWallCell.h"

@implementation bookWallCell


- (UIImageView *)iconIV {
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc]init];
        _iconIV.contentMode = UIViewContentModeScaleToFill;
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.textColor = [UIColor blackColor];
        
    }
    return _titleLb;
}

- (UILabel *)shortIntroLb {
    if (!_shortIntroLb) {
        _shortIntroLb = [[UILabel alloc]init];
        _shortIntroLb.font = [UIFont systemFontOfSize:14];
        _shortIntroLb.textColor = [UIColor lightGrayColor];
        //设置三个点的位置
        _shortIntroLb.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _shortIntroLb;
}

- (UILabel *)authorLb {
    if (!_authorLb) {
        _authorLb = [[UILabel alloc]init];
        _authorLb.font = [UIFont systemFontOfSize:12];
        _authorLb.textColor = [UIColor greenSeaColor];
    }
    return _authorLb;
}

-(UILabel *)chapterLb
{
    if (!_chapterLb) {
        _chapterLb = [[UILabel alloc]init];
        _chapterLb.font = [UIFont systemFontOfSize:12];
        _chapterLb.textColor = [UIColor lightGrayColor];
    }
    return _chapterLb;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.shortIntroLb];
        [self.contentView addSubview:self.authorLb];
        [self.contentView addSubview:self.chapterLb];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(50,70));
            make.left.mas_equalTo(15);
        }];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(_iconIV.mas_rightMargin).mas_equalTo(15);
        }];
        [self.shortIntroLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_rightMargin).mas_equalTo(15);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(0);
        }];
        [self.authorLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_rightMargin).mas_equalTo(15);
            make.top.mas_equalTo(_shortIntroLb.mas_bottom).mas_equalTo(5);
        }];
        
        [self.chapterLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_shortIntroLb.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(_authorLb.mas_right).mas_equalTo(30);
        }];
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
