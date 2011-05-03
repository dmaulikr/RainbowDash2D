//
//  RDMainGame.m
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import "RDMainGame.h"


@implementation RDMainGame

- (id) init {
	if ((self = [super init])) {
		player = [CCSprite spriteWithFile: @"stars2.png"];
		CGSize size = [[CCDirector sharedDirector] winSize];
		lastTouch = ccp(size.width / 2.0, size.height / 2.0);
		[self addChild: player];

		self.isTouchEnabled = YES;
	}
	return self;
}

- (void) update: (ccTime) dt {
	if (ccpFuzzyEqual(player.position, lastTouch, 0.001)) {
		player.position = lastTouch;
		return;
	}
	CGPoint move = ccpSub(lastTouch, player.position);
	CGSize size = [[CCDirector sharedDirector] winSize];
	float factor = (size.width - move.x) / (size.width * 4);
	player.position = ccpAdd(player.position, ccpMult(move, factor));
}

- (void) ccTouchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	lastTouch = [self convertTouchToNodeSpace: [touches anyObject]];
}

- (void) ccTouchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	lastTouch = [self convertTouchToNodeSpace: [touches anyObject]];
}

- (void) ccTouchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	lastTouch = [self convertTouchToNodeSpace: [touches anyObject]];
}

- (void) onEnter {
	[super onEnter];
	[self schedule: @selector(update:)];
}

- (void) onExit {
	[self unschedule: @selector(update:)];
	[super onExit];
}

@end
