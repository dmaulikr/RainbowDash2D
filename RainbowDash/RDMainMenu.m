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
		CCLabelTTF * label = [CCLabelTTF labelWithString: @"Rainbow Dash 2D" fontName: @"Palatino-Roman" fontSize: 24.0];
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position = ccpAdd(ccp(label.contentSize.width / 2.0, size.height), ccp(20.0, -30.0));
		[self addChild: label];
	}
	return self;
}

@end
