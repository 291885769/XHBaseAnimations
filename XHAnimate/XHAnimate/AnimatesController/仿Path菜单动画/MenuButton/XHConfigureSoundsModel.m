//
//  XHConfigureSoundsModel.m
//  XHAnimate
//
//  Created by Weimob-fu on 2017/2/14.
//  Copyright © 2017年 Weimob-fu. All rights reserved.
//

@import QuartzCore;
@import AudioToolbox;

#import "XHConfigureSoundsModel.h"

@interface XHConfigureSoundsModel ()
@property (assign, nonatomic) SystemSoundID bloomSoundID;
@property (assign, nonatomic) SystemSoundID foldSoundID;
@property (assign, nonatomic) SystemSoundID selectedSoundID;

@end

@implementation XHConfigureSoundsModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configureSounds];
    }
    return self;
}
/**
 *  配置声音
 */
- (void)configureSounds
{
    // Configure bloom sound
    //
    NSString *bloomSoundPath = [[NSBundle mainBundle]pathForResource:@"bloom" ofType:@"caf"];
    NSURL *bloomSoundURL = [NSURL fileURLWithPath:bloomSoundPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)bloomSoundURL, &_bloomSoundID);
    
    // Configure fold sound
    //
    NSString *foldSoundPath = [[NSBundle mainBundle]pathForResource:@"fold" ofType:@"caf"];
    NSURL *foldSoundURL = [NSURL fileURLWithPath:foldSoundPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)foldSoundURL, &_foldSoundID);
    
    // Configure selected sound
    //
    NSString *selectedSoundPath = [[NSBundle mainBundle]pathForResource:@"selected" ofType:@"caf"];
    NSURL *selectedSoundURL = [NSURL fileURLWithPath:selectedSoundPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)selectedSoundURL, &_selectedSoundID);
    
}
/**
 *  中间点击声音
 */
-(void)playBloomSound{
    AudioServicesPlaySystemSound(self.bloomSoundID);
}
/**
 *  取消点击声音
 */
-(void)foldSound{
    AudioServicesPlaySystemSound(self.foldSoundID);
}
/**
 *  选中点击声音
 */
-(void)selectedSound{
    AudioServicesPlaySystemSound(self.selectedSoundID);
}


@end
