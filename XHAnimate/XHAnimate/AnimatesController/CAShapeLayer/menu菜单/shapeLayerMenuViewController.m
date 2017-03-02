//
//  shapeLayerMenuViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/24.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "shapeLayerMenuViewController.h"
#import "UIMenuButton.h"
@interface shapeLayerMenuViewController ()

@end

@implementation shapeLayerMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIMenuButton *menuButton=[[UIMenuButton alloc]initWithFrame:CGRectMake(100, 100, 54, 54)];
    menuButton.backgroundColor=[UIColor greenColor];
    [menuButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuButton];
    self.view.backgroundColor=[UIColor blackColor];
}
-(void)buttonAction:(UIMenuButton*)button{
    
    button.show = !button.show;
    
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
