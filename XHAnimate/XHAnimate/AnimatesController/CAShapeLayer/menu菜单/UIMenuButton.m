//
//  UIMenuButton.m
//  an
//
//  Created by Weimob-fu on 2017/2/24.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "UIMenuButton.h"
#import "CALayer+XHLayer_applyAnimation.h"
@interface UIMenuButton ()
//CAShapeLayer 继承与CALayer( 主要用于设置图层的形状)
@property (nonatomic,strong) CAShapeLayer *middleLayer;

//CAShapeLayer 继承与CALayer( 主要用于设置图层的形状)
@property (nonatomic,strong) CAShapeLayer *topLayer;
@property (nonatomic,strong) CAShapeLayer *bottomLayer;
/**
 * path 分段的开始
 */
@property (nonatomic,assign) CGFloat lineStrokeStart;
/**
 * path 分段的结尾
 */
@property (nonatomic,assign) CGFloat lineStrokeEnd;

@property (nonatomic,assign) CGFloat menuStrokeStart;
@property (nonatomic,assign) CGFloat menuStrokeEnd;


@end
@implementation UIMenuButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _middleLayer=[CAShapeLayer layer];
        _topLayer=[CAShapeLayer layer];
        _bottomLayer=[CAShapeLayer layer];
        
        for (CAShapeLayer *layer in @[_middleLayer,_topLayer,_bottomLayer]) {
            //CGColorRef对象，图形填充色，默认为黑色
            layer.fillColor=[UIColor clearColor].CGColor;
            //线条填充颜色
            layer.strokeColor=[UIColor whiteColor].CGColor;
            //线条宽度
            layer.lineWidth = 4;
            //miterLimit：最大斜接长度（只有在使用kCGLineJoinMiter是才有效）， 边角的角度越小，斜接长度就会越大 连接处
            layer.miterLimit = 4;
            
            /*ineCapStyle：path端点样式，有3种样式
             
             　　kCGLineCapButt：无端点
             
             　　kCGLineCapRound：圆形端点
             
             　　kCGLineCapSquare：方形端点（样式上和kCGLineCapButt是一样的，但是比kCGLineCapButt长一点）
             */
            layer.lineCap = @"round";
            //        _middleLayer.masksToBounds = YES;
            
            
            layer.actions = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [NSNull null],@"strokeStart",[NSNull null],@"strokeEnd",[NSNull null],@"transform", nil];
            [self.layer addSublayer:layer];
        }
        
        
        _middleLayer.path = [self middlePaths].CGPath;
        
        _topLayer.path = [self topButtomPaths].CGPath;
        _topLayer.position = CGPointMake( 12,  15);
        _bottomLayer.path = [self topButtomPaths].CGPath;
        _bottomLayer.position = CGPointMake( 12,  36);
        
        /**
         *  开始和结束截取一跳横线
         */
        self.lineStrokeStart=  0.028;
        self.lineStrokeEnd = 0.111;
       /**
         *  大概意思就是：我们可以对绘制的Path进行分区。这两个属性的值在0~1之间，0代表Path的开始位置，1代表Path的结束位置。是一种线性递增关系。strokeStart默认值为0，strokeEnd默认值为1。这两个属性都支持动画。
         */
        _middleLayer.strokeStart = self.lineStrokeStart;
        _middleLayer.strokeEnd = self.lineStrokeEnd;

    }
    return self;
}

