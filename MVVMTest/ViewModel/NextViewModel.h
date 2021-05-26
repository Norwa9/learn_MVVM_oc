//
//  NextViewModel.h
//  MVVMTest
//
//  Created by yy on 2021/5/26.
//  Copyright © 2021 Joy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NextModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^callback) (NextModel *model);
@interface NextViewModel : NSObject

@property(nonatomic,copy)NextModel *model;

-(void)getNextVCTitleWithCallback:(callback)callback;

@end


NS_ASSUME_NONNULL_END
