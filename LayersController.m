//
//  LayersController.m
//  CocoaAnimata
//
//  Created by Michael Forrest on 7 Sep.
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

#import "LayersController.h"


@implementation LayersController
@synthesize outlineView;
@synthesize root;

// CHILD COUNT
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item{
	if(item == NULL) return 1;
	return [[(Layer*) item layers ] count];
}

// IS EXPANDABLE
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item{
	return [[(Layer*)item layers] count] > 1;
}

// CHILD ITEM (item[index])
- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item{
	if(item == NULL) return [document getRootLayer];
	return [[(Layer*)item layers ] objectAtIndex:index];
}

// VALUE TO DISPLAY
- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item{
	//NSLog(@"id:%@",[tableColumn identifier]);
	//return (NSString*)[(Layer*)item valueForKey:[[tableColumn identifier] stringValue]];
	return [(Layer*)item valueForKey:[tableColumn identifier]];
}

// SET NAME
- (void)outlineView:(NSOutlineView *)outlineView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn byItem:(id)item{
	[(Layer *) item setName:object];
}
// GET SELECTION
-(Layer*) selectedLayer{
	return (Layer*)[outlineView itemAtRow:[outlineView selectedRow]];
}

-(void) awakeFromNib{
	[outlineView setTarget:self];
	[outlineView selectRow:0 byExtendingSelection:NO];
	root = [document getRootLayer];
	[outlineView setDoubleAction:@selector(editLayer:)];
	
}

- (void) dealloc {
	[outlineView release];
	[root release];

	[super dealloc];
}
-(IBAction) editLayer:(id) sender{
	if(layerEditor == nil){
		layerEditor = [[LayerEditorWindowController alloc] init];
	}
	[layerEditor setCurrentLayer: [self selectedLayer] ];

}
	 
@end
