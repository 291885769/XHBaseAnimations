//
//  XHPathItemButton.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/14.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import "XHPathItemButton.h"


@interface XHPathItemButton ()

@property (strong, nonatomic) UIImageView *backgroundImageView;

@end

@implementation XHPathItemButton

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage backgroundImage:(UIImage *)backgroundImage backgroundHighlightedImage:(UIImage *)backgroundHighlightedImage
{
    if (self = [super init]) {
        
        // Make sure the iteam has a certain frame
        //
        CGRect itemFrame = CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height);
        
        if (!backgroundImage || !backgroundHighlightedImage) {
            itemFrame = CGRectMake(0, 0, image.size.width, image.size.height);
        }
        self.frame = itemFrame;
        
        // Configure the item image
        //
        self.image = backgroundImage;
        self.highlightedImage = backgroundHighlightedImage;
        
        self.userInteractionEnabled = YES;
        
        // Configure background
        //
        _backgroundImageView = [[UIImageView alloc]initWithImage:image
                                                highlightedImage:highlightedImage];
        
        _backgroundImageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        
        [self addSubview:_backgroundImageView];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = YES;
    self.backgroundImageView.highlighted = YES;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint currentLocation = [[touches anyObject]locationInView:self];
    
    if (! CGRectContainsPoint([self scaleRect:self.bounds], currentLocation)) {
        self.highlighted = NO;
        self.backgroundImageView.highlighted = NO;
        
        return ;
    }
    
    self.highlighted = YES;
    self.backgroundImageView.highlighted = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_delegate respondsToSelector:@selector(itemButtonTapped:)]) {
        [_delegate itemButtonTapped:self];
    }
    
    self.highlighted = NO;
    self.backgroundImageView.highlighted = NO;
}

#pragma mark - Scale Item Button

- (CGRect)scaleRect:(CGRect)originRect
{
    return CGRectMake(- originRect.size.width * 2,
                      - originRect.size.height * 2,
                      originRect.size.width * 5,
                      originRect.size.height * 5);
}


@end
