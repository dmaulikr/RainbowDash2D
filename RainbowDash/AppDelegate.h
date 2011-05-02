//
//  AppDelegate.h
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright University of Chicago 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
