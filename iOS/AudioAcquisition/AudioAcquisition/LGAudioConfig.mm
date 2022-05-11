//
//  NSObject+AudioConfig.m
//  AudioAcquisition
//
//  Created by 张维熙 on 2022/5/9.
//

#import "LGAudioConfig.h"

@implementation LGAudioConfig

+ (instancetype)defaultConfig {
    LGAudioConfig *config = [[self alloc] init];
    config.channels = 2;
    config.sampleRate = 44100;
    config.bitDepth = 16;

    return config;
}

@end
