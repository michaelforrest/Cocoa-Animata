//
//  LayersController.h
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

#import <Cocoa/Cocoa.h>
#import "CocoaAnimataDocument.h"
#import "LayerEditorWindowController.h"

@interface LayersController : NSObject {

	IBOutlet CocoaAnimataDocument * document;
	IBOutlet NSOutlineView * outlineView;
	Layer * root;
	LayerEditorWindowController * layerEditor;
}
@property (nonatomic, retain) NSOutlineView *outlineView;
@property (nonatomic, retain) Layer *root;

-(IBAction) editLayer:(id) sender;

-(Layer*) selectedLayer;

@end
