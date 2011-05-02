//
//  RDGameBackground.m
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import "RDGameBackground.h"


@implementation RDGameBackground

- (id) init {
	if ((self = [super init])) {
		CCSprite * background = [CCSprite spriteWithFile: @"skyline.jpg"];
		CGSize size = [[CCDirector sharedDirector] winSize];
		background.position = ccp(size.width / 2.0, size.height / 2.0);
		[self addChild: background];
		self.isTouchEnabled = NO;
	}
	return self;
}

@end
