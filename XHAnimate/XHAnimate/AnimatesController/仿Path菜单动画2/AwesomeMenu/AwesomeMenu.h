//
//  AwesomeMenu.h
//  AwesomeMenu
//
//  Created by Levey on 11/30/11.
//  Copyright (c) 2011 Levey & Other Contributors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwesomeMenuItem.h"

/// 动画展示的2种类型:直线状\圆弧状
typedef NS_ENUM (NSInteger , SDiffuseMenuGrapyType){
    /**
     *  直线
     */
    SDiffuseMenuGrapyTypeLine,
    /**
     *  弧形
     */
    SDiffuseMenuGrapyTypeArc
    
};




@protocol AwesomeMenuDelegate;

@interface AwesomeMenu : UIView <AwesomeMenuItemDelegate>

@property (nonatomic, copy) NSArray *menuItems;
@property (nonatomic, strong) AwesomeMenuItem *startButton;

@property (nonatomic, getter = isExpanded) BOOL expanded;
@property (nonatomic, weak) id<AwesomeMenuDelegate> delegate;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *highlightedImage;
@property (nonatomic, strong) UIImage *contentImage;
@property (nonatomic, strong) UIImage *highlightedContentImage;

/**
 *  直线||弧形
 */
@property (nonatomic,assign) SDiffuseMenuGrapyType menuGrapyType;

/**
 *   最小半径
 */
@property (nonatomic, assign) CGFloat nearRadius;
/**
 *  结束半径
 */
@property (nonatomic, assign) CGFloat endRadius;
/**
 * 最大半径 弹跳最远的距离
 */
@property (nonatomic, assign) CGFloat farRadius;
/**
 *  开始坐标点
 */
@property (nonatomic, assign) CGPoint startPoint;
/**
 *  单个动画间隔时间
 */
@property (nonatomic, assign) CGFloat timeOffset;
/**
 *  从哪个角度开始 选项按钮整体偏移
 */
@property (nonatomic, assign) CGFloat rotateAngle;
/**
 *  占用的全部角度
 */
@property (nonatomic, assign) CGFloat menuWholeAngle;
/**
 *  展开时自旋角度
 */
@property (nonatomic, assign) CGFloat expandRotation;
/**
 *  结束时自旋角度
 */
@property (nonatomic, assign) CGFloat closeRotation;
/**
 *  动画时长
 */
@property (nonatomic, assign) CGFloat animationDuration;
/**
 *  是否旋转菜单按钮
 */
@property (nonatomic, assign) BOOL    rotateAddButton;

- (id)initWithFrame:(CGRect)frame startItem:(AwesomeMenuItem*)startItem menuItems:(NSArray *)menuItems;

- (id)initWithFrame:(CGRect)frame startItem:(AwesomeMenuItem*)startItem optionMenus:(NSArray *)aMenusArray DEPRECATED_MSG_ATTRIBUTE("use -initWithFrame:startItem:menuItems: instead.");

- (AwesomeMenuItem *)menuItemAtIndex:(NSUInteger)index;

- (void)open;

- (void)close;

@end

@protocol AwesomeMenuDelegate <NSObject>
- (void)awesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx;
@optional
- (void)awesomeMenuDidFinishAnimationClose:(AwesomeMenu *)menu;
- (void)awesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu;
- (void)awesomeMenuWillAnimateOpen:(AwesomeMenu *)menu;
- (void)awesomeMenuWillAnimateClose:(AwesomeMenu *)menu;
@end
