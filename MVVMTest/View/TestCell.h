//
//  TestCell.h
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

/**
 标题：viewcell
 作用：test
 */
/*
 view可以持有viewModel，用户操作视图，这时候要同步给viewmodel
 */
#import <UIKit/UIKit.h>
#import "TestViewModel.h"

@interface TestCell : UITableViewCell

/* testViewModel */
@property (strong, nonatomic) TestViewModel *viewModel;

@end
