//
//  NextViewModel.m
//  MVVMTest
//
//  Created by yy on 2021/5/26.
//  Copyright © 2021 Joy. All rights reserved.
//

#import "NextViewModel.h"

@implementation NextViewModel

- (void)getNextVCTitleWithCallback:(callback)callback{
    NextModel *model= [NextModel new];
    model.vcTitle = @"title";
    self.model = model;
    callback(self.model);
}

@end
