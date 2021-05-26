//
//  TableDelegate.m
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

#import "TableDelegate.h"

@implementation TableDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.viewModel.row = indexPath.row;
    if (_cellClick) {
        self.cellClick(self.viewModel);
    }
}

@end
