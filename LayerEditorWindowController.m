/*
  LayerEditorWindowController.m
  CocoaAnimata

  Created by Michael Forrest on 14 Sep.
  Copyright 2009 Grimaceworks. All rights reserved.

  CocoaAnimata is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
  
  CocoaAnimata is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License
  along with CocoaAnimata. If not, see <http://www.gnu.org/licenses/>.

*/

#import "LayerEditorWindowController.h"


@implementation LayerEditorWindowController
@synthesize window;
@synthesize selectedLayer;

- (id) init {
	self = [super init];
	if (self != nil) {
		[NSBundle loadNibNamed:@"LayerEditor" owner:self];
	}
	return self;
}

- (void) dealloc {
	[window release];
	[selectedLayer release];

	[super dealloc];
}
// GET SELECTION
//-(Layer*) selectedLayer{
//	return self.selectedLayer;
//}

-(void) setCurrentLayer:(Layer*) aLayer{
	// it's like this because I wasn't sure how to 
	// add to synthesized behaviour.
	self.selectedLayer = aLayer;
	[[self window] setTitle:[NSString stringWithFormat:@"Layer Editor: %@",  selectedLayer.name]];
	[[self window] makeKeyAndOrderFront:nil];
}
@end
