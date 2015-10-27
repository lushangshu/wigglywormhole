//
//  PlayerDetail.m
//  Wigglywormhole
//
//  Created by lushangshu on 14-11-7.
//  Copyright (c) 2014年 lushangshu. All rights reserved.
//
//  Username: ACP14SL
#import "PlayerDetail.h"

@implementation PlayerDetail

-(id)initWithname:(NSString *)playerName score:(NSString *)s
{
    self = [super init];
    if (self) {
        _playerName = playerName;
        _score = s;
        //_time = t;
    }
    return self;
}

@end