-(void)setShow:(BOOL)show{
    _show=show;
    CABasicAnimation *strokeStart =[CABasicAnimation animationWithKeyPath:@"strokeStart"];
    CABasicAnimation *strokeEnd =[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEnd.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    strokeEnd.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    
    
    CABasicAnimation  *topTransform = [CABasicAnimation animationWithKeyPath:@"transform"];
    topTransform.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    topTransform.duration = 0.4;
    topTransform.fillMode = kCAFillModeBackwards;
    
    CABasicAnimation  *bottomTransform =topTransform.copy;
    
    
    if (_show) {
        /**
         *  截取一个圆的开始点和终点
         */
        self.menuStrokeStart = 0.2;
        self.menuStrokeEnd = 0.76;
        strokeStart.toValue = @(self.menuStrokeStart);
        strokeStart.duration = 0.5;
        
        strokeEnd.toValue = @(self.menuStrokeEnd);
        strokeEnd.duration = 0.6;
       
        /*
         fillMode属性值（要想fillMode有效，最好设置removedOnCompletion=NO）
         
         kCAFillModeRemoved 这个是默认值,也就是说当动画开始前和动画结束后,动画对layer都没有影响,动画结束后,layer会恢复到之前的状态
         .
         
         kCAFillModeForwards 当动画结束后,layer会一直保持着动画最后的状态.
         
         
         kCAFillModeBackwards 在动画开始前,你只要将动画加入了一个layer,layer便立即进入动画的初始状态并等待动画开始. 你可以这样设定测试代码,将一个动画加入一个layer的时候延迟5秒执行.然后就会发现在动画没有开始的时候,只要动画被加入了layer,layer便处于动画初始状态
         
         
         kCAFillModeBoth 这个其实就是上面两个的合成.动画加入后开始之前,layer便处于动画初始状态,动画结束后layer保持动画最后的状
         */

        CATransform3D caTransform3D =CATransform3DMakeTranslation(3, -0.5, 0);
        topTransform.toValue =[NSValue valueWithCATransform3D:CATransform3DRotate(caTransform3D, M_PI_2/2.0, 0, 0, 1)];
        topTransform.beginTime = CACurrentMediaTime() + 0.25;
        caTransform3D =CATransform3DMakeTranslation(3, 0, 0);
        bottomTransform.toValue =[NSValue valueWithCATransform3D:CATransform3DRotate(caTransform3D, -M_PI_2/2.0, 0, 0, 1)];
        bottomTransform.beginTime = CACurrentMediaTime() + 0.25;

        

    }else{
    
        /**
         *  返回到横线的 截取开始和终点
         *
         */
        strokeStart.toValue = @(self.lineStrokeStart);
        strokeStart.duration = 0.5;

        strokeEnd.toValue = @(self.lineStrokeEnd);
        strokeEnd.duration = 0.6;

    
        topTransform.toValue =[NSValue valueWithCATransform3D:CATransform3DIdentity];
        topTransform.beginTime = CACurrentMediaTime() + 0.25;
        
        bottomTransform.toValue =[NSValue valueWithCATransform3D:CATransform3DIdentity];
        bottomTransform.beginTime = CACurrentMediaTime() + 0.25;
        
        
    }
    
    /**
     *  开始动画截取
     */
    [_middleLayer XHLayer_applyAnimation:strokeStart];
    [_middleLayer XHLayer_applyAnimation:strokeEnd];
    [_topLayer XHLayer_applyAnimation:topTransform];
    [_bottomLayer XHLayer_applyAnimation:bottomTransform];
    [_middleLayer XHLayer_applyAnimation:strokeStart];
}


- (void)ocb_applyAnimation:(CABasicAnimation *)animation
{
    if (animation.fromValue == nil) {
        animation.fromValue = [_middleLayer.presentationLayer valueForKey:animation.keyPath];
    }
    
    [_middleLayer addAnimation:animation forKey:animation.keyPath];
    [_middleLayer setValue:animation.toValue forKey:animation.keyPath];
}

-(UIBezierPath*)middlePaths{
    
    UIBezierPath * path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 27)];
    [path addCurveToPoint:CGPointMake(40, 27) controlPoint1:CGPointMake(12, 27) controlPoint2:CGPointMake(28.02, 27)];
    [path addCurveToPoint:CGPointMake(27, 02) controlPoint1:CGPointMake(55.92, 27) controlPoint2:CGPointMake(50.47, 2)];
    [path addCurveToPoint:CGPointMake(2, 27) controlPoint1:CGPointMake(13.6, 2) controlPoint2:CGPointMake(2, 13.6)];
    
    [path addCurveToPoint:CGPointMake(27, 52) controlPoint1:CGPointMake(2, 40.82) controlPoint2:CGPointMake(13.16, 52)];
    [path addCurveToPoint:CGPointMake(52, 27) controlPoint1:CGPointMake(40.84, 52) controlPoint2:CGPointMake(52, 40.84)];
    [path addCurveToPoint:CGPointMake(27, 2) controlPoint1:CGPointMake(52, 13.16) controlPoint2:CGPointMake(42.39, 2)];
    [path addCurveToPoint:CGPointMake(2, 27) controlPoint1:CGPointMake(13.16, 2) controlPoint2:CGPointMake(2, 13.16)];
    return path;
}
-(UIBezierPath*)topButtomPaths{

    UIBezierPath * path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(2, 2)];
    [path addLineToPoint:CGPointMake(28, 2)];
    return path;

}



@end
