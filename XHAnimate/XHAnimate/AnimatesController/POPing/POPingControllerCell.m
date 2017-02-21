//
//  POPingControllerCell.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/21.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "POPingControllerCell.h"
#import "POP.h"
@implementation POPingControllerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{

    [super setHighlighted:highlighted animated:animated];
    
    if (self.highlighted) {
        //kPOPViewScaleXY xy 缩放
        POPBasicAnimation *scaleAnimation=[POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        //动画时长
        scaleAnimation.duration = 0.1;
        //缩放比例
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        //View 添加动画
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }else{
        //弹跳动画
        POPSpringAnimation * scaleAnimation=[POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        //缩放比例
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        //衰减动画一个初始的velocity，用来决定衰减的时长。
        scaleAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        //springBounciness 弹簧弹力 取值范围为[0, 20]，默认值为4
        scaleAnimation.springBounciness = 20.f;
        //View 添加动画
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    }
    
    
}


@end
