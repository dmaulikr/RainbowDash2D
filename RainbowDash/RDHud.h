//
//  RDHudLayer.h
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface RDHud : CCLayer {
    CCLabelTTF * label;
	CCLabelAtlas * scoreLabel;
}

@property(nonatomic, assign) CCLabelAtlas * scoreLabel;

@end
