/*
 *  RTCAudioDeviceIosObserver.h
 *
 */

#include <AudioUnit/AudioUnit.h>

#import "RTCMacros.h"

NS_ASSUME_NONNULL_BEGIN

RTC_OBJC_EXPORT
@protocol RTCAudioDeviceIosObserverDelegate <NSObject>

@required
- (void)receivedAudioData:(AudioUnitRenderActionFlags *)flags
                timeStamp:(AudioTimeStamp *)timeStamp
                busNumber:(UInt32)busNumber
                numFrames:(UInt32)numFrames
                   ioData:(AudioBufferList *)ioData;

@end

@interface RTCAudioDeviceIosObserver : NSObject

- (instancetype)initWithDelegate:(id<RTCAudioDeviceIosObserverDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
