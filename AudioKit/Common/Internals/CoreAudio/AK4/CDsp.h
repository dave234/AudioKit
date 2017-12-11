//
//  CDsp.h
//  AudioKit
//
//  Created by David O'Neill on 12/10/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//

#ifndef CDsp_h
#define CDsp_h

#include <stdio.h>
#include <AudioToolbox/AudioToolbox.h>

#ifdef __OBJC__
#define AKNEWTYPE __attribute((swift_newtype(struct)))
#else
#define AKNEWTYPE
#endif

#if defined(__cplusplus)
extern "C" {
#endif /* defined(__cplusplus) */

#ifndef CF_SWIFT_NAME
#define CF_SWIFT_NAME(a)
#endif

typedef void * CDsp AKNEWTYPE;

void CDspProcess(CDsp dsp, uint32_t frameCount, uint32_t bufferOffset)
    CF_SWIFT_NAME(CDsp.process(self:frameCount:bufferOffset:));
void CDspSetParameter(CDsp dsp, uint64_t address, float value, BOOL immediate)
    CF_SWIFT_NAME(CDsp.setParameter(self:address:value:immediate:));
float CDspGetParameter(CDsp dsp, uint64_t address)
    CF_SWIFT_NAME(CDsp.getParameter(self:address:));
void CDspReset(CDsp dsp)
    CF_SWIFT_NAME(CDsp.reset(self:));
void CDspSetBuffers(CDsp dsp, AudioBufferList* inBufs, AudioBufferList* outBufs)
    CF_SWIFT_NAME(CDsp.setBuffers(self:inBufs:outBufs:));
void CDspInit(CDsp dsp, int nChannels, double sampleRate)
    CF_SWIFT_NAME(CDsp.init(self:nChannels:sampleRate:));
void CDspStart(CDsp dsp)
    CF_SWIFT_NAME(CDsp.start(self:));
void CDspStop(CDsp dsp)
    CF_SWIFT_NAME(CDsp.stop(self:));
bool CDspIsPlaying(CDsp dsp)
    CF_SWIFT_NAME(getter:CDsp.isPlaying(self:));
bool CDspIsSetup(CDsp dsp)
    CF_SWIFT_NAME(getter:CDsp.isSetup(self:));
void CDspProcessWithEvents(CDsp dsp, AudioTimeStamp const *timestamp, AUAudioFrameCount frameCount, AURenderEvent const *events)
    CF_SWIFT_NAME(CDsp.process(self:timestamp:frameCount:events:));



#if defined(__cplusplus)
}
#endif /* defined(__cplusplus) */

#endif /* CDsp_h */
