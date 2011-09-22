//
//  XMLModel.m
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

#import "XMLModel.h"


@implementation XMLModel
@synthesize folder;

-(id) initWithXML:(NSXMLElement*) xml{
	self = [super init];
	if (self != nil) {
		[self setup:xml];
		for (NSXMLElement * child in [xml children]) {
			[self setupChild:child];
		}
	}
	return self;
}

-(id) initWithXML:(NSXMLElement*) xml inFolder:(NSString*) aFolder{
	self = [super init];
	if (self != nil) {
		self.folder = aFolder;
		[self setup:xml];
		for (NSXMLElement * child in [xml children]) {
			[self setupChild:child];
		}
	}
	return self;
}

-(void) setup:(NSXMLElement*) xml{
}
-(void) setupChild:(NSXMLElement*) child{
}
-(CGFloat) number: (NSXMLElement*) element forAttribute:(NSString *) attributeName{
	return [[[element attributeForName: attributeName] stringValue] floatValue];
}
-(NSInteger) integer: (NSXMLElement*) element forAttribute:(NSString *) attributeName{
	return [[[element attributeForName: attributeName] stringValue] intValue];
}

- (void) dealloc {
	[folder release];
	[super dealloc];
}


@end
