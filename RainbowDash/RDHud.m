//
//  RDHudLayer.m
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import "RDHud.h"
#import "RDMainMenu.h"


@implementation RDHud

- (id) init {
	if ((self = [super init])) {
		label = [CCLabelTTF labelWithString: @"Rainbow Dash 2D" fontName: @"Palatino-Roman" fontSize: 24.0];
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position = ccpAdd(ccp(label.contentSize.width / 2.0, size.height), ccp(20.0, -30.0));
		[self addChild: label];
		self.isTouchEnabled = YES;
	}
	return self;
}

- (BOOL) ccTouchBegan: (UITouch *) touch withEvent: (UIEvent *) event {
	return CGRectContainsPoint(label.boundingBox, [self convertTouchToNodeSpace: touch]);
}

- (void) ccTouchEnded: (UITouch *) touch withEvent: (UIEvent *) event {
	if (CGRectContainsPoint(label.boundingBox, [self convertTouchToNodeSpace: touch])) {
		[[CCDirector sharedDirector] replaceScene: [RDMainMenu scene]];
	}
}

- (void) registerWithTouchDispatcher {
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate: self priority: 0 swallowsTouches: YES];
}

@end
