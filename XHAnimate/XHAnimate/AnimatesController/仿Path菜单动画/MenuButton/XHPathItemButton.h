//
//  XHPathItemButton.h
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/14.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XHPathItemButton;

@protocol XHPathItemButtonDelegate <NSObject>

- (void)itemButtonTapped:(XHPathItemButton *)itemButton;

@end
@interface XHPathItemButton : UIImageView
@property (assign, nonatomic) NSUInteger index;
@property (weak, nonatomic) id<XHPathItemButtonDelegate> delegate;

- (id)initWithImage:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
    backgroundImage:(UIImage *)backgroundImage
backgroundHighlightedImage:(UIImage *)backgroundHighlightedImage;

@end
