//
//  AutomatePOC.m
//  macOSDevelopment
//
//  Created by David O'Neill on 12/11/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//

#import "AutomatePOC.h"

@implementation AutomatePOC
-(instancetype)initWithNode:(AVAudioNode *)node andDSP:(CDsp)dsp{
    self = [super init];
    if (self) {

        double samplerate = [[node outputFormatForBus:0]sampleRate];

        double *automateBuffer = calloc((int)samplerate * 4, sizeof(double));

        // 0 -> 44100 ramp to 1
        for (int i = 0; i < samplerate; i ++) {
            automateBuffer[i] = i / samplerate;
        }
        // 44100 -> 88200 ramp to 0
        for (int i = 0 * samplerate; i <  samplerate; i ++) {
            automateBuffer[i + (int)samplerate] = 1 - (i / samplerate);
        }

        // 88200 -> 132300 silent for a second - already 0

        // 132300 -> 176400 ramp to 1
        for (int i = 0 * samplerate; i <  samplerate; i ++) {
            automateBuffer[i + ((int)samplerate * 3)] = (i / samplerate);
        }

        _tap = [[AKTimelineTap alloc]initWithNode:node timelineBlock:^(AKTimeline *timeline, AudioTimeStamp *timeStamp, UInt32 offset, UInt32 frames, AudioBufferList *ioData) {

            for (int i = 0; i < frames; i++) {
                Float64 sampleTime = timeStamp->mSampleTime + i;

                if (sampleTime < 4 * samplerate) {  //automateBuffer bounds
                    CDspSetParameter(dsp, 0, automateBuffer[(int)sampleTime], true);
                    CDspSetParameter(dsp, 1, automateBuffer[(int)sampleTime], true);
                }

            }
        }];
    }
    return self;
}
-(void)start {
    AKTimelineStart(_tap.timeline);
}
@end
