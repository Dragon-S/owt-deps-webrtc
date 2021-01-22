/*
 *  RTCAudioDeviceIosObserver+Private.h
 *
 */

#import "RTCAudioDeviceIosObserver.h"

#include "modules/audio_device/include/audio_device.h"

NS_ASSUME_NONNULL_BEGIN

@interface RTCAudioDeviceIosObserver ()

@property(nonatomic, weak, nullable, readonly) id<RTCAudioDeviceIosObserverDelegate> delegate;
@property(nonatomic, readonly) webrtc::AduioDeviceObserver* nativeAudioDeviceIosObserver;

@end

NS_ASSUME_NONNULL_END
