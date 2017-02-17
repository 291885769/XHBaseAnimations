//
//  PathMenusViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/14.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "PathMenusViewController.h"

#import "XHPathVIew.h"

#import "XHPathItemButton.h"

@interface PathMenusViewController ()<XHPathVIewDelegate>

@property (nonatomic , strong) XHPathVIew *pathAnimationView;

@end

@implementation PathMenusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfigureXHPathButton];
}

- (IBAction)action:(UIButton *)sender {
    _pathAnimationView.pathViewDirectionType=sender.tag;
    
}

- (void)ConfigureXHPathButton
{

    XHPathVIew *xhPathButton = [[XHPathVIew alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"] hilightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"] andFrame:CGRectMake(100, 100, 200, 200)];
    xhPathButton.backgroundColor=[UIColor redColor];
//    xhPathButton.frame=self.view.bounds;
    xhPathButton.delegate = self;
    _pathAnimationView=xhPathButton;
    // Configure item buttons
    //
    XHPathItemButton *itemButton_1 = [[XHPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    XHPathItemButton *itemButton_2 = [[XHPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    XHPathItemButton *itemButton_3 = [[XHPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    XHPathItemButton *itemButton_4 = [[XHPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    XHPathItemButton *itemButton_5 = [[XHPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]  backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    // Add the item button into the center button
    //
    [xhPathButton addPathItems:@[itemButton_1, itemButton_2, itemButton_3, itemButton_4, itemButton_5]];

    
    [self.view addSubview:xhPathButton];
    
}
#pragma mark - DCPathButton Delegate

- (void)itemButtonTappedAtIndex:(NSUInteger)index
{
    NSLog(@"You tap at index : %ld", index);
}
@end
