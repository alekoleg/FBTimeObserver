//
//  FBUnactiveAppTimeObserver.m
//  FBTimeObserver
//
//  Created by Alekseenko Oleg on 16.03.15.
//  Copyright (c) 2015 alekoleg. All rights reserved.
//

#import "FBUnactiveAppTimeObserver.h"
#import "FBTimeModel.h"
@import UIKit;




@interface FBUnactiveAppTimeObserver ()
@property (nonatomic, strong) NSDate *enterBackgroundDate;
@property (nonatomic, strong) NSDate *enterForegroundDate;
@property (nonatomic, strong) NSMapTable *map;
@end


@implementation FBUnactiveAppTimeObserver

+ (instancetype)observer {
    static FBUnactiveAppTimeObserver *_observer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _observer = [[self alloc] init];
    });
    return _observer;
}

- (instancetype)init {
    if (self = [super init]) {
        _map = [NSMapTable weakToStrongObjectsMapTable];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnteredBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnteredForeground:) name:UIApplicationDidBecomeActiveNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Actions -

- (void)didEnteredBackground:(NSNotification *)not {
    self.enterBackgroundDate = [NSDate date];
}

- (void)didEnteredForeground:(NSNotification *)not {
    self.enterForegroundDate = [NSDate date];
    [self notifyObservers];
}

- (void)notifyObservers {
    
    NSEnumerator *enumerator = [_map keyEnumerator];
    id value = nil;
    NSTimeInterval pastTimeInterval = [self.enterForegroundDate timeIntervalSinceDate:self.enterBackgroundDate];
    
    while ((value = [enumerator nextObject])) {
        FBTimeModel *model = [_map valueForKey:value];
        if (pastTimeInterval >= model.timeInterval) {
            if (model.doBlock) {
                model.doBlock();
            }
        }
    };
}

- (void)registerObserver:(id)object forTimeInterval:(NSTimeInterval)interval block:(FBUnactiveAppTimeObserverDoBlock)doBlock {
    FBTimeModel *model = [FBTimeModel new];
    model.Id = @(arc4random());
    model.timeInterval = interval;
    model.doBlock = doBlock;
    [_map setObject:model forKey:object];
}


@end
