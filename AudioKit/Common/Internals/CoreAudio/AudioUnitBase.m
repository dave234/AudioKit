//
//  AudioUnitBase.m
//  AudioKit
//
//  Created by David O'Neill on 12/5/18.
//  Copyright © 2018 AudioKit. All rights reserved.
//

#import "AudioUnitBase.h"


@implementation AudioUnitBase
+ (AudioUnitDescription *) audioUnitDescription {
    NSAssert(false, @"Sublcasses must override audioUnitDescription");
    return NULL;
}
@end
