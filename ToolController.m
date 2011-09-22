//
//  ToolController.m
//  CocoaAnimata
//
//  Created by Michael Forrest on 12 Sep.
/*
  Copyright 2009 Grimaceworks. All rights reserved.

	Based on Animata
  Copyright (C) 2007 Peter Nemeth, Gabor Papp, Bence Samu
	Kitchen Budapest, <http://animata.kibu.hu/>

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
*///

#import "ToolController.h"


@implementation ToolController
@synthesize selectionTool,drawTrianglesTool,panTool;

@synthesize currentTool;


- (id) init {
	self = [super init];
	if (self != nil) {
		self.selectionTool = [[SelectionTool alloc] init];
		self.drawTrianglesTool = [[DrawTrianglesTool alloc] init];
		self.panTool = [[PanTool alloc] init];
		
		
		
		// HACK? The default tool is also defined in MainToolbarController
		self.currentTool = selectionTool;
		
	}
	return self;
}


- (void) dealloc {
	[panTool release];
	[selectionTool release];
	[drawTrianglesTool release];

	[super dealloc];
}
-(void) temporarilySelect:(Tool*) tool{

	previouslySelectedTool = (Tool*)self.currentTool;
	self.currentTool = tool;

}
-(void) revertTemporarySelection{

	self.currentTool = previouslySelectedTool;
}

@end
