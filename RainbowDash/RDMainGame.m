//
//  RDMainGame.m
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import "RDMainGame.h"
#import "RDHud.h"

#define RANDFR ((arc4random() / ((pow(2,32))-1)))

@implementation RDMainGame

@synthesize hud;

- (id) init {
	if ((self = [super init])) {
		player = [CCSprite spriteWithFile: @"stars2.png"];
		CGSize size = [[CCDirector sharedDirector] winSize];
		lastTouch = ccp(size.width / 2.0, size.height / 2.0);
		[self addChild: player];

		self.isTouchEnabled = YES;

		clouds = [[NSMutableArray array] retain];

		score = 0;
	}
	return self;
}

- (void) update: (ccTime) dt {
	// Update player position based on last touch location
	if (ccpFuzzyEqual(player.position, lastTouch, 0.001)) {
		player.position = lastTouch;
	} else {
		CGPoint move = ccpSub(lastTouch, player.position);
		CGSize size = [[CCDirector sharedDirector] winSize];
		float factor = (size.width - move.x) / (size.width * 4);
		player.position = ccpAdd(player.position, ccpMult(move, factor));
	}

	for (CCSprite * cloud in [clouds copy]) {
		if (CGRectContainsRect([player boundingBox],[cloud boundingBox])) {
			score += cloud.scale * 100;
			if (self.hud) {
				[hud.scoreLabel setString: [NSString stringWithFormat: @"%d", score]];
			}
			[clouds removeObject: cloud];
			[self removeChild: cloud cleanup: YES];
		}
	}
}

- (void) spawnCloud: (ccTime) dt {
	if (arc4random() % 2) { // Add a cloud 50% of the time
		CCSprite * cloud = [CCSprite spriteWithFile: @"stars.png"];
		CGSize size = [[CCDirector sharedDirector] winSize];
		cloud.position = ccp(RANDFR * size.width, RANDFR * size.height);
		[clouds addObject: cloud];
		cloud.scale = 0.0;
		CCAction * scaleAction = [CCScaleTo actionWithDuration: 0.2 scale: 0.5 + (RANDFR * 0.5)];
		[cloud runAction: scaleAction];
		[self addChild: cloud];
	}
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
	[self schedule: @selector(spawnCloud:) interval: 0.50f];
}

- (void) onExit {
	[self unschedule: @selector(update:)];
	[self unschedule: @selector(spawnCloud:)];
	[super onExit];
}

@end
