/*
 *  RTCAudioDeviceIosObserver.mm
 *
 */

#import "RTCAudioDeviceIosObserver+Private.h"

#include "modules/audio_device/include/audio_device.h"

namespace webrtc {
class AudioDeviceIosObserver : public AduioDeviceObserver {
 public:
    AudioDeviceIosObserver(RTCAudioDeviceIosObserver *audioDeviceIosObserver) {
      audioDeviceIosObserver_ = audioDeviceIosObserver;
    }

    ~AudioDeviceIosObserver() override {
      audioDeviceIosObserver_ = nil;
    }

    virtual void OnGetPlayoutAudioData(void *flags,
                                     const void *time_stamp,
                                     uint32_t bus_number,
                                     uint32_t num_frames,
                                     void *io_data) override {
      RTCAudioDeviceIosObserver *audioDeviceIosObserver = audioDeviceIosObserver_;
      [audioDeviceIosObserver.delegate receivedAudioData:(AudioUnitRenderActionFlags *)flags
                                               timeStamp:(AudioTimeStamp *)time_stamp
                                               busNumber:bus_number
                                               numFrames:num_frames
                                                  ioData:(AudioBufferList *)io_data];
    }

 private:
    __weak RTCAudioDeviceIosObserver *audioDeviceIosObserver_;
};
}  // namespace webrtc

@implementation RTCAudioDeviceIosObserver {
  std::unique_ptr<webrtc::AduioDeviceObserver> _nativeAudioDeviceIosObserver;
}

- (instancetype)initWithDelegate:(id<RTCAudioDeviceIosObserverDelegate>)delegate {
	if (self = [super init]) {
    _nativeAudioDeviceIosObserver.reset(new webrtc::AudioDeviceIosObserver(self));

    _delegate = delegate;
  }

  return self;
}

- (webrtc::AduioDeviceObserver *)nativeAudioDeviceIosObserver {
  return _nativeAudioDeviceIosObserver.get();
}

@end
