//
//  RoundsController.m
//  The-Pomodoro-iOS8
//
//  Created by Taylor Mott on 18.2.2015.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsController.h"
#import "Timer.h"

@interface RoundsController()

@property (strong, nonatomic) NSArray *roundTimes;

@end

@implementation RoundsController

+ (instancetype)sharedInstance {
    static RoundsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [RoundsController new];
    });
    
    return sharedInstance;
}


- (void)roundSelected {
    Timer *timer = [Timer sharedInstance];
    timer.minutes = [[self roundTimes][self.currentRound] integerValue];
    timer.seconds = 0;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NewRoundNotification object:self userInfo:nil];
}

-(NSArray *)roundTimes {
    return @[@25, @5, @25, @5, @25, @5, @25, @15];
}

@end
