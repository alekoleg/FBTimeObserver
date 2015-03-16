//
//  FBUnactiveAppTimeObserver.h
//  FBTimeObserver
//
//  Created by Alekseenko Oleg on 16.03.15.
//  Copyright (c) 2015 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBTimeObserverCommon.h"


@interface FBUnactiveAppTimeObserver : NSObject

+ (instancetype)observer;

- (void)registerObserver:(id)object forTimeInterval:(NSTimeInterval)interval block:(FBUnactiveAppTimeObserverDoBlock)doBlock;

@end
