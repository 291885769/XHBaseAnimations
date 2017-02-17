//
//  XHFireworksButton.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/15.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "XHFireworksButton.h"
#import "XHFireworksView.h"

@interface XHFireworksButton ()

@property (strong, nonatomic) XHFireworksView *fireworksView;

@end
@implementation XHFireworksButton

- (void)setup {
    self.clipsToBounds = NO;
    
    _fireworksView = [[XHFireworksView alloc] init];
    _fireworksView.frame = self.bounds;
    [self insertSubview:_fireworksView atIndex:0];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}
#pragma mark - Methods

- (void)animate {
    [self.fireworksView animate];
}
/**
 *  时间帧 放大缩小
 *
 */
- (void)popOutsideWithDuration:(NSTimeInterval)duration {
    __weak typeof(self) weakSelf = self;
    /**
     *  重置变换
     */

    self.transform = CGAffineTransformIdentity;
    
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations: ^{
        /**
         *    第一个关键帧，放大 1.5倍
         */
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
        /**
         * 第二个关键帧 缩小到1.5->0.8
         */
        
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(.8, .8);
        }];
        /**
         * 第三个关键帧 还原到0.8->1.0
         */
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1, 1);
        }];
    } completion:nil];
}
/**
 *  时间帧 放大缩小
 *
 */
- (void)popInsideWithDuration:(NSTimeInterval)duration {
    __weak typeof(self) weakSelf = self;
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 2.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/2.0 relativeDuration:1/2.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:nil];
}

#pragma mark - Properties

- (UIImage *)particleImage {
    return self.fireworksView.particleImage;
}

- (void)setParticleImage:(UIImage *)particleImage {
    self.fireworksView.particleImage = particleImage;
}

- (CGFloat)particleScale {
    return self.fireworksView.particleScale;
}

- (void)setParticleScale:(CGFloat)particleScale {
    self.fireworksView.particleScale = particleScale;
}

- (CGFloat)particleScaleRange {
    return self.fireworksView.particleScaleRange;
}

- (void)setParticleScaleRange:(CGFloat)particleScaleRange {
    self.fireworksView.particleScaleRange = particleScaleRange;
}

@end
