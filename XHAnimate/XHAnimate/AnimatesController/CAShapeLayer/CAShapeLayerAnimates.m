//
//  CAShapeLayerAnimates.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/24.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "CAShapeLayerAnimates.h"
#import "shapeLayerMenuViewController.h"
#import "CheckBtnViewController.h"
#import "CircleProgressController.h"
@interface CAShapeLayerAnimates ()

@end

@implementation CAShapeLayerAnimates

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)initData{
    self.menuArray = [NSArray arrayWithObjects:@"menu菜单",@"checkButton",@"圆形进度条", nil];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *viewController;
    
    switch (indexPath.row) {
        case 0:
            viewController = [[shapeLayerMenuViewController alloc] init];
            break;
        case 1:
            viewController = [[CheckBtnViewController alloc] init];
            break;
        case 2:
            
            viewController = [[CircleProgressController alloc] init];
            break;
//
//        case 3:
//            
//            viewController = [[ImageViewController alloc] init];
//            
//            break;
//        case 4:
//            viewController = [[POPCustomTransitionViewController alloc] init];
//            break;
//        case 5:
//            viewController = [[PaperButtonViewController alloc] init];
//            break;
//        case 6:
//            viewController = [[FoldingViewController alloc] init];
//            break;
//        case 7:
//            viewController = [[PasswordViewController alloc] init];
//            break;
            
            
        default:
            break;
    }
    
    //调用pushFrontViewController进行页面切换
    viewController.title =self.menuArray[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
    
}
@end
