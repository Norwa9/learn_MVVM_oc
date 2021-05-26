//
//  TestViewModel.m
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//
/*
 viewModel的作用：
 1.viewModel updates model。
    headerRefreshRequestWithCallback:
    footerRefreshRequestWithCallback:
 2.viewModel updates viewController/View。
    gotoNextVCWithViewModel:
    cellForRowAtIndexPath
    numberOfRowsInSection
 
 或者说：处理相关逻辑（业务，视图显示）和网络请求，桥接model与viewController/view。
 */
#import "TestViewModel.h"
#import "NextViewController.h"

@interface TestViewModel ()

@end

@implementation TestViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)headerRefreshRequestWithCallback:(callback)callback
{
    //后台执行：
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            //主线程刷新视图
            NSMutableArray *arr=[NSMutableArray array];
            for (int i=0; i<16; i++) {
                NSString *vcName = @"";
                TestModel *model=[[TestModel alloc] init];
                if (i < 6) {
                    model.testEnum = 0;
                    vcName = @"跳转到a";
                } else if ( i >= 6 && i < 10) {
                    model.testEnum = 1;
                    vcName = @"跳转到b";
                }else{
                    model.testEnum = 2;
                    vcName = @"跳转到c";
                }
                NSString *string=[NSString stringWithFormat:@"    %@",vcName];
                model.title=string;
                self.model = model;
                [arr addObject:model];

            }
            self.models = arr;
            callback(self.models);
        });
    });
}

- (void )footerRefreshRequestWithCallback:(callback)callback
{
    //后台执行：
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            //主线程刷新视图
            NSMutableArray *arr=[NSMutableArray array];
            for (int i=0; i<16; i++) {
                NSString *vcName = @"";
                TestModel *model=[[TestModel alloc] init];
                if (i < 6) {
                    model.testEnum = 0;
                    vcName = @"跳转到aaaa";
                } else if ( i >= 6 && i < 10) {
                    model.testEnum = 1;
                    vcName = @"跳转到bbbb";
                }else{
                    model.testEnum = 2;
                    vcName = @"跳转到cccc";
                }
                NSString *string=[NSString stringWithFormat:@"    %@",vcName];
                model.title=string;
                [arr addObject:model];
            }
            self.models = arr;
            callback(self.models);//MVVM：viewModel更新viewController
        });
    });
}


/**
 控制器的跳转

 @param viewModel viewModel
 */
- (void)gotoNextVCWithViewModel:(TestViewModel *)viewModel {
    NSArray<TestModel *> *models = viewModel.models;
    NSInteger row = viewModel.row;
    //跳转逻辑处理
    if (_goToVC) {
        _goToVC(models[row].testEnum);
    }
    
}







@end
