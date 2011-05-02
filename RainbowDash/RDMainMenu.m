//
//  RDMainMenu.m
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import "RDMainMenu.h"
#import "RDUtil.h"
#import "RDHudLayer.h"
#import "RDGameBackground.h"


@implementation RDMainMenu

+ (CCScene *) scene {
	CCScene * scene = [CCScene node];
	[scene addChild: [RDMainMenu node]];
	return scene;
}

- (id) init {
	if ((self = [super init])) {
		CGSize size = [[CCDirector sharedDirector] winSize];
		CGPoint center = ccp(size.width / 2.0, size.height / 2.0);

		CCLabelTTF * label = [CCLabelTTF labelWithString: @"Rainbow Dash 2D" fontName: @"Palatino-Roman" fontSize: 44.0];
		label.position = ccpAdd(center, ccp(0.0, 40.0));
		[self addChild: label];

		button = [CCLabelTTF labelWithString: @"Start" fontName: @"Palatino-Roman" fontSize: 34.0];
		button.position = ccpSub(center, ccp(0.0, 50.0));
		[self addChild: [button retain]];

		self.isTouchEnabled = YES;
	}
	return self;
}

- (void) ccTouchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	UITouch * touch = [touches anyObject];
	CGPoint loc = [self convertTouchToNodeSpace: touch];
	CGRect bounds = CGRectMake(button.position.x, button.position.y,
							   button.contentSize.width, button.contentSize.height);
	if (ccpInRect(loc, bounds)) {
		// The touch landed in the bounds for the start "button"
		[self startGame];
	}
}

- (void) startGame {
	CCScene * scene = [CCScene node];
	RDGameBackground * bg = [RDGameBackground node];
	RDHudLayer * hud = [RDHudLayer node];
	[scene addChild: bg z: 1];
	[scene addChild: hud z: 2];
	[[CCDirector sharedDirector] replaceScene: scene];
}

- (void) dealloc {
	[button release];
	[super dealloc];
}

@end
