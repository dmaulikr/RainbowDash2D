//
//  RDMainMenu.m
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import "RDMainMenu.h"


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

		CCLabelTTF * button = [CCLabelTTF labelWithString: @"Start" fontName: @"Palatino-Roman" fontSize: 34.0];
		button.position = ccpSub(center, ccp(0.0, 50.0));
		[self addChild: button];
	}
	return self;
}

@end
