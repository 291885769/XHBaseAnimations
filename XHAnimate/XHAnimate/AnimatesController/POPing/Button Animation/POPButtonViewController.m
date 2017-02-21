//
//  POPButtonViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/21.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "POPButtonViewController.h"

@interface POPButtonViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttton;
@property (weak, nonatomic) IBOutlet UIButton *shakeButton;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation POPButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.buttton addTarget:self action:@selector(scaleToSmall)
   forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [self.buttton addTarget:self action:@selector(scaleAnimation)
   forControlEvents:UIControlEventTouchUpInside];
    [self.buttton addTarget:self action:@selector(scaleToDefault)
   forControlEvents:UIControlEventTouchDragExit];
    
    
}
- (IBAction)shakeButtonAction:(UIButton *)sender {
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    /* @abstract当前速度值。@discussion之前设置动画开始占初始速度。表达的变化值单位每秒。*/
    positionAnimation.velocity = @1000;
    positionAnimation.springBounciness = 20;
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        
    }];
    [sender.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
}

-(void)scaleToSmall{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.95f, 0.95f)];
    [self.buttton.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
}
-(void)scaleAnimation{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 18.0f;
    [self.buttton.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
}
-(void)scaleToDefault{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [self.buttton.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleDefaultAnimation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
