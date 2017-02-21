//
//  POPCustomTransitionPressonViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/21.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "POPCustomTransitionPressonViewController.h"

@interface POPCustomTransitionPressonViewController ()

@end

@implementation POPCustomTransitionPressonViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.layer.cornerRadius = 8.f;
    self.view.backgroundColor = [UIColor redColor];
    [self addDismissButton];
}

#pragma mark - Private Instance methods

- (void)addDismissButton
{
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeSystem];
    dismissButton.translatesAutoresizingMaskIntoConstraints = NO;
    dismissButton.tintColor = [UIColor whiteColor];
    dismissButton.titleLabel.font = [UIFont fontWithName:@"Avenir" size:20];
    [dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dismissButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[dismissButton]-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(dismissButton)]];
}

- (void)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
