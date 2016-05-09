//
//  SubBookWallViewController.m
//  BaseProject
//
//  Created by ios－33 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SubBookWallViewController.h"
#import "bookWallNetManager.h"
#import "WebBookViewController.h"

#import "Factory.h"

#import "MobClick.h"
#import "MobClickSocialAnalytics.h"
@interface SubBookWallViewController ()

@property (nonatomic , strong) UIImageView *imageView; //  图片
@property (nonatomic , strong) UILabel *titleLb; // 书名
@property (nonatomic , strong) UILabel *cat; // 类型
@property (nonatomic , strong) UILabel *author; // 作者
@property (nonatomic , strong) UILabel *wordCount; // 字数
@property (nonatomic , strong) UIButton *readButton; // 阅读

@property (nonatomic , strong) UIView *whiteView;
@property (nonatomic , strong) UILabel *introduction;

@property (nonatomic , strong) UILabel *longintro; // 内容

@property (nonatomic , strong) NSString *bookName;


@end

@implementation SubBookWallViewController

- (instancetype)initWithBookID:(NSString *)ID {
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}
- (UIButton *)readButton {
    if (!_readButton) {
        _readButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_readButton setTitle:@"在线搜书" forState:UIControlStateNormal];
        _readButton.titleLabel.font = [UIFont systemFontOfSize:19];
        [_readButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _readButton.backgroundColor = KButUIColor;
        _readButton.layer.cornerRadius = 8;
        [_readButton bk_addEventHandler:^(id sender) {
            WebBookViewController *webVC = [[WebBookViewController alloc]init];
            NSString *path = [self.bookName stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            webVC.name = path;
            [self.navigationController pushViewController:webVC animated:YES];
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _readButton;
}
- (UIView *)whiteView {
    if (!_whiteView) {
        _whiteView = [[UIView alloc]init];
        _whiteView.backgroundColor = [UIColor whiteColor];
        
    }
    return _whiteView;
}
- (UILabel *)introduction {
    if (!_introduction) {
        _introduction = [[UILabel alloc]init];
        _introduction.text = @"内容简介";
        _introduction.font = [UIFont systemFontOfSize:19];
    }
    return _introduction;
}

- (UIImageView *)imageView {//图片
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    }
    return _imageView;
}
- (UILabel *)titleLb {//书名
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}
- (UILabel *)cat {//类型
    if (!_cat) {
        _cat = [[UILabel alloc]init];
        _cat.font = [UIFont systemFontOfSize:14];
        _cat.textColor = [UIColor lightGrayColor];
    }
    return _cat;
}
- (UILabel *)author {//作者
    if (!_author) {
        _author = [[UILabel alloc]init];
        _author.font = [UIFont systemFontOfSize:14];
        _author.textColor = [UIColor lightGrayColor];
    }
    return _author;
}
- (UILabel *)wordCount {//字数
    if (!_wordCount) {
        _wordCount = [[UILabel alloc]init];
        _wordCount.font = [UIFont systemFontOfSize:14];
        _wordCount.textColor = [UIColor lightGrayColor];
    }
    return _wordCount;
}
- (UILabel *)longintro {//内容
    if (!_longintro) {
        _longintro = [[UILabel alloc]init];
        _longintro.textColor = [UIColor lightGrayColor];
        _longintro.font = [UIFont systemFontOfSize:13];
        _longintro.numberOfLines = 0;
    }//number数字 的 Lines线
    return _longintro;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    
    [Factory addRigthItemToVC:self];
    [Factory addLeftItemToVC:self];
    
    [bookWallNetManager getSubBookID:_ID completionHandle:^(bookWallModel *model, NSError *error) {
        
        self.bookName = model.title;
        self.navigationItem.title = model.title;
        
        NSString *imageURL = [model.cover substringFromIndex:7];//Index指数
        [self.view addSubview:self.imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(80);
            make.left.mas_equalTo(17);
            make.size.mas_equalTo(CGSizeMake(60, 80));
        }];
        [_imageView setImageWithURL:[NSURL URLWithString:imageURL ] placeholderImage:[UIImage imageNamed:@"about_bad_feel"]];
        
        [self.view addSubview:self.titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_imageView);
            make.left.mas_equalTo(_imageView.mas_right).mas_equalTo(10);
        }];
        _titleLb.text = model.title;
        
        [self.view addSubview:self.cat];
        [_cat mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(3);
            make.leftMargin.mas_equalTo(_titleLb);
        }];
        _cat.text = [NSString stringWithFormat:@"类型:%@",model.cat];
        
        [self.view addSubview:self.author];
        [_author mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_cat.mas_bottom).mas_equalTo(3);
            make.leftMargin.mas_equalTo(_cat);
        }];
        _author.text = [NSString stringWithFormat:@"作者:%@",model.author];
        
        [self.view addSubview:self.wordCount];
        [_wordCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_author.mas_bottom).mas_equalTo(3);
            make.leftMargin.mas_equalTo(_author);
        }];
        _wordCount.text = [NSString stringWithFormat:@"字数:%ldW",(long)model.wordCount/10000];
        
        [self.view addSubview:self.whiteView];
        [_whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(_wordCount.mas_bottom).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(kWindowW, 30));
        }];
        
        [self.view addSubview:self.readButton];
        [_readButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(_whiteView.mas_top).mas_equalTo(-15);
            make.size.mas_equalTo(CGSizeMake(120, 25));
        }];
        
        [self.view addSubview:self.introduction];
        [_introduction mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_whiteView.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(17);
        }];
        
        [self.view addSubview:self.longintro];
        [_longintro mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_introduction.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(17);
            make.right.mas_equalTo(-10);
        }];
        _longintro.text = _shortIntro;
        
        
    }];
    NSLog(@"ID = %@",self.ID);
    
}

// 统计用户进入此界面的时长和频率
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"SubBookWallViewController"];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"SubBookWallViewController"];
}





@end
