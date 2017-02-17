//
//  XHPathVIew.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/14.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//




#import "XHPathVIew.h"

#import "XHPathCenterButton.h"

#import "XHPathItemButton.h"

#import "XHConfigureSoundsModel.h"

@interface XHPathVIew ()<XHPathCenterButtonDelegate, XHPathItemButtonDelegate>

@property (nonatomic,strong) XHConfigureSoundsModel *configureSoundsModel;


@property (strong, nonatomic) UIImage *centerImage;
@property (strong, nonatomic) UIImage *centerHighlightedImage;
/**
 *  是否正在展示 默认为NO
 */
@property (assign, nonatomic, getter = isBloom) BOOL bloom;

@property (assign, nonatomic) CGSize centerImageSize;
@property (assign, nonatomic) CGSize viewSize;




@property (assign, nonatomic) CGPoint pathCenterButtonBloomCenter;

@property (assign, nonatomic) CGPoint expandCenter;
@property (strong, nonatomic) XHPathCenterButton *pathCenterButton;
@property (strong, nonatomic) NSMutableArray *itemButtons;




@end

@implementation XHPathVIew

#pragma mark - Initialization

- (id)initWithCenterImage:(UIImage *)centerImage hilightedImage:(UIImage *)centerHighlightedImage andFrame:(CGRect)frame
{
    if (self = [super init]) {
        
        // Configure center and high light center image
        self.frame=frame;
        self.centerImage = centerImage;
        self.centerHighlightedImage = centerHighlightedImage;
        
        // Init button and image array
        //
        self.itemButtonImages = [[NSMutableArray alloc]init];
        self.itemButtonHighlightedImages = [[NSMutableArray alloc]init];
        self.itemButtons = [[NSMutableArray alloc]init];
        
        // Configure views
        //
        [self configureViewsLayout];
        
        // Configure sounds
        //
        self.configureSoundsModel=[[XHConfigureSoundsModel alloc] init];
        

    }
    return self;
}

- (void)configureViewsLayout
{
    // Init some property only once
    //
    
    self.centerImageSize = self.centerImage.size;
    
    self.pathCenterButtonBloomCenter = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    
    self.circleRadius = 90;

    _pathCenterButton = [[XHPathCenterButton alloc]initWithImage:self.centerImage highlightedImage:self.centerHighlightedImage];
    _pathCenterButton.center = self.pathCenterButtonBloomCenter;
    _pathCenterButton.delegate = self;
    [self addSubview:_pathCenterButton];
    
}



#pragma mark - Configure Center Button Images

- (void)setCenterImage:(UIImage *)centerImage
{
    if (!centerImage) {
        NSLog(@"Load center image failed ... ");
        return ;
    }
    _centerImage = centerImage;
}

- (void)setCenterHighlightedImage:(UIImage *)highlightedImage
{
    if (!highlightedImage) {
        NSLog(@"Load highted image failed ... ");
        return ;
    }
    _centerHighlightedImage = highlightedImage;
}

#pragma mark - Configure Expand Center Point

- (void)setPathCenterButtonBloomCenter:(CGPoint)centerButtonBloomCenter
{
    // Just set the bloom center once
    //
    if (_pathCenterButtonBloomCenter.x == 0) {
        _pathCenterButtonBloomCenter = centerButtonBloomCenter;
    }
    return ;
}

#pragma mark - Expand Status

- (BOOL)isBloom
{
    return _bloom;
}

#pragma mark - Center Button Delegate

- (void)centerButtonTapped
{
    self.isBloom? [self pathCenterButtonFold] : [self pathCenterButtonBloom];
}

#pragma mark - Caculate The Item's End Point
/**
 *  通过正弦函数   算出终点坐标 
 
 半径 弧度 算出 x,y 长度
 
 *
 *  @param itemExpandRadius 半径
 *  @param angel            角度弧度
 *
 *  @return 坐标点
 */
- (CGPoint)createEndPointWithRadius:(CGFloat)itemExpandRadius andAngel:(CGFloat)angel
{
    switch (self.pathViewDirectionType) {
        case XHPathViewDirectionTypeTop:
            //    上
            return CGPointMake(self.pathCenterButtonBloomCenter.x - cosf(angel *M_PI) * itemExpandRadius,self.pathCenterButtonBloomCenter.y - sinf(angel * M_PI) * itemExpandRadius);
            break;
        case XHPathViewDirectionTypeDown:
            //    下
            return CGPointMake(self.pathCenterButtonBloomCenter.x - cosf(angel *M_PI) * itemExpandRadius,self.pathCenterButtonBloomCenter.y + sinf(angel * M_PI) * itemExpandRadius);
            break;
        case XHPathViewDirectionTypeLeft:
            // 左边
            return CGPointMake(self.pathCenterButtonBloomCenter.x - sinf(angel *M_PI) * itemExpandRadius,self.pathCenterButtonBloomCenter.y - cosf(angel * M_PI) * itemExpandRadius);
            break;
        default:
            //右边
            return CGPointMake(self.pathCenterButtonBloomCenter.x + sinf(angel *M_PI) * itemExpandRadius,self.pathCenterButtonBloomCenter.y - cosf(angel * M_PI) * itemExpandRadius);
            break;
    }
}

