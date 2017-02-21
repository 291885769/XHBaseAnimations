//
//  POPDecayViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/21.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//
/*
 基于Bezier曲线的timingFuntion同样无法表述Decay Aniamtion，所以Pop就单独实现了一个 PopDecayAnimation，用于衰减动画。衰减动画一个很常见的地方就是 UIScrollView 滑动松开后的减速，这里就基于UIView实现一个自己的ScrollView，然后使用PopDecayAnimation实现 此代码可以详细参见 KKScrollView 的实现，当滑动手势结束时，根据结束的加速度，给衰减动画一个初始的velocity，用来决定衰减的时长。
 */
#import "POPDecayViewController.h"

@interface POPDecayViewController ()<POPAnimationDelegate>
@property(nonatomic) UIControl *dragView;
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation POPDecayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDragView];
}
- (IBAction)buttonAction:(UIButton *)sender {
    
    
    /*基于Bezier曲线的timingFuntion同样无法表述Decay Aniamtion，所以Pop就单独实现了一个 PopDecayAnimation，用于衰减动画。衰减动画一个很常见的地方就是 UIScrollView 滑动松开后的减速，这里就基于UIView实现一个自己的ScrollView，然后使用PopDecayAnimation实现 此代码可以详细参见 KKScrollView 的实现，当滑动手势结束时，根据结束的加速度，给衰减动画一个初始的velocity，用来决定衰减的时长。*/
    
    //创建一个POPDecayAnimation动画 实现X轴运动 减慢速度的效果 通过速率来计算运行的距离 没有toValue属性
    //    Decay 的动画没有 toValue 只有 fromValue，然后按照 velocity 来做衰减操作。如果我们想做一个刹车效果，那么应该是这样的。 如果 velocity 是负值，那么就会反向递减。
    
//    deceleration （负加速度） 是一个你会很少用到的值，默认是就是我们地球的 0.998，如果你开发给火星人用，那么这个值你使用 0.376 会更合适。
    POPDecayAnimation *anSpring = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anSpring.velocity = @(500); //速率
    anSpring.beginTime = CACurrentMediaTime() + 1.0f;
    [anSpring setCompletionBlock:^(POPAnimation *prop, BOOL fint) {
        
    }];
    [self.testView pop_addAnimation:anSpring forKey:@"myViewposition"];
}

- (void)addDragView
{
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handlePan:)];
    
    self.dragView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.dragView.center = self.view.center;
//    self.dragView.layer.cornerRadius = CGRectGetWidth(self.dragView.bounds)/2;
    self.dragView.backgroundColor = [UIColor blueColor];
    [self.dragView addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.dragView addGestureRecognizer:recognizer];
    
    [self.view addSubview:self.dragView];
}
- (void)touchDown:(UIControl *)sender {
    [sender.layer pop_removeAllAnimations];
}
- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if(recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [recognizer velocityInView:self.view];
        POPDecayAnimation *positionAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.delegate = self;
        positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        [recognizer.view.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    }
}


@end
