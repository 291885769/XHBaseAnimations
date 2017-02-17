//
//  effectOfParticleViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/15.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "effectOfParticleViewController.h"

@interface effectOfParticleViewController ()

@end

@implementation effectOfParticleViewController
static NSString *kX = @"curveX";
static NSString *kY = @"curveY";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    [self effectOfParticle];
}

//粒子效果
-(void)effectOfParticle{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 50, self.view.bounds.size.height / 2.0, 200, 200)];
     view.backgroundColor = [UIColor yellowColor];
    view.layer.cornerRadius = 50;
    [self.view addSubview:view];
    
    //create particle emmitter layer
    //CAEmitterLayer负责发射粒子(粒子也可以发射粒子)
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = view.bounds;
    //决定粒子发射形状的中心点 发射位置
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width /2.0, emitter.frame.size.height / 2.0);
    // 发射源的z坐标位置；
    emitter.emitterZPosition = 3.0;
    /*
     NSString * const kCAEmitterLayerPoint;
     
     NSString * const kCAEmitterLayerLine;
     
     NSString * const kCAEmitterLayerRectangle;
     
     NSString * const kCAEmitterLayerCuboid;
     
     NSString * const kCAEmitterLayerCircle;
     
     NSString * const kCAEmitterLayerSphere;
     */
    //发射器形状
    emitter.emitterShape = kCAEmitterLayerCircle;
    /*
     NSString * const kCAEmitterLayerPoints;
     
     NSString * const kCAEmitterLayerOutline;
     
     NSString * const kCAEmitterLayerSurface;
     
     NSString * const kCAEmitterLayerVolume;
     */
    //3d圆形的体积内发射
    emitter.emitterMode = kCAEmitterLayerVolume;
    //是否开启三维空间模式
    emitter.preservesDepth = YES;
    //发射器的深度，有时可能会产生立体效果
    emitter.emitterDepth = 2.0;
    //自旋转速度//粒子的旋转角度
    emitter.spin = 50;
    [view.layer addSublayer:emitter];
    
    //configure emitter
    /*
     NSString * const kCAEmitterLayerUnordered;
     
     NSString * const kCAEmitterLayerOldestFirst;
     
     NSString * const kCAEmitterLayerOldestLast;
     
     NSString * const kCAEmitterLayerBackToFront;
     
     NSString * const kCAEmitterLayerAdditive;
     */
    //渲染模式
    emitter.renderMode = kCAEmitterLayerBackToFront;
    
    
    //creat a particle template]
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
//    是个CGImageRef的对象,既粒子要展现的图片；
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Sparkle"].CGImage);
    //粒子参数的速度乘数因子；粒子产生系数，默认1.0；
    cell.birthRate = 15.0;
    //粒子生命周期
    cell.lifetime = 5.0;
    //是否打开粒子的渲染效果
    cell.enabled = YES;
    //粒子的颜色
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    //粒子透明度在生命周期内的改变速度；
    cell.alphaSpeed = -0.4;
    //粒子的速度
    cell.velocity = 50;
    //粒子的速度范围
    cell.velocityRange = 70;
   //周围发射角度
    cell.emissionRange = M_PI * 2.0;
    //creat a particle template]
    //装着CAEmitterCell对象的数组，被用于把粒子投放到layer上；
    emitter.emitterCells = @[cell];
    
}


@end