#pragma mark - Center Button Fold

- (void)pathCenterButtonFold
{
    // Play fold sound
    //
     [self.configureSoundsModel foldSound];
    // Load item buttons from array
    //
    for (int i = 1; i <= self.itemButtons.count; i++) {
        
        XHPathItemButton *itemButton = self.itemButtons[i - 1];
        
        CGFloat currentAngel = i / ((CGFloat)self.itemButtons.count + 1);
        CGPoint farPoint = [self createEndPointWithRadius:self.circleRadius + 5.0f andAngel:currentAngel];
        
        CAAnimationGroup *foldAnimation = [self foldAnimationFromPoint:itemButton.center withFarPoint:farPoint];
        
        [itemButton.layer addAnimation:foldAnimation forKey:@"foldAnimation"];
        itemButton.center = self.pathCenterButtonBloomCenter;
        
    }
    
    [self bringSubviewToFront:self.pathCenterButton];
    
    // Resize the DCPathButton's frame to the foled frame and remove the item buttons
    //
    [self resizeToFoldedFrame];
    
}
/**
 *  中间按钮做旋转动画
 */
- (void)resizeToFoldedFrame
{
    [UIView animateWithDuration:0.0618f * 3
                          delay:0.0618f * 2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _pathCenterButton.transform = CGAffineTransformMakeRotation(0);
                     }
                     completion:nil];
    
//    [UIView animateWithDuration:0.1f
//                          delay:0.35f
//                        options:UIViewAnimationOptionCurveLinear
//                     animations:^{
//                         self.backgroundColor=[UIColor clearColor];
//                     }
//                     completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        for (XHPathItemButton *itemButton in self.itemButtons) {
            [itemButton performSelector:@selector(removeFromSuperview)];
        }
    });
    
    _bloom = NO;
}
/**
 *  取消的时候旋转并终点移动到在最远处的点
 *
 *  @param endPoint 停止的点
 *  @param farPoint 最远的点
 *
 *  @return 动画组
 */
- (CAAnimationGroup *)foldAnimationFromPoint:(CGPoint)endPoint withFarPoint:(CGPoint)farPoint
{
    // 1.Configure rotation animation
    //
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.values = @[@(0), @(M_PI), @(M_PI * 2)];
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotationAnimation.duration = 0.35f;
    
    // 2.Configure moving animation
    //
    CAKeyframeAnimation *movingAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // Create moving path
    //
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, endPoint.x, endPoint.y);
    CGPathAddLineToPoint(path, NULL, farPoint.x, farPoint.y);
    CGPathAddLineToPoint(path, NULL, self.pathCenterButtonBloomCenter.x, self.pathCenterButtonBloomCenter.y);
    //keyTimes：各个关键帧的时间控制。前面使用values设置了四个关键帧，默认情况下每两帧之间的间隔为:8/(4-1)秒。如果想要控制动画从第一帧到第二针占用时间4秒，从第二帧到第三帧时间为2秒，而从第三帧到第四帧时间2秒的话，就可以通过keyTimes进行设置。keyTimes中存储的是时间占用比例点，此时可以设置keyTimes的值为0.0，0.5，0.75，1.0（当然必须转换为NSNumber），也就是说1到2帧运行到总时间的50%，2到3帧运行到总时间的75%，3到4帧运行到8秒结束。
    movingAnimation.keyTimes = @[@(0.0f), @(0.75), @(1.0)];
    
    movingAnimation.path = path;
    movingAnimation.duration = 0.35f;
    CGPathRelease(path);
    
    // 3.Merge animation together
    //
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[rotationAnimation, movingAnimation];
    animations.duration = 0.35f;
    
    return animations;
}

#pragma mark - Center Button Bloom
/**
 *  中间按钮开始点击事件
 */
