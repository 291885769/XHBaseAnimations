//
//  CircleProgressController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/24.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "CircleProgressController.h"

@interface CircleProgressController ()
@property (nonatomic,strong) CAShapeLayer *shapeLayer;
@end

@implementation CircleProgressController

- (void)viewDidLoad {
    [super viewDidLoad];
    _shapeLayer=[CAShapeLayer layer];
    _shapeLayer.frame=CGRectMake(100, 100, 200, 200);
    _shapeLayer.fillColor=[UIColor clearColor].CGColor;
    _shapeLayer.lineWidth=2;
    //比例显示 从哪个比例开始到哪个比例结束
    _shapeLayer.strokeEnd =0.0;
    _shapeLayer.strokeStart= 0.0;
    //线条颜色
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    
    UIBezierPath  *path=[UIBezierPath bezierPath];
    path =[UIBezierPath bezierPathWithOvalInRect:_shapeLayer.bounds];
    _shapeLayer.path=path.CGPath;
    [self.view.layer addSublayer:_shapeLayer];
}
- (IBAction)buttonaction:(id)sender {
    //strokeEnd 一定和 shapeLayer的属性strokeEnd 一致
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration =2;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.toValue=@(1.0);
    /*
     fillMode属性值（要想fillMode有效，最好设置removedOnCompletion=NO）
     
     kCAFillModeRemoved 这个是默认值,也就是说当动画开始前和动画结束后,动画对layer都没有影响,动画结束后,layer会恢复到之前的状态
     .
     
     kCAFillModeForwards 当动画结束后,layer会一直保持着动画最后的状态.
     //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
     //    removedOnCompletion：默认为YES，代表动画执行完毕后就从图层上移除，图形会恢复到动画执行前的状态。如果想让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode为kCAFillModeForwards
     
     kCAFillModeBackwards 在动画开始前,你只要将动画加入了一个layer,layer便立即进入动画的初始状态并等待动画开始. 你可以这样设定测试代码,将一个动画加入一个layer的时候延迟5秒执行.然后就会发现在动画没有开始的时候,只要动画被加入了layer,layer便处于动画初始状态
     
     
     kCAFillModeBoth 这个其实就是上面两个的合成.动画加入后开始之前,layer便处于动画初始状态,动画结束后layer保持动画最后的状
     */
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [_shapeLayer addAnimation:animation forKey:@"CircleProgress"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
