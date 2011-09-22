//
//  XMLModel.h
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

#import <Cocoa/Cocoa.h>


@interface XMLModel : NSObject {
	NSString * folder;
}
@property (nonatomic, retain) NSString *folder;

-(CGFloat) number: (NSXMLElement*) element forAttribute:(NSString *) attributeName;
-(NSInteger) integer: (NSXMLElement*) element forAttribute:(NSString *) attributeName;
-(id) initWithXML:(NSXMLElement*) xml;
-(id) initWithXML:(NSXMLElement*) xml inFolder:(NSString*) aFolder;
-(void) setup:(NSXMLElement*) xml;
-(void) setupChild:(NSXMLElement*) child;

@end