- (void)pathCenterButtonBloom
{
    // Play bloom sound
    //
    [self.configureSoundsModel playBloomSound];
    // Configure center button bloom
    //
    // 1. Store the current center point to 'centerButtonBloomCenter
    //
   
    
    // 2. Resize the DCPathButton's frame
    //
//    self.frame = CGRectMake(0, 0, self.viewSize.width, self.viewSize.height);
//    self.center = CGPointMake(self.viewSize.width / 2, self.viewSize.height / 2);
    
    
    
    // 3. Excute the bottom view alpha animation
    //
//    [UIView animateWithDuration:0.0618f * 3
//                          delay:0.0f
//                        options:UIViewAnimationOptionCurveEaseIn
//                     animations:^{
//                         self.backgroundColor=[UIColor colorWithWhite:0.000 alpha:0.305];
//                     }
//                     completion:nil];
    
    // 4. Excute the center button rotation animation
    //
    [UIView animateWithDuration:0.1575f
                     animations:^{
                         _pathCenterButton.transform = CGAffineTransformMakeRotation(-0.75f * M_PI);
                     }];
    
    self.pathCenterButton.center = self.pathCenterButtonBloomCenter;
    
    // 5. Excute the bloom animation
    // 每个item 的弧度间距
    CGFloat basicAngel = 180 / (self.itemButtons.count + 1) ;
    
    for (int i = 1; i <= self.itemButtons.count; i++) {
        
        XHPathItemButton *pathItemButton = self.itemButtons[i - 1];
        
        pathItemButton.delegate = self;
        pathItemButton.tag = i - 1;
        pathItemButton.transform = CGAffineTransformMakeTranslation(1, 1);
        pathItemButton.alpha = 1.0f;
        
        // 1. Add pathItem button to the view
        // 当前 旋转了多少弧度
        CGFloat currentAngel = (basicAngel * i)/180;
        
        pathItemButton.center = self.pathCenterButtonBloomCenter;
        
        [self insertSubview:pathItemButton belowSubview:self.pathCenterButton];
        
        // 2.Excute expand animation
        //
        CGPoint endPoint = [self createEndPointWithRadius:self.circleRadius andAngel:currentAngel];
        CGPoint farPoint = [self createEndPointWithRadius:self.circleRadius + 10.0f andAngel:currentAngel];
        CGPoint nearPoint = [self createEndPointWithRadius:self.circleRadius - 5.0f andAngel:currentAngel];
        
        CAAnimationGroup *bloomAnimation = [self bloomAnimationWithEndPoint:endPoint
                                                                andFarPoint:farPoint
                                                               andNearPoint:nearPoint];
        
        [pathItemButton.layer addAnimation:bloomAnimation forKey:@"bloomAnimation"];
        pathItemButton.center = endPoint;
        
    }
    
    _bloom = YES;
    
}

- (CAAnimationGroup *)bloomAnimationWithEndPoint:(CGPoint)endPoint andFarPoint:(CGPoint)farPoint andNearPoint:(CGPoint)nearPoint
{
    // 1.Configure rotation animation
    //
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.values = @[@(0.0), @(- M_PI), @(- M_PI * 1.5), @(- M_PI * 2)];
    rotationAnimation.duration = 0.3f;
    rotationAnimation.keyTimes = @[@(0.0), @(0.3), @(0.6), @(1.0)];
    
    // 2.Configure moving animation
    //
    CAKeyframeAnimation *movingAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // Create moving path  起点->最远->最近->停止 起到弹跳效果
    //
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, self.pathCenterButtonBloomCenter.x, self.pathCenterButtonBloomCenter.y);
    CGPathAddLineToPoint(path, NULL, farPoint.x, farPoint.y);
    CGPathAddLineToPoint(path, NULL, nearPoint.x, nearPoint.y);
    CGPathAddLineToPoint(path, NULL, endPoint.x, endPoint.y);
    
    movingAnimation.path = path;
    movingAnimation.keyTimes = @[@(0.0), @(0.5), @(0.7), @(1.0)];
    movingAnimation.duration = 0.3f;
    CGPathRelease(path);
    
    // 3.Merge two animation together
    //
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[movingAnimation, rotationAnimation];
    animations.duration = 0.3f;
    
    
    return animations;
}

#pragma mark - Add PathButton Item

- (void)addPathItems:(NSArray *)pathItemButtons
{
    [self.itemButtons addObjectsFromArray:pathItemButtons];
}

#pragma mark - DCPathButton Touch Events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Tap the bottom area, excute the fold animation
    [self pathCenterButtonFold];
}

#pragma mark - DCPathButton Item Delegate

- (void)itemButtonTapped:(XHPathItemButton *)itemButton
{
    if ([_delegate respondsToSelector:@selector(itemButtonTappedAtIndex:)]) {
        
        XHPathItemButton *selectedButton = self.itemButtons[itemButton.tag];
        
        // Play selected sound
        //
         [self.configureSoundsModel selectedSound];
        
        // Excute the explode animation when the item is seleted
        //
        [UIView animateWithDuration:0.0618f * 5
                         animations:^{
                             selectedButton.transform = CGAffineTransformMakeScale(3, 3);
                             selectedButton.alpha = 0.0f;
                         }];
        
        // Excute the dismiss animation when the item is unselected
        //
        for (int i = 0; i < self.itemButtons.count; i++) {
            if (i == selectedButton.tag) {
                continue;
            }
            XHPathItemButton *unselectedButton = self.itemButtons[i];
            [UIView animateWithDuration:0.0618f * 2
                             animations:^{
                                 unselectedButton.transform = CGAffineTransformMakeScale(0, 0);
                             }];
        }
        
        // Excute the delegate method
        //
        [_delegate itemButtonTappedAtIndex:itemButton.tag];
        
        // Resize the DCPathButton's frame
        //
        [self resizeToFoldedFrame];
    }
}


@end
