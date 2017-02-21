//
//  POPingViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/21.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "POPingViewController.h"
#import "POPingControllerCell.h"
#import "POPButtonViewController.h"
#import "POPDecayViewController.h"
#import "ImageViewController.h"
#import "POPCircleViewController.h"
#import "POPCustomTransitionViewController.h"
#import "PaperButtonViewController.h"
#import "FoldingViewController.h"
#import "PasswordViewController.h"
@interface POPingViewController ()

@end

@implementation POPingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)initData{
    self.menuArray = [NSArray arrayWithObjects:@"Button Animation",@"Decay Animation",@"Circle Transition Animation",@"Image Animation",@"Custom Animation",@"Paper Animation",@"Folding Animation",@"Password Indicator Animation", nil];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TABLE_VIEW_ID = @"POPingControllerCell.h";
    POPingControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_VIEW_ID];
    if (!cell) {
        cell = [[POPingControllerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_VIEW_ID];
    }
    cell.textLabel.text = [self.menuArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *viewController;
    
    switch (indexPath.row) {
        case 0:
            viewController = [[POPButtonViewController alloc] init];
            break;
        case 1:
            viewController = [[POPDecayViewController alloc] init];
            break;
        case 2:
            
            viewController = [[POPCircleViewController alloc] init];
            break;

        case 3:
            
            viewController = [[ImageViewController alloc] init];
            
            break;
        case 4:
            viewController = [[POPCustomTransitionViewController alloc] init];
            break;
        case 5:
            viewController = [[PaperButtonViewController alloc] init];
            break;
        case 6:
            viewController = [[FoldingViewController alloc] init];
            break;
        case 7:
            viewController = [[PasswordViewController alloc] init];
            break;

            
        default:
            break;
    }
    
    //调用pushFrontViewController进行页面切换
    viewController.title =self.menuArray[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
    
}
@end
