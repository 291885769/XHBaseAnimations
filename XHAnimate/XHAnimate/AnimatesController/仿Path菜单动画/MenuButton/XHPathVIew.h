//
//  XHPathVIew.h
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/14.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger , XHPathViewDirectionType){
    /**
     *  上
     */
    XHPathViewDirectionTypeTop=0,
    /**
     *  下
     */
    XHPathViewDirectionTypeDown,
    /**
     *  左
     */
    XHPathViewDirectionTypeLeft,
    /**
     *  右
     */
    XHPathViewDirectionTypeRight,
    
    
};

@protocol XHPathVIewDelegate <NSObject>

- (void)itemButtonTappedAtIndex:(NSUInteger)index;

@end
@interface XHPathVIew : UIView

@property (weak, nonatomic) id<XHPathVIewDelegate> delegate;
/**
 *  默认居上显示
 */
@property (nonatomic,assign) XHPathViewDirectionType pathViewDirectionType;

@property (strong, nonatomic) NSMutableArray *itemButtonImages;
@property (strong, nonatomic) NSMutableArray *itemButtonHighlightedImages;

@property (strong, nonatomic) UIImage *itemButtonBackgroundImage;
@property (strong, nonatomic) UIImage *itemButtonBackgroundHighlightedImage;
/**
 *  半径
 */
@property (assign, nonatomic) CGFloat circleRadius;

- (id)initWithCenterImage:(UIImage *)centerImage hilightedImage:(UIImage *)centerHighlightedImage andFrame:(CGRect)frame;
- (void)addPathItems:(NSArray *)pathItemButtons;

@end
