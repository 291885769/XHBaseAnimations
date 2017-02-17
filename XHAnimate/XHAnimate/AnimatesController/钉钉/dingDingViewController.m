//
//  dingDingViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/15.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "dingDingViewController.h"
#import "XHBubbleMenuButton.h"
@interface dingDingViewController ()
@property (nonatomic , strong) XHBubbleMenuButton *dingdingAnimationMenu;
@end

@implementation dingDingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dingdingAnimation];
    
}
/**
 *  仿造钉钉菜单动画
 */
-(void)dingdingAnimation{

        UILabel *homeLabel = [self createHomeButtonView];
        
        _dingdingAnimationMenu = [[XHBubbleMenuButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - homeLabel.frame.size.width - 20.f,self.view.frame.size.height - homeLabel.frame.size.height - 20.f,homeLabel.frame.size.width,homeLabel.frame.size.height)expansionDirection:DirectionUp];
        _dingdingAnimationMenu.homeButtonView = homeLabel;
        [_dingdingAnimationMenu addButtons:[self createDemoButtonArray]];
        
        [self.view addSubview:_dingdingAnimationMenu];

}
- (UILabel *)createHomeButtonView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 40.f, 40.f)];
    
    label.text = @"Tap";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = label.frame.size.height / 2.f;
    label.backgroundColor =[UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
    label.clipsToBounds = YES;
    
    return label;
}
- (NSArray *)createDemoButtonArray {
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];
    
    int i = 0;
    for (NSString *title in @[@"A", @"B", @"C", @"D", @"E", @"F"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        
        button.frame = CGRectMake(0.f, 0.f, 30.f, 30.f);
        button.layer.cornerRadius = button.frame.size.height / 2.f;
        button.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
        button.clipsToBounds = YES;
        button.tag = i++;
        
        [button addTarget:self action:@selector(dwBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [buttonsMutable addObject:button];
    }
    
    return [buttonsMutable copy];
}

- (void)dwBtnClick:(UIButton *)sender {
    NSLog(@"DWButton tapped, tag: %ld", (long)sender.tag);
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
