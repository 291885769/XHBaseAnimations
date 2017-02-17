//
//  GiftEffectViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/17.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "GiftEffectViewController.h"
#import "UIButton+Bubbling.h"
@interface GiftEffectViewController ()
@property (strong,nonatomic) UIButton *bubbeBtn;

@property (strong,nonatomic) NSArray *images;
@end

@implementation GiftEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *buton = [[UIButton alloc] initWithFrame:CGRectMake(200, self.view.frame.size.height - 100, 50, 30)];
    buton.backgroundColor = [UIColor grayColor];
    [buton setTitle:@"冒泡" forState:UIControlStateNormal];
    [self.view addSubview:buton];
    [buton addTarget:self action:@selector(bubbingLove) forControlEvents:UIControlEventTouchUpInside];
    self.bubbeBtn = buton;
    _images = @[@"ic_menu_bluepig",
                @"ic_menu_bluepig2",
                @"ic_menu_greenpig",
                @"ic_menu_greenpig2",
                @"ic_menu_pinkpig",
                @"ic_menu_pinkpig2",
                @"ic_menu_purplepig",
                @"ic_menu_purplepig2",
                @"ic_menu_yellowpig",
                @"ic_menu_yellowpig2"];
}
-(void)bubbingLove{
    /**
     *  出来一个心💕图片 颜色随机
     */
    [self.bubbeBtn bubbingImage:[UIImage imageNamed:@"love"]];
    /**
     *  随机出来一个图片layer
     */
    [self.bubbeBtn bubbingImages:_images];
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
