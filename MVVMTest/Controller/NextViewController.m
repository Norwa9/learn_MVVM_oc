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
    
    nextViewModel = [NextViewModel new];
}


-(void)changeVCTitle{
    [nextViewModel getNextVCTitleWithCallback:^(NextModel * _Nonnull model) {
        self.title = model.vcTitle;
//        NSLog(@"%@",model.vcTitle);
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


@end
