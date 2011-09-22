/*
  SceneGLView.m
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

#import "SceneGLView.h"


@implementation SceneGLView
@synthesize camera;
@synthesize toolController;
@synthesize layersController;

-(Layer*) selectedLayer{
	return [layersController selectedLayer];
}
-(void) drawContent{
	//NSLog(@"drawing %@ (from %@) - %f,%f - %f,%f", [self window],[layersController rootLayerView],bounds.origin.x,bounds.origin.y, bounds.size.width,bounds.size.height);

	[[layersController root] draw:self];
}
@end
