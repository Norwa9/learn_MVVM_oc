//
//  NextModel.h
//  MVVMTest
//
//  Created by yy on 2021/5/26.
//  Copyright © 2021 Joy. All rights reserved.
//
/*
 NextModel用来存放NextViewController中需要用到的数据
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NextModel : NSObject<NSCopying>

@property (nonatomic,strong) NSString *vcTitle;

@end

NS_ASSUME_NONNULL_END
