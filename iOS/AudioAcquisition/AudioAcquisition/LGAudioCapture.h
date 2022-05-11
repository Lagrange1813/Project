//
//  NSObject+LGAudioCapture.h
//  AudioAcquisition
//
//  Created by 张维熙 on 2022/5/9.
//

#import <Foundation/Foundation.h>
#import <CoreMedia/CoreMedia.h>
#import "LGAudioConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface KFAudioCapture : NSObject
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithConfig:(LGAudioConfig *)config;

@property (nonatomic, strong, readonly) LGAudioConfig *config;
@property (nonatomic, copy) void (^sampleBufferOutputCallBack)(CMSampleBufferRef sample); // 音频采集数据回调。
@property (nonatomic, copy) void (^errorCallBack)(NSError *error); // 音频采集错误回调。

- (void)startRunning; // 开始采集音频数据。
- (void)stopRunning; // 停止采集音频数据。
@end

NS_ASSUME_NONNULL_END
