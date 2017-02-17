//
//  DropEffectViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/16.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "DropEffectViewController.h"
#import <CoreMotion/CoreMotion.h>
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
@interface DropEffectViewController ()
//动力学
@property (nonatomic , strong) UIDynamicAnimator        * animator;
//重力特性
@property (nonatomic , strong) UIGravityBehavior        * gravityBehavior;
//碰撞检测，和上面的重力配合查看效果
@property (nonatomic , strong) UICollisionBehavior      * collisionBehavitor;

// accelerometer  加速计 有两获取数据的方式, Pull(主动获取)
@property (nonatomic, strong)  CMMotionManager * motionMManager;
/**
 *  掉落图片数组
 */
@property (strong,nonatomic)   NSMutableArray *dropsArray;
/**
 *  定时器
 */
@property (nonatomic, strong) NSTimer * dowpTimer;
/**
 *  是否正在掉落
 */
@property (assign,nonatomic) BOOL isDropping;

@end

@implementation DropEffectViewController

- (IBAction)start:(UIButton *)sender {
    if (_isDropping) return;
    _isDropping = YES;
    [self startMotion];
    [self getDowpData];
    [self startTimer];
}

- (IBAction)clean:(UIButton *)sender {
    [self didClickedClear:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startMotion];

}


-(void)didClickedClear:(id)sender{
    // 停止陀螺仪
    [_motionMManager stopAccelerometerUpdates];
    _isDropping = NO;
    if ([self.dowpTimer isValid]) {
        [self.dowpTimer invalidate];
        self.dowpTimer = nil;
    }
    for (UIDynamicBehavior *behavior in _animator.behaviors)
    {
        if (behavior == self.gravityBehavior)
        {
            for (UIImageView *v in self.gravityBehavior.items)
            {
                [self.gravityBehavior removeItem:v];
                if (v.superview)[v removeFromSuperview];
            }
            continue;
        }
        else if (behavior == self.collisionBehavitor)
        {
            for (UIImageView *v in self.collisionBehavitor.items) {
                [self.collisionBehavitor removeItem:v];
                if (v.superview)[v removeFromSuperview];
            }
            continue;
        }
        else [_animator removeBehavior:behavior];;
    }
    self.animator = nil;
    [self.dropsArray removeAllObjects];
}

-(void)startTimer{
     if (self.dropsArray.count == 0) return;
    _dowpTimer=[NSTimer scheduledTimerWithTimeInterval:.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if ([self.dropsArray count]) {
            
            UIImageView * dropView = self.dropsArray[0];
            [self.dropsArray removeObjectAtIndex:0];
            [self.view addSubview:dropView];
            //推移行为    mode：推移模式 //UIPushBehaviorModeInstantaneous  力是瞬时的
            ////UIPushBehaviorModeContinuous  力是连续的
            UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[dropView] mode:UIPushBehaviorModeInstantaneous];
            [self.animator addBehavior:pushBehavior];
            //角度范围 ［0.6 1.0］
            float random = ((int)(2 + (arc4random() % (10 - 4 + 1))))*0.1;
            //给了物体一个运动的方向和初速度
            pushBehavior.pushDirection = CGVectorMake(0.6,random);
            if (dropView.tag != 11) {
                pushBehavior.pushDirection = CGVectorMake(-0.6,random);
            }
            //默认值是YES，将其设置为NO，可以将行为停止
            pushBehavior.active = YES;
            //给物体一个加速度，默认值为0.0f
            pushBehavior.magnitude = 0.3;
            [self.gravityBehavior addItem:dropView];
            [self.collisionBehavitor addItem:dropView];
            [self remove:dropView pushBehavior:pushBehavior];
        }else{
            [timer invalidate];
            timer=nil;
            _isDropping = NO;
        }
        
    }];

    [_dowpTimer fire];
    
}

/**
 *  5秒之后自动移除
 *
 */
-(void)remove:(UIImageView *) dropView  pushBehavior:(UIPushBehavior *)pushBehavior {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dropView.alpha = 0;
        [self.gravityBehavior removeItem:dropView];
        [self.collisionBehavitor removeItem:dropView];
        [pushBehavior removeItem:dropView];
        [self.animator removeBehavior:pushBehavior];
        [dropView removeFromSuperview];
    });

}

#pragma mark instance methods
- (void)startMotion
{
    if (!_motionMManager) {
        _motionMManager = [[CMMotionManager alloc] init];
    }
    //检查传感器到底在设备上是否可用
    if(_motionMManager.accelerometerAvailable)
    {
        //判断加速计是否已经激活
        if (!_motionMManager.accelerometerActive)
        {
            // 获取硬件数据的更新间隙
            _motionMManager.accelerometerUpdateInterval = 1.0/3.0;
            __unsafe_unretained typeof(self) weakSelf = self;
            //  Push(按照accelerometerUpdateInterval定时推送回来)
            [_motionMManager
             startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init]
             withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                 // CMAcceleration 是表示加速计数据的结构体
                 if (error)
                 {
                     NSLog(@"CoreMotion Error : %@",error);
                     // 结束更新硬件数据
                     [_motionMManager stopAccelerometerUpdates];
                 }
                 CGFloat a = accelerometerData.acceleration.x;
                 CGFloat b = accelerometerData.acceleration.y;
                 
                 CGVector gravityDirection = CGVectorMake(a,-b);
                 //表示重力方向
                 weakSelf.gravityBehavior.gravityDirection = gravityDirection;
             }];
        }
        
    }
    else
    {
        NSLog(@"The accelerometer is unavailable");
    }
}
/**
 *  掉落的imageView 数组
 */
- (NSMutableArray *)getDowpData
{
    UIImage *love = [UIImage imageNamed:@"love"];
    UIImage *star = [UIImage imageNamed:@"star"];
    NSArray * images =@[love,star];
    
    NSMutableArray *viewArray = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 40; i++) {
        
        UIImage *image = [images objectAtIndex:rand()%[images count]];
        UIImageView * imageView =[[UIImageView alloc ]initWithImage:image];
        imageView.backgroundColor=[UIColor redColor];
        imageView.contentMode = UIViewContentModeCenter;
        // 设置 开始路径
        imageView.center = CGPointMake(50, 100);
        imageView.tag = 11;
        if (i%2 == 0) {
            // 设置 开始路径
            imageView.center = CGPointMake(SCREEN_WIDTH - 50, 100);
            imageView.tag = 22;
        }
        [viewArray addObject:imageView];
    }
    [self.dropsArray addObjectsFromArray:viewArray];
    return _dropsArray;
    
}

- (UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        /** 重力效果*/
        self.gravityBehavior = [[UIGravityBehavior alloc] init];
        //        self.gravityBehavior.gravityDirection = CGVectorMake(0.5,1);
        /** 碰撞效果*/
        self.collisionBehavitor = [[UICollisionBehavior alloc] init];
        //碰撞动力界限是否有效 YES 界限起作用 NO 不起作用
        [self.collisionBehavitor setTranslatesReferenceBoundsIntoBoundary:NO];
        [_animator addBehavior:self.gravityBehavior];
        [_animator addBehavior:self.collisionBehavitor];
    }
    return _animator;
}

-(NSMutableArray *)dropsArray{
    if (nil == _dropsArray) {
        _dropsArray = [NSMutableArray array];
    }
    return _dropsArray;
}

-(void)dealloc{
    NSLog(@"dealloc");
}

@end
