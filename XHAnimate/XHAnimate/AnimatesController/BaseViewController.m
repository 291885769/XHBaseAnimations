//
//  BaseViewController.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/1/19.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//
/*
 UIBezierPath贝塞尔弧线常用方法记 (2012-09-19 21:34:56)
 转载
 ▼
	分类： IOS相关
 //根据一个矩形画曲线
 
 + (UIBezierPath *)bezierPathWithRect:(CGRect)rect
 
 
 //根据矩形框的内切圆画曲线
 
 + (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect
 
 
 //根据矩形画带圆角的曲线
 
 + (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
 
 
 //在矩形中，可以针对四角中的某个角加圆角
 
 + (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
 
 参数：
 
 corners:枚举值，可以选择某个角
 
 cornerRadii:圆角的大小
 
 //以某个中心点画弧线
 
 + (UIBezierPath *)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
 
 参数：
 
 center:弧线中心点的坐标
 
 radius:弧线所在圆的半径
 
 startAngle:弧线开始的角度值
 
 endAngle:弧线结束的角度值
 
 clockwise:是否顺时针画弧线
 
 
 //以三个点画一段曲线，一般和moveToPoint 起点配合使用
 controlPoint1  控制点 endPoint终点 这里是 1个控制点
 - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
 
 参数：
 
 endPoint:曲线的终点
 
 controlPoint:画曲线的基准点
 
 
 //以三个点画一段曲线，一般和moveToPoint 起点配合使用
 controlPoint1  控制点 endPoint终点 这里是 2个控制点
 - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2
 
 参数：
 
 endPoint:曲线的终点
 
 controlPoint1:画曲线的第一个基准点
 
 controlPoint2:画曲线的第二个基准点
 
 */
#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
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
