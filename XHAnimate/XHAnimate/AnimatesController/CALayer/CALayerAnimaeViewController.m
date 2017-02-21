//
//  CALayerAnimaeViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/17.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "CALayerAnimaeViewController.h"
#import "MaskAnimateViewController.h"
@interface CALayerAnimaeViewController ()

@end

@implementation CALayerAnimaeViewController

-(void)initData{
    self.menuArray = [NSArray arrayWithObjects:@"遮罩层", nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *viewController;
    
    switch (indexPath.row) {
            
        case 0:
            viewController = [[MaskAnimateViewController alloc] init];
            break;
//        case 1:
//            viewController = [[effectOfParticleViewController alloc] init];
//            break;
////        case 2:
////            viewController = [[DropEffectViewController alloc] init];
////            break;
////        case 3:
////            viewController = [[GiftEffectViewController alloc] init];
////            break;
////        case 4:
////            viewController = [[FireworksViewController alloc] init];
////            break;
////        case 5:
////            viewController = [[SprayViewController alloc] init];
////            break;
////        case 6:
////            viewController = [[SnowViewController alloc] init];
////            break;
            
    }
    
    //调用pushFrontViewController进行页面切换
    viewController.title =self.menuArray[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

@end
