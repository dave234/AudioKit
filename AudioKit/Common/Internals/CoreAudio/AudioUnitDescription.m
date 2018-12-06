//
//  AudioUnitDescription.m
//  AudioKit
//
//  Created by David O'Neill on 12/5/18.
//  Copyright © 2018 AudioKit. All rights reserved.
//

#import "AudioUnitDescription.h"

FourCharCode fourCharCode(const char *str) {
    return (UInt32)str[0] << 24 | (UInt32)str[1] << 16 | (UInt32)str[2] << 8  | (UInt32)str[3];
}

@implementation AudioUnitDescription : NSObject
-(instancetype)initWithType:(AudioComponentType)type subType:(NSString *)fourCharSubType {
    return [self initWithType:type subType:fourCharSubType manufacturer:@"AuKt" name:NSStringFromClass(AudioUnitDescription.class)];
}

-(instancetype)initWithType:(AudioComponentType)type subType:(NSString *)fourCharSubType manufacturer:(NSString *)fourCharManufacturer name:(NSString *)name {
    self = [super init];
    if (self) {
        assert(fourCharSubType.length == 4 && fourCharManufacturer.length == 4);
        _componentDescription = (AudioComponentDescription) {
            .componentType = type,
            .componentSubType = fourCharCode(fourCharSubType.UTF8String),
            .componentManufacturer = fourCharCode(fourCharManufacturer.UTF8String),
            .componentFlags = 0,
            .componentFlagsMask = 0
        };
        self.name = name;
    }
    return self;
}
@end
