//
//  TestCell.m
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//
/*
 view作用：
 
 控制视图的UI。通过viewModel控制它的显示，点击它的控件通过viewModel刷新model。
 （由于用block，中间需要vc的胶水作用）
 */
#import "TestCell.h"

@interface TestCell ()

/* title */
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation TestCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 50)];
        [self.contentView addSubview:_titleLabel];
        _titleLabel.backgroundColor=[UIColor whiteColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    }
    return self;
}

//数据填充
- (void)setViewModel:(TestViewModel *)viewModel {
    _viewModel = viewModel;
    NSArray<TestModel *> *models = viewModel.models;
    NSInteger row = viewModel.row;
    _titleLabel.text = models[row].title;
}


@end
