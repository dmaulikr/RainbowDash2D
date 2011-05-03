//
//  RDMainMenu.m
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import "RDMainMenu.h"
#import "RDUtil.h"
#import "RDHud.h"
#import "RDGameBackground.h"


@implementation RDMainMenu

+ (CCScene *) scene {
	CCScene * scene = [CCScene node];
	[scene addChild: [RDMainMenu node]];
	return scene;
}

- (id) init {
	if ((self = [super init])) {
		CCLabelTTF * titleLabel = [CCLabelTTF labelWithString: @"Rainbow Dash 2D" fontName: @"Palatino-Roman" fontSize: 34.0];
		CCLabelTTF * startLabel = [CCLabelTTF labelWithString: @"Start!" fontName: @"Palatino-Roman" fontSize: 26.0];
		CCMenu * menu = [CCMenu menuWithItems:
						 [CCMenuItemLabel itemWithLabel: titleLabel],
						 [CCMenuItemLabel itemWithLabel: startLabel target: self selector: @selector(menuStartItemPressed:)],
						 nil];
		[menu alignItemsVerticallyWithPadding: 30.0];
		[self addChild: menu];
	}
	return self;
}

- (void) menuStartItemPressed: (CCMenuItem *) menuItem {
	[self startGame];
}

- (void) startGame {
	CCScene * scene = [CCScene node];
	RDGameBackground * bg = [RDGameBackground node];
	RDHud * hud = [RDHud node];
	[scene addChild: bg z: 1];
	[scene addChild: hud z: 2];
	[[CCDirector sharedDirector] replaceScene: scene];
}

- (void) dealloc {
	[super dealloc];
}

@end
