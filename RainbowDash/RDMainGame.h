//
//  RDMainGame.h
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class RDHud;

@interface RDMainGame : CCLayer {
    CCSprite * player;
	CGPoint lastTouch;
	NSInteger score;
	NSMutableArray * clouds;
	RDHud * hud;
}

@property(nonatomic, retain) RDHud * hud;

- (void) spawnCloud: (ccTime) dt;

@end
