//
//  NSObject+AudioConfig.h
//  AudioAcquisition
//
//  Created by 张维熙 on 2022/5/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGAudioConfig : NSObject
+ (instancetype)defaultConfig;

@property(nonatomic, assign) NSUInteger channels; // 声道数，default: 2。
@property(nonatomic, assign) NSUInteger sampleRate; // 采样率，default: 44100。
@property(nonatomic, assign) NSUInteger bitDepth; // 量化位深，default: 16。
@end

NS_ASSUME_NONNULL_END
