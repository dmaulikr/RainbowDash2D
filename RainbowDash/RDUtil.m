//
//  RDUtil.c
//  RainbowDash
//
//  Created by Michael Victor Zink on 5/2/11.
//  Copyright 2011 Michael Victor Zink. All rights reserved.
//

#import "RDUtil.h"

BOOL ccpInRect(CGPoint point, CGRect rect) {
	BOOL inHoriz = (rect.origin.x <= point.x) && (point.x <= (rect.origin.x + rect.size.width));
	BOOL inVert = (rect.origin.y <= point.y) && (point.y <= (rect.origin.y + rect.size.height));
	return inHoriz && inVert;
}
