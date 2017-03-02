//
//  CALayer+XHLayer_applyAnimation.m
//  an
//
//  Created by Weimob-fu on 2017/2/24.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "CALayer+XHLayer_applyAnimation.h"

@implementation CALayer (XHLayer_applyAnimation)

- (void)XHLayer_applyAnimation:(CABasicAnimation *)animation
{
    if (animation.fromValue == nil) {
        animation.fromValue = [self.presentationLayer valueForKey:animation.keyPath];
    }
    
    [self addAnimation:animation forKey:animation.keyPath];
    [self setValue:animation.toValue forKey:animation.keyPath];
}
@end
