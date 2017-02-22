//
//  XHCommonAnimationCollectionViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/22.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "XHCommonAnimationCollectionViewController.h"
#import "XHCoreAnimationEffect.h"
@interface XHCommonAnimationCollectionViewController ()

@end

@implementation XHCommonAnimationCollectionViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title=@"点击查看效果";

}

- (IBAction)action1:(UIButton *)sender {
     [XHCoreAnimationEffect showAnimationType:@"cube"  withSubType:kCATransitionFromRight duration:2 timingFunction:kCAMediaTimingFunctionEaseOut view:sender];
  
}

- (IBAction)action2:(UIButton *)sender {
    [XHCoreAnimationEffect animationRevealFromBottom:sender];
}
- (IBAction)action3:(id)sender {
    
    [XHCoreAnimationEffect  animationRevealFromTop:sender];
    
}
- (IBAction)action4:(id)sender {
    
    [XHCoreAnimationEffect  animationRevealFromLeft:sender];
}

- (IBAction)action5:(id)sender {
    
    [XHCoreAnimationEffect  animationRevealFromRight:sender];
}
- (IBAction)action6:(id)sender {
    
    [XHCoreAnimationEffect  animationEaseIn:sender];
}
- (IBAction)action7:(id)sender {
    
    [XHCoreAnimationEffect  animationEaseOut:sender];
}
- (IBAction)action8:(id)sender {
    
    [XHCoreAnimationEffect  animationFlipFromLeft:sender];
}
- (IBAction)action9:(id)sender {
    
    [XHCoreAnimationEffect  animationFlipFromRigh:sender];
}

- (IBAction)action10:(id)sender {
    
    [XHCoreAnimationEffect  animationCurlUp:sender];
}

- (IBAction)action11:(id)sender {
    
    [XHCoreAnimationEffect  animationCurlDown:sender];
}


- (IBAction)action12:(id)sender {
    
    [XHCoreAnimationEffect  animationPushUp:sender];
}
- (IBAction)action13:(id)sender {
    
    [XHCoreAnimationEffect animationPushDown:sender ];
}

- (IBAction)action14:(id)sender {
    
    [XHCoreAnimationEffect  animationPushLeft:sender];
}
- (IBAction)action15:(id)sender {
    
    [XHCoreAnimationEffect  animationPushRight:sender];
}
- (IBAction)action16:(id)sender {
    
    [XHCoreAnimationEffect  animationMoveUp:sender duration:2.0f];
}
- (IBAction)action17:(id)sender {
    
    [XHCoreAnimationEffect  animationMoveDown:sender duration:2];
}
- (IBAction)action18:(id)sender {
    
    [XHCoreAnimationEffect  animationMoveLeft:sender];
}
- (IBAction)action19:(id)sender {
    
    [XHCoreAnimationEffect  animationMoveRight:sender];
}

- (IBAction)action20:(id)sender {
    
    [XHCoreAnimationEffect  animationRotateAndScaleEffects:sender];
}

- (IBAction)action21:(id)sender {
    
    [XHCoreAnimationEffect  animationRotateAndScaleDownUp:sender];
}

- (IBAction)action22:(id)sender {
    
    [XHCoreAnimationEffect  animationFlipFromTop:sender];
}

- (IBAction)action23:(id)sender {
    
    [XHCoreAnimationEffect  animationFlipFromBottom:sender];
}

- (IBAction)action24:(id)sender {
    
    [XHCoreAnimationEffect  animationCubeFromLeft:sender];
}
- (IBAction)action25:(id)sender {
    
    [XHCoreAnimationEffect  animationCubeFromRight:sender];
}

- (IBAction)action26:(id)sender {
    
    [XHCoreAnimationEffect  animationCubeFromTop:sender];
}

- (IBAction)action27:(id)sender {
    
    [XHCoreAnimationEffect  animationCubeFromBottom:sender];
}

- (IBAction)action28:(id)sender {
    
    [XHCoreAnimationEffect  animationSuckEffect:sender];
}

- (IBAction)action29:(id)sender {
    
    [XHCoreAnimationEffect  animationRippleEffect:sender];
}
- (IBAction)action30:(id)sender {
    
    [XHCoreAnimationEffect  animationCameraOpen:sender];
}
- (IBAction)action31:(id)sender {
    
    [XHCoreAnimationEffect  animationCameraClose:sender];
}

- (IBAction)action32:(id)sender {
    
//    [XHCoreAnimationEffect  ];
}



@end
