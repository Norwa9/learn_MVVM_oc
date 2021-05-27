//
//  NextViewModel.m
//  MVVMTest
//
//  Created by yy on 2021/5/26.
//  Copyright © 2021 Joy. All rights reserved.
//
/*
 NextviewModel负责处理NextViewController的业务逻辑
 这里，button按下后，调用viewmodel的getNextVCTitleWithCallback方法获取model，
 viewmodel获取model后，用这个model通过callback来更新viewController的view。
 */
#import "NextViewModel.h"

@implementation NextViewModel

- (void)getNextVCTitleWithCallback:(callback)callback{
    NextModel *model= [NextModel new];
    
    //假装从网络抓取数据
    model.vcTitle = @"title";
    model.bestHostName = @"主持人";
    model.luckyUserName = @"幸运用户";
    
    self.model = model;
    callback(self.model);
}

@end
