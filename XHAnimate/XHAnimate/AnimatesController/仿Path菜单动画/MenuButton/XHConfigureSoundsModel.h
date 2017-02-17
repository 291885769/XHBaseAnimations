//
//  XHConfigureSoundsModel.h
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/14.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface XHConfigureSoundsModel : NSObject
/**
 *  中间点击声音
 */
-(void)playBloomSound;
/**
 *  取消点击声音
 */
-(void)foldSound;
/**
 *  选中点击声音
 */
-(void)selectedSound;
@end
