//
//  CheckBtnViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/24.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "CheckBtnViewController.h"
#import "CheckBtn.h"
@interface CheckBtnViewController ()

@end

@implementation CheckBtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    CheckBtn *checkBtn = [[CheckBtn alloc] initWithFrame:CGRectMake(150, 200, 39, 39)];
    [checkBtn addTarget:self action:@selector(checkBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkBtn];
}

- (void)checkBtnEvent:(CheckBtn *)btn
{
    btn.showCheck = !btn.showCheck;
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
