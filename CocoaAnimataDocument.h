//
//  CocoaAnimata
//
//  Created by Michael Forrest on 5 Sep.
//  Copyright Grimaceworks 2009 . All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import "Layer.h"
#import "ImageNotFoundException.h"
@interface CocoaAnimataDocument : NSDocument
{
	Layer * root;
}
-(Layer *) getRootLayer;
@end
