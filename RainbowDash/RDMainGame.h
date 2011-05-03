//
//  RDMainGame.h
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface RDMainGame : CCLayer {
    CCSprite * player;
	CGPoint lastTouch;
	NSMutableArray * clouds;
	NSInteger score;
}

- (void) spawnCloud: (ccTime) dt;

@end
