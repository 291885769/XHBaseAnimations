//
//  ViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/1/19.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "ViewController.h"

#import "BaseAnimationViewController.h"

#import "KeyFrameAnimationsController.h"

#import "GroupAnimationController.h"

#import "AffineTransformController.h"

#import "TransitionAnimationController.h"

#import "PathMenusViewController.h"

#import "PathMenusViewController2.h"

#import "dingDingViewController.h"

#import "FireworksViewController.h"

#import "effectOfParticleViewController.h"

#import "DropEffectViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSArray *menuArray;

@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title=@"动画";
    [self initData];
    [self initView];
}

-(void)initData{
    _menuArray = [NSArray arrayWithObjects:@"基础动画",@"关键帧动画",@"组动画",@"仿射变换",@"过渡动画",@"仿Path 菜单动画",@"仿Path 菜单动画2",@"钉钉",@"点赞",@"粒子效果",@"粒子掉落", nil];
}

-(void)initView{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _menuArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TABLE_VIEW_ID = @"table_view_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_VIEW_ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_VIEW_ID];
    }
    cell.textLabel.text = [_menuArray objectAtIndex:indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *viewController;
    
    switch (indexPath.row) {
        case 0:
            viewController = [[BaseAnimationViewController alloc] init];
            break;
        case 1:
            viewController = [[KeyFrameAnimationsController alloc] init];
            break;
        case 2:
            
            viewController = [[GroupAnimationController alloc] init];
            break;
            
        case 3:
            
            viewController = [[AffineTransformController alloc] init];

            break;
        case 4:
            viewController = [[TransitionAnimationController alloc] init];
            break;
        case 5:
            viewController = [[PathMenusViewController alloc] init];
            break;
        case 6:
            viewController = [[PathMenusViewController2 alloc] init];
            break;
        case 7:
            viewController = [[dingDingViewController alloc] init];
            break;
        case 8:
            viewController = [[FireworksViewController alloc] init];
            break;
        case 9:
            viewController = [[effectOfParticleViewController alloc] init];
            break;
        case 10:
            viewController = [[DropEffectViewController alloc] init];
            break;

        default:
            break;
    }
    
//    //调用pushFrontViewController进行页面切换
    viewController.title =_menuArray[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
