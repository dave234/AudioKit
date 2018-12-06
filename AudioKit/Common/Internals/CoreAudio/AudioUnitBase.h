//
//  AudioUnitBase.h
//  AudioKit
//
//  Created by David O'Neill on 12/5/18.
//  Copyright © 2018 AudioKit. All rights reserved.
//

#import <AudioKit/AudioKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "AudioUnitDescription.h"
#import "BufferedAudioUnit.h"

NS_ASSUME_NONNULL_BEGIN

@interface AudioUnitBase : BufferedAudioUnit
+ (AudioUnitDescription *) audioUnitDescription;
@end

NS_ASSUME_NONNULL_END
