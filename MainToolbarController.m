//
//  MainToolbarController.m
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

#import "MainToolbarController.h"


@implementation MainToolbarController
-(IBAction) selectItem:(id) sender{
	[toolbar setSelectedItemIdentifier:[sender itemIdentifier]];
	toolController.currentTool = [toolMappings objectForKey:[sender itemIdentifier]];
	NSLog(@"current tool=%@",toolController.currentTool);
}

- (NSArray *)toolbarSelectableItemIdentifiers: (NSToolbar *)aToolbar{
	NSMutableArray *allIdentifiers = [[NSMutableArray alloc] init];
	for (NSToolbarItem *toolbarItem in [aToolbar items])
	{
		[allIdentifiers addObject:[toolbarItem itemIdentifier]];
	}
	return [allIdentifiers autorelease];
}

-(void) awakeFromNib{
	toolMappings = [[NSDictionary alloc] initWithObjectsAndKeys:
									toolController.selectionTool, [select itemIdentifier], 
									toolController.drawTrianglesTool,[drawTriangles itemIdentifier], 
									toolController.panTool,[pan itemIdentifier],
									nil];
	[self selectItem:select];
}
-(IBAction) selectSelectTool:(id) sender{
	[self selectItem:select];
}
-(IBAction) selectDrawTrianglesTool:(id) sender{
	[self selectItem:drawTriangles];
}
-(IBAction) selectPanTool:(id) sender{
	[self selectItem:pan];
}

@end
