//
//  XHBubbleMenuButton.h
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/15.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ExpansionDirection) {
    DirectionLeft = 0,
    DirectionRight,
    DirectionUp,
    DirectionDown
};
@class XHBubbleMenuButton;

@protocol XHBubbleMenuButtonDelegate <NSObject>

@optional
- (void)bubbleMenuButtonWillExpand:(XHBubbleMenuButton *)expandableView;
- (void)bubbleMenuButtonDidExpand:(XHBubbleMenuButton *)expandableView;
- (void)bubbleMenuButtonWillCollapse:(XHBubbleMenuButton *)expandableView;
- (void)bubbleMenuButtonDidCollapse:(XHBubbleMenuButton *)expandableView;

@end
@interface XHBubbleMenuButton : UIView <UIGestureRecognizerDelegate>
@property (nonatomic, weak, readonly) NSArray *buttons;
@property (nonatomic, strong) UIView *homeButtonView;
@property (nonatomic, readonly) BOOL isCollapsed;
@property (nonatomic, weak) id <XHBubbleMenuButtonDelegate> delegate;

// The direction in which the menu expands
@property (nonatomic) enum ExpansionDirection direction;

// Indicates whether the home button will animate it's touch highlighting, this is enabled by default
@property (nonatomic) BOOL animatedHighlighting;

// Indicates whether menu should collapse after a button selection, this is enabled by default
@property (nonatomic) BOOL collapseAfterSelection;

// The duration of the expand/collapse animation
@property (nonatomic) float animationDuration;

// The default alpha of the homeButtonView when not tapped
@property (nonatomic) float standbyAlpha;

// The highlighted alpha of the homeButtonView when tapped
@property (nonatomic) float highlightAlpha;

// The spacing between menu buttons when expanded
@property (nonatomic) float buttonSpacing;

// Initializers
- (id)initWithFrame:(CGRect)frame expansionDirection:(ExpansionDirection)direction;

// Public Methods
- (void)addButtons:(NSArray *)buttons;
- (void)addButton:(UIButton *)button;
- (void)showButtons;
- (void)dismissButtons;
@end
