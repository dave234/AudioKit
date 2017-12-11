//
//  AutomatePOC.h
//  macOSDevelopment
//
//  Created by David O'Neill on 12/11/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioKit/AudioKit.h>

@interface AutomatePOC : NSObject
@property AKTimelineTap * _Nonnull tap;
-(instancetype _Nonnull)initWithNode:(AVAudioNode * _Nonnull)node andDSP:(CDsp _Nonnull)dsp;
-(void)start;
@end
