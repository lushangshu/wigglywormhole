//
//  PlayerDetail.h
//  Wigglywormhole
//
//  Created by lushangshu on 14-11-7.
//  Copyright (c) 2014年 lushangshu. All rights reserved.
//
//  Username: ACP14SL
#import <Foundation/Foundation.h>

@interface PlayerDetail : NSObject

@property (strong) NSString *playerName;
@property (strong) NSString *score;
//@property (strong) NSTimeZone *time;

-(id) initWithname:(NSString*)playerName score:(NSString*)s ;
@end
