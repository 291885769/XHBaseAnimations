//
//  effectOfParticleAnimatesViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/17.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "effectOfParticleAnimatesViewController.h"
#import "effectOfParticleViewController.h"
#import "likeViewController.h"
#import "DropEffectViewController.h"

#import "GiftEffectViewController.h"
#import "FireworksViewController.h"

#import "SprayViewController.h"

#import "SnowViewController.h"
@interface effectOfParticleAnimatesViewController ()

@end

@implementation effectOfParticleAnimatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)initData{
    self.menuArray = [NSArray arrayWithObjects:@"点赞",@"粒子效果",@"粒子掉落",@"礼物冒泡",@"烟花效果",@"喷射效果",@"雪花效果", nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *viewController;
    
    switch (indexPath.row) {
        
        case 0:
            viewController = [[likeViewController alloc] init];
            break;
        case 1:
            viewController = [[effectOfParticleViewController alloc] init];
            break;
        case 2:
            viewController = [[DropEffectViewController alloc] init];
            break;
        case 3:
            viewController = [[GiftEffectViewController alloc] init];
            break;
        case 4:
            viewController = [[FireworksViewController alloc] init];
            break;
        case 5:
            viewController = [[SprayViewController alloc] init];
            break;
        case 6:
            viewController = [[SnowViewController alloc] init];
            break;

    }
    
    //调用pushFrontViewController进行页面切换
    viewController.title =self.menuArray[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

@end
