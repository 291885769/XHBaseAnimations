

//
//  POPCustomTransitionViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/21.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "POPCustomTransitionViewController.h"
#import "POPCustomTransitionPressonViewController.h"
#import "PresentingAnimator.h"
#import "DismissingAnimator.h"

@interface POPCustomTransitionViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation POPCustomTransitionViewController
- (IBAction)buttonAction:(UIButton *)sender {
    
    
    POPCustomTransitionPressonViewController *modalViewController = [POPCustomTransitionPressonViewController new];
    modalViewController.transitioningDelegate = self;
    modalViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self.navigationController presentViewController:modalViewController animated:YES completion:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}
#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [PresentingAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [DismissingAnimator new];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
