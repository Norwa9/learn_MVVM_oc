//
//  NextViewController.m
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

#import "NextViewController.h"
#import "NextViewModel.h"
#import "Masonry.h"

@interface NextViewController ()
@property(nonatomic,strong)UIButton* button;
@property(nonatomic,strong)UIStackView *stackView;
@property(nonatomic,strong)UILabel *bestHost;
@property(nonatomic,strong)UILabel *luckyUser;
@end

@implementation NextViewController{
    NextViewModel *nextViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    // Do any additional setup after loading the view.
}

-(void)setUI{
    self.title = @"a";
    
    
    [self.view addSubview: self.button];//调用_button的getter
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    /*
     view(button)接收用户操作，然后view让viewModel(nextViewModel)去访问model获取数据
     然后反过来viewModel对view(self.title)进行更新.
     */
    [self.button addTarget:self action:@selector(changeVCTitle) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.stackView];
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.button.mas_bottom).offset(20);
//        make.size.mas_equalTo(CGSizeMake(200,50));
        make.centerX.equalTo(self.button);
    }];
    
    [self.stackView addArrangedSubview:self.bestHost];
    [self.stackView addArrangedSubview:self.luckyUser];
    
    nextViewModel = [NextViewModel new];
}


-(void)changeVCTitle{
    [nextViewModel getNextVCTitleWithCallback:^(NextModel * _Nonnull model) {
        self.title = model.vcTitle;
        self.bestHost.text = model.bestHostName;
        self.luckyUser.text = model.luckyUserName;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy
-(UIButton*)button{
    if(!_button){
        _button = [UIButton new];
        [_button setTitle:@"更改VC标题" forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor greenColor]];
        
    }
    return _button;
}
-(UIStackView*)stackView{
    if(!_stackView){
        _stackView = [UIStackView new];
        _stackView.axis = UILayoutConstraintAxisVertical;
        _stackView.distribution = UIStackViewDistributionEqualSpacing;
        _stackView.spacing =4;
        _stackView.backgroundColor = [UIColor blackColor];
    }
    return _stackView;
}
-(UILabel*)bestHost{
    if(!_bestHost){
        _bestHost = [UILabel new];
        _bestHost.textAlignment = NSTextAlignmentCenter;
        _bestHost.font = [UIFont boldSystemFontOfSize:30];
        _bestHost.textColor = [UIColor blackColor];
        _bestHost.backgroundColor = [UIColor yellowColor];
    }
    return _bestHost;
}
-(UILabel*)luckyUser{
    if(!_luckyUser){
        _luckyUser = [UILabel new];
        _luckyUser.textAlignment = NSTextAlignmentCenter;
        _luckyUser.font = [UIFont boldSystemFontOfSize:30];
        _luckyUser.textColor = [UIColor blackColor];
        _luckyUser.backgroundColor = [UIColor systemPinkColor];
    }
    return _luckyUser;
}
@end
