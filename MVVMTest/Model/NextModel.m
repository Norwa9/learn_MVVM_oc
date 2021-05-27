//
//  NextModel.m
//  MVVMTest
//
//  Created by yy on 2021/5/26.
//  Copyright © 2021 Joy. All rights reserved.
//

#import "NextModel.h"

@implementation NextModel

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    NextModel *model = [NextModel new];
    model.vcTitle = _vcTitle;
    model.bestHostName = _bestHostName;
    model.luckyUserName = _luckyUserName;
    return model;
}

@end
