//
//  CDsp.c
//  AudioKit
//
//  Created by David O'Neill on 12/10/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//

#include "CDsp.h"
#include "AKDSPBase.hpp"

void CDspProcess(CDsp dsp, uint32_t frameCount, uint32_t bufferOffset) {
    reinterpret_cast<AKDSPBase *>(dsp)->process(frameCount, bufferOffset);
}
void CDspSetParameter(CDsp dsp, uint64_t address, float value, BOOL immediate) {
    reinterpret_cast<AKDSPBase *>(dsp)->setParameter(address, value, immediate);
}
float CDspGetParameter(CDsp dsp, uint64_t address) {
    return reinterpret_cast<AKDSPBase *>(dsp)->getParameter(address);
}
void CDspReset(CDsp dsp) {
    reinterpret_cast<AKDSPBase *>(dsp)->reset();
}
void CDspSetBuffers(CDsp dsp, AudioBufferList* inBufs, AudioBufferList* outBufs) {
    reinterpret_cast<AKDSPBase *>(dsp)->setBuffers(inBufs, outBufs);
}
void CDspInit(CDsp dsp, int nChannels, double sampleRate) {
    reinterpret_cast<AKDSPBase *>(dsp)->init(nChannels, sampleRate);
}
void CDspStart(CDsp dsp)  {
    reinterpret_cast<AKDSPBase *>(dsp)->start();
}
void CDspStop(CDsp dsp) {
    reinterpret_cast<AKDSPBase *>(dsp)->stop();
}
bool CDspIsPlaying(CDsp dsp) {
    return reinterpret_cast<AKDSPBase *>(dsp)->isPlaying();
}
bool CDspIsSetup(CDsp dsp) {
    return reinterpret_cast<AKDSPBase *>(dsp)->isSetup();
}
void CDspProcessWithEvents(CDsp dsp, AudioTimeStamp const *timestamp, AUAudioFrameCount frameCount,AURenderEvent const *events) {
    reinterpret_cast<AKDSPBase *>(dsp)->processWithEvents(timestamp, frameCount, events);
}

