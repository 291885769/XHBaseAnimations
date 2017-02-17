//
//  FireworksViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/15.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "FireworksViewController.h"

#import "XHFireworksButton.h"

@interface FireworksViewController ()
@property (nonatomic , strong) XHFireworksButton *goodBtn;
@property (nonatomic , assign) BOOL selected;
@end

@implementation FireworksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self clickGoodAnimation];
    
}

/**
 *  仿造facebook，点赞动画
 */
-(void)clickGoodAnimation{

        _goodBtn = [[XHFireworksButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-25, 50, 50)];
        _goodBtn.particleImage = [UIImage imageNamed:@"Sparkle"];
        _goodBtn.particleScale = 0.05;
        _goodBtn.particleScaleRange = 0.02;
        [_goodBtn setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
        
        [_goodBtn addTarget:self action:@selector(handleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_goodBtn];

}
- (void)handleButtonPress:(id)sender {
    _selected = !_selected;
    if(_selected) {
        [_goodBtn popOutsideWithDuration:0.5];
        [_goodBtn setImage:[UIImage imageNamed:@"Like-Blue"] forState:UIControlStateNormal];
        [_goodBtn animate];
    }else {
        [_goodBtn popInsideWithDuration:0.4];
        [_goodBtn setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
    }
}

@end
