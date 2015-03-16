//
//  FBTimeModel.h
//  FBTimeObserver
//
//  Created by Alekseenko Oleg on 16.03.15.
//  Copyright (c) 2015 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBTimeObserverCommon.h"


@interface FBTimeModel : NSObject

@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, copy) FBUnactiveAppTimeObserverDoBlock doBlock;

@end
