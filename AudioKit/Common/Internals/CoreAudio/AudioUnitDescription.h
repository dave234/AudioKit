//
//  AudioUnitDescription.h
//  AudioKit
//
//  Created by David O'Neill on 12/5/18.
//  Copyright © 2018 AudioKit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(OSType, AudioComponentType) {
    AudioComponentTypeOutput            = kAudioUnitType_Output,
    AudioComponentTypeMusicDevice       = kAudioUnitType_MusicDevice,
    AudioComponentTypeMusicEffect       = kAudioUnitType_MusicEffect,
    AudioComponentTypeFormatConverter   = kAudioUnitType_FormatConverter,
    AudioComponentTypeEffect            = kAudioUnitType_Effect,
    AudioComponentTypeMixer             = kAudioUnitType_Mixer,
    AudioComponentTypePanner            = kAudioUnitType_Panner,
    AudioComponentTypeGenerator         = kAudioUnitType_Generator,
    AudioComponentTypeOfflineEffect     = kAudioUnitType_OfflineEffect,
    AudioComponentTypeMIDIProcessor     = kAudioUnitType_MIDIProcessor
};

/// AudioUnitDescription is a convenience wrapper for AudioComponentDescription + name.
@interface AudioUnitDescription : NSObject
@property NSString *name;
@property (readonly) AudioComponentDescription componentDescription;
-(instancetype)initWithType:(AudioComponentType)type subType:(NSString *)subType;
-(instancetype)initWithType:(AudioComponentType)type subType:(NSString *)subType manufacturer:(NSString *)manufacturer name:(NSString *)name NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;
@end

NS_ASSUME_NONNULL_END
