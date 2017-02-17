//
//  ViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/1/19.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//
/*
 常规动画属性设置（可以同时选择多个进行设置）
 
 UIViewAnimationOptionLayoutSubviews：动画过程中保证子视图跟随运动。
 
 UIViewAnimationOptionAllowUserInteraction：动画过程中允许用户交互。
 
 UIViewAnimationOptionBeginFromCurrentState：所有视图从当前状态开始运行。
 
 UIViewAnimationOptionRepeat：重复运行动画。
 
 UIViewAnimationOptionAutoreverse ：动画运行到结束点后仍然以动画方式回到初始点。
 
 UIViewAnimationOptionOverrideInheritedDuration：忽略嵌套动画时间设置。
 
 UIViewAnimationOptionOverrideInheritedCurve：忽略嵌套动画速度设置。
 
 UIViewAnimationOptionAllowAnimatedContent：动画过程中重绘视图（注意仅仅适用于转场动画）。
 
 UIViewAnimationOptionShowHideTransitionViews：视图切换时直接隐藏旧视图、显示新视图，而不是将旧视图从父视图移除（仅仅适用于转场动画）
 UIViewAnimationOptionOverrideInheritedOptions ：不继承父动画设置或动画类型。
 
 2.动画速度控制（可从其中选择一个设置）
 
 UIViewAnimationOptionCurveEaseInOut：动画先缓慢，然后逐渐加速。
 
 UIViewAnimationOptionCurveEaseIn ：动画逐渐变慢。
 
 UIViewAnimationOptionCurveEaseOut：动画逐渐加速。
 
 UIViewAnimationOptionCurveLinear ：动画匀速执行，默认值。
 
 3.转场类型（仅适用于转场动画设置，可以从中选择一个进行设置，基本动画、关键帧动画不需要设置）
 
 UIViewAnimationOptionTransitionNone：没有转场动画效果。
 
 UIViewAnimationOptionTransitionFlipFromLeft ：从左侧翻转效果。
 
 UIViewAnimationOptionTransitionFlipFromRight：从右侧翻转效果。
 
 UIViewAnimationOptionTransitionCurlUp：向后翻页的动画过渡效果。
 
 UIViewAnimationOptionTransitionCurlDown ：向前翻页的动画过渡效果。
 
 UIViewAnimationOptionTransitionCrossDissolve：旧视图溶解消失显示下一个新视图的效果。
 
 UIViewAnimationOptionTransitionFlipFromTop ：从上方翻转效果。
 
 UIViewAnimationOptionTransitionFlipFromBottom：从底部翻转效果。
 */

//使用UIView [begin,commit]模式
/*
 // 开始动画
 + (void)beginAnimations:(NSString *)animationID context:(void *)context;
 
 // 提交动画
 + (void)commitAnimations;
 
 // 设置动画曲线，默认是匀速进行：
 + (void)setAnimationCurve:(UIViewAnimationCurve)curve;
 
 // 设置动画时长：
 + (void)setAnimationDuration:(NSTimeInterval)duration;
 
 // 默认为YES。为NO时跳过动画效果，直接跳到执行后的状态。
 + (void)setAnimationsEnabled:(BOOL)enabled;
 
 // 设置动画延迟执行（delay：秒为单位）：
 + (void)setAnimationDelay:(NSTimeInterval)delay;
 
 // 动画的重复播放次数
 + (void)setAnimationRepeatCount:(float)repeatCount;
 
 // 如果为YES，逆向（相反）动画效果，结束后返回动画逆向前的状态; 默认为NO：
 + (void)setAnimationRepeatAutoreverses:(BOOL)repeatAutoreverses;
 
 // 设置动画代理：
 + (void)setAnimationDelegate:(id)delegate;
 
 // 动画将要开始时执行方法××（必须要先设置动画代理）：
 + (void)setAnimationWillStartSelector:(SEL)selector;
 
 // 动画已结束时执行方法××（必须要先设置动画代理）：
 + (void)setAnimationDidStopSelector:(SEL)selector;
 
 
 *  设置动画过渡效果
 *
 *  @param transition 动画的过渡效果
 *  @param view 过渡效果作用视图
 *  @param cache 如果为YES，开始和结束视图分别渲染一次并在动画中创建帧；否则，视图将会渲染每一帧。例如，你不需要在视图转变中不停的更新，你只需要等到转换完成再去更新视图。
 
+ (void)setAnimationTransition:(UIViewAnimationTransition)transition forView:(UIView *)view cache:(BOOL)cache;

 删除所有动画层
 注意：层指的是layout，例：[_imageView.layer removeAllAnimations];
- (void)removeAllAnimations;
 
 */


#import "BaseAnimationViewController.h"


@interface BaseAnimationViewController()

@property (nonatomic , strong) UIView *demoView;

@end

@implementation BaseAnimationViewController

-(void)viewDidLoad{

    [super viewDidLoad];
    
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-100,100 ,100 )];
    _demoView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_demoView];
    
}
-(IBAction)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self opacityAniamtion];
            break;
        case 2:
            [self scaleAnimation];
            break;
        case 3:
            [self rotateAnimation];
            break;
        case 4:
            [self backgroundAnimation];
            break;
            
        default:
            break;
    }
}


