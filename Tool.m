//
//  Tool.m
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

#import "Tool.h"


@implementation Tool
@synthesize cursor;

- (id) init {
	self = [super init];
	if (self != nil) {
		self.cursor = [NSCursor arrowCursor];
	}
	return self;
}

- (void) dealloc {
	[cursor release];
	[super dealloc];
}
-(void) mouseDown: (NSPoint) mouseLoc camera:(Camera*)camera sender:(id)sender{
	
}
-(void) mouseDragged:(NSEvent*) event camera:(Camera*)camera sender:(id)sender{
}
-(void) mouseUp: (NSPoint) mouseLoc camera:(Camera*)camera sender:(id)sender{
}


@end
