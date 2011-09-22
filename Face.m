//
//  Face.m
//  CocoaAnimata
//
//  Created by Michael Forrest on 13 Sep.
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

#import "Face.h"


@implementation Face
@synthesize vertices;


-(id) initWithXML:(NSXMLElement*) xml andVertices:(NSMutableArray *) allVertices{
	self = [super init];
	if(self != nil){
		self.vertices = [[NSArray alloc] initWithObjects:
										 [allVertices objectAtIndex:[self integer:xml forAttribute:@"v0"]],
										 [allVertices objectAtIndex:[self integer:xml forAttribute:@"v1"]],
										 [allVertices objectAtIndex:[self integer:xml forAttribute:@"v2"]]
										 ,nil];
	}
	return self;
}
- (void) dealloc {
	[vertices release];
	[super dealloc];
}


@end