/**
 *  位移动画演示
 */
-(void)positionAnimation{
    
    //使用CABasicAnimation创建基础动画
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    // view.center 移动
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-75)];
    /**
     *  动画时间 动画的持续时间
     */
    anima.duration = 1.0f;
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
//    removedOnCompletion：默认为YES，代表动画执行完毕后就从图层上移除，图形会恢复到动画执行前的状态。如果想让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode为kCAFillModeForwards
    anima.fillMode = kCAFillModeForwards;
    /**
     *  完成后是否删除 默认YES
     */
    anima.removedOnCompletion = NO;
    /**
     *  是否原路返回
     */
    anima.autoreverses  =YES;
    /**
     *  重复次数
     */
    anima.repeatCount=5;
    /**
     *  移动速度
     */
//    anima.speed=10;
    /**
     *  动画的重复时间
     */
    anima.repeatDuration=50;
    /**
     *  beginTime：可以用来设置动画延迟执行时间，若想延迟2s，就设置为CACurrentMediaTime()+2，CACurrentMediaTime()为图层的当前时间
     */
    anima.beginTime=CACurrentMediaTime()+2;
    /**
     *  速度控制函数，控制动画运行的节奏 kCAMediaTimingFunctionLinear 匀速  kCAMediaTimingFunctionEaseIn
     */
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    /**
     *  动画完成协议
     */
//    anima.delegate=self;
    
    /**
     *  添加到layer 上
     */
    
    [_demoView.layer addAnimation:anima forKey:@"positionAnimation"];
    //删除动画
//    [_demoView.layer removeAnimationForKey:@"positionAnimation"];
    
    
    //使用UIView Animation 代码块调用
//        _demoView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
//        [UIView animateWithDuration:1.0f animations:^{
//            _demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
//        } completion:^(BOOL finished) {
//            _demoView.frame = CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-50, 50, 50);
//        }];

    //
    //使用UIView [begin,commit]模式
        _demoView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
        [UIView beginAnimations:nil context:nil];
    // 动画的重复播放次数
    [UIView setAnimationRepeatCount:10];
    // 设置动画延迟执行（delay：秒为单位）：
    [UIView setAnimationDelay:2];
    //如果为YES，逆向（相反）动画效果，结束后返回动画逆向前的状态; 默认为NO：
    //原路返回
    
    [UIView setAnimationRepeatAutoreverses:YES];
        [UIView setAnimationDuration:1.0f];
        _demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
    
    // 动画将要开始时执行方法××（必须要先设置动画代理）：
//    [UIView setAnimationWillStartSelector:<#(nullable SEL)#>];
    
        [UIView commitAnimations];
}

/**
 *  透明度动画
 */
-(void)opacityAniamtion{
    [_demoView.layer removeAnimationForKey:@"rotateAnimation"];
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    anima.toValue = [NSNumber numberWithFloat:0.2f];
    anima.duration = 1.0f;
    [_demoView.layer addAnimation:anima forKey:@"opacityAniamtion"];
}

/**
 *  缩放动画
 */
-(void)scaleAnimation{
    //    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"bounds"];
    //    anima.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    //    anima.duration = 1.0f;
    //    [_demoView.layer addAnimation:anima forKey:@"scaleAnimation"];
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//同上
    anima.toValue = [NSNumber numberWithFloat:2.0f];
    anima.duration = 1.0f;
    [_demoView.layer addAnimation:anima forKey:@"scaleAnimation"];
    
    //    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    //    anima.toValue = [NSNumber numberWithFloat:0.2f];
    //    anima.duration = 1.0f;
    //    [_demoView.layer addAnimation:anima forKey:@"scaleAnimation"];
}

/**
 *  旋转动画
 */
-(void)rotateAnimation{
//    CABasicAnimation *anima1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
//    anima1.toValue = [NSNumber numberWithFloat:M_PI];
//    anima1.duration = 1.0f;
//    [_demoView.layer addAnimation:anima1 forKey:@"rotateAnimation1"];
    
        //valueWithCATransform3D作用与layer
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
        anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];//绕着矢量（x,y,z）旋转
        anima.duration = 1.0f;
        anima.repeatCount = MAXFLOAT;
       //匀速旋转
        anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [_demoView.layer addAnimation:anima forKey:@"rotateAnimation"];
    /**
     *  删除动画
     */
//    [_demoView.layer removeAnimationForKey:@"rotateAnimation"];
    
        //CGAffineTransform作用与View
//        _demoView.transform = CGAffineTransformMakeRotation(0);
    //    [UIView animateWithDuration:1.0f animations:^{
//    保持原来的transform 旋转 不然会重置后旋转_demoView.transform.transform=CGAffineTransformRotate(self.mySearchBar.transform, M_PI);
    //        _demoView.transform = CGAffineTransformMakeRotation(M_PI);
    //    } completion:^(BOOL finished) {
    //
    //    }];
}

/**
 *  背景色变化动画
 */
-(void)backgroundAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue =(id) [UIColor greenColor].CGColor;
    anima.duration = 1.0f;
    [_demoView.layer addAnimation:anima forKey:@"backgroundAnimation"];
}


@end
